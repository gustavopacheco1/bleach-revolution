function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)

   if (getPlayerLevel(cid) <= 999) then

	  return doCreatureSetDropLoot(cid, false)	  

   end


   return true

end