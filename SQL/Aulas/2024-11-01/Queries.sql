/*

	01 (Faculdade): Crie uma query que liste o número de alunos do sexo masculino e feminino em cada curso da faculdade.
	
	Campos: Código, Descrição, Números de Homens, Número de Mulheres e Número Total de Alunos.
    
*/

USE faculdade_wds;

SELECT cur.id_curso AS "Código", cur.descritivo AS "Curso", 
(SELECT COUNT(id_aluno) FROM alunos WHERE id_curso = cur.id_curso AND sexo = "M") AS "Número de Homens", 
(SELECT COUNT(id_aluno) FROM alunos WHERE id_curso = cur.id_curso AND sexo = "F") AS "Número de Mulheres", 
(SELECT COUNT(id_aluno) FROM alunos WHERE id_curso = cur.id_curso) AS "Número Total de Alunos"

FROM cursos cur

ORDER BY cur.descritivo ASC;

-- Teste.

SELECT nome, sexo FROM alunos WHERE id_curso = 8;

/*

	02 (RH - Empresa): Crie uma query que liste dados de funcionários de acordo com o layout abaixo.
	
	Campos: Código, Nome, Salário, Número de Filhos, Número de Filhas e Número Total de Filhos.
	
*/

USE rh_empresa;

SELECT func.id_funcionario AS "Código", func.nome AS "Funcionários", CONCAT("R$", FORMAT(func.salario, 2, "de_DE")) AS "Salário", 
(SELECT COUNT(id_dependente) FROM dependentes WHERE id_funcionario = func.id_funcionario AND SEXO = "M") AS "Número de Filhos",
(SELECT COUNT(id_dependente) FROM dependentes WHERE id_funcionario = func.id_funcionario AND SEXO = "F") AS "Número de Filhas",
(SELECT COUNT(id_dependente) FROM dependentes WHERE id_funcionario = func.id_funcionario) AS "Número Total de Filhos"

FROM funcionarios func

ORDER BY func.nome ASC;

-- Teste.

SELECT id_dependente, sexo FROM dependentes WHERE id_funcionario = 2;

/*

	03 (Imobiliária: Crie uma query que liste o número de imóveis locados e não locados e o total de imóveis por tipo.
	
	Campos: Código, Tipo, Locados, Não Locados e Número Total de Imóveis.
    
*/

USE imobiliaria;

SELECT tip.id_tipo AS "Código", tip.descritivo AS "Tipo", 
(SELECT COUNT(imoveis.id_tipo) FROM locacao INNER JOIN imoveis ON (imoveis.id_imovel = locacao.id_imovel) WHERE imoveis.id_tipo = tip.id_tipo) AS "Alocados",
(SELECT COUNT(imoveis.id_tipo) FROM locacao RIGHT JOIN imoveis ON (imoveis.id_imovel = locacao.id_imovel) WHERE imoveis.id_tipo = tip.id_tipo AND locacao.id_locacao IS NULL) AS "Não Alocados",
(SELECT COUNT(imoveis.id_tipo) FROM locacao RIGHT JOIN imoveis ON (imoveis.id_imovel = locacao.id_imovel) WHERE imoveis.id_tipo = tip.id_tipo) AS "Número Total de Imóveis"

FROM tipos tip

ORDER BY tip.descritivo ASC;