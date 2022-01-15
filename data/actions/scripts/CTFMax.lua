--[[
    Capture The Flag System
    Author: Maxwell Denisson(MaXwEllDeN)
    Version: 1.0
]]

function onUse(cid, item, frompos, item2, topos)
   local CTF = _CTF_LIB

   if (tonumber(getItemAttribute(item.uid, "aid")) == 15312) then

      if (getPlayerStorageValue(cid, CTF.Flagsto) < 0) or
         (getPlayerStorageValue(cid, CTF.Flagsto) == tonumber(getItemAttribute(item.uid, "uid"))) then
         return false
      end

      local flag = CTF.flags[getPlayerStorageValue(cid, CTF.Flagsto)]
      doCreateItem(flag.id, 1, topos)

      local function remover(id, pos)
         doRemoveItem(doFindItemInPos({id}, pos)[1].uid, 1)
      end

      addEvent(remover, 2000, flag.id, topos)
      addPoint(cid, getPlayerStorageValue(cid, CTF.teamssto), getPlayerStorageValue(cid, CTF.Flagsto))
      setPlayerStorageValue(cid, _CTF_LIB.Flagsto, -1)
      return true
   else
	   local BanTEAM = tonumber(getItemAttribute(item.uid, "uid"))
	   if (getPlayerStorageValue(cid, CTF.teamssto) < 1) then
   	   return false
	   elseif (getPlayerStorageValue(cid, CTF.teamssto) == BanTEAM) then
   	   return doPlayerSendCancel(cid, "Você não pode roubar a bandeira do seu proprio time!")
	   end

   	setPlayerStorageValue(cid, CTF.Flagsto, CTF.teamssto)
	
   	getFlag(cid, CTF.teamsto, BanTEAM)
      doRemoveItem(doFindItemInPos({CTF.flags[BanTEAM].id}, topos)[1].uid, 1)
   end
   return true
end