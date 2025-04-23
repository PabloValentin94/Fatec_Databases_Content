// Inserindo um documento.

db.pessoa.insertOne({_id: 1, nome: "Tiago"});

// Inserindo vários documentos de uma vez.

db.pessoa.insertMany([

    {_id: 2, nome: "Vânia"},
    {_id: 3, nome: "Anderson"},
    {_id: 4, nome: "Lívia"}

]);