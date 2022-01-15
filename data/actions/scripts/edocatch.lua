local mtrs = {
 
                ["[Edo Tensei] Madara] = {hp = 50000, maxhp = 50000, corpse = 2936, chance = 100},
                ["[Edo Tensei] Sasuke] = {hp = 50000, maxhp = 50000, corpse = 2806, chance = 100},
                ["[Edo Tensei] Deidara] = {hp = 50000, maxhp = 50000, corpse = 2879, chance = 100},
}
local vocs = {300, 649}
local corpos = {2936, 2806, 2879}
 
function onUse(cid, item, frompos, item2, topos)
if(not(isInArray(vocs, getPlayerVocation(cid)))) then
return doPlayerSendTextMessage(cid, 26, "You cannot use this object.")
end
if(not(isInArray(corpos, item2.itemid))) then
doPlayerPopupFYI(cid, "Para usar o Edo Tensei você deve usar o pergaminho em algum corpo de um jogador.")
return true
end
                for pet_name, v in pairs(mtrs) do
                                if item2.itemid == v.corpse then
                                        if math.random(0,100) <= v.chance then
doSendMagicEffect(topos, 2)
                                                doPlayerSendTextMessage(cid, 27, "".. pet_name .. " foi selado nesse pergaminho.")
                                                doRemoveItem(item2.uid, 1)
                                                doRemoveItem(item.uid, 1)
                                                local itemcatch = doPlayerAddItem(cid, 11390, 1)
                                                doItemSetAttribute(itemcatch, "namepet", pet_name)
                                                doItemSetAttribute(itemcatch, "description", "Neste pergaminho foi selado um ".. pet_name ..".")
                                                doItemSetAttribute(itemcatch, "lifepet", v.hp)
                                                doItemSetAttribute(itemcatch, "maxlifepet", v.maxhp)
                                        else
                                                doPlayerSendTextMessage(cid, 27, "Falhou.")
                                        end
                                end
                end
                return true
end