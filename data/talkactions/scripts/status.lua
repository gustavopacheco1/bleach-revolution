function onSay(cid, words, param, channel)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Life ["..getCreatureHealth(cid).."] - ["..getCreatureMaxHealth(cid).."]\n Chakra ["..getPlayerMana(cid).."] - ["..getPlayerMaxMana(cid).."]")
return true
end