function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getCreatureStorage(cid, "tutorial") ~= 9 then
		return true
	end

	MultiLanguage.doPlayerPopupFYI(
		cid,
		"Welcome to Karakura!\n\nKarakura is the point in the human world that has the highest concentration of spirit beings. Be careful!",
		"Bem vindo à Karakura!\n\nKarakura é o ponto no mundo humano que possui a maior concentração de seres espirituais. Tome cuidado!"
	)

	doPlayerSetTown(cid, 1)
	doTeleportThing(cid, getTownTemplePosition(1))
	doCreatureSetStorage(cid, "tutorial", nil)
	return true
end
