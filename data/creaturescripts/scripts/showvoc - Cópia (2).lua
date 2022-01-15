function onLook(cid, thing, position, lookDistance)
if isPlayer(thing.uid) then
local type = getPlayerStorageValue(thing.uid, 89745)
doPlayerSetSpecialDescription(thing.uid, "\n "..(getPlayerSex(cid) == 0 and "Ela" or "Ele").." eh "..(type < 0 and "Um Shinobi" or type == 1 and "Um Genin" or type == 2 and "Um Chunin" or type == 3 and "Um Jounin" or type == 4 and "Um Anbu" or type == 5 and "Um Sennin" or type == 6 and "Akatsuki"))
end
return true
end