function onAdvance(cid, skill, oldLevel, newLevel)

local config = {
[50] = {item = 2160, count = 5},
[100] = {item = 2160, count = 15},
[150] = {item = 2160, count = 20},
[25] = {item = 7417, count = 20},
[225] = {item = 2447, count = 20},
[175] = {item = 2430, count = 20},
[275] = {item = 2397, count = 20},
[200] = {item = 2160, count = 25},
[250] = {item = 2160, count = 30},
[300] = {item = 2160, count = 50},
[350] = {item = 2160, count = 100},
[400] = {item = 2160, count = 100},
}

if skill == 8 then
for level, info in pairs(config) do
if newLevel >= level and (getPlayerStorageValue(cid, 30700) == -1 or not (string.find(getPlayerStorageValue(cid, 30700), "'" .. level .. "'"))) then
doPlayerAddItem(cid, info.item, info.count)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Parabéns, você atingiu o level "..newLevel.." e ganhou "..info.count.." "..getItemNameById(info.item)..".")
local sat = getPlayerStorageValue(cid, 30700) == -1 and "Values: '" .. level .. "'" or getPlayerStorageValue(cid, 30700) .. ",'" .. level .. "'" 
setPlayerStorageValue(cid, 30700, sat)
end
end
end

return TRUE
end