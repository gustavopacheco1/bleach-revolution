local storage = 73732

function doCreateTile(tileid, pos)
        doCombatAreaHealth(0, 0, pos, 0, 0, 0, CONST_ME_NONE)
        doCreateItem(tileid, 1, pos)
        return true
end

function getCreaturesInPos(pos)
   local ret =  {}
   for a = 0, 255 do
      local pos_check = {x = pos.x, y = pos.y, z = pos.z, stackpos = a}
      local crea = getThingFromPos(pos_check).uid 
      if (isCreature(crea)) and not(isInArray(ret, crea)) then
         table.insert(ret, crea)
      end
   end
   return ret
end 

function onThrow(cid, fromPosition, toPosition)
   if (getPlayerStorageValue(cid, storage) < 1) then
      return true   
   else
      local fpTile = getTileThingByPos(fromPosition)
      if (fpTile.itemid == 460) then
         local pos_check = {x = fromPosition.x, y = fromPosition.y, z = fromPosition.z, stackpos = 255}
         if (#getCreaturesInPos(fromPosition) < 2) then
            doRemoveItem(fpTile.uid, 1)
         end
      end
      
      local tpTile = getTileThingByPos(toPosition)
      if (tpTile.itemid == 0) then 
         doCreateTile(460, toPosition)         
      end
   end

   return true
end

function onAttack(cid, target)
	if getPlayerStorageValue(cid, storage) == 1 then
		doPlayerSendCancel(cid, "Você não pode atacar usando o fly.")
		return false
	end
	return true
end

function onLogout(cid)
	if (getCreatureStorage(cid, storage) == 1) then
		doPlayerSendCancel(cid, "Você não pode deslogar usando o fly.")
		return false
	end
	return true
end