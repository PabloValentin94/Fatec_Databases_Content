/*

    Índices no MongoDB fazem com que listagem de dados sejam feitas de forma mais rápida, 
    porém ocupam mais espaço de disco (Armazenamento.).

*/

use db_indices;

db.createCollection("usuarios");

// Criar um índice simples (Uma referência.).

db.usuarios.createIndex({"email": 1}); // Criando um índice simples que busca documentos com base no campo e-mail, em ordem crescente (1).

db.usuarios.find({"email": "teste@email.com"}); // Consultas que envolvam o campo email serão mais rápidas.

// Criar um índice composto (Mais de uma referência.).

db.usuarios.createIndex({"nome": 1, "idade": -1}); // Criando um índice composto que busca documentos com base no campo nome, em ordem crescente (1), e no campo idade, em ordem decrescente (-1).

db.usuarios.find({"nome": "Carlos"}).sort({"idade": -1}); // Obtém todos os documentos cujo campo nome possua o valor "Carlos" e irá organizá-los com base na idade, em ordem descrescente (A mesma estrutura do índice anterior.).

// Utilizar índices em Arrays (Índice Multi-Key).

db.pedidos.createIndex({"itens": 1});

// Criar um índice textual.

db.produtos.createIndex({"descricao": "text"});

db.produtos.find({$text: {$search: "notebook"}}); // Utilizando o índice anterior para pesquisar documentos cuja descrição contenha a palavra "notebook".

/*

    É possível criar índices para campos que armazenam coordenadas geográficas (Índices Geoespaciais.), 
    o que possibilita buscar locais próximos de um ponto específico.

*/

db.locais.createIndex({"localizacao": "2dsphere"});

// Visualizar o espaço total ocupado pelos índices de uma coleção.

db.usuarios.totalIndexSize();

// Visualizar o espaço que cada índice de uma coleção ocupa.

db.usuarios.stats().indexSizes;

// Descobrir se um índice está sendo usado.

db.usuarios.find({"email": "teste@email.com"}).explain("executionStats");

// Definir manualmente qual índice deve ser utilizando na execução.

db.usuarios.find({"email": "teste@email.com"}).hint({"email": 1}); // Utilizando o índice do campo e-mail.

// Utilizando os dois últimos recursos juntos.

db.usuarios.find({"email": "teste@email.com"}).hint({"email": 1}).explain("executionStats");

// Listar os índices existentes em uma coleção.

db.usuarios.getIndexes();

// Remover um índice de uma coleção.

db.usuarios.dropIndex("alias do índice");

// db.dropDatabase();

/*

    Consulte o material em PDF para uma melhor explicação.

*/