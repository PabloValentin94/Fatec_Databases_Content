// Testar o índice simples.

db.usuarios.find({"email": "Usuario98@email.com"}).explain("executionStats"); // Sem índice.

db.usuarios.createIndex({"email": 1}); // Criando o índice.

db.usuarios.find({"email": "Usuario98@email.com"}).hint({"email": 1}).explain("executionStats"); // Com índice.

// Testar o índice composto.

db.usuarios.find({"nome": "Usuario971"}).sort({"idade": -1}).explain("executionStats"); // Sem índice.

db.usuarios.createIndex({"nome": 1, "idade": -1}); // Criando o índice.

db.usuarios.find({"nome": "Usuario971"}).sort({"idade": -1}).hint({"nome": 1, "idade": -1}).explain("executionStats"); // Com índice.

// Testar o índice textual.

db.usuarios.createIndex({"nome": "text"}); // Criando o índice.

db.usuarios.find({$text: {$search: "97"}}).explain("executionStats"); // Com índice.

// Listar os índices existentes em uma coleção.

db.usuarios.getIndexes();

// Visualizar o espaço total ocupado pelos índices de uma coleção.

db.usuarios.totalIndexSize();

// Visualizar o espaço que cada índice de uma coleção ocupa.

db.usuarios.stats().indexSizes;