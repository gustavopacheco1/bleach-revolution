function onSay(cid, words, param) 
local cfg = { 
        oldVoc = 15 or 10 ---- tu wypisujesz id profesji
        level = 400, 
        mana = 100 --- ile many ma dodawac
        hp = 100 ----- ile hp ma dodawac
        effect = 231, 
        newVoc = 16, 
        longEffect = 22, 
        newOutfit = {lookType = 237, lookTypeEx = 0, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = 0} 
        } 
    if getPlayerVocation(cid) == cfg.oldVoc then 
        if getPlayerLevel(cid) >= cfg.level then 
            doSendMagicEffect(getCreaturePosition(cid), cfg.effect, true) 
            doPlayerSetVocation(cid, cfg.newVoc) 
            doCreatureChangeOutfit(cid, cfg.newOutfit) 
            doCreatureAddHealth(cid, cfg.hp)
            doCreatureAddMana(cid, cfg.mana)
    function eventtrans(cid) 
            if isPlayer(cid) then 
                doSendMagicEffect(getPlayerPosition(cid), cfg.longEffect) 
                addEvent(eventtrans, 1000, cid) 
    end 
    vc = addEvent(eventtrans, 1000, cid) 
    doSendAnimatedText(getCreaturePosition(cid), "Kaioken", COLOR_WHITE) 
    else
        doPlayerSendDefaultCancel(cid, "You cannot transform!")
    return true 
        end 
            end 
    end 
end  