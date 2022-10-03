local skills_stages = {
	[SKILL_FIST] = {
		{ level = 0, rate = 4 },
		{ level = 50, rate = 3 },
		{ level = 80, rate = 2 },
		{ level = 100, rate = 1 },
	},

	[SKILL_CLUB] = {
		{ level = 0, rate = 3 },
		{ level = 50, rate = 2 },
		{ level = 80, rate = 1 },
	},

	[SKILL_SWORD] = {
		{ level = 0, rate = 5 },
		{ level = 50, rate = 4 },
		{ level = 80, rate = 3 },
		{ level = 100, rate = 2 },
		{ level = 120, rate = 1 },
	},

	[SKILL_AXE] = {
		{ level = 0, rate = 5 },
		{ level = 50, rate = 4 },
		{ level = 80, rate = 3 },
		{ level = 100, rate = 2 },
		{ level = 120, rate = 1 },
	},

	[SKILL_DISTANCE] = {
		{ level = 0, rate = 5 },
		{ level = 50, rate = 4 },
		{ level = 80, rate = 3 },
		{ level = 100, rate = 2 },
		{ level = 120, rate = 1 },
	},

	[SKILL_SHIELD] = {
		{ level = 0, rate = 3 },
		{ level = 50, rate = 2 },
		{ level = 80, rate = 1 },
	},

	[SKILL_FISHING] = {
		{ level = 0, rate = 8 },
		{ level = 50, rate = 5 },
		{ level = 80, rate = 4 },
		{ level = 100, rate = 3 },
		{ level = 120, rate = 2 },
		{ level = 130, rate = 1 },
	},

	[SKILL__MAGLEVEL] = {
		{ level = 0, rate = 7 },
		{ level = 50, rate = 6 },
		{ level = 80, rate = 5 },
		{ level = 100, rate = 3 },
		{ level = 120, rate = 2 },
		{ level = 130, rate = 1 },
	}
}

function onLogin(cid)
	for skill_id, skill_stages in pairs(skills_stages) do
		local skill_level
		if (skill_id >= 0 and skill_id <= 6) then
			skill_level = getPlayerSkillLevel(cid, skill_id, true)
		else
			skill_level = getPlayerMagLevel(cid, true)
		end

		local skill_rate = 0
		for _, skill_stage in pairs(skill_stages) do
			if (skill_level < skill_stage.level) then
				break
			end

			skill_rate = skill_stage.rate
		end

		doPlayerSetRate(cid, skill_id, skill_rate)
	end
	return true
end

function onAdvance(cid, skill, oldLevel, newLevel)
	if not skills_stages[skill] then
		return true
	end

	local skill_rate
	for _, skill_stage in pairs(skills_stages[skill]) do
		if (newLevel < skill_stage.level) then
			break
		end

		skill_rate = skill_stage.rate
	end

	doPlayerSetRate(cid, skill, skill_rate)
	return true
end
