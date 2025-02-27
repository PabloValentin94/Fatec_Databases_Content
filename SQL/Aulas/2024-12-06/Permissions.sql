-- Exemplo 01 (Criação de Usuário.):

CREATE USER carlos@localhost IDENTIFIED BY "1234";

SELECT * FROM mysql.user;

GRANT USAGE ON *.* TO carlos@localhost;

FLUSH PRIVILEGES;

SHOW GRANTS FOR carlos@localhost;

SHOW GRANTS FOR root@localhost;

DROP USER carlos@localhost;

-- Exemplo 02 (Privilégios Globais.):

CREATE USER pedro@localhost IDENTIFIED BY "1234";

SELECT * FROM mysql.user;

GRANT ALL PRIVILEGES ON *.* TO pedro@localhost WITH GRANT OPTION;

REVOKE ALL PRIVILEGES, GRANT OPTION FROM pedro@localhost;

FLUSH PRIVILEGES;

SHOW GRANTS FOR pedro@localhost;

DROP USER pedro@localhost;

-- Exemplo 03 (Privilégios em um Banco de Dados.):

CREATE USER paulo@localhost IDENTIFIED BY "1234";

SELECT * FROM mysql.user;

GRANT INSERT, UPDATE, DELETE, SELECT ON imobiliaria.* TO paulo@localhost;

REVOKE DELETE ON imobiliaria.* FROM paulo@localhost;

FLUSH PRIVILEGES;

SHOW GRANTS FOR paulo@localhost;

DROP USER paulo@localhost;

-- Exemplo 04 (Privilégios em uma Tabela.):

CREATE USER lucas@localhost IDENTIFIED BY "1234";

SELECT * FROM mysql.user;

GRANT DELETE, SELECT ON faculdade_wds.alunos TO lucas@localhost;

REVOKE DELETE ON faculdade_wds.alunos FROM lucas@localhost;

FLUSH PRIVILEGES;

SHOW GRANTS FOR lucas@localhost;

DROP USER lucas@localhost;

-- Exemplo 05 (Privilégios em Campos.):

CREATE USER vinicius@localhost IDENTIFIED BY "1234";

SELECT * FROM mysql.user;

GRANT SELECT (id_aluno, nome) ON faculdade_wds.alunos TO vinicius@localhost;

REVOKE SELECT (id_aluno, nome) ON faculdade_wds.alunos FROM vinicius@localhost;

FLUSH PRIVILEGES;

SHOW GRANTS FOR vinicius@localhost;

DROP USER vinicius@localhost;

-- Exemplo 06 (Senha de Usuário.):

CREATE USER teste@localhost IDENTIFIED BY "1234";

SELECT * FROM mysql.user;

-- SQLyog:

SET PASSWORD FOR teste@localhost = PASSWORD("#senha");

-- MySQL:

ALTER USER teste@localhost IDENTIFIED BY "#senha";
FLUSH PRIVILEGES;

DROP USER teste@localhost;