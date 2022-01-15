function onLogin(cid)
	if getPlayerLevel(cid) > 1 then
	doSendAnimatedText(getPlayerPosition(cid),"- WELCOME -", math.random(1,69))
	setPlayerStorageValue(cid, 171994, -1)
return TRUE
end
end