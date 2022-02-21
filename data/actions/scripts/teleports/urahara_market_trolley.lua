function onUse(cid, item, fromPosition, itemEx, toPosition)
    doTeleportThing(cid, {x = 3587, y = 3463, z = 8})
    doSendMagicEffect({x = 3587, y = 3463, z = 8}, 10)
    return true
end
