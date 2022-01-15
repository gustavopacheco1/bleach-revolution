
local efeito = {
	    [1] = {position = {1000, 1018, 14}, effect = {409}}
  }

function onThink(interval, lastExecution)
	for _, tile in pairs(efeito) do
		doSendMagicEffect({x=tile.position[1],y=tile.position[2],z=tile.position[3]}, tile.effect[1])
    end
   return true
end