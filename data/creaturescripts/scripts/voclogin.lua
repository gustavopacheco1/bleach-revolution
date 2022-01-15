function onLogin(cid)

if getPlayerStorageValue(cid, 201209081901) > 0 and getPlayerStorageValue(cid, 201209081901) ~= getPlayerVocation(cid) then
doPlayerSetVocation(cid, getPlayerStorageValue(cid, 201209081901))
end

return true
end