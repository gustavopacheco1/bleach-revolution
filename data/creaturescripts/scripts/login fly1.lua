local storage = 157213
local pos = getCreaturePosition(cid)

function onLogin(cid)
  if getPlayerStorageValue(cid, stor) <= 0 and getPlayerVocation(cid) == 17 then
    setPlayerStorageValue(cid, stor, 1)
    doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
  end
return true
end