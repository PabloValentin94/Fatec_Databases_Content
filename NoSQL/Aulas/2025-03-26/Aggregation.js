use db_aggregation;

db.createCollection("ordens");

db.createCollection("clientes");

// Junção de documentos por Embedding (Incorporação.).

db.ordens.insertOne({

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

db.ordens.find();

// Junção de documentos por References (Referências externas.).

client = {

    _id: ObjectId("64ac9f9c75e7a9c7a6765710"), // Referenciado.
    nome: "Pablo",
    idade: 19

};

ordem = {

    _id: objectId("64ac9f9c75e7a9c7a6765712"),
    item: "Laptop",
    quantidade: 2,
    preco: 2000.00,
    id_cliente: ObjectId("64ac9f9c75e7a9c7a6765710") // Referência.

}

db.ordens.findOne({_id: ObjectId("64ac9f9c75e7a9c7a6765715")});

db.clientes.findOne({_id: ObjectId("64ac9f9c75e7a9c7a6765715")});

// Usando o recurso de agregação entre documentos.

db.ordens.aggregate([
    // Relacionando um documento com outro (Parecido com o JOIN do SQL.).
    {
        $lookup: {
            from: "clientes",
            localField: "id_cliente",
            foreignField: "_id",
            as: "cliente_info"
        }
    }
]);

// Usando o operador $group (Parecido com o GROUP BY do SQL.).

db.ordens.aggregate({
    // Agrupando de acordo com critérios especificados.
    $group: {
        _id: "$_id", // Agrupando com base no ID da ordem.
        total_ordens: {$sum: 1}, // Obtendo a quantidade de ordens existentes.
        total_quantity: {$sum: "$quantidade"} // Obtendo o total de produtos vendidos em todas as ordens juntas.
    }
});

// Entendendo a estrutura de estágios de agregação.

db.ordens.aggregate({
    // Execução do estágio 01.
    {},

    // Execução do estágio 02 (É executado com base no retorno do estágio 01.).
    {},

    // Execução do estágio 03 (É executado com base no retorno do estágio 02.).
    {},

    // Execução do estágio 04 (É executado com base no retorno do estágio 03.).
    {}

    // E assim por diante, até acabarem todos os estágios de agregação.
});