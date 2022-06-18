local spell = {
    cooldown = 30,
    duration = 3
}

local area = createCombatArea {
    {1, 1, 1},
    {1, 2, 1},
    {1, 1, 1}
}

local combat = createCombatObject()
setCombatArea(combat, area)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 653)

function onCastSpell(cid, var)
    if checkSpecialCooldown(cid) then
        return false
    end

    local target = getCreatureTarget(cid)

    if getCreatureNoMove(target) or getCreatureSpeed(target) == 0 then
        MultiLanguage.doPlayerSendCancel(
            cid,
            "You cannot use a trap technique in a trapped creature.",
            "Você não pode utilizar uma técnica de trap em uma criatura trapada."
        )
        return false
    end

    if isPlayer(target) then
        doCreatureSetNoMove(target, true)
        addEvent(function()
            if isCreature(cid) then
                doCreatureSetNoMove(target, false)
            end
        end, spell.duration * 1000)
    end

    if isMonster(target) then
        local creature_base_speed = getCreatureBaseSpeed(target)

        doChangeSpeed(target, -getCreatureSpeed(target))
        addEvent(function()
            if isMonster(target) then
                doChangeSpeed(target, creature_base_speed)
            end
        end, spell.duration * 1000)
    end

    exhaustion.set(cid, "special", spell.cooldown)
    doCombat(cid, combat, var)
    return true
end
