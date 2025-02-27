/*

	01: Calcule o número de alunas (Sexo feminino) em cada curso. Classifique a listagem em ordem alfabética.
	
	01.1: Exiba os cursos que possuam 6 ou mais alunas.
    
*/

-- 01:

SELECT cur.id_curso AS "Código", cur.descritivo AS "Curso", COUNT(cur.id_curso) AS "Quantidade de Alunas"

FROM alunos alu

INNER JOIN cursos cur ON (cur.id_curso = alu.id_curso)

WHERE alu.sexo = "F"

GROUP BY cur.id_curso

ORDER BY cur.descritivo ASC;

-- 01.1:

SELECT cur.id_curso AS "Código", cur.descritivo AS "Curso", COUNT(cur.id_curso) AS "Quantidade_Alunas"

FROM alunos alu

INNER JOIN cursos cur ON (cur.id_curso = alu.id_curso)

WHERE alu.sexo = "F"

GROUP BY cur.id_curso

HAVING Quantidade_Alunas >= 6 -- Utilização de Alias.

ORDER BY cur.descritivo ASC;

/*

	02: Calcule o número de disciplinas ministradas por cada professor. Classifique a listagem em ordem alfabética.
    
*/

SELECT prof.id_professor AS "Código", prof.nome AS "Professor(a)", cur.descritivo AS "Curso", COUNT(disc.descritivo) AS "Disciplinas Ministradas"

FROM disciplinas disc

INNER JOIN professores prof ON (prof.id_professor = disc.id_professor)
INNER JOIN cursos cur ON (cur.id_curso = prof.id_curso)

GROUP BY prof.id_professor

ORDER BY prof.nome ASC;

/*

	03: Calcule o número de alunos matriculados em cada disciplina. Classifique a listagem com base no ID da disciplina, em ordem crescente.
    
*/

SELECT disc.id_disciplina AS "Código", disc.descritivo AS "Disciplina", cur.descritivo AS "Curso", COUNT(mat.id_aluno) AS "Alunos Matriculados"

FROM matriculas mat

INNER JOIN disciplinas disc ON (disc.id_disciplina = mat.id_disciplina)
INNER JOIN cursos cur ON (cur.id_curso = disc.id_curso)

GROUP BY mat.id_disciplina

ORDER BY disc.id_disciplina ASC;

/*

	04: Calcule a mensalidade que cada aluno paga pelas disciplinas cursadas. Classifique a listagem com base no nome do aluno, em ordem crescente.
    
*/

SELECT alu.id_aluno AS "Código", alu.nome AS "Aluno(a)", cur.descritivo AS "Curso",
COUNT(mat.id_disciplina) AS "Disciplinas Cursadas", CONCAT("R$", FORMAT(SUM(disc.valor), 2, "de_DE")) AS "Mensalidade"

FROM matriculas mat

INNER JOIN disciplinas disc ON (disc.id_disciplina = mat.id_disciplina)
INNER JOIN alunos alu ON (alu.id_aluno = mat.id_aluno)
INNER JOIN cursos cur ON (cur.id_curso = alu.id_curso)

GROUP BY mat.id_aluno

ORDER BY alu.nome ASC;

/*

	05: Calcule a média das notas de todas as disciplinas, com base em seus respectivos cursos. Classifique a listagem em ordem decrescente.
    
*/

SELECT cur.id_curso AS "Código", cur.descritivo AS "Curso", FORMAT(AVG(mat.media_final), 2, "de_DE") AS "Média de Notas"

FROM matriculas mat

INNER JOIN disciplinas disc ON (disc.id_disciplina = mat.id_disciplina)
INNER JOIN cursos cur ON (cur.id_curso = disc.id_curso)

GROUP BY cur.id_curso

ORDER BY AVG(mat.media_final) DESC;