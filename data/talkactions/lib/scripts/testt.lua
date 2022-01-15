local spells = {
[1] = {used = 0, text = '<attack name="melee" interval="1000" min="-100" max="-1000"/>'},
[2] = {used = 0, text = '<attack name="melee" interval="1000" min="-100" max="-1000"/>'},
[3] = {used = 0, text = '<attack name="melee" interval="1000" min="-100" max="-1000"/>'}
}

local spellsNumber = 2

function randomNum(range)

 local rand = 0
 good = false

 math.randomseed( os.time() )
 math.random()
 math.random()
 math.random()
 
while (not good) do
	rand = math.random(range)
	
	if (spells[rand].used == 0) then
		spells[rand].used = 1
		good = true
	else
		good = false
	end
	
end

return rand

end


function onSay(cid, words, param, channel)

	-- /custom name,lookType,health,exp
	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
		return true
	end
	local t = string.explode(param, ",")
	if(not t[4]) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command require 2 params.")
		return true
	end
	
	local position = getCreaturePosition(cid)
	outfit = {lookType = t[2], lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0}
	local attacks = "<a>"
	local num
	
	for i=1,spellsNumber,1 do
		num = randomNum(table.getn(spells))
		attacks = attacks .. spells[num].text
	end
	
	attacks = attacks .. "</a>"
	-- doCreateCustomMonster(name, pos, outfit, health, spells, corpse, distance, exp )
	doCreateCustomMonster(t[1],position,outfit,t[3],attacks, 6324, 1, t[4])
	
	for i=1,table.getn(spells),1 do
		spells[i].used = 0
	end
	
	attacks = ""


	return true
end