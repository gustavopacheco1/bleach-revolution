function onTarget(cid, target)
	if isPlayer(target) and getCreatureByName("Kyuubi") and isInArray( 1, getPlayerVocation(target)) then
        return false
    end
    return true
end 