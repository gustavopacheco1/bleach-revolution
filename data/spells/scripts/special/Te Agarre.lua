local spell = {
    cooldown = 40,
    teleport_time = 7,
    range = 1,
    marked_sqm_effect = 628,
    teleport_effect = 14,
}

local position_storage = {}

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    position_storage[cid] = getCreaturePosition(cid)
    doSendMagicEffect(position_storage[cid], spell.marked_sqm_effect)
    addEvent(function()
        if isCreature(cid) then
            for _, i in ipairs(getSpectators(getCreaturePosition(cid), spell.range, spell.range)) do
                doTeleportThing(i, position_storage[cid])
            end

            doTeleportThing(cid, position_storage[cid])
            doSendMagicEffect(position_storage[cid], spell.teleport_effect)
        end
        position_storage[cid] = nil
    end, spell.teleport_time * 1000)

    exhaustion.set(cid, "special", spell.cooldown)
    return true
end
