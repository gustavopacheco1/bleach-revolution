--[[Script By Vodkart]]-- 
function onUse(cid, item, position, fromPosition) 
--[[ 
Nome do monstros, Coordenada de onde ele irá ser sumonado. 
Pode adicionar mais monstro caso assim desejar. 
--]] 
local M = {  
[1] = {"nidaime",{x=915, y=1158, z=8}}
}  
 
local storage = 19908 -- n mexa 
local time_summon = 15 -- intervalo de tempo em minutos para nao summonar novamente 
 
if not isPlayer(cid) then
return FALSE
elseif getGlobalStorageValue(storage) >= os.time() then
doCreatureSay(cid, "Parece que foi aberto recentemente, devo aguardar alguns minutos.", 19) 
return FALSE
end
for i = 1, #M do  
doCreateMonster(M[i][1], M[i][2]) 
end 
doCreatureSay(cid, "Nossa, Eh um clone perfeito de Nidaime!", 19)  
setGlobalStorageValue(storage, os.time()+time_summon*60)   
return TRUE  
end