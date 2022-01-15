local spells = {
[1] = {used = 0, text = '<attack name="melee" interval="2000" chance="100" range="5" radius="1" target="0"><attribute key="areaEffect" value="fire"/></attack>'},
[2] = {used = 0, text = '<attack name="melee" interval="1200" chance="100" range="5" radius="1" target="0"><attribute key="areaEffect" value="energyarea"/></attack>'},
[3] = {used = 0, text = '<attack name="melee" interval="700" chance="100" range="5" radius="1" target="0"><attribute key="areaEffect" value="mortarea"/></attack>'}
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


function onSay(cid, words)

	local attacks = "<a>"
	local num
	
	for i=1,spellsNumber,1 do
		num = randomNum(table.getn(spells))
		attacks = attacks .. spells[num].text
	end
	
	attacks = attacks .. "</a>"
	doCreateCustomMonster(getCreatureName(cid), getCreaturePosition(cid), getCreatureOutfit(cid), getCreatureMaxHealth(cid), attacks, 6324, 1, 100)
	
	for i=1,table.getn(spells),1 do
		spells[i].used = 0
	end
	
	attacks = ""


	return true
end