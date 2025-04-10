// 01:

db.clientes.aggregate([

    {$lookup: {

        from: "pedidos",
        localField: "_id",
        foreignField: "cliente_id",
        as: "pedidos_cliente"

    }},

    {$addFields: {

        quantidade_pedidos: {$size: "$pedidos_cliente"}

    }},

    {$sort: {quantidade_pedidos: -1}},

    {$match: {quantidade_pedidos: 0}}

]).pretty();

// 02 (Incompleto):

db.vendas.aggregate([

    {$group: {

        _id: "$mes",
        total_vendas: {$sum: 1}

    }},

    {$sort: {_id: 1}}

]);

// 03:

db.produtos.aggregate([

    {$lookup: {

        from: "vendas",
        localField: "_id",
        foreignField: "produto_id",
        as: "vendas_associadas"

    }},

    {$addFields: {

        quantidade_vezes_associado: {$size: "$vendas_associadas"}

    }},

    {$sort: {quantidade_vezes_associado: -1}},

    {$match: {quantidade_vezes_associado : 0}}
    
]).pretty();

// 04:

db.pedidos.aggregate([

    {$group: {

        _id: "$cliente_id",
        gasto: {$sum: {$multiply: ["$quantidade", "$preco_unitario"]}}

    }},

    {$lookup: {

        from: "clientes",
        localField: "_id",
        foreignField: "_id",
        as: "cliente"

    }},

    {$sort: {gasto: -1}},

    {$limit: 1}

]).pretty();

// 05:

db.pedidos.aggregate([ // Quantidade de pedidos de cada produto.

    {$group: {

        _id: "$produto",
        total_requisicoes: {$sum: "$quantidade"}
        
    }}

]);

db.pedidos.aggregate([ // Quantidade de pedidos de cada região.

    {$lookup: {

        from: "clientes",
        localField: "cliente_id",
        foreignField: "_id",
        as: "cliente"

    }},

    {$unwind: "$cliente"},

    {$group: {

        _id: "$cliente.regiao",
        total_requisicoes: {$sum: "$quantidade"}

    }}

]);