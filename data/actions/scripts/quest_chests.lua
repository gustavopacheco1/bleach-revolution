local function getRewardsWeight(items)
    local weight = 0
    
    for i = 1, #items do
        weight = weight + getItemWeightById(items[i])
    end

    return weight
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local quest_chest_aid = getItemAttribute(item.uid, "aid")

    if not (questChests[quest_chest_aid]) then return end

    if getPlayerStorageValue(cid, questChests[quest_chest_aid].storage) ~= -1 then
        doSendMagicEffect(getCreaturePosition(cid), 2)
        return MultiLanguage.doPlayerSendTextMessage(
            cid,
            MESSAGE_EVENT_ADVANCE,
            "This chest is empty.",
            "Este baú está vázio."
        )
    end

    if getPlayerFreeCap(cid) < getRewardsWeight(questChests[quest_chest_aid].items) then
        return MultiLanguage.doPlayerSendTextMessage(
            cid,
            MESSAGE_EVENT_ADVANCE,
            "You do not have enough capacity.",
            "Você não tem capacidade suficiente."
        )
    end

    setPlayerStorageValue(cid, questChests[quest_chest_aid].storage, 1)
    for i = 1, #questChests[quest_chest_aid].items do
        doPlayerAddItem(cid, questChests[quest_chest_aid].items[i])
    end
end
