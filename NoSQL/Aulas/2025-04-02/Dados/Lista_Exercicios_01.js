// Banco de Dados.

use db_lista_01;

// Coleções.

db.createCollection("clientes");

db.createCollection("produtos");

db.createCollection("vendas");

db.createCollection("pedidos");

show collections;

// Documentos.

db.clientes.insertMany([ 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765710"), 
      "nome": "Alice", 
      "email": "alice@example.com", 
      "regiao": "Sudeste" 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765711"), 
      "nome": "Bruno", 
      "email": "bruno@example.com", 
      "regiao": "Sul" 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765712"), 
      "nome": "Carlos", 
      "email": "carlos@example.com", 
      "regiao": "Centro-Oeste" 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765713"), 
      "nome": "Diana", 
      "email": "diana@example.com", 
      "regiao": "Norte" 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765714"), 
      "nome": "Eduardo", 
      "email": "eduardo@example.com", 
      "regiao": "Nordeste" 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765715"), 
      "nome": "Fernanda", 
      "email": "fernanda@example.com", 
      "regiao": "Sul" 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765716"), 
      "nome": "Gabriel", 
      "email": "gabriel@example.com", 
      "regiao": "Sudeste" 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765717"), 
      "nome": "Helena", 
      "email": "helena@example.com", 
      "regiao": "Centro-Oeste" 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765718"), 
      "nome": "Igor", 
      "email": "igor@example.com", 
      "regiao": "Norte" 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765719"), 
      "nome": "Juliana", 
      "email": "juliana@example.com", 
      "regiao": "Nordeste" 
    } 
]);

db.produtos.insertMany([ 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765720"), 
      "nome": "Laptop", 
      "preco": 1200 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765721"), 
      "nome": "Smartphone", 
      "preco": 800 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765722"), 
      "nome": "Tablet", 
      "preco": 500 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765723"), 
      "nome": "Headphones", 
      "preco": 150 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765724"), 
      "nome": "Smartwatch", 
      "preco": 300 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765725"), 
      "nome": "Câmera Digital", 
      "preco": 700 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765726"), 
      "nome": "Impressora", 
      "preco": 400 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765727"), 
      "nome": "Monitor", 
      "preco": 350 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765728"), 
      "nome": "Teclado", 
      "preco": 100 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765729"), 
      "nome": "Mouse", 
      "preco": 80 
    } 
]);

db.vendas.insertMany([ 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765730"), 
      "data_venda": ISODate("2023-01-15T08:00:00Z"), 
      "valor": 1500, 
      "mes": 1, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765710"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765720") 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765731"), 
      "data_venda": ISODate("2023-02-20T10:30:00Z"), 
      "valor": 1600, 
      "mes": 2, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765711"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765721") 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765732"), 
      "data_venda": ISODate("2023-03-05T14:15:00Z"), 
      "valor": 500, 
      "mes": 3, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765712"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765722") 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765733"), 
      "data_venda": ISODate("2023-04-18T09:45:00Z"), 
      "valor": 300, 
      "mes": 4, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765713"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765724") 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765734"), 
      "data_venda": ISODate("2023-05-22T16:20:00Z"), 
      "valor": 700, 
      "mes": 5, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765714"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765725") 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765735"), 
      "data_venda": ISODate("2023-06-30T11:10:00Z"), 
      "valor": 400, 
      "mes": 6, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765715"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765726") 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765736"), 
      "data_venda": ISODate("2023-07-12T13:55:00Z"), 
      "valor": 350, 
      "mes": 7, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765716"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765727") 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765737"), 
      "data_venda": ISODate("2023-08-25T07:30:00Z"), 
      "valor": 100, 
      "mes": 8, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765717"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765728") 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765738"), 
      "data_venda": ISODate("2023-09-09T19:40:00Z"), 
      "valor": 80, 
      "mes": 9, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765718"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765729") 
    }, 
    { 
      "_id": ObjectId("64ac9f0375e7a9c7a6765739"), 
      "data_venda": ISODate("2023-10-03T12:25:00Z"), 
      "valor": 900, 
      "mes": 10, 
      "ano": 2023, 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765719"), 
      "produto_id": ObjectId("64ac9f0375e7a9c7a6765721") 
    } 
]);

db.pedidos.insertMany([ 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765740"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765710"), 
      "produto": "Laptop", 
      "quantidade": 2, 
      "preco_unitario": 1200, 
      "ano": 2023 
    }, 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765741"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765711"), 
      "produto": "Smartphone", 
      "quantidade": 1, 
      "preco_unitario": 800, 
      "ano": 2023 
    }, 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765742"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765712"), 
      "produto": "Tablet", 
      "quantidade": 3, 
      "preco_unitario": 500, 
      "ano": 2023 
    }, 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765743"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765713"), 
      "produto": "Smartwatch", 
      "quantidade": 2, 
      "preco_unitario": 300, 
      "ano": 2023 
    }, 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765744"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765714"), 
      "produto": "Câmera Digital", 
      "quantidade": 1, 
      "preco_unitario": 700, 
      "ano": 2023 
    }, 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765745"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765715"), 
      "produto": "Impressora", 
      "quantidade": 1, 
      "preco_unitario": 400, 
      "ano": 2023 
    }, 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765746"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765716"), 
      "produto": "Monitor", 
      "quantidade": 2, 
      "preco_unitario": 350, 
      "ano": 2023 
    }, 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765747"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765717"), 
      "produto": "Teclado", 
      "quantidade": 4, 
      "preco_unitario": 100, 
      "ano": 2023 
    }, 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765748"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765718"), 
      "produto": "Mouse", 
      "quantidade": 5, 
      "preco_unitario": 80, 
      "ano": 2023 
    }, 
    { 
      "_id": ObjectId("64ac9f9c75e7a9c7a6765749"), 
      "cliente_id": ObjectId("64ac9f0375e7a9c7a6765719"), 
      "produto": "Smartphone", 
      "quantidade": 3, 
      "preco_unitario": 800, 
      "ano": 2023 
    } 
]);