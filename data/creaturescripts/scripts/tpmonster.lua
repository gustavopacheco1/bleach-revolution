local tpId = 1387
local tps = {
	["RB Goku SSJ4"] = {pos = {x=389, y=250, z=15}, toPos = {x=400, y=250, z=15}, time = 60}, -- Onde o Teleport irá aparecer e onde ele levará o Player. Em 'Time', configurar tempo em segundos para o TP desapecer.
	["RB Vegeta SSJ4"] = {pos = {x=412, y=250, z=15}, toPos = {x=426, y=250, z=15}, time = 60},
	["RB Gohan SSJ4"] = {pos = {x=438, y=250, z=15}, toPos = {x=449, y=250, z=15}, time = 60},
	["RB Trunks SSJ4"] = {pos = {x=461, y=250, z=15}, toPos = {x=377, y=271, z=15}, time = 60},
	["RB Raditz SSJ4"] = {pos = {x=389, y=271, z=15}, toPos = {x=400, y=271, z=15}, time = 60},
	["RB Broly SSJ4"] = {pos = {x=412, y=271, z=15}, toPos = {x=426, y=271, z=15}, time = 60},
	["RB Turles SSJ4"] = {pos = {x=438, y=271, z=15}, toPos = {x=449, y=271, z=15}, time = 60},
	["RB Bardock SSJ4"] = {pos = {x=461, y=271, z=15}, toPos = {x=419, y=232, z=15}, time = 60},
	["RB Gogeta SSJ4"] = {pos = {x=419, y=220, z=15}, toPos = {x=419, y=316, z=15}, time = 60},
	["Porunga"] = {pos = {x=419, y=295, z=15}, toPos = {x=419, y=400, z=13}, time = 60},
	["Fire Guardian1"] = {pos = {x=642, y=718, z=6}, toPos = {x=638, y=718, z=6}, time = 60},
	["Fire Guardian2"] = {pos = {x=636, y=730, z=5}, toPos = {x=636, y=732, z=5}, time = 60},
	["Fire Guardian3"] = {pos = {x=636, y=707, z=5}, toPos = {x=636, y=705, z=5}, time = 60},
	["Hawk"] = {pos = {x=648, y=841, z=3}, toPos = {x=646, y=841, z=3}, time = 60},
	["Warlock"] = {pos = {x=637, y=837, z=3}, toPos = {x=641, y=831, z=1}, time = 60},
	["Titanius"] = {pos = {x=459, y=1080, z=6}, toPos = {x=361, y=1107, z=5}, time = 300},
}
 
 
function removeTp(tp)
    local t = getTileItemById(tp.pos, tpId)
    if t then
        doRemoveItem(t.uid, 1)
        doSendMagicEffect(tp.pos, CONST_ME_POFF)
    end
end

function onDeath(cid)
    local tp = tps[getCreatureName(cid)]
    if tp then
        doCreateTeleport(tpId, tp.toPos, tp.pos)
        doCreatureSay(cid, "O teleport irá sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
        addEvent(removeTp, tp.time*1000, tp)
        addEvent(doCreateMonster, tp.time*1001, getCreatureName(cid), tp.pos)
    end
    return TRUE
end