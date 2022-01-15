local tapete = 13460   
 function onUse(cid, item, actor)
    if (isPlayer(cid)) then
        doCreateItem(tapete, 1)
        end
    return true
end
