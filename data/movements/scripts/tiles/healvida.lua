function onStepIn (cid,pos)
	local health = 10000
	if getPlayerLevel(cid) > 1 then
		doCreatureAddHealth(cid, health)
		doSendAnimatedText(getPlayerPosition(cid),"- HEALTH -", math.random(1,255))
	end
end