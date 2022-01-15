local outfit = {lookType = 795}
local hp = 10000

function onSay(cid, words, param, channel)                                  -- addEvent makes this function begin within the set ammount of time.
    if getPlayerVocation(cid) == 7 then          -- this will make the spell wear off.
        doPlayerSetVocation(cid, 6)                      -- 7 should be set to the vocation of the player before casting the spell
        doSendMagicEffect(getPlayerPosition(cid), 10)
		doSetCreatureOutfit(cid, outfit)
		setCreatureMaxHealth(cid,getCreatureMaxHealth(cid)-hp)
    end
	if isPlayer(cid) == TRUE then
	return true
	end
end
 