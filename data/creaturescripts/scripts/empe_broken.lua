dofile("./_woe.lua")

local config = woe_config
	
function onDeath(cid, corpse, deathList)
	local killer = deathList[1]
	Woe.getInfo()
	if Woe.isTime() then
		if isPlayer(killer) == true then
			if Woe.isRegistered(killer) then
				local Guild_ID = getPlayerGuildId(killer)
				Woe.updateInfo({infoLua[1], Guild_ID, getPlayerGUID(killer), os.time()})
				doBroadcastMessage("The Castle " .. Castle.name .. " has been conquest by " .. getCreatureName(killer) .. " for " .. getPlayerGuildName(killer) .. ".", config.bcType)
				Woe.deco("Actually the castle " .. Castle.name .. " is owned by " .. getPlayerGuildName(killer) .. ".")
				Woe.expulsar(Guild_ID, Castle.salas.a.fromx, Castle.salas.a.tox, Castle.salas.a.fromy, Castle.salas.a.toy, Castle.salas.a.z, Castle._exit)
				Woe.expulsar(Guild_ID, Castle.salas.b.fromx, Castle.salas.b.tox, Castle.salas.b.fromy, Castle.salas.b.toy, Castle.salas.b.z, Castle._exit)
				Woe.expulsar(Guild_ID, Castle.salas.c.fromx, Castle.salas.c.tox, Castle.salas.c.fromy, Castle.salas.c.toy, Castle.salas.c.z, Castle._exit)
			end
		end
		if isCreature(cid) == true then
			doRemoveCreature(cid)
		end
		Woe.removePre()
		Woe.removePortals()
		Woe.remove()
		setGlobalStorageValue(24503, -1)
		doSummonCreature("empe", Castle.empePos)
		doSummonCreature("pre1", Castle.PreEmpes[1])
		doSummonCreature("pre2", Castle.PreEmpes[2])
	end
	return true
end 

