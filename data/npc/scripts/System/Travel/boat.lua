local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
  
  
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
 
local travelNode = keywordHandler:addKeyword({'konohagakure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila da Folha?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=1018, y=1016, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
 

local travelNode = keywordHandler:addKeyword({'amegakure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila dos Passaros?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=982, y=1224, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

local travelNode = keywordHandler:addKeyword({'sunagakure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila da Areia?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=814, y=1196, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

local travelNode = keywordHandler:addKeyword({'kirikagure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila da Névoa?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=1349, y=1134, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})

local travelNode = keywordHandler:addKeyword({'ishigakure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você realmente, deseja viajar para a Vila da Aguá?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=705, y=1153, z=7} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I wouldn\'t go there either.'})
 
npcHandler:addModule(FocusModule:new())