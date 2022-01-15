function onStepIn(cid, item, position, fromPosition)
location = {
{x=997, y=910, z=7}, -- Adicione uma coordenada
}

return doTeleportThing(cid, location[math.random(#location)])
end