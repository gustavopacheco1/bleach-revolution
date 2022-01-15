 
function onSay(cid, words)
    local words = "- - - - - - - - - - - - SaGA - - - - - - - - - - - -" ..
    "\n"..
    "\n- Introdução PT1 - !saga  [BEGIGN]" ..
    "\n- Introdução PT2 - !saga 2" ..
    "\n- País da Onda - !saga 3" ..
    "\n- Chuunin Shiken - !saga 4" ..
    "\n- Invasão de Konoha - !saga 5" ..
    "\n- Volta de Itachi - !saga 6" ..
    "\n- Decisão da Tsunade - !saga 7" ..
    "\n- Corrida do País do Chá - !saga 8" ..
    "\n- Resgate do Sasuke - !saga 9" ..
    "\n- Caçador de Recompensas - !saga 10" ..
    "\n- Vilarejo Oculto da Estrela - !saga 11" ..
    "\n- Castelo mal-assombrado - !saga 12" ..
    "\n- Cuidados de Kurenai - !saga 13" ..
    "\n- Resgate do Gaara - !saga 14" ..
    "\n- Atrás do Espião de Sasori - !saga 15" ..
    "\n- O esconderijo do Orochimaru - !saga 16" ..
    "\n- Treinamento - !saga 17" ..
	"\n"..
	"\n- Para saber, onde deve ir, ou o que fazer em cada saga, utilize o prefixo ! e o nome da missão..." ..
	"\n- Exemplo: !introdução." ..
	
	"\n"..
	"\n- Após um número de sagas, o jogador não ganhará outfit, e passará a ganhar somente saga points, que são utilizados, para efetuar graduações." ..
	"\n"..
	"\n- Para a utilização do comando saga, use !saga1, !saga2, e etc.."
	
	
   
   
	doShowTextDialog(cid, 1950, words)
   
    return TRUE
   
end