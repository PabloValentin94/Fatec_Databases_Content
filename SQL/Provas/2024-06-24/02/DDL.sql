-- Criação do banco de dados.

CREATE DATABASE db_pedidos;

USE db_pedidos;

CREATE TABLE Pedidos (

ped_codigo INT PRIMARY KEY AUTO_INCREMENT,
ped_vendedor INT NOT NULL,
ped_produto INT NOT NULL,
ped_nome_produto VARCHAR(255) NOT NULL,
ped_valor DOUBLE NOT NULL

);

-- As chaves estrangeiras não foram adicionadas para agilizar o desenvolvimento da questão.

-- Exibição da estrutura do banco de dados.

SHOW TABLES;

DESC Pedidos;