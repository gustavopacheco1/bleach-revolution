function onSay(cid, words, param)
local count = getPlayerInstantSpellCount(cid)
local text = ""
local t = {}
for i = 0, count - 1 do
local spell = getPlayerInstantSpellInfo(cid, i)
if spell.level ~= 0 then
if getCreatureOutfit(cid).lookType ~= 251 and getCreatureOutfit(cid).lookType ~= 583 and spell.words ~= "Bijuu Explosion" 
and spell.words ~= "Bijuu Dama" and spell.words ~= "Bijuu Squall" and spell.words ~= "Concentred Bijuu Dama" and spell.words ~= "Hachibi Syrup" then
if spell.manapercent > 0 then
spell.mana = spell.manapercent .. "%"
end
table.insert(t, spell)
else
if spell.words == "Chakra Down" or spell.words == "Skip" or spell.words == "Jump" or spell.words == "Sense" or spell.words == "Regeneration" 
or spell.words == "Kai" or spell.words == "Chakra Feet" or spell.words == "Kawarimi Defensive" or spell.words == "Chakra Defense" 
or spell.words == "Defense Kai" or spell.words == "Big Regeneration" or spell.words == "Concentrate Chakra Feet" or spell.words == "Kawarimi Attack"
or spell.words == "Bijuu Explosion" or spell.words == "Bijuu Dama" or spell.words == "Bijuu Squall" or spell.words == "Concentred Bijuu Dama"
or spell.words == "Hachibi Syrup" or spell.words == "Tajuu Kage Bunshin no Jutsu" then
table.insert(t, spell)
end
end
end
end
table.sort(t, function(a, b) return a.level < b.level end)
local prevLevel = -1
for i, spell in ipairs(t) do
local line = ""
if prevLevel ~= spell.level then
if i ~= 1 then
line = "\n"
end
line = line .. "Jutsus for Level " .. spell.level .. "\n"
prevLevel = spell.level
end

if getCreatureOutfit(cid).lookType ~= 251 and getCreatureOutfit(cid).lookType ~= 583 then

if spell.words == "Susano" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que aumenta muito suas skills, porém causa paralyze no seu personagem.\n"
elseif spell.words == "Sharingan" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Trava o target por 3 segundos.\n"
elseif spell.words == "Karasu" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Você fica invisivel de monsters e players por 5 segundos, porém não pode soltar nenhum outro jutsu durante esse tempo.\n"
elseif spell.words == "Juukenhou" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Cria uma área circular exclusiva do clã Hyuga no chão que trava todos que não sejam do seu time e que estiverem nela.\n"
elseif spell.words == "Juuken Kaiten" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Você fica sem tomar dano por 5 segundos.\n"
elseif spell.words == "Kurama Mode" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que aumenta pouco suas skills e velocidade.\n"
elseif spell.words == "Kurama Full" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que aumenta muito suas skills, porém causa paralyze no seu personagem.\n"
elseif spell.words == "Byakugo no Jutsu" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que realiza curas a cada 1 segundo durante 1 minuto.\n"
elseif spell.words == "Enkaku Chiyu" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que heala todo o seu time que estiver próximo à 10 sqms de você.\n"
elseif spell.words == "Mystical Palm" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que heala um personagem especifico.\n"
elseif spell.words == "Shichmon" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que abre o sexto portão da morte e aumenta pouco suas skills e velocidade.\n"
elseif spell.words == "Omote Dash" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de extrema velocidade que faz com que você dashe 10 sqms.\n"
elseif spell.words == "Saikyou no Tate" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Você fica sem tomar dano por 15 segundos apenas se continuar no casulo de areia.\n"
elseif spell.words == "Gokusa Maiso" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Paralyza o target por 7 segundos.\n"
elseif spell.words == "Kage Circle" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função:  Cria uma área circular exclusiva do clã Nara no chão que trava todos que não sejam do seu time e que estiverem nela.\n"
elseif spell.words == "Kage Front" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Cria uma área frontal exclusiva do clã Nara no chão que trava o target que estiver na reta, além disso, quem não for do seu time e passar por cima dessa área também é travado.\n"
elseif spell.words == "Doton Prison" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Cria uma trap grande em torno de você onde não é possível que entrem ou saiam dela.\n"
elseif spell.words == "Katon Gouka Mekkyaku" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que causa um extremo dano em área.\n"
elseif spell.words == "Suiton Suirou" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Paralyza o target por 7 segundos.\n"
elseif spell.words == "Suiton Senshokuko" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que paralyze todos que não forem do seu time na área determinada.\n"
elseif spell.words == "Suiton Suijinheki" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Você fica sem tomar dano por 15 segundos apenas se continuar na bolha de água.\n"
elseif spell.words == "Dappi In" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu cuja função é renascer (tempo limite de 5 segundos depois que é acionada).\n"
elseif spell.words == "Poisonous" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que aplica envenenamento no target com dano razoavel.\n"
elseif spell.words == "Hiraishin Dash" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de extrema velocidade que faz com que você dashe 20 sqms.\n"
elseif spell.words == "Shiki Fuji" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Muta o target por 3 segundos.\n"
elseif spell.words == "Hiraishin Kunai" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Cria a kunai que tem função de se teletransportar.\n"
elseif spell.words == "Hiraishingiri" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Pula no target.\n"
elseif spell.words == "Hiraishin Kawase" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Troca de lugar com o target.\n"
elseif spell.words == "Jashin Chikara" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Cria um circulo do Deus Jashin no chão que tem como função deixa-lo imune e refletir todos os danos (só funciona se estiver no centro do circulo).\n"
elseif spell.words == "Jashin Scythe" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Cria a Scythe que tem como função sugar a vida do target.\n"
elseif spell.words == "Ryuu Yagai" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de extrema velocidade que faz com que você dashe 6 sqms, além disso trava e muta o target se ele estiver na área do efeito do dash.\n"
elseif spell.words == "Yoruzo" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Chuta o target para longe e se ele bater em alguém ou em um objeto ele é travado por 3 segundos.\n"
elseif spell.words == "Hachmon" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que aumenta muito as skills.\n"
elseif spell.words == "Tsukuyomi" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Trava o target por 4 segundos.\n"
elseif spell.words == "Shintenshin" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Você e o target ficam travados por 10 segundos e o target se movimenta para a direção que você estiver indicando.\n"
elseif spell.words == "Mokuton Prison" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Trava o target por 2 segundos.\n"
elseif spell.words == "Saisei" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que healiza uma enorme cura instantanea.\n"
elseif spell.words == "Daburu Dash" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de extrema velocidade que faz com que você dashe 10 sqms, sendo que passa por cima de monsters ou players.\n"
elseif spell.words == "Karori Kontororu" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que aumenta em grande quantidade sua life e skills.\n"
elseif spell.words == "Sawarabi Prison" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que cria trap de espinhos no entorno do personagem, só recebe dano quem demorar muito para sair do sqm e não for do seu time.\n"
elseif spell.words == "Karamatsu no Mai" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que aumenta muito suas skills.\n"
elseif spell.words == "Kamui Dimension" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que teletransporta você, o target e mais duas pessoas do seu time (apenas se estiverem do seu lado) para a dimensão do kamui por 10 segundos.\n"
elseif spell.words == "Kamui In" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Você fica sem tomar dano por 5 segundos.\n"
elseif spell.words == "Gatsuuga Dash" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de extrema velocidade que faz com que você dashe 10 sqms.\n"
elseif spell.words == "Shikyaku no Jutsu" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que aumenta muito suas skills.\n"
elseif spell.words == "Hachibi Syrup" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu cuja função é renascer (tempo limite de 5 segundos depois que é acionada).\n"
elseif spell.words == "Hachibi Mode" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que aumenta muito suas skills, porém causa paralyze no seu personagem.\n"
elseif spell.words == "Explosive Trap" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que cria explosive traps em uma grande área no chão e causa um grande dano para quem não é do time.\n"
elseif spell.words == "Paralyze Trap" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu que cria paralyze traps em uma grande área no chão e causa paralyze para quem não é do time.\n"
elseif spell.words == "Tsutenkyaku" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Trava o target por 2 segundos.\n"
elseif spell.words == "Raiton Chakura" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de transformação que aumenta muito as skills.\n"
elseif spell.words == "Sutoreto Dash" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Jutsu de extrema velocidade que faz com que você dashe 20 sqms.\n"
elseif spell.words == "Raisuiryudan" then
text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. " - Função: Chuta o target para longe e se ele bater em alguém ou em um objeto ele é travado por 5 segundos.\n"

else

text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. "\n"

end

else

text = text .. line .. " " .. spell.words .. " : " .. spell.mana .. "\n"

end

end
doShowTextDialog(cid, 13283, text)
return TRUE
end