-- Clínica Médica:

/*

	02: Liste quantos atendimentos foram realizados na clínica.
    
*/

SELECT COUNT(atend.id_atendimento) AS "Atendimentos Realizados" FROM atendimentos atend;

/*

	03: Liste a média das idades de todos os médicos.
    
*/

SELECT FLOOR(AVG(TIMESTAMPDIFF(YEAR, med.data_nasc, CURRENT_DATE()))) AS "Média de Idade dos(as) Médicos(as)" FROM medicos med;

/*

	04: Liste a média dos preços dos exames cadastrados.
    
*/

SELECT CONCAT("R$", FORMAT(AVG(exa.valor), 2, "de_DE")) AS "Média de Preço dos Exames" FROM exames exa;

/*

	05: Liste a receita da clínica, obtida com os atendimentos, considerando o valor médio de uma consulta sendo R$250,00.
    
*/

SELECT CONCAT("R$", FORMAT((COUNT(atend.id_atendimento) * 250.00), 2, "de_DE")) AS "Receita - Atendimentos" FROM atendimentos atend;

/*

	06: Liste o exame mais caro e o mais barato.
    
*/

SELECT MAX(exa.valor) AS "Preço do Exame Mais Caro", MIN(exa.valor) "Preço do Exame Mais Barato" FROM exames exa ORDER BY exa.valor DESC;

-- Faculdade:

/*

	01: Liste a quantidade de alunos (Sexo masculino) presentes na faculdade.
    
*/

SELECT COUNT(alu.id_aluno) AS "Quantidade de Alunos na Faculdade" FROM alunos alu WHERE alu.sexo = "M";

/*

	02: Calcule a receita da faculdade.
    
*/

SELECT CONCAT("R$", FORMAT(SUM(disc.valor), 2, "de_DE")) AS "Receita da Faculdade"

FROM matriculas mat

INNER JOIN alunos alu ON (alu.id_aluno = mat.id_aluno)
INNER JOIN disciplinas disc ON (mat.id_disciplina = disc.id_disciplina)
INNER JOIN cursos cur ON (cur.id_curso = disc.id_curso);

/*

	03: Calcule a receita individual dos cursos da faculdade.
    
*/

SELECT cur.id_curso AS "Código", cur.descritivo AS "Curso", CONCAT("R$", FORMAT(SUM(disc.valor), 2, "de_DE")) AS "Receita do Curso"

FROM matriculas mat

INNER JOIN alunos alu ON (alu.id_aluno = mat.id_aluno)
INNER JOIN disciplinas disc ON (mat.id_disciplina = disc.id_disciplina)
INNER JOIN cursos cur ON (cur.id_curso = disc.id_curso)

GROUP BY cur.id_curso

ORDER BY SUM(disc.valor) DESC;