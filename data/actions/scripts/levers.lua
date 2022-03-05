local paths = {
    [26000] = {
        wall_id = 1304,
        {x = 3405, y = 3066, z = 7, stackpos = 1},
        {x = 3405, y = 3067, z = 7, stackpos = 1}
    },

    [26001] = {
        wall_id = 1304,
        {x = 3774, y = 3777, z = 8, stackpos = 1},
        {x = 3775, y = 3777, z = 8, stackpos = 1},
        {x = 3776, y = 3777, z = 8, stackpos = 1},
        {x = 3777, y = 3777, z = 8, stackpos = 1}
    },

    [26002] = {
        wall_id = 1304,
        {x = 3790, y = 3812, z = 8, stackpos = 1},
        {x = 3791, y = 3812, z = 8, stackpos = 1},
        {x = 3792, y = 3812, z = 8, stackpos = 1},
        {x = 3793, y = 3812, z = 8, stackpos = 1},
        {x = 3794, y = 3812, z = 8, stackpos = 1}
    },

    [26003] = {
        wall_id = 1304,
        {x = 3331, y = 3212, z = 9, stackpos = 1},
        {x = 3331, y = 3213, z = 9, stackpos = 1},
        {x = 3331, y = 3214, z = 9, stackpos = 1},
        {x = 3331, y = 3215, z = 9, stackpos = 1},
        {x = 3331, y = 3216, z = 9, stackpos = 1},
        {x = 3331, y = 3217, z = 9, stackpos = 1},
        {x = 3331, y = 3218, z = 9, stackpos = 1}
    },

    [26004] = {
        wall_id = 1304,
        {x = 4503, y = 4473, z = 7, stackpos = 1},
        {x = 4504, y = 4473, z = 7, stackpos = 1},
        {x = 4505, y = 4473, z = 7, stackpos = 1},
        {x = 4506, y = 4473, z = 7, stackpos = 1},
        {x = 4507, y = 4473, z = 7, stackpos = 1},
        {x = 4508, y = 4473, z = 7, stackpos = 1},
        {x = 4509, y = 4473, z = 7, stackpos = 1},
        {x = 4510, y = 4473, z = 7, stackpos = 1},
        {x = 4511, y = 4473, z = 7, stackpos = 1},
        {x = 4512, y = 4473, z = 7, stackpos = 1},
        {x = 4513, y = 4473, z = 7, stackpos = 1}
    },

    [26005] = {
        {x = 4520, y = 4328, z = 7, stackpos = 1},
        {x = 4521, y = 4328, z = 7, stackpos = 1},
        {x = 4522, y = 4328, z = 7, stackpos = 1},
        {x = 4523, y = 4328, z = 7, stackpos = 1},
        {x = 4524, y = 4328, z = 7, stackpos = 1},
        {x = 4525, y = 4328, z = 7, stackpos = 1},
        {x = 4526, y = 4328, z = 7, stackpos = 1},
        {x = 4527, y = 4328, z = 7, stackpos = 1},
        {x = 4528, y = 4328, z = 7, stackpos = 1}
    },

    [26006] = {
        wall_id = 1304,
        {x = 4503, y = 4186, z = 7, stackpos = 1},
        {x = 4503, y = 4186, z = 7, stackpos = 1},
        {x = 4503, y = 4186, z = 7, stackpos = 1},
        {x = 4503, y = 4186, z = 7, stackpos = 1},
        {x = 4503, y = 4186, z = 7, stackpos = 1},
        {x = 4503, y = 4186, z = 7, stackpos = 1},
        {x = 4503, y = 4186, z = 7, stackpos = 1},
        {x = 4503, y = 4186, z = 7, stackpos = 1},
        {x = 4503, y = 4186, z = 7, stackpos = 1},
        {x = 4518, y = 4186, z = 7, stackpos = 1}
    },

    [26007] = {
        wall_id = 1304,
        {x = 4807, y = 4141, z = 7, stackpos = 1},
        {x = 4807, y = 4142, z = 7, stackpos = 1},
        {x = 4807, y = 4143, z = 7, stackpos = 1},
        {x = 4807, y = 4144, z = 7, stackpos = 1},
        {x = 4807, y = 4145, z = 7, stackpos = 1},
        {x = 4807, y = 4146, z = 7, stackpos = 1},
        {x = 4807, y = 4147, z = 7, stackpos = 1},
        {x = 4807, y = 4148, z = 7, stackpos = 1},
        {x = 4807, y = 4149, z = 7, stackpos = 1},
        {x = 4807, y = 4150, z = 7, stackpos = 1},
        {x = 4807, y = 4151, z = 7, stackpos = 1},
        {x = 4807, y = 4152, z = 7, stackpos = 1},
        {x = 4807, y = 4153, z = 7, stackpos = 1},
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local lever_aid = getItemAttribute(item.uid, "aid")

    if not (paths[lever_aid]) then return end

    local path = paths[lever_aid]

    for position = 1, #path do
        local wall = getThingFromPosition(path[position])

        if wall.itemid == path.wall_id then
            doRemoveItem(wall.uid, 1)
        else
            doCreateItem(path.wall_id, path[position])
        end

        doSendMagicEffect(path[position], 2)
    end

    if item.itemid == 9828 then
        doTransformItem(item.uid, 9827)
    else
        doTransformItem(item.uid, 9828)
    end
    return true
end
