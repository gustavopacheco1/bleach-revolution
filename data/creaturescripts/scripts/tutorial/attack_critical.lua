function onAttack(cid, target)
	if getCreatureName(target) ~= "Punching Bag" then
		return true
	end

	if getPlayerSlotItem(cid, CONST_SLOT_LEFT).itemid ~= 16456 then
		MultiLanguage.doPlayerSendTextMessage(
			cid,
			MESSAGE_EVENT_ADVANCE,
			"You need to equip the wooden sword to train your critical skills.",
			"Você precisa equipar a wooden sword para treinar suas habilidades de critical."
		)
		return false
	end

	return true
end
