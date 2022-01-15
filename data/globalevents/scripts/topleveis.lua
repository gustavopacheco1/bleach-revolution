function onThink(interval, lastExecution)
	local max, query = 5, db.getResult("SELECT `name`, `level` FROM `players` WHERE `id` > 6 AND `group_id` < 2 ORDER BY `level` DESC, `name` ASC;")
	local str = "TOP "..max.." Rank Level:\n\n"
	if (query:getID() ~= -1) then 
		k = 1 
		while true do
			str = str .. "\n " .. k .. " - "..query:getDataString("name").."["..query:getDataInt("level").."]"
			k = k + 1
			if not(query:next()) or k > max then
				break 
			end 
		end 
		query:free()
	end
    doBroadcastMessage(str, 22)
	return true
end