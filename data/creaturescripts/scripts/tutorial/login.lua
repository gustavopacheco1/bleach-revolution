local actions = {
	[1] = {
		tutorial_arrow = { { x = 156, y = 31, z = 7 } }
	},
	[2] = {
		tutorial_arrow = { { x = 158, y = 31, z = 8 }, { x = 156, y = 31, z = 7 } }
	},
	[3] = {
		register_events = { "TutorialTask" }
	},
	[4] = {
		tutorial_arrow = { { x = 158, y = 31, z = 8 }, { x = 156, y = 31, z = 7 } }
	},
	[5] = {
		tutorial_arrow = { { x = 156, y = 31, z = 8 }, { x = 143, y = 23, z = 7 } }
	},
	[6] = {
		register_events = { "AdvanceAgilityTutorial" },
		tutorial_arrow = { { x = 135, y = 24, z = 7 } }
	},
	[7] = {
		tutorial_arrow = { { x = 138, y = 21, z = 7 } }
	},
	[8] = {
		register_events = { "AdvanceCriticalTutorial", "AttackCriticalTutorial" },
		tutorial_arrow = { { x = 139, y = 28, z = 7 } }
	},
	[9] = {
		tutorial_arrow = { { x = 154, y = 51, z = 7 } }
	}
}

function onLogin(cid)
	local tutorial_storage = getCreatureStorage(cid, "tutorial")
	local action = actions[tutorial_storage]

	if not action then
		return true
	end

	if action.tutorial_arrow then
		local secondary_position = nil

		if action.tutorial_arrow[2] then
			secondary_position = action.tutorial_arrow[2]
		end

		doSendTutorialArrow(
			cid,
			action.tutorial_arrow[1],
			"tutorial",
			tutorial_storage,
			secondary_position
		)
	end

	if action.register_events then
		for _, event in ipairs(action.register_events) do
			registerCreatureEvent(cid, event)
		end
	end

	return true
end
