local outfit = {lookType = 795}
local hp = 10000

function onSay(cid, words, param, channel)                                  -- addEvent makes this function begin within the set ammount of time.
    if getPlayerVocation(cid) == 6 then          -- this will make the spell wear off.
        doPlayerSetVocation(cid, 7)                      -- 7 should be set to the vocation of the player before casting the spell
        doSendMagicEffect(getPlayerPosition(cid), 10)
		doSetCreatureOutfit(cid, outfit)
		setConditionFormula(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
		setCreatureMaxHealth(cid,getCreatureMaxHealth(cid)+hp)
    end
	if isPlayer(cid) == TRUE then
	return true
	end
end
 