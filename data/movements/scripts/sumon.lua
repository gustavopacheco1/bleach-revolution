local monsters = {
"Bandit", "Beezer", "Snake", "Anbu", "Shinobi Archer", "Kiba", "Great Snake", "Dark Snake",
}
local storage = 27560 -- a storage utilizada pelo script

-- não modifique daqui para baixo, a menos que saiba o que está fazendo
local internal = {}
local function localCheck(player, monster, next)
    if not isCreature(player) then
            if isCreature(monster) then
                    doSendMagicEffect(getThingPos(monster), CONST_ME_POFF)
                    doRemoveCreature(monster)
            end
    return
    end
    if not isCreature(monster) then
            setPlayerStorageValue(player, storage, next)
            doSendMagicEffect(getThingPos(player), 13)
            internal[getPlayerGUID(player)] = nil
    return
    end
    if getDistanceBetween(getThingPos(player), getThingPos(monster)) > 18 then
            doSendMagicEffect(getThingPos(monster), CONST_ME_POFF)
            doRemoveCreature(monster)
            doSendMagicEffect(getThingPos(player), CONST_ME_POFF)
    return
    end
addEvent(localCheck, 1000, player, monster, next)
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

    local guid, lvl = getPlayerGUID(cid), math.max(getPlayerStorageValue(cid, storage), 1)

    if lvl > #monsters then
            doTeleportThing(cid, fromPosition, true)
            doSendMagicEffect(fromPosition, CONST_ME_POFF)
            doPlayerSendCancel(cid, "A cova está vazia!")
    return true
    end
    
    local monster = monsters[lvl]
    
    if not internal[guid] then
            internal[guid] = doCreateMonster(monster, fromPosition, false)
            if not internal[guid] then
                    doTeleportThing(cid, fromPosition, true)
                    doSendMagicEffect(fromPosition, CONST_ME_POFF)
                    doPlayerSendCancel(cid, "Não há espaço para os monstros sairem!")
            return false
            end
            doSendMagicEffect(getThingPos(internal[guid]), CONST_ME_TELEPORT)
            addEvent(localCheck, 1000, cid, internal[guid], lvl + 1)
    else
            doPlayerSendCancel(cid, "Mate o monstro que você sumonou primeiro!")
            doTeleportThing(cid, fromPosition, true)
    end

end