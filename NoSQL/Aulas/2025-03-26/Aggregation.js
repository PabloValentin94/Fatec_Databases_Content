use db_aggregation;

db.createCollection("pedidos");

db.createCollection("clientes");

// Junção de documentos por Embedding (Incorporação.).

db.pedidos.insertOne({

    _id: objectId("64ac9f9c75e7a9c7a6765712"),
    item: "Laptop",
    quantidade: 2,
    preco: 2000.00,
    cliente: {

        // Esse documento é inserido dentro de outro, ou seja, não há uma referência externa.
        nome: "Pablo",
        idade: 19

    }

});

db.pedidos.find();

// Junção de documentos por References (Referências externas.).

db.clientes.insertOne({

    _id: ObjectId("64ac9f9c75e7a9c7a6765710"), // Referenciado.
    nome: "Pablo",
    idade: 19

});

db.clientes.findOne({_id: ObjectId("64ac9f9c75e7a9c7a6765710")});

db.pedidos.insertOne({

    _id: ObjectId("64ac9f9c75e7a9c7a6765712"),
    item: "Laptop",
    quantidade: 2,
    preco: 2000.00,
    id_cliente: ObjectId("64ac9f9c75e7a9c7a6765710") // Referência.

});

db.pedidos.findOne({_id: ObjectId("64ac9f9c75e7a9c7a6765712")});

// Entendendo a estrutura de estágios (Pipeline.) de agregação.

db.pedidos.aggregate([
    // Execução do estágio 01.
    {},

    // Execução do estágio 02 (É executado com base no retorno do estágio 01.).
    {},

    // Execução do estágio 03 (É executado com base no retorno do estágio 02.).
    {},

    // Execução do estágio 04 (É executado com base no retorno do estágio 03.).
    {}

    // E assim por diante, até acabarem todos os estágios de agregação.
]);

// Entendendo o funcionamento do $lookup (Operador de agregação - Relacionamento.).

db.pedidos.aggregate([
    // Relacionando um documento com outro (Parecido com o JOIN do SQL.).
    {
        $lookup: {

            from: "clientes", // Coleção referenciada.
            localField: "id_cliente", // Índice relacional da coleção referenciada.
            foreignField: "_id", // Índice relacional da coleção que referencia.
            as: "dados_cliente" // Alias do retorno.

        }
    }
]).pretty();

// Entendendo o funcionamento do $group (Operador de agregação - Agrupamento.).

db.pedidos.aggregate([
    {
        // Agrupando de acordo com critérios especificados (Parecido com o GROUP BY do SQL.).
        $group: {

            _id: "$_id", // Agrupando com base no ID da ordem.
            total_pedidos: {$sum: 1}, // Obtendo a quantidade de pedidos existentes.
            total_quantidade: {$sum: "$quantidade"} // Obtendo o total de produtos vendidos em todas os pedidos juntos.

        }
    }
]).pretty();

// Entendendo o funcionamento do $match (Operador de agregação - Filtragem.).

db.clientes.aggregate([
    // Filtrando documentos (Parecido com o WHERE do SQL.).
    {
        $match: {idade: 19} // Obtém os pedidos que foram criados em 2024.
    }
]).pretty();

// Entendendo o funcionamento do $sort (Operador de agregação - Ordenação.).

db.clientes.aggregate([
    // Ordenando documentos (Parecido com o ORDER BY do SQL.).
    {
        /*
            1 --> Crescente.

            -1 --> Decrescente.
        */
        $sort: {idade: -1}
    }
]).pretty();

// Entendendo o funcionamento do $project (Operador de agregação - Exibição.).

db.pedidos.aggregate([
    {
        $lookup: {

            from: "clientes",
            localField: "id_cliente",
            foreignField: "_id",
            as: "dados_cliente"

        }
    },

    // Definindo quais campos e valores devem ser retornados.
    {
        $project: {_id: 0, item: 1, quantidade: 1, preco: 1, id_cliente: 0, dados_cliente: 1}
    }
]).pretty();

// Entendendo o funcionamento do $limit e do $skip (Operadores de agregação - Delimitação de exibição.).

db.pedidos.aggregate([
    // Definindo quantos documentos, de todos que forem retornados, serão exibidos.
    {
        $limit: 5 // Somente os primeiros 5 documentos retornados serão mostrados.
    },

    // Definindo quantos documentos, de todos que forem retornados, devem ser ignorados/pulados.
    {
        $skip: 2 // Os primeiros 2 documentos, do retorno gerado pelo primeiro estágio da pipeline, serão ignorados (Não serão mostrados.).
    }
]).pretty();

/*
    Entendendo o funcionamento do $unwind (Operador de agregação - Desagrupamento de documentos.).

    O trecho de código abaixo é só um exemplo para visualização de síntaxe, pois a coleção especificada não foi criada.
*/

const exemplo_unwind = ["P", "A", "B", "L", "O"];

db.teste.aggregate([
    /*
        O campo especificado no operador é um array. O operador $unwind irá desestruturar/desagrupar o array, ou seja, 
        ao invés de ser retornado 1 array com 4 strings, serão retornadas as 4 strings desse array, desagrupadas.
    */
    {
        $unwind: "$exemplo_unwind"
    }
]);

// Entendendo o funcionamento do $facet (Operador de agregação - Execução paralela.).

db.pedidos.aggregate([
    // Executando dois estágios filhos dentro de um estágio pai e retornando
    {
        // Os retornos de todos os estágios filhos serão combinados e adicionados ao estágio pai.
        $facet: {

            total_pedidos: {$count: "$_id"}, // Número total de pedidos.
            total_lucro: {$sum: {$multiply: ["$quantidade", "$preco"]}} // Dinheiro total levantado.

        }
    }
]).pretty();

// Entendendo o funcionamento do $bucket (Operador de agregação - Agrupamento fracionado.).

db.clientes.aggregate([
    {
        /*
            Ao invés de na execução o agrupamento de documentos ser direto (Do 0 ao 10.), o operador $bucket fará 
            com que ele aconteça em partes (Veja a divisão de execução na propriedade "boundaries".).
        */
        $bucket: {

            groupBy: "$idade",
            boundaries: [0,3,6,10],
            default: "10 clientes.",
            output: {media_idades: {$avg: "$idade"}}
            
        }
    }
]).pretty();

// Entendendo o funcionamento do $addFields (Operador de agregação - Complementação do retorno.).

db.pedidos.aggregate([
    // Adicionando um novo campo ao retorno do "aggregate" (A coleção original não é afetada.).
    {
        $addFields: {
            valor_total: {$multiply: ["$quantidade", "$preco"]}
        }
    }
]).pretty();