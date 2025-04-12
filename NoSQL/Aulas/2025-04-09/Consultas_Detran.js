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

db.multa.aggregate([ // Consulta.

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

    }}

]).pretty();

db.multa.find({id_cidade: {$eq: 3}}).pretty(); // Verificação.

// 03:

db.multa.aggregate([ // Consulta.

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
        qnt_multas_referentes: {$count: {}}

    }},

    {$sort: {qnt_multas_referentes: -1}},

    {$limit: 1}

]).pretty();

db.multa.find({id_infracao: {$eq: 2}}).pretty(); // Verificação.

// 04:

db.multa.aggregate([

    {$group: {

        _id: {$month: "$horario_multa"},
        mes: {$first: {$month: "$horario_multa"}},
        qnt_multas: {$count: {}}

    }},

    {$project: {_id: 0}},

    {$sort: {mes: -1}},

    {$limit: 1}

]).pretty();

// 05:

db.multa.aggregate([

    {$lookup: {

        from: "veiculo",
        localField: "id_veiculo",
        foreignField: "_id",
        as: "veiculo_associado"

    }},

    {$unwind: "$veiculo_associado"},

    {$lookup: {

        from: "cor",
        localField: "veiculo_associado.id_cor",
        foreignField: "_id",
        as: "veiculo_associado.cor"

    }},

    {$unwind: "$veiculo_associado.cor"},

    {$group: {

        _id: "$veiculo_associado.id_cor",
        cor: {$first: "$veiculo_associado.cor.nome"},
        qnt_multas: {$count: {}}

    }},

    {$sort: {qnt_multas: -1}},

    {$limit: 1}

]).pretty();

// 06:

db.multa.aggregate([ // Consulta.

    {$lookup: {

        from: "agente",
        localField: "id_agente",
        foreignField: "_id",
        as: "agente"

    }},

    {$unwind: "$agente"},

    {$group: {

        _id: "$id_agente",
        agente: {$first: "$agente.nome"},
        qnt_multas_aplicadas: {$count: {}}

    }},

    {$sort: {qnt_multas_aplicadas: -1}},

    {$limit: 1}

]).pretty();

db.multa.find({id_agente: {$eq: 1}}).pretty(); // Verificação.

// 07:

db.multa.aggregate([

    {$lookup: {

        from: "veiculo",
        localField: "id_veiculo",
        foreignField: "_id",
        as: "veiculo_associado"

    }},

    {$unwind: "$veiculo_associado"},

    {$lookup: {

        from: "proprietario",
        localField: "veiculo_associado.id_proprietario",
        foreignField: "_id",
        as: "veiculo_associado.proprietario"

    }},

    {$unwind: "$veiculo_associado.proprietario"},

    {$lookup: {

        from: "sexo",
        localField: "veiculo_associado.proprietario.id_sexo",
        foreignField: "_id",
        as: "veiculo_associado.proprietario.sexo"

    }},

    {$unwind: "$veiculo_associado.proprietario.sexo"},

    {$group: {

        _id: "$veiculo_associado.proprietario.id_sexo",
        sexo: {$first: "$veiculo_associado.proprietario.sexo.nome"},
        qnt_multas_associadas: {$count: {}}

    }},

    {$sort: {qnt_multas_associadas: -1}},

    {$limit: 1}

]).pretty();

// 08:

db.veiculo.aggregate([

    {$lookup: {

        from: "proprietario",
        localField: "id_proprietario",
        foreignField: "_id",
        as: "proprietario"

    }},

    {$unwind: "$proprietario"},

    {$lookup: {

        from: "sexo",
        localField: "proprietario.id_sexo",
        foreignField: "_id",
        as: "proprietario.sexo"

    }},

    {$unwind: "$proprietario.sexo"},

    {$lookup: {

        from: "modelo",
        localField: "id_modelo",
        foreignField: "_id",
        as: "modelo"

    }},

    {$unwind: "$modelo"},

    {$lookup: {

        from: "marca",
        localField: "modelo.id_marca",
        foreignField: "_id",
        as: "modelo.marca"

    }},

    {$unwind: "$modelo.marca"},

    {$group: {

        _id: {id_sexo: "$proprietario.id_sexo", id_marca: "$modelo.id_marca"},
        sexo_analisado: {$first: "$proprietario.sexo.nome"},
        marca_analisada: {$first: "$modelo.marca.nome"},
        qnt_veiculos_incluidos: {$count: {}}

    }},

    {$match: {"_id.id_sexo": {$eq: 1}}},

    {$sort: {qnt_veiculos_incluidos: -1}},

    {$limit: 1}

]).pretty();

// 09:

db.veiculo.aggregate([

    {$lookup: {

        from: "proprietario",
        localField: "id_proprietario",
        foreignField: "_id",
        as: "proprietario"

    }},

    {$unwind: "$proprietario"},

    {$lookup: {

        from: "sexo",
        localField: "proprietario.id_sexo",
        foreignField: "_id",
        as: "proprietario.sexo"

    }},

    {$unwind: "$proprietario.sexo"},

    {$lookup: {

        from: "cor",
        localField: "id_cor",
        foreignField: "_id",
        as: "cor"

    }},

    {$unwind: "$cor"},

    {$group: {

        _id: {id_sexo: "$proprietario.id_sexo", id_cor: "$id_cor"},
        sexo_analisado: {$first: "$proprietario.sexo.nome"},
        cor_analisada: {$first: "$cor.nome"},
        qnt_veiculos_incluidos: {$count: {}}

    }},

    {$match: {"_id.id_sexo": {$eq: 2}}},

    {$sort: {qnt_veiculos_incluidos: -1}},

    {$limit: 1}

]).pretty();

// 10:

db.multa.aggregate([ // Consulta.

    {$lookup: {

        from: "veiculo",
        localField: "id_veiculo",
        foreignField: "_id",
        as: "veiculo"

    }},

    {$unwind: "$veiculo"},

    {$group: {

        _id: "$id_veiculo",
        veiculo: {$first: "$veiculo.placa"},
        qnt_multas: {$count: {}}

    }},

    {$sort: {qnt_multas: -1}}

]).pretty();

db.multa.find({id_veiculo: {$eq: 1}}).pretty(); // Verificação.