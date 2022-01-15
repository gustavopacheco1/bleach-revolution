function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(fromPosition.x ~= CONTAINER_POSITION) then
		doSendMagicEffect(fromPosition, CONST_ME_CRAPS)
	end
	local value = math.random(1, 100)
	doCreatureSay(cid, getCreatureName(cid) .. ' sorteou o número ' .. value .. '.', TALKTYPE_MONSTER)
	return true
end
