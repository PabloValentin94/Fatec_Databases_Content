-- Criação do banco de dados.

CREATE DATABASE db_music_player;

USE db_music_player;

CREATE TABLE Usuario (

usu_id INT PRIMARY KEY AUTO_INCREMENT,
usu_nome VARCHAR(255) NOT NULL,
usu_email VARCHAR(255) NOT NULL UNIQUE,
usu_senha CHAR(8) NOT NULL,

CHECK(CHAR_LENGTH(usu_senha) = 8)

);

CREATE TABLE Playlist (

play_codigo INT PRIMARY KEY AUTO_INCREMENT,
play_nome VARCHAR(255) NOT NULL,
play_obs VARCHAR(255) NULL DEFAULT NULL,

fk_usuario INT,
CONSTRAINT fk_usu_id FOREIGN KEY(fk_usuario) REFERENCES Usuario(usu_id),

play_usu_nome VARCHAR(255) NULL DEFAULT NULL

);

-- Modificações da estrutura do banco de dados.

ALTER TABLE Playlist CHANGE play_codigo play_id INT AUTO_INCREMENT;

-- Exibição da estrutura do banco de dados.

SHOW TABLES;

DESC Usuario;

DESC Playlist;