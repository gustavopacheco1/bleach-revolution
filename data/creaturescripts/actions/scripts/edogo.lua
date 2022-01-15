local config = {
percent = 15, --- porcentagem do chakra que perde
}
 
function onUse(cid, item, frompos, item2, topos)
    local health = tonumber(getItemAttribute(item.uid, "lifepet"))
    local mhp = tonumber(getItemAttribute(item.uid, "maxlifepet"))
local lifedraw = math.ceil(getCreatureMaxHealth(cid) * (config.percent)/100)
local vocs = {300, 649}
local msg0 = [[ Você ssó pode ter 0 summon(s), A seguinte tabela mostra os
leveis e o respectivo número de summons que um player terá
ao estar nele
 
Level <~> [summons]
 
~->50[1]
~->150[2]
~->200[2]
~->350[3]
~->450[4]
]]
 
local msg1 = [[ Você ssó pode ter 1 summon(s), A seguinte tabela mostra os
leveis e o respectivo número de summons que um player terá
ao estar nele
 
Level <~> [summons]
 
~->50[1]
~->150[2]
~->200[2]
~->350[3]
~->450[4]
]]
 
local msg2 = [[ Você ssó pode ter 2 summon(s), A seguinte tabela mostra os
leveis e o respectivo número de summons que um player terá
ao estar nele
 
Level <~> [summons]
 
~->50[1]
~->150[2]
~->200[2]
~->350[3]
~->450[4]
]]
 
local msg3 = [[ Você ssó pode ter 3 summon(s), A seguinte tabela mostra os
leveis e o respectivo número de summons que um player terá
ao estar nele
 
Level <~> [summons]
 
~->50[1]
~->150[2]
~->200[2]
~->350[3]
~->450[4]
]]
 
local msg4 = [[ Você ssó pode ter 4 summon(s), A seguinte tabela mostra os
leveis e o respectivo número de summons que um player terá
ao estar nele
 
Level <~> [summons]
 
~->50[1]
~->150[2]
~->200[2]
~->350[3]
~->450[4]
]]
 
if(not(isInArray(vocs, getPlayerVocation(cid)))) then
return doPlayerSendTextMessage(cid, 26, "You cannot use this object.")
end
 
if health <= 0 then
return doPlayerSendCancel(cid, "Esse pet esta morto.")
end
 
 
if #getCreatureSummons(cid) == 0 and getPlayerLevel(cid) <= 49 then
doPlayerPopupFYI(cid, msg0)
    return true
end
 
if #getCreatureSummons(cid) == 1 and getPlayerLevel(cid) <= 149 then
doPlayerPopupFYI(cid, msg1)
    return true
end
 
if #getCreatureSummons(cid) == 1 and getPlayerLevel(cid) <= 199 then
doPlayerPopupFYI(cid, msg1)
    return true
end
 
if #getCreatureSummons(cid) == 2 and getPlayerLevel(cid) <= 349 then
doPlayerPopupFYI(cid, msg2)
    return true
end
 
if #getCreatureSummons(cid) == 3 and getPlayerLevel(cid) <= 449 then
doPlayerPopupFYI(cid, msg3)
    return true
end
 
if #getCreatureSummons(cid) == 4 and getPlayerLevel(cid) >= 450 then
doPlayerPopupFYI(cid, msg4)
    return true
end
 
    local pet_name = getItemAttribute(item.uid, "namepet")
 
if item.itemid == 11390 then
if not getTilePzInfo(getPlayerPosition(cid)) then
if #getCreatureSummons(cid) < 1 and getPlayerLevel(cid) > 49 or #getCreatureSummons(cid) < 2 and getPlayerLevel(cid) > 149 or #getCreatureSummons(cid) < 2 and getPlayerLevel(cid) > 199 or #getCreatureSummons(cid) < 3 and getPlayerLevel(cid) > 349 or #getCreatureSummons(cid) < 4 and getPlayerLevel(cid) > 449 then
if isCreature(cid) then
if getCreatureMaxHealth(cid) then
 
local summon = doSummonCreature(pet_name, topos)
doRemoveItem(item.uid, 1)
                doConvinceCreature(cid, summon)
                setCreatureMaxHealth(summon, mhp)
                doCreatureAddHealth(summon, mhp)
                doCreatureAddHealth(summon, health - mhp)
doCreatureAddHealth(cid, -5000)
doCreatureAddMana(cid, -5103)
                doSendMagicEffect(getCreaturePosition(summon), 2)
                doCreatureSay(cid, "EDO TENSEI!", 19)
end
else
doPlayerSendCancel(cid,'Você não pode invocar uma criatura de uma zona protegida.')
end
    end
end
end
    return true
end