// Analisando o tempo de execução antes da criação de índices.

db.pessoa.find({nome: "Laís Daniela Assunção"}).explain("executionStats");

// Criando um índice com base no nome.

db.pessoa.createIndex({nome: 1});

// Testando o índice anterior.

db.pessoa.find({nome: "Laís Daniela Assunção"}).explain("executionStats");

// Testando um índice nativo.

db.pessoa.find({_id: ObjectId("68083f837b573ea0344baeba")}).explain("executionStats");

// Listando os índices existentes.

db.pessoa.getIndexes();

// Exibindo o espaço que cada índice ocupa na memória.

db.pessoa.stats().indexSizes;

// Exibindo o espaço total de memória gasto com índices.

db.pessoa.totalIndexSize();