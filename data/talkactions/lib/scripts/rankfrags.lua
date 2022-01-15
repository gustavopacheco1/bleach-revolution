function onSay(cid, words, param)
local max = 20
local letters_to_next = 20
local name_now
local name = "Top Frags\n"
local rkn = 0

name = name.."\n"
name = name.."Rank Frags - Nome do Jogador\n"
local v = db.getResult("SELECT `p`.`name` AS `name`, COUNT(`p`.`name`) as `frags` FROM `killers` k LEFT JOIN `player_killers` pk ON `k`.`id` = `pk`.`kill_id` LEFT JOIN `players` p ON `pk`.`player_id` = `p`.`id` WHERE `k`.`unjustified` = 1 GROUP BY `name` ORDER BY `frags` DESC;")
repeat
if v:getID() == -1 then
break
end
rkn = rkn+1
name_now, l = v:getDataString("name"), string.len(v:getDataString("name"))
name = name..rkn..". ["..v:getDataInt("frags").."] - "..name_now.." ".." ".."".."\n" 
until v:next() == false
if name ~= "" then 
doShowTextDialog(cid,1903, name)
end
return TRUE
end