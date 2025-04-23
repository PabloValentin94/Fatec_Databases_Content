// A:

db.filmes.updateMany({$and: [{diretor: {$eq: "Christopher Nolan"}}, {ano: {$lt: 2015}}]}, {$set: {classico: true}});

db.filmes.find({diretor: "Christopher Nolan"}).pretty();

// B:

db.filmes.updateMany({diretor: "Christopher Nolan"}, {$inc: {avaliacao: 0.2}});

db.filmes.find({diretor: "Christopher Nolan"}).pretty();