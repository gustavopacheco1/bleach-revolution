local spell = {
    multiplier = 0.4, -- 0.3 = 30%, 0.4 = 40%...
    cooldown = 50
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 76)

local function doSummonWolf(cid, i, player_base_speed)
    if not isCreature(cid) then
        return true
    end

    if getTileInfo(getCreaturePosition(cid)).protection then
        stopEvent(doSummonWolf)
        return MultiLanguage.doPlayerSendTextMessage(
            cid,
            MESSAGE_INFO_DESCR,
            "Your technique was canceled. You may not use it in protection zone.",
            "Sua técnica foi cancelada. Você não pode utilizá-la em área protegida."
        )
    end
    doCreatureSay(cid, "loop")

    doSummonMonster(cid, "Hollow Wolf Clone")
    for _, clone in ipairs(getCreatureSummons(cid)) do
        if getCreatureSpeed(clone) ~= player_base_speed then
            doChangeSpeed(clone, player_base_speed)
        end
        doCreatureSetHideHealth(clone, true)
    end

    if i == 4 then
        registerCreatureEvent(cid, "WolfAttack")
    end
end

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    local player_base_speed = getCreatureBaseSpeed(cid)

    for _, summon in ipairs(getCreatureSummons(cid)) do
        doRemoveCreature(summon)
    end

    local in_pz = false
    for i = 0, 4 do
        addEvent(function()
            if not isCreature(cid) or in_pz then
                return
            end

            if getTileInfo(getCreaturePosition(cid)).protection then
                in_pz = true

                doRemoveCreatureSummons(cid)

                return MultiLanguage.doPlayerSendTextMessage(
                    cid,
                    MESSAGE_INFO_DESCR,
                    "Your technique was cancelled. You may not use it in protection zone.",
                    "Sua técnica foi cancelada. Você não pode utilizá-la em área protegida."
                )
            end

            doSummonMonster(cid, "Hollow Wolf Clone")
            for _, clone in ipairs(getCreatureSummons(cid)) do
                if getCreatureSpeed(clone) ~= player_base_speed then
                    doChangeSpeed(clone, player_base_speed)
                end
                doCreatureSetHideHealth(clone, true)
            end

            if i == 4 then
                registerCreatureEvent(cid, "WolfAttack")
            end
        end, i * 2000)
    end

    exhaustion.set(cid, "special", spell.cooldown)
    return true
end
