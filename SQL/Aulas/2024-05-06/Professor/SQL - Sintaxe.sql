/* 
   Atualizado em 06/05/2024 - 23:35

   Repositório de SQL
   Sintaxe básica.
*/

/* 
   Mostra todos os bancos de dados disponíveis ao usuário 
*/
SHOW DATABASES;

/* 
  Criação de uma nova instancia de banco de dados
  SINTAXE: CREATE DATABASE nomedobancodedados
*/
CREATE DATABASE sistema;

/* 
   Conexão a determinado banco de dados 
   SINTAXE: USE nomedobancodedados
*/
USE sistema;


/*
   Mostra todas as tabelas do Banco de Dados selecionado
*/
SHOW TABLES;

/*
   Lista as características da tabela (Atributos criados)
   SINTAXE: DESCRIBE nomedatabela
*/
DESCRIBE autor;

/*
   Atenção.... Cuidado com este comando
   Caso seu usuário tenha permissão total no banco....
   Irá apagar a tabela selecionada. Com todos os dados...!
*/
DROP TABLE autor;


/* 
   Exemplo de criação de uma tabela
   Nome da tabela: autor
   Atributos:
	- autor_codigo: Chave primário, Tipo Inteiro
	- autor_nome: Atributo Simples, Tipo Varchar de 255 caracteres, não pode ser nulo, obrigatório inserir dados
	- autor_editora: Atributo Simples, Tipo Varchar  de 255 caracteres, não pode ser nulo, obrigatório inserir dados
*/
CREATE TABLE autor(
	autor_codigo INT PRIMARY KEY,
	autor_nome VARCHAR(255) NOT NULL,
	autor_editora VARCHAR(255) NOT NULL
);
