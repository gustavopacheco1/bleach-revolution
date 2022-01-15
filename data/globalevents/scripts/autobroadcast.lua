function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22 -- Defina a cor da mensagem (22 = branco)
    local mensagens ={
[[NtoAlony Informa:
Premium Account, como todo servidor tem um custo, precisamos da ajuda de vocês para manter o servidor online!
Beneficios premium, Jutsus Kawarimi, Jump"up jump"down, jutsus de trap, Kuchyose de ultimo nivel, 50% exp extra, Buff de Kekkei genkai e tambem tem acesso a ilhas vip do  Npc Minoru!
]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end