/*

	01: Liste os funcionários que tem o salário maior que o do funcionário de ID 01.
	
	Campos exigidos: Código, Nome, Sexo e Salário.
    
*/

SELECT func.id_funcionario AS "Código", func.nome AS "Funcionário(a)",
func.sexo AS "Sexo", CONCAT("R$", FORMAT(func.salario, 2, "de_DE")) AS "Salário"

FROM funcionarios func

WHERE func.salario > (SELECT salario FROM funcionarios WHERE id_funcionario = 1)

ORDER BY func.id_funcionario ASC;

/*

	02: Liste os funcionários que tem o salário maior que o do funcionário de ID 01 e que participam do projeto de ID 03.
	
	Campos exigidos: Código, Nome, Sexo e Salário.
    
*/

SELECT func.id_funcionario AS "Código", func.nome AS "Funcionário(a)",
func.sexo AS "Sexo", CONCAT("R$", FORMAT(func.salario, 2, "de_DE")) AS "Salário"

FROM funcionarios_projetos func_proj

INNER JOIN funcionarios func ON (func.id_funcionario = func_proj.id_funcionario)
INNER JOIN projetos proj ON (proj.id_projeto = func_proj.id_projeto)

WHERE func_proj.id_projeto = 3 AND func.salario > (SELECT salario FROM funcionarios WHERE id_funcionario = 1)

ORDER BY func.id_funcionario ASC;

/*

	03: Liste os funcionários que tem o salário igual ao menor cadastrado na empresa.
	
	Campos exigidos: Código, Nome, Sexo, Salário e Cargo.
    
*/

SELECT func.id_funcionario AS "Código", func.nome AS "Funcionário(a)", func.sexo AS "Sexo",
CONCAT("R$", FORMAT(func.salario, 2, "de_DE")) AS "Salário", car.descritivo AS "Cargo"

FROM funcionarios func

INNER JOIN cargos car ON (car.id_cargo = func.id_cargo)

WHERE func.salario = (SELECT MIN(salario) FROM funcionarios)

ORDER BY func.id_funcionario ASC;

/*

	04: Liste os funcionários que tem o salário abaixo da média salarial da empresa.
	
	Campos exigidos: Código, Nome, Sexo, Salário e Departamento.
    
*/

SELECT func.id_funcionario AS "Código", func.nome AS "Funcionário(a)", func.sexo AS "Sexo",
CONCAT("R$", FORMAT(func.salario, 2, "de_DE")) AS "Salário", dep.descritivo AS "Departamento"

FROM funcionarios func

INNER JOIN departamentos dep ON (dep.id_departamento = func.id_departamento)

WHERE func.salario < (SELECT AVG(salario) FROM funcionarios)

ORDER BY func.id_funcionario;

/*

	05: Reajuste em 10% (Update) o salário de todos os funcionários com mais de 2 dependentes.
    
*/

-- Redefina o salário para testar múltiplas vezes. Comando:

-- UPDATE funcionarios SET salario = 3726.80 WHERE funcionarios.id_funcionario = 2;

-- Primeiro jeito:

UPDATE funcionarios func SET func.salario = func.salario * 1.10

WHERE (SELECT COUNT(depen.id_funcionario) FROM dependentes depen WHERE depen.id_funcionario = func.id_funcionario GROUP BY depen.id_funcionario) > 2;

-- Segundo jeito:

UPDATE funcionarios SET salario = salario * 1.10

WHERE id_funcionario IN (SELECT id_funcionario FROM dependentes GROUP BY id_funcionario HAVING COUNT(id_funcionario) > 2);

/*

	06: Liste todos os dependentes que possuem uma idade maior ou igual a média de idade da empresa.
	
	Campos exigidos: Código, Dependente, Sexo e Idade.
    
*/

-- Poderia ser feita uma subtração dos anos das datas, porém isso faria com que a imprecisão do resultado fosse maior maior do que como está agora.

SELECT depen.id_dependente AS "Código", depen.nome AS "Dependente",
depen.SEXO AS "Sexo", CONCAT(FLOOR(DATEDIFF(CURRENT_DATE(), depen.DATAN) / 365), " anos") AS "Idade"

FROM dependentes depen

WHERE DATEDIFF(CURRENT_DATE(), depen.DATAN) >= (SELECT AVG(DATEDIFF(CURRENT_DATE(), DATAN)) FROM dependentes)

GROUP BY depen.id_dependente;

/*

	07: Liste os departamentos que possuem 2 ou mais funcionários.
	
	Campos exigidos: Código, Descrição e Quantidade de Funcionários.
    
*/

SELECT dep.descritivo AS "Departamento", COUNT(func.id_departamento) AS "Quantidade de Funcionários"

FROM funcionarios func

INNER JOIN departamentos dep ON (dep.id_departamento = func.id_departamento)

GROUP BY func.id_departamento

HAVING COUNT(func.id_departamento) >= 2

ORDER BY dep.id_departamento ASC;