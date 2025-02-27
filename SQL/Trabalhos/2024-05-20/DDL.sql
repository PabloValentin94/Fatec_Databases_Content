CREATE DATABASE db_testes;

USE db_testes;

CREATE TABLE Usuario (

    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(255),
    email VARCHAR(255),
    senha CHAR(8),
    administrador BOOL DEFAULT 0 -- Em banco de dados, os booleanos são representados como valores inteiros (0/Falso ou 1/Verdadeiro.);

);

CREATE TABLE Autor (

    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(255)

);

CREATE TABLE Editora (

    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(255)

);

CREATE TABLE Livro (

    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(255),
    qnt_paginas INT,

    fk_autor INT,
    fk_editora INT,

    FOREIGN KEY(fk_autor) REFERENCES Autor(id),
    FOREIGN KEY(fk_editora) REFERENCES Editora(id)

);

CREATE TABLE Proprietario (

    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(255),
    cpf CHAR(11) UNIQUE,
    data_nascimento DATE,
    sexo VARCHAR(13), -- ENUM("Masculino", "Feminino", "Não informado").
    telefone VARCHAR(11)

);

CREATE TABLE Veiculo (

    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    renavam CHAR(11) UNIQUE,
    placa CHAR(7) UNIQUE,
    ano CHAR(4),

    fk_proprietario INT,

    FOREIGN KEY(fk_proprietario) REFERENCES Proprietario(id)

);

CREATE TABLE Bloco (

    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    descricao VARCHAR(255) UNIQUE

);

CREATE TABLE Sala (

    id INT PRIMARY KEY UNIQUE, -- O AUTO_INCREMENT não foi colocado propositalmente.
    nome VARCHAR(255),

    fk_bloco INT,

    FOREIGN KEY(fk_bloco) REFERENCES Bloco(id)

);

/*CREATE TABLE Disciplina (

    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(255),

    fk_sala INT,

    FOREIGN KEY(fk_sala) REFERENCES Sala(id)

);*/

SHOW TABLES;