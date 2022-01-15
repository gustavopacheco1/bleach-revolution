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

function onSay(cid, words, param, channel)
    local anyPos, pos = {x = 0, y = 0, z = 0}, getCreaturePosition(cid)
    local toPos = {
        {x = pos.x + 1, y = pos.y + 1, z = pos.z},
        {x = pos.x + 8, y = pos.y + 4, z = pos.z},
        {x = pos.x + 4, y = pos.y + 4, z = pos.z},
        {x = pos.x - 5, y = pos.y - 1, z = pos.z},
        {x = pos.x - 3, y = pos.y - 2, z = pos.z},
        {x = pos.x - 7, y = pos.y - 3, z = pos.z},
        {x = pos.x + 3, y = pos.y + 1, z = pos.z},
        {x = pos.x + 2, y = pos.y + 4, z = pos.z},
        {x = pos.x + 1, y = pos.y + 3, z = pos.z},
        {x = pos.x - 4, y = pos.y - 1, z = pos.z},
        {x = pos.x - 3, y = pos.y - 4, z = pos.z},
        {x = pos.x - 2, y = pos.y - 4, z = pos.z},
    }

    local maxSummons, playerSummons = 12, #getCreatureSummons(cid)
    if maxSummons - playerSummons > 0 then
        for i = 1, maxSummons - playerSummons do
            doCombatAreaHealth(0, 0, anyPos, 0, 0, 0, 255)
            doCreateItem(460, 1, anyPos)

            local bunshin = doCreateMonster("White Zetsu", anyPos)
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