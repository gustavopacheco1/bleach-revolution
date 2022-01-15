local groups = {2, 3, 4}
function onLogin(cid)
    if isInArray(groups, getPlayerGroupId(cid)) then
        doBroadcastMessage("["..getPlayerGroupName(cid).."] "..getPlayerName(cid)..", está online.")
    end
    return true
end