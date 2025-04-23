// Listando os bancos de dados existentes.

show databases;

show dbs;

// Listando as coleções do banco de dados selecionado.

show collections;

// Selecionando um banco de dados (A criação é automática.).

use db_conceitos;

// Criando coleções.

db.createCollection("pessoa");

db.createCollection("local");

db.createCollection("item");

// Excluíndo coleções.

db.local.drop();

db.item.drop();

// Excluíndo um banco de dados (É preciso selecioná-lo antes.).

db.dropDatabase();