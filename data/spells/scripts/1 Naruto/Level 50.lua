function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
local position1 = {x=getPlayerPosition(Target).x+1, y=getPlayerPosition(Target).y+1, z=getPlayerPosition(Target).z}	
	doMoveCreature(cid, position1)
	doCreatureSay(cid, "KAA KAAA KAAAA.", TALKTYPE_MONSTER)
		return true
		end
end