local Bosses = {
["kurama"] = {"the kurama boss", 15211},
["hidan"] = {"the hidan boss", 15212},
["juubi"] = {"the juubi boss", 15213},
}
local from,to = {x=1140, y=686, z=7},{x=1164, y=710, z=7}
local pos = {x=1157,y=695,z=7} -- pos onde o boss ira nascer
local time = 3 -- tempo em minutos para começar o evento

function onSay(cid, words, param, channel)
    local boss = Bosses[param:lower()]
    local function Cancel_Event()
        setGlobalStorageValue(12530, -1)
        if getTileItemById({x=1014,y=890,z=7},1536).uid < 1 then
            doCreateItem(1536,1,{x=1014,y=890,z=7})
        end
        for x = from.x, to.x do
            for y = from.y, to.y do
                for z = 7, 8 do
                    local mob = getTopCreature({x=x, y=y, z=z}).uid
                    if isPlayer(mob) then
                        doCreatureAddHealth(mob, getCreatureMaxHealth(mob))
                        doRemoveCondition(mob, CONDITION_POISON)
                        doRemoveCondition(mob, CONDITION_PARALYZE)
                        doRemoveCondition(mob, CONDITION_OUTFIT)
                        doRemoveCondition(mob, CONDITION_INFIGHT)
                        doTeleportThing(mob, getClosestFreeTile(mob, {x=1014 ,y=894 ,z=7}))
                    end
                    if isMonster(mob) then
                        doRemoveCreature(mob)
                    end
                end
            end
        end
    end
    local function Open_Event()
        local check = 0
        for x = from.x, to.x do
            for y = from.y, to.y do
                local mob = getTopCreature({x=x, y=y, z=from.z}).uid
                if isPlayer(mob) and getPlayerAccess(mob) < 2 then
                    check = check + 1
                end
            end
        end
        if check < 1 then
            Cancel_Event()
            doBroadcastMessage("Evento Bosses foi cancelado por falta de participantes!", MESSAGE_EVENT_ADVANCE)
            return true
        end
        if isCreature(getTopCreature({x=1014,y=890,z=7}).uid) then
            doTeleportThing(mob, {x=1014,y=891,z=7})
        end
        if getTileItemById({x=1014,y=890,z=7},1536).uid < 1 then
            doCreateItem(1536,1,{x=1014,y=890,z=7})
        end
        local chest = doCreateItem(7493,1,{x=1153,y=698,z=8})
        doCreateMonster(boss[1],pos)
        doItemSetAttribute(chest, "uid", boss[2])
        doBroadcastMessage("O evento Bosses começou!", MESSAGE_EVENT_ADVANCE)
    end

    if (param == "") then
        return doPlayerSendTextMessage(cid, 27, "\n-kurama\n-hidan\n-juubi")

    elseif (boss) then
        if getGlobalStorageValue(12530) > 0 then
            return doPlayerSendTextMessage(cid, 27, "O evento Bosses ja esta aberto.")
        end
        Cancel_Event()
        setGlobalStorageValue(12530,1)
        doBroadcastMessage("O evento Bosses esta Aberto!! o teleport fechara em "..(time).." minuto"..(time > 1 and "s" or "").."! BOSS: "..param:upper().."", MESSAGE_EVENT_ADVANCE)
        if getTileItemById({x=1014,y=890,z=7},1536).uid > 0 then
            doRemoveItem(getTileItemById({x=1014,y=890,z=7},1536).uid)
        end
        if getTileItemById({x=1153,y=698,z=8},1740).uid > 0 then
            doRemoveItem(getTileItemById({x=1153,y=698,z=8},7493).uid)
        end
        local event = addEvent(Open_Event, time*60*1000)
        setGlobalStorageValue(1200,event)

    elseif (param == "arrumar") then
        return doTeleportThing(cid, {x=1153, y=703, z=7})

    elseif (param == "close") then
        if getGlobalStorageValue(12530) < 1 then
            return doPlayerSendTextMessage(cid, 27, "O evento Bosses ja esta fechado.")
        end
        Cancel_Event()
        setGlobalStorageValue(12530, -1)
        stopEvent(getGlobalStorageValue(1200))
        doBroadcastMessage("O evento Bosses foi cancelado!", MESSAGE_EVENT_ADVANCE)
    end
    return true
end