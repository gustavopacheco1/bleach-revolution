local config = {
storage = 19354
}

local outfit = {lookType = 709}

function onStatsChange(cid, attacker, type, combat, value)
if type == STATSCHANGE_HEALTHLOSS and value >= getCreatureHealth(cid) then
if getPlayerStorageValue(cid, config.storage) > 0 then
doPlayerSetStorageValue(cid, config.storage, (getPlayerStorageValue(cid, config.storage)-1))
local pos1 = getCreaturePosition(cid)
doSendMagicEffect({x = pos1.x + 1, y = pos1.y + 1, z = pos1.z}, 11)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
doSendAnimatedText(getCreaturePosition(cid),"IMOOORTALIY", math.random(1,69))
doSetCreatureOutfit(cid, outfit)
if isCreature(attacker) then
doPlayerSendTextMessage(cid, 27, "O ".. getCreatureName(attacker) .." acaba de tentar lhe matar, é hora de suave vingança!")
doPlayerSendTextMessage(cid, 25, "Voce acaba de ativar a passiva da imortalidade!.")
end
if isPlayer(attacker) and isCreature(cid) then
doPlayerSendTextMessage(attacker, 27, "Voce matou ".. getCreatureName(cid) .."!")
end


return false
end
end
return true
end