--[[
    Capture The Flag System 
    Author: Maxwell Denisson(MaXwEllDeN)
    Version: 1.0
]]

local CTF = _CTF_LIB

function onStepIn(cid, item, pos)
   
   local team = getPlayerStorageValue(cid, _CTF_LIB.teamssto)      

   setGlobalStorageValue(team, getGlobalStorageValue(team)-1)
   setPlayerStorageValue(cid, _CTF_LIB.teamssto, -1)
   
   doPlayerSetTown(cid, CTF.TownExit)
   doTeleportThing(cid, getTownTemplePosition(CTF.TownExit))   

   doRemoveCondition(cid, CONDITION_OUTFIT)   
   if (getPlayerStorageValue(cid, CTF.Flagsto) > 0) then
      local bant = getPlayerStorageValue(cid, CTF.Flagsto)

      devolverFlag(cid, bant)

      MsgToCTFM(22, getCreatureName(cid) .. " saiu do Evento Roube a Bandeira sem entregar a bandeira do time ".. _CTF_LIB.flags[bant].na ..", por tanto ela foi devolvida!")
      setPlayerStorageValue(cid, CTF.Flagsto, -1)     
   end
   
   return true
end