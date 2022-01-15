function onSay(cid, words, param, channel)
local playerpos = getPlayerPosition(cid)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
local MaximoSummon = 2 --- Maximo de Monstros Sumonados!!

local summons = getCreatureSummons(cid)

if(table.maxn(summons) < MaximoSummon) then -- no summons
local clone = doCreateMonster("Shark", playerpos)
local clone1 = doCreateMonster("Shark", playerpos)
doConvinceCreature(cid, clone)
doConvinceCreature(cid, clone1)
doSendAnimatedText(getPlayerPosition(cid),"- SHARK -", math.random(1,255))
doCreatureSay(cid, "Kuchyose no Jutsu: Sharks", TALKTYPE_MONSTER)
doSendMagicEffect(position1, 152)
doPlayerSendTextMessage(cid,27,'Kuchyose no Jutsu.') 
return TRUE
end
end