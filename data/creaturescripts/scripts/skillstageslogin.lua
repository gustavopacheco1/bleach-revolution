dofile(getDataDir() .. "creaturescripts/scripts/stagesconfig.lua")

function onLogin(cid)
	for skill, skillStage in pairs(skillStages) do
		if (skill >= 0 and skill <= 6) then
			nowSkill = getPlayerSkillLevel(cid, skill)
		else
			nowSkill = getPlayerMagLevel(cid, true)
		end

		for i, skillRateInfo in pairs(skillStage) do
			if (nowSkill >= skillRateInfo[1]) then
				skillRate = skillRateInfo[2]
			else
				break
			end
		end
		doPlayerSetRate(cid, skill, skillRate)
	end

	if (showInfoOnLogin) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, getPlayerSkillRatesText(cid))
	end

	registerCreatureEvent(cid, "SkillStagesAdvance")
	return true
end
