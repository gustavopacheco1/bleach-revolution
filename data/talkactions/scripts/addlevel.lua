function onSay(cid, words, param)
	if (param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Name and level required.")
		return true
	end

	local t = string.explode(param, ",")
	local player = getPlayerByNameWildcard(t[1])
	local amount = tonumber(t[2])
	if (not t[2]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need to add a ,then the level to set.")
	end

	if (doPlayerAddExp(player, getExperienceForLevel(amount) - (getPlayerExperience(player)))) == LUA_ERROR then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Error")
	end
	doCreatureAddMana(player, getCreatureMaxMana(player) - getCreatureMana(player))
	doCreatureAddHealth(player, getCreatureMaxHealth(player) - getCreatureHealth(player))
	return true
end
