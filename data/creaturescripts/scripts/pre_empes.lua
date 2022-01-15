dofile("./_woe.lua")

local config = woe_config

function onDeath(cid, corpse, killer)
	if isCreature(cid) == true then
		doRemoveCreature(cid)
	end
	if Woe.isTime() then
		if Woe.checkPre() then
			doSetItemActionId(doCreateItem(1387, 1, Castle.PrePortalsPos[1]), Castle.portals)
			doSetItemActionId(doCreateItem(1387, 1, Castle.PrePortalsPos[2]), Castle.portals)
			doBroadcastMessage("Both Pre-Empes have been broken, portals opened.", config.bcType)
		else
			doBroadcastMessage("one of Pre-Empes have been broken...", config.bcType)
		end
	end
	return true
end 
