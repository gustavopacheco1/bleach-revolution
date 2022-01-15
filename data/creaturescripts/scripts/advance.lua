function onAdvance(cid, skill, oldlevel, newlevel)
skillnames={'Ataque Speed','SHOOTING','Espada','Luva','Distancia','Defesa','Aura','Magic chakra','Level'}

	 doSendAnimatedText(getCreaturePosition(cid), '' ..skillnames[skill+1].. ' UP!', math.random(1,254))
doSendMagicEffect(getCreaturePosition(cid),29)
end