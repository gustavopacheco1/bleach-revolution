function onLogin(cid)
	local lastLogin, str = getPlayerLastLoginSaved(cid), getConfigValue('loginMessage')
	if (lastLogin > 0) then
		str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
	else
		doCreatureChangeOutfit(cid, { lookType = VOCATION_OUTFITS[getPlayerVocationName(cid)][1] })
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)

	-- Death Penalty
	local loss = getConfigValue('deathLostPercent')
	if (loss ~= nil and getPlayerStorageValue(cid, "bless") ~= 5) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	if (getPlayerStorageValue(cid, "death_bless") == 1) then
		local t = { PLAYERLOSS_EXPERIENCE, PLAYERLOSS_SKILLS, PLAYERLOSS_ITEMS, PLAYERLOSS_CONTAINERS }
		for i = 1, #t do
			doPlayerSetLossPercent(cid, t[i], 100)
		end
		setPlayerStorageValue(cid, "death_bless", 0)
	end

	if (not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	doPlayerOpenChannel(cid, 10) -- Loot channel
	doPlayerFormula(cid)
	if getPlayerLevel(cid) < 60 and not getPlayerBlessing(cid, 1) then
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_STATUS_CONSOLE_BLUE,
			"You received soul protection for being less than level 60.",
			"Você recebeu proteção de alma por ser nível menor que 60."
		)
		doPlayerAddBlessings(cid)
	end

	-- Events
	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Mail")

	if (getBooleanFromString(getConfigValue('useFragHandler'))) then
		registerCreatureEvent(cid, "SkullCheck")
	end

	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "AdvanceSave")
	registerCreatureEvent(cid, "PlayerTrade")
	registerCreatureEvent(cid, "TransformsAdvance")
	registerCreatureEvent(cid, "NpcTarget")
	registerCreatureEvent(cid, "Death")
	registerCreatureEvent(cid, "AmuletOfLoss")
	registerCreatureEvent(cid, "SkillsStagesAdvance")

	doCreatureSetStorage(cid, "save", (os.time() + 120))
	return true
end
