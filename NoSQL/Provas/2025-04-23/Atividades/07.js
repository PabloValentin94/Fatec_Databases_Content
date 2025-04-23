// A:

/*

    Veja abaixo, exemplos do cálculo feito nos agrupamentos das agregações.

    ▪ Ano -> 2017 | 2017 - 7 (Ano - Resto) | 2010 <- Década

    ▪ Ano -> 2024 | 2024 - 4 (Ano - Resto) | 2020 <- Década

    ▪ Ano -> 2006 | 2006 - 6 (Ano - Resto) | 2000 <- Década

    ▪ Etc.

*/

db.filmes.aggregate([

    {$group: {

        _id: {$subtract: ["$ano", {$mod: ["$ano", 10]}]},
        qnt_filmes_produzidos: {$count: {}}

    }},

    {$addFields: {

        decada: "$_id" // Neste estágio, o valor do campo "_id" refere-se a decada.

    }},

    {$sort: {decada: -1}},

    {$project: {_id: 0, decada: 1, qnt_filmes_produzidos: 1}}

]).pretty();

// B:

db.filmes.aggregate([

    {$group: {

        _id: {$subtract: ["$ano", {$mod: ["$ano", 10]}]},
        media_geral_avaliacao_filmes: {$avg: "$avaliacao"}

    }},

    {$addFields: {

        decada: "$_id"

    }},

    {$sort: {decada: -1}},

    {$project: {_id: 0, decada: 1, media_geral_avaliacao_filmes: 1}}

]).pretty();

// C:

/*

    Veja abaixo, uma representação do que acontece quando desestruturamos/descompactamos 
    um array que possui mais de um elemento.

    Forma Base:

        {carreira: "Programação", area: ["Front-End", "Back-End", "Banco de Dados"]}

    Retorno da Descompactação ($unwind):

        {carreira: "Programação", area: "Front-End"},
        {carreira: "Programação", area: "Back-End"},
        {carreira: "Programação", area: "Banco de Dados"}

    Em resumo, se desestruturarmos um array que tem mais de um elemento, o documento ao qual ele 
    pertence fará réplicas de si mesmo, onde a única alteração é o campo referente ao array. Para 
    cada elemento que o array possui, é feito um documento de réplica.

    A agregação abaixo, é um exemplo de quando isso pode ser útil.

*/

db.filmes.aggregate([

    {$unwind: "$genero"}, // Descompactando o array para que os elementos sejam adicionados individualmente ao campo gerado no agrupamento.

    {$group: {

        _id: {$subtract: ["$ano", {$mod: ["$ano", 10]}]},
        generos_lancados: {$addToSet: "$genero"}

    }},

    {$addFields: {

        decada: "$_id"

    }},

    {$sort: {decada: -1}},

    {$project: {_id: 0, decada: 1, generos_lancados: 1}}

]).pretty();
