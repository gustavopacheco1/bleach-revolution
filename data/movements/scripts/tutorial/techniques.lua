function onStepIn(cid, item, position, fromPosition)
	if getCreatureStorage(cid, "tutorial") == 1 then
		MultiLanguage.doPlayerPopupFYI(
			cid,
			"You can verify all the techniques that your character owns with: !techniques",
			"Voc� consegue verificar todas as t�cnicas que o seu personagem possui com: !t�cnicas"
		)
		doCreatureExecuteTalkAction(cid, "!techniques")
		doCreatureSetStorage(cid, "tutorial", 2)
		doSendTutorialArrow(cid, { x = 158, y = 31, z = 8 }, "tutorial", 2)
	end
	return true
end
