--[[
    Capture The Flag System 
    Author: Maxwell Denisson(MaXwEllDeN)
    Version: 1.0
]]

local CTF = _CTF_LIB

function onStatsChange(cid, attacker, type, combat, value)         
   if (getPlayerStorageValue(cid, CTF.teamssto) > 0) and (getCreatureHealth(cid)-value <= 0) then 
      if isPlayer(cid) and isCreature(attacker) then
         if (getPlayerStorageValue(cid, CTF.Flagsto) > 0) then
            local bant = getPlayerStorageValue(cid, CTF.Flagsto)
            devolverFlag(cid, bant)

            MsgToCTFM(22, getCreatureName(cid) .. " morreu no CTF com a bandeira do time ".. CTF.flags[bant].na .. " por tanto ela foi devolvida.")
                        
            setPlayerStorageValue(cid, CTF.Flagsto, -1)     
         end      

      doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
      doCreatureAddMana(cid, getCreatureMaxMana(cid))
      doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
      doCreatureSetSkullType(cid, 0)
      return false
      end                                         
   end	   
	return true
end

function onLogout(cid)
   
   local team = getPlayerStorageValue(cid, _CTF_LIB.teamssto)         

   if (team > 0) then
      setGlobalStorageValue(team, getGlobalStorageValue(team)-1)
      setPlayerStorageValue(cid, _CTF_LIB.teamssto, -1)

      doRemoveCondition(cid, CONDITION_OUTFIT)   
      doPlayerSetTown(cid, CTF.TownExit)
      doTeleportThing(cid, getTownTemplePosition(CTF.TownExit))   
   
      if (getPlayerStorageValue(cid, CTF.Flagsto) > 0) then
         local bant = getPlayerStorageValue(cid, CTF.Flagsto)

         devolverFlag(cid, bant)

         MsgToCTFM(22, getCreatureName(cid) .. " saiu do Capture The Flag sem entregar a bandeira do time ".. _CTF_LIB.flags[bant].na ..", por tanto ela foi devolvida!")
         RemoveFlag(getPPos(cid), _CTF_LIB.flags[bant].id)         
         setPlayerStorageValue(cid, CTF.Flagsto, -1)     
      end

   end
   return true
end

function onCombat(cid, target)    

   if (getPlayerStorageValue(cid, CTF.teamssto) > 0) then
      local team = getPlayerStorageValue(cid, CTF.teamssto)
      if (team == getPlayerStorageValue(target, CTF.teamssto)) then
         return false
      end
   end      
   return true
end

function onAttack(cid, target)     

   if (getPlayerStorageValue(cid, CTF.teamssto) > 0) then
      local team = getPlayerStorageValue(cid, CTF.teamssto)
      if (team == getPlayerStorageValue(target, CTF.teamssto)) then
         doPlayerSendCancel(cid, "Você não pode atacar alguém que é do mesmo time que o seu!")
         return false
      end
   end      
   return true
end