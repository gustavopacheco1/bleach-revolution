--poe isso lá embaixo no login.lua
function doPlayerSaveTime(cid)
if isPlayer(cid) then
	doPlayerSave(cid)
	addEvent(doPlayerSaveTime, 30*1000*60, cid) 
end
end
--depois de terminar o script...
--e no login.lua, antes do return true dele poe:
--addEvent(doPlayerSaveTime, 30*1000*60, cid) 
