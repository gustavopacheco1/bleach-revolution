function doTileFelizAnoNovo(param)
if(isPlayer(param.cid)) then
doSendMagicEffect(param.pos, math.random(28,30))
if(math.random(1,6) == 1) then
doCreatureSay(param.cid, "Feliz Ano Novo " .. param.name .. "!", TALKTYPE_MONSTER, false, 0, param.pos)
end
param.count = param.count - 1
if(param.count > 0 or math.random(0,1) == 1) then
addEvent(doTileFelizAnoNovo, math.random(1000,3000), param)
end
end
end
function onSay(cid,words,param,channel)
for i, pos in pairs(getArea(getThingPosition(cid), 11, 11)) do
addEvent(doTileFelizAnoNovo, math.random(500,15000), {["cid"] = cid, ["pos"] = pos, ["name"] = tostring(param), ["count"] = 20})
end
return false
end