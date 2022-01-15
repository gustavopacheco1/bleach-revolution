local config = {
--[vocation id] = { level, looktype, efeito}
[1] = { 25, 66, 208},
[1] = { 50, 91, 208},
[1] = { 75, 18, 208},
[1] = { 100, 31, 208},
[1] = { 125, 92, 208},
[1] = { 150, 40, 208},
[1] = { 175, 305, 208},
[1] = { 200, 320, 208},
[1] = { 225, 179, 208},
[1] = { 250, 394, 208}
}
function onSay(cid, words, param, channel)
local from,to = {x=1001, y=705, z=7},{x=1031, y=737, z=7} -- começo e final do mapa
local from2,to2 = {x=1011, y=705, z=6},{x=1031, y=738, z=6} -- começo e final do mapa
local from3,to3 = {x=1012, y=706, z=5},{x=1032, y=739, z=5} -- começo e final do mapa
local from4,to4 = {x=985, y=598, z=7},{x=1044, y=652, z=7} -- começo e final do mapa
local from5,to5 = {x=986, y=615, z=6},{x=1039, y=647, z=7} -- começo e final do mapa
local from6,to6 = {x=990, y=616, z=5},{x=1040, y=647, z=5} -- começo e final do mapa
if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) or isInRange(getCreaturePosition(cid), from5, to5) or isInRange(getCreaturePosition(cid), from6, to6) then
doPlayerSendCancel(cid, "Você não pode se Transformar nesta área!") return true
end
doPlayerSay(cid, "transformar")
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você Transformou!")
local outfit = {lookType = voc[2]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[3])
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Você precisa estar no level " .. voc[1] .. " para transformar.")
end
else
doPlayerSendCancel(cid, "Você não pode se Transformar!")
end
return true
end