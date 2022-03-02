local potions = {
    -- great reiatsu potion
    [16111] = {heal_mana = 30000, randomizer = 2500, effect = 502},

    -- ultimate potion
    [16112] = {heal_health = 15000, heal_mana = 15000, randomizer = 2500, effect = 502},

    -- reiatsu potion
    [16113] = {heal_mana = 15000, randomizer = 2500, effect = 502},

    -- health potion
    [16114] = {heal_health = 15000, randomizer = 2500, effect = 502},

    -- reiatsu pill
    [16116] = {heal_mana = 8000, randomizer = 2500, effect = 502},

    -- health pill
    [16117] = {heal_health = 8000, randomizer = 2500, effect = 502},

    -- great health potion
    [16118] = {heal_health = 30000, randomizer = 2500, effect = 502}
}

local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 1000)

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if isPlayer(itemEx.uid) and not hasCondition(cid, CONDITION_EXHAUST) then
        local potion = potions[item.itemid]
    
        if potion.heal_health then
            doCreatureAddHealth(itemEx.uid, math.random(potion.heal_health - potion.randomizer, potion.heal_health + potion.randomizer))
        end
        
        if potion.mana then
            doCreatureAddMana(itemEx.uid, math.random(potion.heal_mana - potion.randomizer, potion.heal_mana + potion.randomizer))
        end
    
        doSendMagicEffect(toPosition, potions[item.itemid].effect)
        doAddCondition(cid, exhaust)
        doRemoveItem(item.uid, 1)
    end
    return true
end