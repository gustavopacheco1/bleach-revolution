function onLook(cid, thing, position, lookDistance)
if isPlayer(thing.uid) then
local var,ret,tri = getPlayerStorageValue(thing.uid, 89745) < 0 and 0 or getPlayerStorageValue(thing.uid, 89745), getPlayerStorageValue(thing.uid, 550000) < 0 and 0 or getPlayerStorageValue(thing.uid, 550000), getPlayerStorageValue(thing.uid, 120000) < 0 and 0 or getPlayerStorageValue(thing.uid, 120000) 
local a = {[0] = "Shinobi",[1] = "Genin",[2] = "Chunin",[3] = "Jounin",[4] = "Anbu",[5] = "Sennin",[6] = "Akatsuki"}
local b = {[0] = "Academia Shinobi", [1] = "Akatsuki", [2] = "Vila da Folha"}
local c = {[0] = "Sem Vila", [1] = "Konoha", [2] = "Suna"}
doPlayerSetSpecialDescription(thing.uid, "\n "..(getPlayerSex(cid) == 0 and "Ela é uma" or "Ele é um").." "..a[var]..", e pertence a "..b[ret].." . Vive em "..c[tri])
end
return true
end