--[[ Cliport Item 1.1
Autor: Skymagnum/Skyforever
You can post in other forums if you take credits :)
]]
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
 
    local canPassAtWalls = false
    local removeAtUse = true
    local maxDist = 4
 
    if not isWalkable(toPosition, true, true, true) then
         doPlayerSendCancel(cid, "Sorry, not possible.") return true
    end
 
    if canPassAtWalls == false and not isSightClear(fromPosition, toPosition, true) then
         doPlayerSendCancel(cid, "Sorry, you can't do it.") return true
    end
 
    if getDistanceBetween(fromPosition, toPosition) > maxDist then
         doPlayerSendCancel(cid, "Sorry, is too far.") return true
    end
 
    doTeleportThing(cid, toPosition, false)
    doSendDistanceShoot(fromPosition, toPosition, 30)
 
    if removeAtUse then
         doRemoveItem(item.uid, 1)
    end
 
    return true
end