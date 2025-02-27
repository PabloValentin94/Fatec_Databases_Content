-- Exemplo 01:

SET autocommit = 0; -- Desabilitando a execução automática.

INSERT INTO cursos(descritivo) VALUES("Curso do Carlinhos");

SELECT * FROM cursos ORDER BY descritivo ASC;

ROLLBACK;

COMMIT;

SET autocommit = 1; -- Habilitando a execução automática.

-- Exemplo 02:

SET autocommit = 0; -- Desabilitando a execução automática.

UPDATE disciplinas SET valor = 150.00 WHERE id_disciplina > 0;

SELECT * FROM disciplinas;

ROLLBACK;

SET autocommit = 1; -- Habilitando a execução automática.