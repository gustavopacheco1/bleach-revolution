local s = {5678,5679,5677}
function onStepIn(cid, item, pos)
local mystr = "return {x=xx,y=yy,z=zz}"
local mystr = string.gsub(mystr, "xx", pos.x)
local mystr = string.gsub(mystr, "yy", pos.y)
local mystr = string.gsub(mystr, "zz", pos.z)
local position112 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doPlayerSendTextMessage(cid, 22, "Você só pode sair daqui 20 segundos.")
setPlayerStorageValue(cid, s[1], mystr)
setPlayerStorageValue(cid, s[2], os.time()+20)
setPlayerStorageValue(cid, s[3], 1)
doSendMagicEffect(mystr, 75)
return true
end