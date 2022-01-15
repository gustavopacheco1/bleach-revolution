function onSay(cid , words, param)
local textSay = {"Sim", "Não", "Talves", "Não] intendi vc poderia repetir?"}
pet = {
["jya boss"]= {stor=78551,price=500},
["great snake"]= {stor=78552,price=300},
["dark snake"]= {stor=78553,price=500},
["gama bunta"]= {stor=78554,price=300},
["jya"]= {stor=78555,price=500},
["manda"]= {stor=78556,price=300},
["Namekuji"]= {stor=78557,price=500},
}
param = string.lower(param)
if words=="!comprar" then
if doPlayerRemoveMoney(cid,pet[param].price) then
setPlayerStorageValue(cid,pet[param].stor,1)
else
doPlayerSendCancel(cid,"Desculpa, mas voce nao tem dinheiro para esse Kuchiyose")
end
end
if words=="!kuchiyose" then
if #getCreatureSummons(cid) < 1 and pet[param] and getPlayerStorageValue(cid,pet[param].stor) >= 1 then
local x = doSummonCreature(param,getCreaturePosition(cid))
doConvinceCreature(cid, x)
doCreatureSay(cid,"Go "..getCreatureName .."",TALKTYPE_ORANGE_1)
else
doPlayerSendCancel(cid,"Desculpa voce nao tem um summon")
end
elseif words=="!remover" then
if #getCreatureSummons(cid) > 0 then
doRemoveCreature(getCreatureSummons(cid)[1])
doCreatureSay(cid,"Back My Monster",TALKTYPE_ORANGE_1)
end
elseif words=="!conversar" then
if #getCreatureSummons(cid) > 0 then
doCreatureSay(cid,textSay[math.random(#texteSay)],TALKTYPE_ORANGE_1)
else
doPlayerSendCancel(cid,"Desculpe incoque seu summon primeiro")
end
elseif words=="!fale" then	
doCreatureSay(getCreatureSummons(cid)[1],param,TALKTYPE_ORANGE_1)
end
return true
end