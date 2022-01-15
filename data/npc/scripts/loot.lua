local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-------SELLABLE

shopModule:addSellableItem({'madara armor'}, 11403, 6000,       'madara armor')

-------BUYABLE
shopModule:addBuyableItem({'madara armor'}, 11403, 6000,       'madara armor')

npcHandler:addModule(FocusModule:new())