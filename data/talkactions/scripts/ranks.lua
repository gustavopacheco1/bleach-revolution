local ranks = {

['fist'] = {0},
['hand'] = {0},
['atack speed'] = {0},
['weapon'] = {1},
['sword'] = {2},
['glove'] = {3},
['distance'] = {4},
['defense'] = {5},
['shield'] = {5},
['fishing'] = {6},
['ninjutsu'] = {7},
['magic'] = {7},
['ml'] = {7},
['magic level'] = {7},
['level'] = {8},

}


function onSay(cid, words, param)

local msg = string.lower(param)
if ranks[msg] ~= nil then
str = getHighscoreString((ranks[msg][1]))
else
str = getHighscoreString((8))
end
doShowTextDialog(cid,6500, str)
return TRUE

end