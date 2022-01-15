dofile("./_woe.lua")

local formulas = 
	{
		[1] = {level = 5, ml = 2},
		[2] = {level = 5, ml = 2},
		[3] = {level = 5, ml = 1},
		[4] = {level = 5, ml = 3}
	}

--add more vocs.	
	
function formulilla(cid)
	local tmp = formulas[getPlayerVocation(cid)]
	if not tmp then
		return 100 --default
	else
		return (getPlayerLevel(cid) / tmp.level) + (getPlayerMagLevel(cid) * tmp.ml)
	end
end

function onStatsChange(cid, attacker, type, combat, value)
	Woe.getInfo()
	
	if not isPlayer(attacker) then
		return true
	end
		
	if not Woe.isRegistered(attacker) then
		return false
	end	
		
	if (type == STATSCHANGE_HEALTHGAIN) then
		doCreatureAddHealth(cid, formulilla(attacker), true)
		return false
	end	
		
	if (type == STATSCHANGE_HEALTHLOSS) then
		if getPlayerGuildId(attacker) == infoLua[2] then
			doPlayerSendCancel(attacker, "You can not atack your empe.")
			return false
		end
	end
	return true
end 