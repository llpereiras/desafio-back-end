TypeTransaction.destroy_all

TypeTransaction.create!({id: 1, description: "Débito",                 nature: "Entrada", sinal: "+"})
TypeTransaction.create!({id: 2, description: "Boleto",                 nature: "Saída",   sinal: "-"})
TypeTransaction.create!({id: 3, description: "Financiamento",          nature: "Saída",   sinal: "-"})
TypeTransaction.create!({id: 4, description: "Crédito",                nature: "Entrada", sinal: "+"})
TypeTransaction.create!({id: 5, description: "Recebimento Empréstimo", nature: "Entrada", sinal: "+"})
TypeTransaction.create!({id: 6, description: "Vendas",                 nature: "Entrada", sinal: "+"})
TypeTransaction.create!({id: 7, description: "Recebimento TED",        nature: "Entrada", sinal: "+"})
TypeTransaction.create!({id: 8, description: "Recebimento DOC",        nature: "Entrada", sinal: "+"})
TypeTransaction.create!({id: 9, description: "Aluguel",                nature: "Saída",   sinal: "-"})




