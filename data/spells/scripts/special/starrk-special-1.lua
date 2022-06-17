local spell_cooldown = 50

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 76)

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

            doSummonMonster(cid, "Wolf Clone")
            for _, summon in ipairs(getCreatureSummons(cid)) do
                if getCreatureSpeed(summon) ~= player_base_speed then
                    doChangeSpeed(summon, player_base_speed)
                end
                doCreatureSetHideHealth(summon, true)
            end

            if i == 4 then
                registerCreatureEvent(cid, "WolfAttack")
            end
        end, i * 2000)
    end

    exhaustion.set(cid, "special", spell_cooldown)
    return true
end
