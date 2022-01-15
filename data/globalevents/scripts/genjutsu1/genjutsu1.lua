
local efeito = {
	    [1] = {position = {1002, 1024, 14}, effect = {405}}
  }

function onThink(interval, lastExecution)
	for _, tile in pairs(efeito) do
		doSendMagicEffect({x=tile.position[1],y=tile.position[2],z=tile.position[3]}, tile.effect[1])
    end
   return true
end