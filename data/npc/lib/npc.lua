function selfSayChannel(cid, message)
	return selfSay(message, cid, false)
end

function selfSayMultiLanguage(message_en, message_pt, cid)
	if getPlayerStorageValue(cid, "language") == "en" then
		return selfSay(message_en, cid)
	end

	return selfSay(message_pt, cid)
end

function selfMoveToThing(id)
	errors(false)
	local thing = getThing(id)

	errors(true)
	if(thing.uid == 0) then
		return
	end

	local t = getThingPosition(id)
	selfMoveTo(t.x, t.y, t.z)
	return
end

function selfMoveTo(x, y, z)
	local position = {x = 0, y = 0, z = 0}
	if(type(x) ~= "table") then
		position = Position(x, y, z)
	else
		position = x
	end

	if(isValidPosition(position)) then
		doSteerCreature(getNpcId(), position)
	end
end

function selfMove(direction, flags)
	local flags = flags or 0
	doMoveCreature(getNpcId(), direction, flags)
end

function selfTurn(direction)
	doCreatureSetLookDirection(getNpcId(), direction)
end

function getNpcDistanceTo(id)
	errors(false)
	local thing = getThing(id)

	errors(true)
	if(thing.uid == 0) then
		return nil
	end

	local c = getCreaturePosition(id)
	if(not isValidPosition(c)) then
		return nil
	end

	local s = getCreaturePosition(getNpcId())
	if(not isValidPosition(s) or s.z ~= c.z) then
		return nil
	end

	return math.max(math.abs(s.x - c.x), math.abs(s.y - c.y))
end

function doMessageCheck(message, keyword, exact)
	local exact = exact or false
	if(type(keyword) == "table") then
		return isInArray(keyword, message, exact)
	end

	if(exact) then
		return message == keyword
	end

	local a, b = message:lower(), keyword:lower()
	return a == b or (a:find(b) and not a:find('(%w+)' .. b))
end

function doNpcSellItem(cid, itemid, amount, subType, ignoreCap, inBackpacks, backpack)
	local amount = amount or 1
	local subType = subType or 0
	local ignoreCap =  false
	local inBackpacks = inBackpacks or false
	local backpack = backpack or 1988
	local item = 0

	if isItemStackable(itemid) then
		if inBackpacks then
			stuff = doCreateItemEx(backpack, 1)
			item = doAddContainerItem(stuff, itemid, math.min(100, amount))
		else
			stuff = doCreateItemEx(itemid, math.min(100, amount))
		end
		local ret = doPlayerAddItemEx(cid, stuff, ignoreCap)

		if ret == RETURNVALUE_NOERROR then
			return amount,0, {stuff}
		elseif ret == RETURNVALUE_NOTENOUGHROOM then
			return 0,0, {}
		elseif ret == RETURNVALUE_NOTENOUGHCAPACITY then
			return 0,0, {}
		end
	end
	
	local a = 0
	if inBackpacks then
	
		local itemTable = {}
		local container, b = doCreateItemEx(backpack, 1), 1
		table.insert(itemTable, container)
		for i = 1, amount do
		
			local item = doAddContainerItem(container, itemid, subType)
			if(itemid == ITEM_PARCEL) then
				doAddContainerItem(item, ITEM_LABEL)
			end
			
			if(isInArray({(getContainerCapById(backpack) * b), amount}, i)) then
				if doPlayerAddItemEx(cid, container, ignoreCap) ~= RETURNVALUE_NOERROR then
					b = b - 1
					return a, b, itemTable
				end

				a = i
				if amount > i then
				
					container = doCreateItemEx(backpack, 1)
					table.insert(itemTable, container)
					b = b + 1
					
				end
			end
		end
		return a, b, itemTable
	end
	
	local itemTable = {}
	
	for i = 1, amount do
		item = doCreateItemEx(itemid, subType)
		if(itemid == ITEM_PARCEL) then
			doAddContainerItem(item, ITEM_LABEL)
		end
		if(doPlayerAddItemEx(cid, item, ignoreCap) ~= RETURNVALUE_NOERROR) then
			return a, 0, itemTable
		end
		table.insert(itemTable, item)
		a = i
	end

	return a, 0, itemTable
end

function doRemoveItemIdFromPosition(id, n, position)
	local thing = getTileItemById(position, id)
	if(thing.itemid < 101) then
		return false
	end

	doRemoveItem(thing.uid, n)
	return true
end

function getNpcName()
	return getCreatureName(getNpcId())
end

function getNpcPosition()
	return getThingPosition(getNpcId())
end

function selfGetPosition()
	local t = getThingPosition(getNpcId())
	return t.x, t.y, t.z
end

function creatureSayBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks)
    local shopItem = trade_items[itemid]

    local backpack = 1988
    local totalCost = amount * shopItem.price
    if(inBackpacks) then
        totalCost = totalCost + 20 or totalCost + (math.max(1, math.floor(amount / getContainerCapById(backpack))) * 20)
    end

    local parseInfo = {
        [TAG_PLAYERNAME] = getPlayerName(cid),
        [TAG_ITEMCOUNT] = amount,
        [TAG_TOTALCOST] = totalCost,
        [TAG_ITEMNAME] = getItemNameById(itemid)
    }

    if(subType < 1 or getItemInfo(itemid).stackable) then
        subType = -1
    end

    if(getPlayerMoney(cid) < totalCost) then
        local msg = NpcHandler:getMessage(cid, MESSAGE_NEEDMONEY)
        doPlayerSendCancel(cid, NpcHandler:parseMessage(msg, parseInfo))
        return false
    end

    local a, b, item = doNpcSellItem(cid, itemid, amount, subType, ignoreCap, inBackpacks, backpack)
    
    if(a < amount) then
        local msgId = MESSAGE_NEEDMORESPACE
        if(a == 0) then
            msgId = MESSAGE_NEEDSPACE
        end
        

        local msg = NpcHandler:getMessage(cid, msgId)
        parseInfo[TAG_ITEMCOUNT] = a

        doPlayerSendCancel(cid, NpcHandler:parseMessage(msg, parseInfo))
        if(a > 0) then
        
            local prev_money = getPlayerMoney(cid)
            local removeMoney = doPlayerRemoveMoney(cid, (a * shopItem.price) + (b * 20), false)
            
            if removeMoney == true then
                parseInfo[TAG_TOTALCOST] = a * shopItem.price
                local msg = NpcHandler:getMessage(cid, MESSAGE_BOUGHT)
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, NpcHandler:parseMessage(msg, parseInfo))
            else
                for i = 1, #item do
                    doRemoveItem(item[i])
                end
                
                local currentMoney = getPlayerMoney(cid)
                if currentMoney ~= prev_money and  currentMoney < prev_money then -- Let's make sure the player did not pay for an item he did not receive.
                    doPlayerAddMoney(cid, math.abs(prev_money - currentMoney))
                end
                
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don't have enough space to receive the change when buying "..amount.. "x ".. getItemNameById(itemid).."!")
            end
            return true
        end

        return false
    else
    
        local prev_money = getPlayerMoney(cid)
        
        if doPlayerRemoveMoney(cid, totalCost, false) == true then
            local msg = NpcHandler:getMessage(cid, MESSAGE_BOUGHT)
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, NpcHandler:parseMessage(msg, parseInfo))
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don't have enough space to receive the change when buying "..amount.. "x ".. getItemNameById(itemid).."!")
            for i = 1, #item do
                doRemoveItem(item[i])
            end
            
            local currentMoney = getPlayerMoney(cid)
            if currentMoney ~= prev_money and  currentMoney < prev_money then -- Let's make sure the player did not pay for an item he did not receive.
                doPlayerAddMoney(cid, math.abs(prev_money - currentMoney))
            end
            
        end
        return true
    end
end

msgcontains = doMessageCheck
moveToPosition = selfMoveTo
moveToCreature = selfMoveToThing
selfMoveToCreature = selfMoveToThing
selfMoveToPosition = selfMoveTo
isPlayerPremiumCallback = isPremium
doPosRemoveItem = doRemoveItemIdFromPosition
doRemoveItemIdFromPos = doRemoveItemIdFromPosition
doNpcBuyItem = doPlayerRemoveItem
doNpcSetCreatureFocus = selfFocus
getNpcCid = getNpcId
getDistanceTo = getNpcDistanceTo
getDistanceToCreature = getNpcDistanceTo
getNpcDistanceToCreature = getNpcDistanceTo
getNpcPos = getNpcPosition
