local task_normal = {

{names = {"Strong Anbu"}, 			storage = 162001,	storageend = 163001,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Shinobi Wanted"}, 		storage = 162002,	storageend = 163002,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Black Anbu"}, 			storage = 162003,	storageend = 163003,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Spy Oto No Kuni"}, 		storage = 162004,	storageend = 163004,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Jay Eremita"}, 			storage = 162005,	storageend = 163005,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Gryphon"}, 				storage = 162006,	storageend = 163006,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Silver Dragon"}, 		storage = 162007,	storageend = 163007,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Plumari"}, 				storage = 162008,	storageend = 163008,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Salamander"}, 			storage = 162009,	storageend = 163009,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Black Spider"}, 			storage = 162010,	storageend = 163010,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Gorila"}, 				storage = 162011,	storageend = 163011,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Shido"}, 				storage = 162012,	storageend = 163012,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Elite Anbu"}, 			storage = 162013,	storageend = 163013,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Suna Wa Kami"}, 			storage = 162014,	storageend = 163014,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Lider Guard"}, 			storage = 162015,	storageend = 163015,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Gamabunta"}, 			storage = 162016,	storageend = 163016,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"False Zetsu"}, 			storage = 162017,	storageend = 163017,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Stealth Sand"}, 			storage = 162018,	storageend = 163018,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Akahoshi"}, 				storage = 162019,	storageend = 163019,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Withe Zetsu"}, 			storage = 162020,	storageend = 163020,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Supure Snake"}, 			storage = 162021,	storageend = 163021,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"gamakichi", "gamahiro"}, storage = 162022,	storageend = 163022,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	},
{names = {"Scorpion King"}, 		storage = 162023,	storageend = 163023,	count = 1, 	items = {	{id = 2160, countmax = 1}, {id = 7443, countmax = 50}	}	}

}

function onSay(cid, words, param)

local text = "---------------[TASK SYSTEM]--------------- Após atingir a quantidade necessária de kills basta ir até o NPC Tsunade e entregar sua TASK. \n\n"

for i, monstersname in pairs(task_normal) do

if getPlayerStorageValue(cid, task_normal[i].storage) <= -1 then -- PARA INICIAR DO ZERO
setPlayerStorageValue(cid, task_normal[i].storage, 0)
end

text = text .. "" .. task_normal[i].names[1] .. " - [".. getPlayerStorageValue(cid, task_normal[i].storage) .."/".. task_normal[i].count .."]\n"

end

doShowTextDialog(cid, 13283, text)

return true
end