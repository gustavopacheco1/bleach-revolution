local area = createCombatArea {
    {1, 1, 1},
    {1, 3, 1},
    {1, 1, 1}
}

local combat = createCombatObject()
setCombatArea(combat, area)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 653)

function onTargetTile(cid, position)
    if isWalkableTrue(cid, position, true, true) <= 0 then
        local create = doCreateItemEx(13521, 1)
        doTileAddItemEx(position, create)
        doDecayItem(create)
    end
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
    if exhaustion.check(cid, "special") then
        doPlayerSendCancel(cid, "Cooldown " .. exhaustion.get(cid, "special") .. "s")
        return false
    end

    exhaustion.set(cid, "special", 29.0)
    doCombat(cid, combat, var)
    return true
end
