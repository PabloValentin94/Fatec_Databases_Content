// A:

db.filmes.aggregate([

    {$group: {

        _id: "$diretor",
        diretor: {$first: "$diretor"},
        qnt_filmes_dirigidos: {$count: {}}

    }},

    {$project: {_id: 0}}

]).pretty();

// B:

db.filmes.aggregate([

    {$group: {

        _id: "$diretor",
        diretor: {$first: "$diretor"},
        media_avaliacao: {$avg: "$avaliacao"}

    }},

    {$project: {_id: 0}}

]).pretty();

// C:

db.filmes.aggregate([

    {$group: {

        _id: "$diretor",
        diretor: {$first: "$diretor"},
        soma_duracao_minutos_filmes_dirigidos: {$sum: "$duracao"}

    }},

    {$project: {_id: 0}}

]).pretty();

// D:

db.filmes.aggregate([

    {$group: {

        _id: "$diretor",
        diretor: {$first: "$diretor"},
        qnt_filmes_dirigidos: {$count: {}}

    }},

    {$project: {_id: 0}},

    {$sort: {qnt_filmes_dirigidos: -1}}

]).pretty();