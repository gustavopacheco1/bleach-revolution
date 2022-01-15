function onSay(cid, words, param, channel)
    if (param == "") then
        return doPlayerSendTextMessage(cid, 27, "\n-open\n-close\n-arrumar")

    elseif (param == "open") then
        if getGlobalStorageValue(WAR_Lib_Config.TeamYondaime.storage) > 0 and getGlobalStorageValue(WAR_Lib_Config.TeamTobi.storage) > 0 then
            return doPlayerSendTextMessage(cid, 27, "O evento Shinobi War ja esta aberto.")
        else
            setGlobalStorageValue(WAR_Lib_Config.TeamYondaime.storage, WAR_Lib_Config.Kills)
            setGlobalStorageValue(WAR_Lib_Config.TeamTobi.storage, WAR_Lib_Config.Kills)
            doBroadcastMessage("O evento Shinobi War esta Aberto!! o teleport fechara em "..WAR_Lib_Config.Time.." minuto"..(WAR_Lib_Config.Time > 1 and "s" or "").."!", MESSAGE_EVENT_ADVANCE)
            ShinobiWarOpen()
            local event = addEvent(ShinobiWarCheck, WAR_Lib_Config.Time*60*1000)
            setGlobalStorageValue(1050,event)
            return true
        end

    elseif (param == "arrumar") then
        return doTeleportThing(cid, WAR_Lib_Config.TeamYondaime.pos)

    elseif (param == "close") then
        if getGlobalStorageValue(WAR_Lib_Config.TeamYondaime.storage) < 1 and getGlobalStorageValue(WAR_Lib_Config.TeamTobi.storage) < 1 then
            return doPlayerSendTextMessage(cid, 27, "O evento Shinobi War ja esta fechado.")
         else
            ShinobiWarCancel()
            doBroadcastMessage("O evento Shinobi War foi cancelado!", MESSAGE_EVENT_ADVANCE)
            stopEvent(getGlobalStorageValue(1050))
        end
    end
    return true
end
