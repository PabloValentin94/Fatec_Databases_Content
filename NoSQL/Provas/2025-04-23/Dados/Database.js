// Criando o banco de dados.

use db_prova_01;

// Criando as coleções.

db.createCollection("filmes");

db.createCollection("usuarios");

// Verificando.

show databases;

show collections;

// Inserindo documentos nas coleções.

db.filmes.insertMany([

    { "_id": 1, "titulo": "Oppenheimer", "ano": 2023, "genero": ["Drama", "Histórico"], "avaliacao": 8.9, "diretor": "Christopher Nolan", "duracao": 180, "premiado": true },

    { "_id": 2, "titulo": "A Origem", "ano": 2010, "genero": ["Ação", "Ficção"], "avaliacao": 8.8, "diretor": "Christopher Nolan", "duracao": 148, "premiado": false },
    
    { "_id": 3, "titulo": "Matrix", "ano": 1999, "genero": ["Ação", "Ficção"], "avaliacao": 8.7, "diretor": "Wachowski", "duracao": 136, "premiado": true },

    { "_id": 4, "nome": "Deadpool & Wolverine", "ano": 2024, "genero": ["Comédia"], "avaliacao": 10.0, "diretor": "Ryan Reynolds", "duracao": 105, "premiado": false }

]);

db.usuarios.insertMany([

    { "_id": 1, "nome": "Ana", "idade": 24, "email": "ana@email.com", "compras": [120, 85], "vip": true },

    { "_id": 2, "nome": "Pedro", "idade": 40, "email": "pedro@email.com", "compras": [300, 100], "vip": false },

    { "_id": 3, "nome": "João", "idade": 35, "email": "joao@email.com", "compras": [], "vip": false },

    { "_id": 4, "nome": "Pablo", "idade": 19, "email": "pablo@teste.com", "compras": [80, 20, 150, 1], "vip": false }

]);