local tps = {
                        ["Madara"] = {pos = {x=796, y=1086, z=8}, toPos = {x=796, y=1074, z=8}, time = 50},
}
local function removeTp(tp)
local t = getTileItemById(tp.pos, 5023).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(tp.pos, CONST_ME_POFF)
end
function onDeath(cid)
                        local tp = tps[getCreatureName(cid)]
                        if tp then
                        doCreateTeleport(5023, tp.toPos, tp.pos)
                        doCreatureSay(cid, "Hahaha, Voltarei!!..O teleport irá sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
                        addEvent(removeTp, tp.time*1000, tp)
                        end
                        return true
end