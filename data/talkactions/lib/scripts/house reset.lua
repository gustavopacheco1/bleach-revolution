function onSay(cid, words, param, channel) 

local query = db.getResult("SELECT id, owner FROM houses")
while true do
local houseid,own = query:getDataInt("id"),query:getDataInt("owner")
if own > 0 then
setHouseOwner(houseid,0,true)
end
if not (query:next()) then
break
end
end
return TRUE
end