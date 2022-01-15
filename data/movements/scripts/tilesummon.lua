function onStepIn(cid, item, position, fromPosition)
--[[
Nome do monstros, Coordenada de onde ele irá ser sumonado.
Pode adicionar mais monstro caso assim desejar.
--]]
local M = {
[1] = {"Mizukii",{x=1009, y=347, z=7}},
}
local storage = 13311 -- n mexa
local time_summon = 3 -- intervalo de tempo em minutos para nao summonar novamente
if not isPlayer(cid) then
return FALSE
elseif getGlobalStorageValue(storage) >= os.time() then
return FALSE
end
for i = 1, #M do
doCreateMonster(M[1], M[2])
end
doCreatureSay(cid, "Haa eu vou te derrotar!", 19)
setGlobalStorageValue(storage, os.time()+time_summon*60)
return TRUE
end