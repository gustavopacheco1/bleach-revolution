function onSay(cid, words, param, channel) 
local days = 5*24*60*60
local query = db.getResult("SELECT lastlogin FROM players")
local last = tonumber(query:getDataInt("lastlogin"))

while TRUE do
if last >= os.time()-days then
db.executeQuery("DELETE FROM players WHERE lastlogin >= UNIX_TIMESTAMP()-"..days.."")
end
if not(query:next()) then
break
end
end
return TRUE
end