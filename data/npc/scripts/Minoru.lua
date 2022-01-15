local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)    npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()       npcHandler:onThink() end

local travelNode = keywordHandler:addKeyword({'konoha gakure'}, StdModule.travel, {npcHandler = npcHandler, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=1036, y=871, z=6}})

local travelNode = keywordHandler:addKeyword({'suna gakure'}, StdModule.travel, {npcHandler = npcHandler, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=741, y=1157, z=6}})

local travelNode = keywordHandler:addKeyword({'amegakure no sato'}, StdModule.travel, {npcHandler = npcHandler, onlyFocus = true, text = 'Bye,Bye ', cost = 0, destination = {x=977, y=1430, z=6}})

local travelNode = keywordHandler:addKeyword({'kusagakure no sato'}, StdModule.travel, {npcHandler = npcHandler, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=1598, y=1027, z=6}})

local travelNode = keywordHandler:addKeyword({'kusagakure island'}, StdModule.travel, {npcHandler = npcHandler, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=1853, y=977, z=6}})

local travelNode = keywordHandler:addKeyword({'dark forest'}, StdModule.travel, {npcHandler = npcHandler, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=1067, y=1212, z=6}})

local travelNode = keywordHandler:addKeyword({'vila takumi'}, StdModule.travel, {npcHandler = npcHandler, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=1223, y=1157, z=6}})

local travelNode = keywordHandler:addKeyword({'sout camp'}, StdModule.travel, {npcHandler = npcHandler, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=933, y=1035, z=6}})

local travelNode = keywordHandler:addKeyword({'suna camp'}, StdModule.travel, {npcHandler = npcHandler, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=646, y=939, z=6}})

local travelNode = keywordHandler:addKeyword({'death forest'}, StdModule.travel, {npcHandler = npcHandler, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=804, y=921, z=6}})

local travelNode = keywordHandler:addKeyword({'hoshigakure island'}, StdModule.travel, {npcHandler = npcHandler, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=2047, y=1153, z=6}})

local travelNode = keywordHandler:addKeyword({'yukigakure no sato'}, StdModule.travel, {npcHandler = npcHandler, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=1763, y=1109, z=6}})

local travelNode = keywordHandler:addKeyword({'takigakure no sato'}, StdModule.travel, {npcHandler = npcHandler, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=1278, y=1255, z=6}})

local travelNode = keywordHandler:addKeyword({'monte myoboku'}, StdModule.travel, {npcHandler = npcHandler, premium = true, onlyFocus = true, text = 'Bye,Bye ', cost = 5000, destination = {x=1525, y=604, z=6}})

        
npcHandler:addModule(FocusModule:new())