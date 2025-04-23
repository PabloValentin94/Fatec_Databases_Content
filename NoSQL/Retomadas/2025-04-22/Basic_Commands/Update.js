// Atualizando um documento.

db.pessoa.updateOne({_id: 2}, {$set: {nome: "Wudson"}});

// Atualizando vários documentos de uma vez.

db.pessoa.updateMany({_id: {$gt: 0}}, {$set: {idade: 18}});