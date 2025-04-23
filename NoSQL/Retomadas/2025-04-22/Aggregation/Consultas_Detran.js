// 01:

db.multa.aggregate([

    {$lookup: {

        from: "veiculo",
        localField: "id_veiculo",
        foreignField: "_id",
        as: "veiculo_associado"

    }},

    {$unwind: "$veiculo_associado"},

    {$lookup: {

        from: "modelo",
        localField: "veiculo_associado.id_modelo",
        foreignField: "_id",
        as: "veiculo_associado.modelo"

    }},

    {$unwind: "$veiculo_associado.modelo"},

    {$group: {

        _id: "$veiculo_associado.id_modelo",
        modelo_veiculo: {$first: "$veiculo_associado.modelo.nome"},
        qnt_multas: {$count: {}}

    }},

    {$sort: {qnt_multas: -1}},

    {$limit: 1}

]).pretty();

// 02:

db.multa.aggregate([

    {$lookup: {

        from: "cidade",
        localField: "id_cidade",
        foreignField: "_id",
        as: "cidade"

    }},

    {$unwind: "$cidade"},

    {$group: {

        _id: "$id_cidade",
        cidade: {$first: "$cidade.nome"},
        qnt_multas: {$count: {}}

    }},

    {$sort: {qnt_multas: -1}}

]).pretty();

// 03:

db.multa.aggregate([

    {$lookup: {

        from: "infracao",
        localField: "id_infracao",
        foreignField: "_id",
        as: "infracao"

    }},

    {$unwind: "$infracao"},

    {$group: {

        _id: "$id_infracao",
        infracao: {$first: "$infracao.descricao"},
        qnt_vezes_aplicada: {$count: {}}

    }},

    {$sort: {qnt_vezes_aplicada: -1}},

    {$limit: 1}

]).pretty();