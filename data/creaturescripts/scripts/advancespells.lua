function onAdvance(cid, skill, oldLevel, newLevel)
	if skill == SKILL__LEVEL then		
		local spells = {}
		for index = 0, 	getPlayerInstantSpellCount(cid) - 1 do
			local spell = getPlayerInstantSpellInfo(cid, index)
		
			if spell.level > oldLevel and spell.level <= newLevel then
				table.insert(spells, "   [".. spell.name .."] \"".. spell.words .. "\" Mana[".. spell.mana .."]")
			end
		end
	
		if #spells > 0 then			
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, "Voce alcançou o Nivel-> ".. newLevel .." e Aprendeu Novos Jutsus!")

			for _, v in pairs(spells) do
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE, v)
			end
		end
	end
		
	return true
end