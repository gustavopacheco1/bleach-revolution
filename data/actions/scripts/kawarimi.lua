function onUse (cid, item, frompos, item2, topos)
if item2.itemid == 2288 then
doPlayerSendCancel (cid, "You don't use this.")
else
playerpos = getPlayerPosition (cid)
doTeleportThing (cid, topos)
doSendMagicEffect (playerpos ,2)
doSendMagicEffect (topos ,10)
doSendAnimatedText(playerpos,"Kawarimi",10)
doPlayerAddMana(cid, -1500)
end
end