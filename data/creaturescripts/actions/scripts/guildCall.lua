-- Script feito por Luan, antigo DBKO
-- #OMS 5
local tempo = 60 -- Tempo que os players tem para aceitar
local cooldown = 60 -- Cooldown para chamar os membros novamente

function getOnlineGuildMembersByRank(guildId, rank, selectLowerRanks) -- Função feita pelo Luan para o AGS.
    if not rank then
        rank = 3
        selectLowerRanks = true
    end
    local list = {}
    for _, pid in pairs(getPlayersOnline()) do
        if getPlayerGuildId(pid) == guildId then
            local playerRank = getPlayerGuildLevel(pid)
            if playerRank == rank or (selectLowerRanks and playerRank <= rank) then
                table.insert(list, pid)
            end
        end
    end
    return list
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if getPlayerStorageValue(cid, 281921) > os.time() then
        doPlayerSendCancel(cid, "Espere mais " .. getPlayerStorageValue(cid, 281921) - os.time() .. " segundos para chamar sua guld novamente.")
       return true
   end
   
   if getPlayerGuildLevel(cid) < 3 then
       doPlayerSendCancel(cid, "Somente o lider da guild pode chamar todos os membros.")
       return true
   end

   local guildMembers = getOnlineGuildMembersByRank(getPlayerGuildId(cid), 2, true)
   doPlayerSetStorageValue(cid, 281921, os.time() + cooldown)
   doPlayerSendTextMessage(cid, 25, "Voce chamou todos os membros da sua guild para virem aqui. Em " .. tempo .. " segundos, todos que aceitarem serao teleportados para ca.")
   for _, membros in ipairs (guildMembers) do
       doPlayerSendTextMessage(membros, MESSAGE_STATUS_CONSOLE_ORANGE, getCreatureName(cid).. " lider da guild esta te chamando para o lado dele, voce quer ir? Diga !yes para aceitar. Voce tem ".. tempo .." segundos para decidir")
       doPlayerSetStorageValue(membros, 380121, os.time() + tempo)
       addEvent(function()
           if getPlayerStorageValue(membros, 125023) == 1 then
               doPlayerSetStorageValue(membros, 125023, 0)
               if not isPlayerPzLocked(membros) then
                   doTeleportThing(membros, fromPosition)
                   doSendMagicEffect(fromPosition, CONST_ME_TELEPORT)
               else 
                   doPlayerSendCancel(membros, "Voce nao foi teleportado pois esta pz locked.")
               end
           end
       end, tempo * 1000)
   end
   return true
end