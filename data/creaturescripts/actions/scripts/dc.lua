local dodge = {itemid = xxx, countmax = xxx, storage = xxx}
local critical = {itemid = xxx, countmax = xxx, storage = xxx}

function onUse(cid, item)
   
if item.itemid == dodge.itemid then
if getPlayerStorageValue(cid, dodge.storage) < dodge.countmax then
setPlayerStorageValue(cid, dodge.storage, getPlayerStorageValue(cid, dodge.storage) + 1)
doSendMagicEffect(getCreaturePosition(cid), 12)
doPlayerSendTextMessage(cid, 22, "Now, your dodges chance is "..(getPlayerStorageValue(cid, dodge.storage)/10).."%.")
doRemoveItem(item.uid, 1)
return true
else
doSendMagicEffect(getCreaturePosition(cid), 2)
doPlayerSendTextMessage(cid, 22, "You already have the max chance that is possible for dodge.")
return true
end
    
elseif item.itemid == critical.itemid then
if getPlayerStorageValue(cid, critical.storage) < critical.countmax then
setPlayerStorageValue(cid, critical.storage, getPlayerStorageValue(cid, critical.storage) + 1)
doSendMagicEffect(getCreaturePosition(cid), 12)
doPlayerSendTextMessage(cid, 22, "Now, your criticals chance is "..(getPlayerStorageValue(cid, critical.storage)/10).."%.")
doRemoveItem(item.uid, 1)
return true
else
doSendMagicEffect(getCreaturePosition(cid), 2)
doPlayerSendTextMessage(cid, 22, "You already have the max chance that is possible for critical.")
return true
end
end
        
return false
end