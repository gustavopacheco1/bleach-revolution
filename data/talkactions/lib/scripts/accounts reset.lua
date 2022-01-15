function onSay(cid, words, param, channel)
local query = db.getResult("SELECT lastday FROM accounts")
local last = tonumber(query:getDataInt("lastday"))
doPlayerSendCancel(cid, ""..math.floor((os.time()-30*24*60*60)/24/60/60%60).."")
return TRUE
end