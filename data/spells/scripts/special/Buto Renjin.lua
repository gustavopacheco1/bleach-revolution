local spell = {
    cooldown = 60,
    effect = 352,
    health_percentage_damage = 0.05, -- 0.05 = 5%, 0.1 = 10%...
    total_hits = 10,
    hit_delay = 4
}

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    local damage = getCreatureMaxHealth(cid) * spell.health_percentage_damage
    local target = getCreatureTarget(cid)

    for i = 0, spell.total_hits-1 do
        addEvent(function()
            if isCreature(cid) and isCreature(target) then
                doTargetCombatHealth(cid, target, COMBAT_PHYSICALDAMAGE, -damage, -damage, spell.effect)
            end
        end, i * (spell.hit_delay * 1000))
    end

    exhaustion.set(cid, "special", spell.cooldown)
    return true
end