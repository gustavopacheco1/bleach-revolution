function onAdvance(cid, skill, oldlevel, newlevel)
		  if skill == SKILL__LEVEL then
		   doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
		doCreatureAddMana(cid, getCreatureMaxMana(cid))
                doSendMagicEffect(getCreaturePosition(cid), 40)
                doSendAnimatedText(getCreaturePosition(cid), "Level UP", 210)
   end
return TRUE
end