local text = '<attack name="melee" interval="2000" chance="100" range="5" radius="1" target="0"><attribute key="areaEffect" value="fire"/></attack>'
function onSay(cid, words)
local MaximoSummon = 10 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 5 Clones

local summons = getCreatureSummons(cid)
if(table.maxn(summons) < MaximoSummon) then -- no summons
local clone = doCreateCustomMonster(getCreatureName(cid), getCreaturePosition(cid), getCreatureOutfit(cid), getCreatureMaxHealth(cid), text, 6324, 1, 100)
doConvinceCreature(cid, clone)
return true
end
return true
end