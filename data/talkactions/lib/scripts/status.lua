function onSay(cid, words, param, channel) 

if (words == "!life") or (words == "/life") or (words == "/chakra") or (words == "!chakra") then
doPlayerSendTextMessage(cid, 27, "Health: ["..getCreatureHealth(cid).."/"..getCreatureMaxHealth(cid).."]")

elseif (words == "!mana") or (words == "/mana") or (words == "/vida") or (words == "!vida") then
doPlayerSendTextMessage(cid, 27, "Mana: ["..getCreatureMana(cid).."/"..getCreatureMaxMana(cid).."]")
end
return TRUE
end