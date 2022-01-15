function onSay(cid, words, param)
        if doPlayerRemoveMoney(cid, 100) == TRUE then
doPlayerAddItem(cid, 1987, 1)
                        doSendMagicEffect(getPlayerPosition(cid), 5)
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,'BAG!') 
else
            doPlayerSendCancel(cid, "You need 100 plate coin to buy bag!")
                end
return TRUE
                end
