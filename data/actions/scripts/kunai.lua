local teleport = createConditionObject(CONDITION_GAMEMASTER, -1, false, GAMEMASTER_TELEPORT)

function onUse(cid, item)
	local subId = GAMEMASTER_IGNORE
	if(item.itemid == 12698 and item.actionid ~= 100) then
		condition = teleport
		subId = GAMEMASTER_TELEPORT
		name = "Hirashin"
	end

	local action = "desativar"
	if(not getCreatureCondition(cid, CONDITION_GAMEMASTER, subId)) then
		doAddCondition(cid, condition)
		action = "ativar"
	else
		doRemoveCondition(cid, CONDITION_GAMEMASTER, subId)
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce acaba de " .. action .. " o " .. name .. ".")
	return true
end
