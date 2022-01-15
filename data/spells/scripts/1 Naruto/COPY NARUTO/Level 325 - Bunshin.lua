local function isWalkable(pos)
    if getTileThingByPos(pos).itemid == 0 then
        return false
    end

    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, 2) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end

function onCastSpell(cid, var)
    local anyPos, pos = {x = 0, y = 0, z = 0}, getCreaturePosition(cid)
    local toPos = {
        {x = pos.x + 1, y = pos.y, z = pos.z},
        {x = pos.x - 1, y = pos.y, z = pos.z},
        {x = pos.x, y = pos.y + 1, z = pos.z},
        {x = pos.x, y = pos.y - 1, z = pos.z}
    }

    local maxSummons, playerSummons = 4, #getCreatureSummons(cid)
    if maxSummons - playerSummons > 0 then
        for i = 1, maxSummons - playerSummons do
            doCombatAreaHealth(0, 0, anyPos, 0, 0, 0, 255)
            doCreateItem(460, 1, anyPos)

            local bunshin = doCreateMonster("Clone", anyPos)
            doConvinceCreature(cid, bunshin)
            setCreatureMaxHealth(bunshin, getCreatureMaxHealth(cid))
            doCreatureAddHealth(bunshin, getCreatureHealth(cid))
            doSetCreatureOutfit(bunshin, getCreatureOutfit(cid), -1)
            setCreatureName(bunshin, getCreatureName(cid), "a " .. getCreatureName(cid))

            local toPos = isWalkable(toPos[i]) == false and pos or toPos[i]
            doTeleportThing(bunshin, toPos)
            doSendMagicEffect(toPos, CONST_ME_POFF)
        end
    else
        return false
    end
    return true
end