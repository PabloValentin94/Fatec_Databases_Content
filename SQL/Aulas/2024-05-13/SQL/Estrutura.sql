CREATE DATABASE db_assistencia_tecnica;

USE db_assistencia_tecnica;

-- Tabelas Simples (Sem chave estrangeira.):

CREATE TABLE Endereco (

    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    estado CHAR(2),
    cidade VARCHAR(255),
    bairro VARCHAR(255),
    logradouro VARCHAR(255),
    numero VARCHAR(5),
    cep CHAR(8)

);

CREATE TABLE Marca (

    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255)

);

CREATE TABLE Servico (

    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255),
    preco FLOAT

);

CREATE TABLE Funcionario (

    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255),
    telefone VARCHAR(11)

);

-- Tabelas Complexas (Com chave estrangeira.):

CREATE TABLE Produto (

    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255),
    preco FLOAT,
    unidade_medida VARCHAR(5),
    modelo VARCHAR(255),

    fk_marca INT,

    FOREIGN KEY(fk_marca) REFERENCES Marca(id)

);

CREATE TABLE Cliente (

    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(11),
    tipo ENUM("Físico", "Jurídico"),
    cpf CHAR(11),
    cnpj CHAR(14),

    fk_endereco INT,

    FOREIGN KEY(fk_endereco) REFERENCES Endereco(id)

);

CREATE TABLE Equipamento (

    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    descricao VARCHAR(255),
    ano_fabricacao INT,
    observacoes VARCHAR(255),
    especiicacoes VARCHAR(255),

    fk_marca INT,
    fk_cliente INT,

    FOREIGN KEY(fk_marca) REFERENCES Marca(id),
    FOREIGN KEY(fk_cliente) REFERENCES Cliente(id)

);

CREATE TABLE Ordem_Servico (

    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    data_abertura DATE,
    data_conclusao DATE,

    fk_cliente INT, -- Opcional.
    fk_funcionario INT,
    fk_equipamento INT,

    FOREIGN KEY(fk_cliente) REFERENCES Cliente(id),
    FOREIGN KEY(fk_funcionario) REFERENCES Funcionario(id),
    FOREIGN KEY(fk_equipamento) REFERENCES Equipamento(id)

    -- Poderíamos puxar o cliente pelos dados do equipamento, mas por questão didática, não faremos isso agora.

);

-- Tabelas Associativas (Duas ou mais chaves estrangeiras definem a condição de existência de um campo.):

CREATE TABLE Ordem_Servico_Servico_Assoc (

    fk_ordem_servico INT,
    fk_servico INT,

    FOREIGN KEY(fk_ordem_servico) REFERENCES Ordem_Servico(id),
    FOREIGN KEY(fk_servico) REFERENCES Servico(id)

);

CREATE TABLE Funcionario_Servico_Assoc (

    fk_funcionario INT,
    fk_servico INT,

    FOREIGN KEY(fk_funcionario) REFERENCES Funcionario(id),
    FOREIGN KEY(fk_servico) REFERENCES Servico(id)

);

CREATE TABLE Ordem_Servico_Produto_Assoc (

    fk_ordem_servico INT,
    fk_produto INT,

    FOREIGN KEY(fk_ordem_servico) REFERENCES Ordem_Servico(id),
    FOREIGN KEY(fk_produto) REFERENCES Produto(id)

);

ALTER TABLE Servico MODIFY preco DOUBLE;
ALTER TABLE Produto MODIFY preco DOUBLE;

SHOW TABLES;