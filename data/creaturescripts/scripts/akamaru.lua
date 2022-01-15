local speed = 100000
local storage = 121233
local storages = 121234
local storagesummons = 157213

function onLogin(cid)

	local MyuuRi = {lookType = 988}
	if getCreatureByName('MyuuRi') then
		doChangeSpeed(cid, speed)
		doCreatureChangeOutfit(cid, MyuuRi) 
		doCreatureSetStorage(cid, FLY_STORAGE, 1)
		doCreatureSetStorage(cid, storagesummons, 1)
		return true
	end

	local group = getPlayerGroupId(cid)
	if group == 6 then
		 doCreatureSetStorage(cid, storagesummons, 1)
		else
		 doCreatureSetStorage(cid, storages, 0)
		return true
	end
	
	if isInArray({17, 26, 15}, getPlayerVocation(cid)) and getPlayerLevel(cid) > 1 then 
	   doCreatureSetStorage(cid, storagesummons, 1)
	  else
	   doCreatureSetStorage(cid, storages, 0)
	end

	if getPlayerLevel(cid) > 1 then 
	   doCreatureSetStorage(cid, storages, 0)
	  return true
	end

	if getPlayerLevel(cid) <= 200 and getPlayerVocation(cid) == 9 then 
    local ppos = getPlayerPosition(cid)
	   doConvinceCreature(cid, doCreateMonster("Akamaru Low", ppos)) --- Apos o Fly ---
	   doCreatureSetStorage(cid, storage, 0)
	  else
	   doCreatureSetStorage(cid, storages, 0)
	  return true
	end
	
	if getPlayerVocation(cid) == 9 and getPlayerLevel(cid) >= 200 then
	local ppos = getPlayerPosition(cid)
	  doConvinceCreature(cid, doCreateMonster("Akamaru High", ppos)) --- Apos o Fly ---
	  doCreatureSetStorage(cid, storage, 0)
	 else
	  doCreatureSetStorage(cid, storages, 0)
	 return true
    end
	return true
end