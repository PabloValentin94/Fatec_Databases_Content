// A:

db.filmes.find({avaliacao: {$gte: 8.5, $lte: 9.0}}).pretty();

// B:

db.filmes.find({ano: {$gt: 2000}}).pretty();

// C:

db.filmes.find({$and: [{genero: "Ficção"}, {genero: "Ação"}]}).pretty();

// D:

db.filmes.find({premiado: false}).pretty();