function onUse(cid, item, frompos, item2, topos)
if item.uid == 7000 then
if item.itemid == 1946 then

player1pos = {x=1068, y=876, z=7, stackpos=253}
player1 = getThingfromPos(player1pos)

player2pos = {x=1069, y=875, z=7, stackpos=253}
player2 = getThingfromPos(player2pos)

player3pos = {x=1070, y=876, z=7, stackpos=253}
player3 = getThingfromPos(player3pos)

player4pos = {x=1069, y=877, z=7, stackpos=253}
player4 = getThingfromPos(player4pos)


if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then

player1level = getPlayerLevel(player1.uid)
player2level = getPlayerLevel(player2.uid)
player3level = getPlayerLevel(player3.uid)
player4level = getPlayerLevel(player4.uid)

questlevel = 1

if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel then

	demon1pos = {x=1147, y=849, z=7}
	demon2pos = {x=1130, y=810, z=7}
	demon3pos = {x=1132, y=810, z=7}
	demon4pos = {x=1134, y=810, z=7}
	demon5pos = {x=1136, y=810, z=7}
	demon6pos = {x=1138, y=810, z=7}

	doSummonCreature("Kikkai", demon1pos)
	doSummonCreature("Kikkai", demon2pos)
	doSummonCreature("Kikkai", demon3pos)
	doSummonCreature("Kikkai", demon4pos)
	doSummonCreature("Kikkai", demon5pos)
	doSummonCreature("Kikkai", demon6pos)

	nplayer1pos = {x=1138, y=860, z=7}
	nplayer2pos = {x=1139, y=862, z=7}
	nplayer3pos = {x=1141, y=863, z=7}
	nplayer4pos = {x=1144, y=863, z=7}

	doSendMagicEffect(player1pos,2)
	doSendMagicEffect(player2pos,2)
	doSendMagicEffect(player3pos,2)
	doSendMagicEffect(player4pos,2)

	doTeleportThing(player1.uid,nplayer1pos)
	doTeleportThing(player2.uid,nplayer2pos)
	doTeleportThing(player3.uid,nplayer3pos)
	doTeleportThing(player4.uid,nplayer4pos)

	doSendMagicEffect(nplayer1pos,4)
	doSendMagicEffect(nplayer2pos,4)
	doSendMagicEffect(nplayer3pos,4)
	doSendMagicEffect(nplayer4pos,4)

	doTransformItem(item.uid,1945)

	else
	doPlayerSendCancel(cid,"All players must have level 100 to enter.")
	end
	else
	doPlayerSendCancel(cid,"You need 4 players in your team.")
end
end
if item.itemid == 1945 then

starting={x=1087, y=807, z=7, stackpos=253}
checking={x=starting.x, y=starting.y, z=starting.z, stackpos=starting.stackpos}
ending={x=1170, y=884, z=7, stackpos=253}
players=0
totalmonsters=0
monster = {}
repeat
creature= getThingfromPos(checking)
if creature.itemid > 0 then
if getPlayerAccess(creature.uid) == 0 then
players=players+1
end
if getPlayerAccess(creature.uid) ~= 0 and getPlayerAccess(creature.uid) ~= 3 then
totalmonsters=totalmonsters+1
monster[totalmonsters]=creature.uid
	end
end
checking.x=checking.x+1
if checking.x>ending.x then
checking.x=starting.x
checking.y=checking.y+1
end
until checking.y>ending.y
if players==0 then
trash= {x=233, y=125, z=10}
current=0
repeat
current=current+1
doTeleportThing(monster[current],trash)
until current>=totalmonsters
doTransformItem(item.uid,1946)
end


end
end
if item.uid == 5006 then
queststatus = getPlayerStorageValue(cid,130)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voce pegou a Kage Boots.")
doPlayerAddItem(cid,2161,1)
setPlayerStorageValue(cid,130,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5007 then
queststatus = getPlayerStorageValue(cid,130)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"Voce pegou a Raikage Glove.")
doPlayerAddItem(cid,2516,1)
setPlayerStorageValue(cid,130,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5008 then
queststatus = getPlayerStorageValue(cid,130)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"Voce Pegou a Samehada.")
doPlayerAddItem(cid,2413,1)
setPlayerStorageValue(cid,130,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
if item.uid == 5009 then
queststatus = getPlayerStorageValue(cid,130)
if queststatus ~= 1 then
doPlayerSendTextMessage(cid,22,"Voce pegou a Shukaku Spear.")
doPlayerAddItem(cid,7862,1)
setPlayerStorageValue(cid,130,1)
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
end
return 1
end