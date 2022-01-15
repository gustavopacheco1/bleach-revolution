local t = {
    vocations = {2},
    newSpeed = -400
}

function onStepIn(cid, item, position, fromPosition)
    if isInArray(t.vocations, getPlayerVocation(cid)) then
	local bs = getCreatureBaseSpeed(cid)
        setPlayerStorageValue(cid, speedGaara, bs)
	doChangeSpeed(cid, -getCreatureSpeed(cid))
        doChangeSpeed(cid, getPlayerStorageValue(cid, speedGaara) + t.newSpeed)
    end
   return true
end

function onStepOut(cid, item, position, fromPosition)
    if isInArray(t.vocations, getPlayerVocation(cid)) then
	doChangeSpeed(cid, -getCreatureSpeed(cid))
	doChangeSpeed(cid, getPlayerStorageValue(cid, speedGaara))
    end
   return true
end