function onDeath(cid, corpse, deathList)

local heart = doPlayerAddItem(deathList[1],5943, 1)

if isPlayer(cid) and isPlayer(deathList[1]) then

doItemSetAttribute(heart, "name", "" ..getPlayerName(cid).. " Coracao")
doItemSetAttribute(heart, "description", "Morto no level "..getPlayerLevel(cid).." por "..getPlayerName(deathList[1])..". " .. (getCreatureSkullType(cid) <= SKULL_GREEN and "(Injustificado)" or "(Justificado)"))
end
return true
end