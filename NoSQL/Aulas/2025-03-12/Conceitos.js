// Criar e selecionar o banco de dados especificado.

use db_teste;

// Criar uma Collection (Tabela.).

db.createCollection("pessoas");

// Listar as coleções (Tabelas.) do banco de dados selecionado.

show collections;

// Inserir vários documentos (Registros.) de uma vez em uma Collection.

db.pessoas.insertMany([

    {"_id": 1, "username": "João", "age": 24, "active": true, "premium": false, "hobbies": ["Reading", "Soccer"], "tasks": [{"title": "To study MongoDB", "status": "pending"}]},
    {"_id": 2, "username": "Maria", "age": 30, "active": false, "premium": true, "hobbies": ["Gastronomy", "Yoga"], "tasks": [{"title": "To complete a new project", "status": "done"}]},
    {"_id": 3, "username": "Carlos", "age": 35, "active": true, "premium": false, "hobbies": ["Gaming", "Music"], "tasks": [{"title": "To write report", "status": "pending"}]}

]);

// Listar os documentos de uma Collection.

db.pessoas.find();

// Atualizar um documento (Registro.).

db.pessoas.updateOne({"username": "João"}, {$set: {"age": 25}});

// Atualizar vários documentos (Registros.).

db.pessoas.updateMany({"active": true}, {$set: {"premium": true}});

// Substituir um documento por outro novo.

db.pessoas.replaceOne(

    {"username": "Maria"},
    {"_id": 2, "username": "Maria", "age": 31, "active": true, "premium": false, "hobbies": []}

);

// Remover um campo (Coluna.) de um documento (Registro.).

db.pessoas.updateOne({"username": "Carlos"}, {$unset: {"premium": ""}});

// Renomear um campo de um documento.

db.pessoas.updateOne({"username": "João"}, {$rename: {"age": "years old"}});

// Incrementar (Aumentar.) o valor de um campo de um documento.

db.pessoas.updateOne({"username": "João"}, {$inc: {"years old": 10}});

// Decrementar (Diminuir.) o valor de um campo de um documento.

db.pessoas.updateOne({"username": "João"}, {$inc: {"years old": -5}});

// Multiplicar um valor de um documento.

db.pessoas.updateOne({"username": "João"}, {$mul: {"years old": 2}});

// Definir um limite máximo para o valor de um campo de um documento (Se for maior, será ajustado para o valor limite.).

db.pessoas.updateOne({"username": "João"}, {$min: {"years old": 30}});

// Definir um limite mínimo para o valor de um campo de um documento (Se for menor, será ajustado para o valor limite.).

db.pessoas.updateOne({"username": "João"}, {$max: {"years old": 35}});

// Adicionar um valor a um campo do tipo array.

db.pessoas.updateOne({"username": "Maria"}, {$push: {"hobbies": "Eletric guitar"}}); // Adiciona um elemento ao final do array.

// Remover um valor de um campo do tipo array.

db.pessoas.updateOne({"username": "João"}, {$pop: {"hobbies": 1}}); // Remove um elemento do final do array.

db.pessoas.updateOne({"username": "João"}, {$pop: {"hobbies": -1}}); // Remove um elemento do início do array.

db.pessoas.updateOne({"username": "Carlos"}, {$pull: {"hobbies": "Gaming"}}); // Remove o elemento especificado do array.

// Adicionar um valor, se ele ainda não existir, a um campo do tipo de array.

db.pessoas.updateOne({"username": "Carlos"}, {$addToSet: {"hobbies": "Chess"}});

// Adicionar vários valores a um campo do tipo array.

db.pessoas.updateOne({"username": "João"}, {$push: {"hobbies": {$each: ["Coding", "Music"]}}});

// db.dropDatabase();