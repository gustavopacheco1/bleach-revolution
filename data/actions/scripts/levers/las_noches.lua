function onUse(cid, item, fromPosition, itemEx, toPosition)
    local wall_1 = getThingFromPosition({x = 3405, y = 3066, z = 7, stackpos = 1})
    local wall_2 = getThingFromPosition({x = 3405, y = 3067, z = 7, stackpos = 1})

    if wall_1.itemid == 1304 and wall_2.itemid == 1304 then
        doRemoveItem(wall_1.uid, 1)
        doRemoveItem(wall_2.uid, 1)
        doTransformItem(item.uid, 9828)
    else
        doCreateItem(1304, {x = 3405, y = 3066, z = 7, stackpos = 1})
        doCreateItem(1304, {x = 3405, y = 3067, z = 7, stackpos = 1})
        doTransformItem(item.uid, 9827)
    end
    return true
end
