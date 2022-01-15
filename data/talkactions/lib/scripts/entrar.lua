local evento = {x=2027, y=807, z=7}
local from1,to1 = {x=2023, y=801, z=7},{x=2032, y=811, z=7}
local from2,to2 = {x=2051, y=864, z=7},{x=2102, y=943, z=7}
local from3,to3 = {x=2497, y=757, z=7},{x=2513, y=770, z=7}
local from4,to4 = {x=2243, y=788, z=7},{x=2257, y=797, z=7}

function onSay(cid, words, param, channel) 
    local pos = getCreaturePosition(cid)
    if getTilePzInfo(pos) == FALSE then
        return doPlayerSendTextMessage(cid, 27, "Voce so pode usar esse comando se tiver em uma protection zone.")

    elseif getGlobalStorageValue(15200) < 0 then
        return doPlayerSendTextMessage(cid, 27, "Nao esta tendo evento neste momento.")

    elseif isInRange(pos, from1, to1) then
        return doPlayerSendTextMessage(cid, 27, "Voce ja esta dentro do evento! entre no teleport aberto.")

    elseif isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) then
        return doPlayerSendTextMessage(cid, 27, "Voce ja esta participando do evento!.")
    end
    doTeleportThing(cid, evento)
    return true
end