local outfits = {
        [1] = {lookType = 92}, 
        [10] = {lookType = 7},
        [30] = {lookType = 60},
        [40] = {lookType = 172},
        [50] = {lookType = 62},
        [60] = {lookType = 108},
        [70] = {lookType = 196},
        [80] = {lookType = 342},
        [90] = {lookType = 298},
        [100] = {lookType = 385}, 
        [110] = {lookType = 98}, 
        [120] = {lookType = 376},
        [130] = {lookType = 10}
     
}        
       
 
function onLogin(cid)
        local voc_id = getPlayerVocation(cid)
        if getPlayerVocation(cid) > 0 then
                doSetCreatureOutfit(cid, outfits[voc_id], -1)
        end
        return TRUE
end