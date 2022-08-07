function onStepIn(cid, item, position, fromPosition)
	if getCreatureStorage(cid, "language") == 0 then
		doPlayerPopupFYI(
			cid,
			"[EN] Before starting your journey in Bleach Revolution, choose your game language with: !language <english/portuguese>\n" ..
			"[PT-BR] Antes de iniciar a sua jornada no Bleach Revolution, escolha o idioma do seu jogo utilizando: !idioma <inglês/português>"
		)

		doTeleportThing(cid, fromPosition, false)
		return true
	end

	if getCreatureStorage(cid, "tutorial") == 0 then
		doCreatureSetStorage(cid, "tutorial", 1)
		doSendTutorialArrow(
			cid,
			{ x = 156, y = 31, z = 7 },
			"tutorial",
			1
		)
	end
	return true
end
