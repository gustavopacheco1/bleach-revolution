dofile("./_woe.lua")

local config = woe_config

local done = 1

function onThink(interval, lastExecution)
	if not Woe.isStarted() then
		return true
	end
	Woe.getInfo()
	if Woe.check() then
		if (done == -1) then
			setGlobalStorageValue(24503, os.time())
			doBroadcastMessage("OOH NOES !!! se murieron los guardias.", config.bcType)
			done = 1
		end
		return true
	end
	done = -1
	for storage = 24504, 24511 do
		local pid = getGlobalStorageValue(storage)
		if isCreature(pid) then
			local target = getCreatureTarget(pid)
			if (target ~= 0) and isPlayer(target) then
				if (getPlayerGuildId(target) == infoLua[2] ) then
					local newTarget = 0
					for _, i in ipairs(getMonsterTargetList(pid)) do
						if isPlayer(i) and (getPlayerGuildId(i) ~= infoLua[2]) then
							newTarget = i
						end
					end
					if (newTarget ~= 0) then
						doMonsterSetTarget(pid, newTarget)
					end
				end
			end
		end
	end
	return true
end
