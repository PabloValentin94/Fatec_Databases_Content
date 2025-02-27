CREATE DATABASE db_livros;

USE db_livros;

-- A ordem de criação das tabelas importa.

CREATE TABLE Autor (

id_autor INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL

);

CREATE TABLE Editora (

id_editora INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL

);

CREATE TABLE Livro (

id_livro INT PRIMARY KEY,
titulo VARCHAR(100) NOT NULL,
qnt_paginas INT NOT NULL,
fk_id_editora INT NOT NULL,

FOREIGN KEY(fk_id_editora) REFERENCES Editora (id_editora)

);

CREATE TABLE Livro_Autor_Assoc (

fk_id_livro INT NOT NULL,
fk_id_autor INT NOT NULL,

FOREIGN KEY(fk_id_livro) REFERENCES Livro (id_livro),
FOREIGN KEY(fk_id_autor) REFERENCES Autor (id_autor)

);

CREATE TABLE Autor_Editora_Assoc (

fk_id_autor INT NOT NULL,
fk_id_editora INT NOT NULL,

FOREIGN KEY(fk_id_autor) REFERENCES Autor (id_autor),
FOREIGN KEY(fk_id_editora) REFERENCES Editora (id_editora)

);