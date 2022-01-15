function onSay(cid, words, param, channel)
local file = io.open('data/logs/Reports.txt','r')
local text = file:read(-1)
doShowTextDialog(cid,10136,text)
file:close()
return TRUE
end