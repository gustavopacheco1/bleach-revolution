 function onThink(interval, lastExecution)
	local max, query = 5, db.getResult("SELECT `p`.`name` AS `name`, COUNT(`p`.`name`) as `frags` FROM `killers` k LEFT JOIN `player_killers` pk ON `k`.`id` = `pk`.`kill_id` LEFT JOIN `players` p ON `pk`.`player_id` = `p`.`id` WHERE `k`.`unjustified` = 1 GROUP BY `name` ORDER BY `frags` DESC;")
	local str = "TOP "..max.." Rank Frags:\n\n"
	if (query:getID() ~= -1) then 
		k = 1 
		while true do
			str = str .. "\n " .. k .. " - "..query:getDataString("name").."["..query:getDataInt("frags").."]"
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