local stime = 10 -- tempo de pk (minutos)
local condition_infight = createConditionObject(CONDITION_INFIGHT)
setConditionParam(condition_infight, CONDITION_PARAM_TICKS, stime * 60 * 1000)

function onAttack(cid, target)

if getPlayerLevel(cid) < 100 and isPlayer(getCreatureMaster(target)) then
doPlayerSendCancel(cid, "Você não tem level para atacar Summons(Apartir do 100 ganhar PK).")
return false
end

    if isPlayer(cid) and getCreatureSkullType(cid) < 3 and isPlayer(getCreatureMaster(target)) then
        doCreatureSetSkullType(cid, SKULL_WHITE)
        doAddCondition(cid, condition_infight)
        doPlayerSetPzLocked(cid, true)
    end
    return true
end
