-- (Sistema para sentar com recuperação automatica) --
-- Criadores: Flaah e Vodkart (Não retirem os créditos) --

events = {}
config = {
sit = {hp = 500, mana = 500},
outfit = {lookType = 357},
storage = 21211
}
local outfits = {
[1] = {lookType = 200}, -- o numero 1 é o ID da vocação e 200 é o ID do looktype.
[2] = {lookType = 201}, -- o numero 2 é o ID da vocação e 201 é o ID do looktype.
[3] = {lookType = 202}, -- o numero 1 é o ID da vocação e 202 é o ID do looktype. 

}
function onSay(cid, words, param, channel)
local waittime = 2 -- Tempo de exhaustion
local storage = 115819

if exhaustion.check(cid, storage) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o charge novamente.")
return false
end
setPlayerStorageValue(cid, config.storage, getPlayerStorageValue(cid, config.storage) == -1 and 1 or -1)
doCreatureSetNoMove(cid, getPlayerStorageValue(cid, config.storage) == 1 and true or false)
if getPlayerStorageValue(cid, config.storage) == 1 then
doPlayerSay(cid, "Ahh.. chakra charge")
doSendMagicEffect(getCreaturePosition(cid), 13)
exhaustion.set(cid, storage, waittime)
doSitRelax(cid, config.sit)
else
doPlayerSay(cid, "Ok, Lets Go!")
stopEvent(events[getPlayerGUID(cid)])
end
return true
end
function doSitRelax(cid, formula)
if not isCreature(cid) then return LUA_ERROR end
doCreatureAddHealth(cid, formula.hp)
doCreatureAddMana(cid, formula.mana)
doSendMagicEffect(getCreaturePosition(cid), 13)
events[getPlayerGUID(cid)] = addEvent(doSitRelax, 2000, cid, formula)
end