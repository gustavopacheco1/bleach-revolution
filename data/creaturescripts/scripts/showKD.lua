function onLook(cid, thing, position, lookDistance)
 
    if isPlayer(thing.uid) then
        doPlayerSetSpecialDescription(thing.uid, (getPlayerSex(thing.uid) == 0 and "\nShe" or "\nHe") .. " killed[" .. getK(thing.uid) .. " and death[" .. getD(thing.uid) .. "]/nKD is[" .. getKD(thing.uid) .. "].")
        return true
    end
    
    if thing.uid == cid then
        doPlayerSetSpecialDescription(thing.uid, "You have killed[" .. getK(thing.uid) .. " and death[" .. getD(thing.uid) .. "] your KD is [" .. getKD(thing.uid) .. "].")
        return true
    end
 
    return true
end