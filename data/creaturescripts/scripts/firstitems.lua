local firstItems = {
2160,
2160
}

function onLogin(cid)

if getPlayerStorageValue(cid, 30001) < 1  then
for i=1, #firstItems do
doPlayerRemoveItem(cid, firstItems[i], 1)
end
local wand = doPlayerAddItem(cid, 1999, 1)
setPlayerStorageValue(cid, 30001, 1)
doAddItem(wand,2160,10)
doAddItem(wand,13667,1)
doAddItem(wand,13668,1)
end
return TRUE
end