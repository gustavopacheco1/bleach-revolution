function onStepIn(cid, item, position, fromPosition)
location = {
{x=996, y=913, z=7}, -- Adicione uma coordenada
}

return doTeleportThing(cid, location[math.random(#location)])
end