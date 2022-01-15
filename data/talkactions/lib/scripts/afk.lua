local FRASES = {"- OFF -", "- A F K -"} -- Auto-Mensagens.

local TEMPO = 1 -- Intervalo de Tempo em segundos.

local function doSendAutoMessage(cid, pos)

if (isCreature(cid) == TRUE) then

npos = getThingPos(cid)

if (pos.x == npos.x) and (pos.y == npos.y) and (pos.z == npos.z) then

doSendAnimatedText(pos, FRASES[math.random(#FRASES)], math.random(255))

doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)

addEvent(doSendAutoMessage, TEMPO*1000, cid, npos)

end

end

end

function onSay(cid, words, param)

pos = getThingPos(cid)

doSendAnimatedText(pos, FRASES[math.random(#FRASES)], math.random(255))

doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)

doCreatureSay(cid, "- AFK -", TALKTYPE_ORANGE_1)

doPlayerSendTextMessage(cid, 20, "Voce acaba de entrar no modo AFK, para sair, basta andar a qualquer direcao.")

addEvent(doSendAutoMessage, TEMPO*1000, cid, pos)

return TRUE

end