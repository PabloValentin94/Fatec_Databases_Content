// 01:

db.agendamentos.aggregate([

    {$lookup: {

        from: "animais",
        localField: "animal_id",
        foreignField: "_id",
        as: "animal"

    }},

    {$unwind: "$animal"},

    {$group: {

        _id: "$servico",
        peso_medio_animais: {$avg: "$animal.peso"}

    }}

]).pretty();

// 02:

db.agendamentos.aggregate([

    {$lookup: {

        from: "animais",
        localField: "animal_id",
        foreignField: "_id",
        as: "animal"
        
    }},

    {$unwind: "$animal"},

    {$group: {

        _id: "$animal.tipo",
        agendamentos_realizados: {$sum: 1}

    }}

]).pretty();

// 03:

db.agendamentos.aggregate([

    {$lookup: {

        from: "animais",
        localField: "animal_id",
        foreignField: "_id",
        as: "animal"

    }},

    {$unwind: "$animal"},

    {$lookup: {

        from: "donos",
        localField: "animal.dono_id",
        foreignField: "_id",
        as: "dono"

    }},

    {$unwind: "$dono"},

    {$match: {servico: {$eq: "Banho e Tosa"}}},

    {$project: {_id: 1, servico: 1, animal: 1, dono: 1}}

]).pretty();

// 04:

db.agendamentos.aggregate([

    {$lookup: {

        from: "animais",
        localField: "animal_id",
        foreignField: "_id",
        as: "animal"

    }},

    {$unwind: "$animal"},

    {$group: {

        _id: "$servico",
        servico: {$first: "$servico"},
        idade_media_animais: {$avg: "$animal.idade"}

    }},

    {$project: {_id: 0}}

]).pretty();

// 05:

db.animais.insertOne({
    
    "_id": 11,
    "nome": "Ben",
    "idade": 3,
    "tipo": "Cachorro",
    "raça": "Labrador",
    "peso": 25.0,
    "dono_id": 1

});

db.donos.aggregate([

    {$lookup: {

        from: "animais",
        localField: "_id",
        foreignField: "dono_id",
        as: "animais_associados"

    }},

    {$addFields: {

        qnt_animais_estimacao: {$size: "$animais_associados"}

    }},

    {$match: {qnt_animais_estimacao: {$gt: 1}}}

]).pretty();