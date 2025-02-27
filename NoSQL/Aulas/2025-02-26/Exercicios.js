use db_teste;

db.createCollection("produtos");

db.produtos.insertMany([
    
    {"_id": 1, "nome": "Notebook Lenovo", "categoria": "Eletrônicos", "preco": 2000.00, "estoque": 250, "avaliacao": 4.7},
    {"_id": 2, "nome": "Smartphone Motorola", "categoria": "Eletrônicos", "preco": 1100.00, "estoque": 800},
    {"_id": 3, "nome": "Tablet Samsung", "categoria": "Eletrônicos", "preco": 1800.00, "estoque": 300, "avaliacao": 4.5},
    {"_id": 4, "nome": "Cadeira Gamer", "categoria": "Móveis", "preco": 2500.00, "estoque": 1000, "avaliacao": 4.4},
    {"_id": 5, "nome": "Suporte de Fone de Ouvido", "categoria": "Móveis", "preco": 50.00, "estoque": 1000, "avaliacao": 5.0},
    {"_id": 6, "nome": "Apple Watch", "categoria": "Rico", "preco": 5000.00, "estoque": 100, "avaliacao": 4.5}

]);

db.produtos.find();

// 01:

db.produtos.find({"preco": {$gte: 2000}});

// 02:

db.produtos.find({$and: [{"categoria": "Móveis"}, {"avaliacao": {$gt: 4.5}}]});

// 03:

db.produtos.find({$or: [{"preco": {$lt: 2000}}, {"estoque": {$gt: 20}}]});

// 04:

db.produtos.find({"avaliacao": {$exists: true}});

// 05:

db.produtos.find({$nor: [{"categoria": "Eletrônicos"}, {"preco": {$gt: 3000}}]});

// db.dropDatabase();