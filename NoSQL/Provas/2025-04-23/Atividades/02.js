// A:

db.usuarios.find({idade: {$gt: 25, $lt: 40}}).pretty();

// B:

db.usuarios.find({vip: false}).pretty();

// C:

db.usuarios.find({compras: {$not: {$eq: []}}}).pretty();

db.usuarios.find({compras: {$not: {$size: 0}}}).pretty();

// D:

db.usuarios.find({compras: {$gt: 100, $lt: 200}}).pretty(); // O MongoDB percorre o array automaticamente.