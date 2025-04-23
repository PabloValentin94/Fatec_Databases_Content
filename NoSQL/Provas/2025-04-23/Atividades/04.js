db.usuarios.updateMany({$and: [{vip: {$eq: false}}, {compras: {$eq: []}}]}, {$push: {compras: 50}});

db.usuarios.find({vip: false}).pretty();