// 01:

db.internacoes.aggregate([

    {$lookup: {

        from: "medicos",
        localField: "medico_id",
        foreignField: "_id",
        as: "medico"

    }},

    {$lookup: {

        from: "pacientes",
        localField: "paciente_id",
        foreignField: "_id",
        as: "paciente"

    }},

    {$unwind: "$medico"},

    {$unwind: "$paciente"},

    {$group: {

       _id: "$medico.especialidade",
       media_idade_pacientes: {$avg: "$paciente.idade"}

    }}

]).pretty();

// 02:

db.internacoes.insertOne({
    
    "_id": 11,
    "paciente_id": 1,
    "medico_id": 1,
    "data_internacao": ISODate("2023-11-01"),
    "data_alta": ISODate("2023-11-10"),
    "motivo": "Tratamento de Diabetes"

});

db.internacoes.aggregate([ // Primeira maneira.

    {$group: {

        _id: "$paciente_id",
        quantidade_vezes_internado: {$count: {}}

    }},

    {$sort: {_id: 1}},

    {$lookup: {

        from: "pacientes",
        localField: "_id",
        foreignField: "_id",
        as: "paciente"

    }},

    {$unwind: "$paciente"}

]).pretty();

db.pacientes.aggregate([ //Segunda maneira.

    {$sort: {_id: 1}},

    {$lookup: {

        from: "internacoes",
        localField: "_id",
        foreignField: "paciente_id",
        as: "internacoes"

    }},

    {$addFields: {

        quantidade_vezes_internado: {$size: "$internacoes"}

    }}

]).pretty();

// 03:

db.internacoes.aggregate([

    {$lookup: {

        from: "medicos",
        localField: "medico_id",
        foreignField: "_id",
        as: "medico"

    }},

    {$lookup: {

        from: "pacientes",
        localField: "paciente_id",
        foreignField: "_id",
        as: "paciente"

    }},

    {$unwind: "$medico"},

    {$unwind: "$paciente"},

    {$project: {_id: 1, data_internacao: 1, medico: 1, paciente: 1}},

    {$match: {"paciente.diagnóstico": {$eq: "Diabetes"}}}

]).pretty();

// 04:

db.internacoes.insertOne({
    
    "_id": 11,
    "paciente_id": 10,
    "medico_id": 1,
    "data_internacao": ISODate("2024-03-20"),
    "data_alta": ISODate("2024-03-30"),
    "motivo": "Tratamento Cardíaco"

});

db.internacoes.aggregate([

    {$lookup: {

        from: "pacientes",
        localField: "paciente_id",
        foreignField: "_id",
        as: "paciente"

    }},

    {$unwind: "$paciente"},

    {$addFields: {

        qnt_dias_internado: {$dateDiff: {startDate: "$data_internacao", endDate: "$data_alta", unit: "day"}}

    }},

    {$group: {

        _id: "$paciente._id",
        /*
            Ao atribuir um valor ao campo "paciente" estamos referenciando um grupo de documentos 
            (Todos as internações cujo id do paciente é igual ao valor do campo de agrupamento "_id".) 
            e não a um documento isolado. Devido a isso, devemos utilizar o operador "$first" para obter somente 
            o valor do campo do primeiro documento do agrupamento (Como todos os documentos do grupo possuem o mesmo 
            paciente, o valor do campo sempre será igual em todos, então se obtermos o primeiro, já resolvemos o 
            problema.)
        */
        paciente: {$first: "$paciente.nome"},
        total_dias_internado: {$sum: "$qnt_dias_internado"}

    }}

]).pretty();

// 05:

db.medicos.aggregate([

    {$group: {

        _id: "$especialidade",
        media_salarial: {$avg: "$salário"}

    }}

]).pretty();