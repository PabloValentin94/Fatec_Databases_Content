// Substituindo os dados de um documento.

db.pessoa.replaceOne({_id: {$eq: 1}}, {nome: "Tiagotas", idade: 20}); // O único campo não afetado é o ID.

// Não é possível substituir vários documentos de uma vez.