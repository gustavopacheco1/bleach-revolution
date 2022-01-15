function onStepIn (cid,pos)
	local mana = 10000
	if getPlayerLevel(cid) > 1 then
		doCreatureAddHealth(cid, mana)
		doSendAnimatedText(getPlayerPosition(cid),"- MANA -", math.random(1,255))
	end
end
	