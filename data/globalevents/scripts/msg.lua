function onThink(interval, lastExecution)
	MENSAGEM = {
	"FRASE 1",
	"FRASE 2",
	"FRASE 3",
	"FRASE 4",
	"FRASE 5",
}
	doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],22)
	return true
end