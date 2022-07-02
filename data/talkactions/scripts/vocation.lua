function onSay(cid, words, param)
	if (param == "") then
		doPlayerSendCancel(cid, "Name and level required.")
		return false
	end

	local t = string.explode(param, ",")
	local player = getPlayerByNameWildcard(t[1])
	local vocation = tonumber(t[2])

	if (not t[2]) then
		doPlayerSendCancel(cid, "You need to add a ,then the level to set.")
	end

	if doPlayerSetVocation(player, vocation) == LUA_ERROR then
		doPlayerSendCancel(cid, "Vocation not found.")
		return false
	end

	doPlayerSetVocation(player, vocation)
	return true
end
