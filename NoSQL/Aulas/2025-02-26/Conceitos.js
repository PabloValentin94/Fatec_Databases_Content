// Listar os bancos de dados existentes (Os que não possuem nenhuma Collection, não são mostrados.).

show databases;

// Criar e selecionar o banco de dados especificado.

use db_teste;

// Criar uma Collection (Tabela.).

db.createCollection("produtos");

// Inserir vários documentos (Registros.) de uma vez em uma Collection.

db.produtos.insertMany([
    
    {"_id": 1, "nome": "Notebook Lenovo", "categoria": "Eletrônicos", "preco": 2000.00, "estoque": 250, "avaliacao": "4.7"},
    {"_id": 2, "nome": "Smartphone Motorola", "categoria": "Eletrônicos", "preco": 1100.00, "estoque": 800, "avaliacao": "4.8"},
    {"_id": 3, "nome": "Tablet Samsung", "categoria": "Eletrônicos", "preco": 1800.00, "estoque": 300, "avaliacao": "4.5"},
    {"_id": 4, "nome": "Cadeira Gamer", "categoria": "Móveis", "preco": 2500.00, "estoque": 1000, "avaliacao": "4.4"}

]);

// Exibir as Collections do banco de dados selecionado.

show collections;

// Listar os documentos de uma Collection.

db.produtos.find();

// Listar os documentos de uma Collection de forma organizada.

db.produtos.find().pretty();

// Filtrar documentos de uma Collection.

db.produtos.find({"preco": { $eq: 2500 }}); // Igual.

db.produtos.find({"preco": { $ne: 2500 }}); // Diferente.

db.produtos.find({"preco": { $gt: 2500 }}); // Maior.

db.produtos.find({"preco": { $lt: 2500 }}); // Menor.

db.produtos.find({"preco": { $gte: 1500, $lte: 2400 }}); // Maior ou igual | Menor ou igual.

db.produtos.find({$and: [{"categoria": "Eletrônicos"}, {"preco": { $gt: 1500 }}]}); // Operador AND (Deve a atender a todas as condições.).

db.produtos.find({$or: [{"preco": 2000}, {"categoria": "Móveis"}]}); // Operador OR (Deve atender a uma das condições.).

db.produtos.find({"preco": {$not: { $gt: 2000 }}}); // Operador NOT (Inverte a lógica de uma condição).

db.produtos.find({$nor: [{"preco": 2000}, {"categoria": "Móveis"}]}); // Operador NOR (Retorna todos que não atenderem as condições.).

db.produtos.find({"avaliacao": { $exists: true }}); // Verificação de existência.

db.produtos.find({"preco": {$type: "double"}}); // Retorna os valores de um campo que atenderem ao tipo especificado.