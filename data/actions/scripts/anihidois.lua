function onUse(cid, item, frompos, item2, topos)
if item.uid == 7001 then
if item.itemid == 1946 then

player1pos = {x=1074, y=782, z=7, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x=1076, y=782, z=7, stackpos=253}
player2 = getThingfromPos(player2pos)


if player1.itemid > 0 and player2.itemid > 0  then

player1level = getPlayerLevel(player1.uid)
player2level = getPlayerLevel(player2.uid)

questlevel = 1

if player1level >= questlevel and player2level >= questlevel then

	demon1pos = {x=1222, y=755, z=7}
	demon2pos = {x=1223, y=755, z=7}
	demon3pos = {x=1224, y=755, z=7}
	demon4pos = {x=1225, y=755, z=7}
	demon5pos = {x=1226, y=755, z=7}
	demon6pos = {x=1227, y=755, z=7}

	doSummonCreature("Kikkai", demon1pos)
	doSummonCreature("Kikkai", demon2pos)
	doSummonCreature("Kikkai", demon3pos)
	doSummonCreature("Kikkai", demon4pos)
	doSummonCreature("Kikkai", demon5pos)
	doSummonCreature("Kikkai", demon6pos)

	nplayer1pos = {x=1104, y=780, z=7}
	nplayer2pos = {x=1105, y=780, z=7}

	doSendMagicEffect(player1pos,2)
	doSendMagicEffect(player2pos,2)

	doTeleportThing(player1.uid,nplayer1pos)
	doTeleportThing(player2.uid,nplayer2pos)

	doSendMagicEffect(nplayer1pos,4)
	doSendMagicEffect(nplayer2pos,4)

	doTransformItem(item.uid,1945)

	else
	doPlayerSendCancel(cid,"All players must have level 1 to enter.")
	end
	else
	doPlayerSendCancel(cid,"You need 2 players in your team.")
end
end
if item.itemid == 1945 then

starting2={x=1095, y=750, z=7, stackpos=253}
checking2={x=starting2.x, y=starting2.y, z=starting2.z, stackpos=starting2.stackpos}
ending2={x=1275, y=792, z=7, stackpos=253}
players=0
totalmonsters=0
monster = {}
repeat
creature= getThingfromPos(checking2)
if creature.itemid > 0 then
if getPlayerAccess(creature.uid) == 0 then
players=players+1
end
if getPlayerAccess(creature.uid) ~= 0 and getPlayerAccess(creature.uid) ~= 3 then
totalmonsters=totalmonsters+1
monster[totalmonsters]=creature.uid
	end
end
checking2.x=checking2.x+1
if checking2.x>ending2.x then
checking2.x=starting2.x
checking2.y=checking2.y+1
end
until checking2.y>ending2.y
if players==0 then
trash= {x=1061, y=777, z=7}
current=0
repeat
current=current+1
doTeleportThing(monster[current],trash)
until current>=totalmonsters
doTransformItem(item.uid,1946)
end


end
end
if item.uid == 5010 then
queststatus = getPlayerStorageValue(cid,131)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voce pegou um Item.")
doPlayerAddItem(cid,2391,1)
setPlayerStorageValue(cid,131,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5011 then
queststatus = getPlayerStorageValue(cid,131)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"Voce pegou um Item.")
doPlayerAddItem(cid,2430,1)
setPlayerStorageValue(cid,131,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5012 then
queststatus = getPlayerStorageValue(cid,131)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"Voce Pegou um Item.")
doPlayerAddItem(cid,7417,1)
setPlayerStorageValue(cid,131,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5013 then
queststatus = getPlayerStorageValue(cid,131)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"Voce pegou um Item.")
doPlayerAddItem(cid,7862,1)
setPlayerStorageValue(cid,131,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
return 1
end