// Deletando um documento.

db.pessoa.deleteOne({_id: 1});

// Deletando vários documentos de uma vez.

db.pessoa.deleteMany({_id: {$gt: 0}});