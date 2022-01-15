time = 7 -- intervalo entre cada animação
time = time*1000
function onLogin(cid)
		piscaVip(cid)
		registerCreatureEvent(cid, "pisca")
		return 1
end

----------------------PISCA----------------------
function piscaVip(cid)
	if (getPlayerPremiumDays(cid))  then
		doSendAnimatedText(getCreaturePosition(cid),'SOU VIP' , 180)
		addEvent(piscaVip,time,cid)
	end
	return 1
end 