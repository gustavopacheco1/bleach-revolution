function onSay(cid, words, param, channel)
if getPlayerLevel(cid) >= 100 then
local pos1 = getThingPos(cid)
doSendMagicEffect({x = pos1.x, y = pos1.y - 1, z = pos1.z}, 408)
return true
end
end