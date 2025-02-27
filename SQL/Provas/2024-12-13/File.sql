-- 01:

DELIMITER //
DROP PROCEDURE IF EXISTS Remover_Projeto//
CREATE PROCEDURE Remover_Projeto(IN codigo_projeto INT)
BEGIN

    IF (codigo_projeto IN (SELECT id_projeto FROM projetos)) THEN
    
	IF (codigo_projeto IN (SELECT DISTINCT(id_projeto) FROM funcionarios_projetos)) THEN
	
	    SELECT "Este projeto não pode ser apagado, pois está vinculado a algum funcionário." AS "Mensagem";
	    
	ELSE
	
	    DELETE FROM projetos WHERE id_projeto = codigo_projeto;
	    
	    SELECT "Projeto removido com sucesso." AS "Mensagem";
	
	END IF;
    
    ELSE
    
	SELECT "Projeto não cadastrado." AS "Mensagem";
    
    END IF;

END//
DELIMITER ;

CALL Remover_Projeto(0);

CALL Remover_Projeto(4);

INSERT INTO projetos(descritivo, bonus) VALUES("Teste", 10.00);

CALL Remover_Projeto(5);

-- 02:

DELIMITER //
DROP PROCEDURE IF EXISTS Calcular_Mensalidade_Aluno//
CREATE PROCEDURE Calcular_Mensalidade_Aluno(IN codigo_aluno INT)
BEGIN

    IF (codigo_aluno IN (SELECT id_aluno FROM alunos)) THEN
    
	IF (codigo_aluno IN (SELECT DISTINCT(id_aluno) FROM matriculas)) THEN
	
	    SELECT alu.nome AS "Aluno", cur.descritivo AS "Curso", CONCAT("R$", FORMAT(SUM(disc.valor), 2, "de_DE")) AS "Mensalidade"
	    
	    FROM matriculas mat
	    
	    INNER JOIN alunos alu ON (alu.id_aluno = mat.id_aluno)
	    INNER JOIN cursos cur ON (cur.id_curso = alu.id_curso)
	    INNER JOIN disciplinas disc ON (disc.id_disciplina = mat.id_disciplina)
	    
	    WHERE mat.id_aluno = codigo_aluno;
	
	ELSE
	
	    SELECT "Este aluno não possui disciplinas associadas a ele." AS "Mensagem";
	
	END IF;
    
    ELSE
    
	SELECT "Aluno não cadastrado." AS "Mensagem";
    
    END IF;

END//
DELIMITER ;

CALL Calcular_Mensalidade_Aluno(0);

CALL Calcular_Mensalidade_Aluno(1);

CALL Calcular_Mensalidade_Aluno(3);

CALL Calcular_Mensalidade_Aluno(11);

-- 03:

DELIMITER //
DROP TRIGGER IF EXISTS Aplicar_Desconto//
CREATE TRIGGER Aplicar_Desconto BEFORE INSERT ON nf_vendas FOR EACH ROW
BEGIN

    DECLARE quantidade_compras_cliente INT;

    IF (NEW.id_cliente IN (SELECT DISTINCT(id_cliente) FROM nf_vendas)) THEN
    
	SET quantidade_compras_cliente = (SELECT COUNT(id_cliente) FROM nf_vendas WHERE id_cliente = NEW.id_cliente);
	
	IF (quantidade_compras_cliente >= 1 AND quantidade_compras_cliente <= 2) THEN
	
	    SET NEW.valor = NEW.valor * 0.95;
	    
	ELSE
	
	    IF (quantidade_compras_cliente >= 3 AND quantidade_compras_cliente <= 4) THEN
	    
		SET NEW.valor = NEW.valor * 0.92;
		
	    ELSE
	    
	        SET NEW.valor = NEW.valor * 0.90;
	        
	    END IF;
	
	END IF;

    END IF;

END//
DELIMITER ;

INSERT INTO nf_vendas(emissao, valor, id_vendedor, id_cliente, id_fp) VALUES(CURRENT_DATE, 100.00, 2, 10, 1); -- R$100.00

INSERT INTO nf_vendas(emissao, valor, id_vendedor, id_cliente, id_fp) VALUES(CURRENT_DATE, 200.00, 2, 6, 1); -- R$190.00

INSERT INTO nf_vendas(emissao, valor, id_vendedor, id_cliente, id_fp) VALUES(CURRENT_DATE, 300.00, 2, 3, 1); -- R$276.00

INSERT INTO nf_vendas(emissao, valor, id_vendedor, id_cliente, id_fp) VALUES(CURRENT_DATE, 400.00, 2, 1, 1); -- R$360.00

SELECT * FROM nf_vendas ORDER BY emissao DESC;

-- 04:

CREATE USER antonio@localhost IDENTIFIED BY "1234";

SELECT * FROM mysql.user;

GRANT SELECT (id_funcionario, nome, sexo, admissao, salario), UPDATE (nome, admissao) ON rh_empresa.funcionarios TO antonio@localhost;

SHOW GRANTS FOR antonio@localhost;

REVOKE UPDATE (nome, admissao) ON rh_empresa.funcionarios FROM antonio@localhost;

SHOW GRANTS FOR antonio@localhost;

DROP USER antonio@localhost;

SELECT * FROM mysql.user;