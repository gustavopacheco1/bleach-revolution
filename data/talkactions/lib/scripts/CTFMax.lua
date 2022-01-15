--[[
    Capture The Flag System 
    Author: Maxwell Denisson(MaXwEllDeN)
    Version: 1.0
]]

function onSay(cid, words, param)
   local CTF = _CTF_LIB

   if not(CTF.nopen) then
      return false
   end      

   if (param == "open") then
      if (getGlobalStorageValue(CTF.CTFSto) > 0) then
         return doPlayerSendTextMessage(cid, 27, "O Evento RB já está aberto!")
      end

      doBroadcastMessage("[Evento] Roube a Bandeira foi aberto!")
      setGlobalStorageValue(CTF.CTFSto, 1)
      doPlayerSendTextMessage(cid, 27, "Evento Roube a Bandeira foi aberto com sucesso!")
   elseif (param == "close") then
      if (getGlobalStorageValue(CTF.CTFSto) < 1) then
         return doPlayerSendTextMessage(cid, 27, "O Evento Roube a Bandeira já está fechado!")
      end

      doBroadcastMessage("[Evento] Roube a Bandeira foi fechado!")
      
      for a, _ in pairs(CTF.flags) do
         setGlobalStorageValue(a, 0)
         setGlobalStorageValue(a-15, 0)         
      end      
      
      for _, cid in pairs (getOnlinePlayers()) do       
          local cid = getPlayerByNameWildcard(b)
          if (getPlayerStorageValue(cid, CTF.teamssto) > 0) then
             doPlayerSendTextMessage(cid, 22, "[Evento] Roube a Bandeira foi fechado e você saiu do evento!")

             if (getPlayerStorageValue(cid, CTF.Flagsto) > 0) then
                local bant = getPlayerStorageValue(cid, CTF.Flagsto)
                devolverFlag(cid, bant)
             end              
             
             setPlayerStorageValue(cid, CTF.teamssto, -1)
             setPlayerStorageValue(cid, CTF.Flagsto, -1)
	          doPlayerSetTown(cid, CTF.TownExit)
             doTeleportThing(cid, getTownTemplePosition(CTF.TownExit))             
          end
      end            
      
      setGlobalStorageValue(CTF.CTFSto, -1)
      doPlayerSendTextMessage(cid, 27, "Evento RB foi fechado com sucesso!")
   end 
   return true
end