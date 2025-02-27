/*

	01 (RH_Empresa): Crie uma Procedure para calcular a soma dos salários dos funcionários de uma determinada unidade da empresa, identificando o nome da unidade.
	
	Entrada: Código da Unidade.
	
	Saída: Nome da Unidade e Folha de Pagamento.

*/

DELIMITER //
DROP PROCEDURE IF EXISTS Soma_Salarios//
CREATE PROCEDURE Soma_Salarios(IN codigo_unidade INT, OUT nome_unidade VARCHAR(100), OUT folha_pagamento DOUBLE)
BEGIN

    IF (codigo_unidade IN (SELECT id_empresa FROM empresas)) THEN
	
        IF (codigo_unidade IN (SELECT DISTINCT(id_empresa) FROM funcionarios)) THEN
        
            SELECT emp.descritivo, SUM(func.salario) INTO nome_unidade, folha_pagamento
            
            FROM funcionarios func
            
            INNER JOIN empresas emp ON (emp.id_empresa = func.id_empresa)
            
            WHERE emp.id_empresa = codigo_unidade;
            
        ELSE
        
            SELECT "Unidade sem funcionários." AS "Mensagem";
        
        END IF;
	
    ELSE
	
        SELECT "Unidade inexistente." AS "Mensagem";
	
    END IF;

END//
DELIMITER ;

CALL Soma_Salarios(2, @nome_unidade, @valor_folha_pagamento);

SELECT @nome_unidade AS "Empresa", CONCAT("R$", FORMAT(@valor_folha_pagamento, 2, "de_DE")) AS "Folha de Pagamento";

/*

	02 (Faculdade): Crie uma Procedure que calcula a mensalidade que um determinado aluno vai pagar indicando o nome do aluno e o valor da mensalidade.
	
	Entrada: Código do Aluno.
	
	Saída: Nome do Aluno e Valor da Mensalidade.

*/

DELIMITER //
DROP PROCEDURE IF EXISTS Mensalidade_Aluno//
CREATE PROCEDURE Mensalidade_Aluno(IN codigo_aluno INT, OUT nome_aluno VARCHAR(100), OUT mensalidade DOUBLE)
BEGIN

    IF (codigo_aluno IN (SELECT id_aluno FROM alunos)) THEN
    
        IF (codigo_aluno IN (SELECT DISTINCT(id_aluno) FROM matriculas)) THEN
        
            SELECT alu.nome, SUM(disc.valor) INTO nome_aluno, mensalidade
            
            FROM matriculas mat
            
            INNER JOIN alunos alu ON (alu.id_aluno = mat.id_aluno)
            INNER JOIN disciplinas disc ON (disc.id_disciplina = mat.id_disciplina)
            
            WHERE mat.id_aluno = codigo_aluno;
        
        ELSE
        
            SELECT "Aluno sem disciplinas." AS "Mensagem";
        
        END IF;
    
    ELSE
    
        SELECT "Aluno não encontrado." AS "Mensagem";
    
    END IF;

END//
DELIMITER ;

CALL Mensalidade_Aluno(4, @nome_aluno, @mensalidade_aluno);

SELECT @nome_aluno AS "Aluno", CONCAT("R$", FORMAT(@mensalidade_aluno, 2, "de_DE")) AS "Mensalidade";