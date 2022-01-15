dofile("./_woe.lua")

function onLogin(cid)
	registerCreatureEvent(cid, "vs_guard")
	return true
end

function onStatsChange(cid, attacker, type, combat, value)	
	if not isCreature(attacker) or isPlayer(attacker) then 
		return true
	end
	Woe.getInfo()
	if (type == STATSCHANGE_HEALTHLOSS) then
		if (getCreatureName(attacker):lower() == "guard") then
			if (infoLua[2] == getPlayerGuildId(cid)) then
				doMonsterChangeTarget(attacker)
				return false
			end
		end
	end	
	return true
end
