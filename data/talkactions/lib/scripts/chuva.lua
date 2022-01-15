function onSay(cid, words, param, channel)
local param = tonumber(param)

if(not param or param < 0 or param > 254) then
doPlayerSendCancel(cid, "Numeric param may not be lower than 0 and higher than 251.")
return true
end

local tempo = 60
     
local function Magica(tempo2, tempo3, cid)
if isCreature(cid) then
for i=1, 50 do
local position = {x=getCreaturePosition(cid).x+(math.random(-4, 4)), y=getCreaturePosition(cid).y+(math.random(-4, 4)), z=getCreaturePosition(cid).z}
doSendMagicEffect(position, param)
end
end
end

tempo2 = 0
while (tempo2 ~= (tempo*1000)) do
addEvent(Magica, tempo2, tempo2, tempo*1000, cid)
tempo2 = tempo2 + 800
end
return TRUE
end