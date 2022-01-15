local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, 80000) -- Tempo que ira durar
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, 25) -- Quanto de shield ira adicionar


function onUse(cid, item)

local f = {
"Potion Def",
"Potion Def",
}        

    if getPlayerGroupId(cid) >= 3 then
              doSendMagicEffect(getPlayerPosition(cid), 2)
              doSendAnimatedText(getPlayerPosition(cid), "Nao posso usar agora..", math.random(1,255))
              return doPlayerSendTextMessage(cid, 22, "Nao posso usar agora..!")
    end

    if(doAddCondition(cid, condition)) then
              doRemoveItem(item.uid, 1)
              doPlayerSay(cid, f[math.random(#f)], TALKTYPE_ORANGE_1)
              doSendMagicEffect(getPlayerPosition(cid), 67)
    end

return TRUE
end 