/*

	03: Liste todas as consultas (Atendimentos) realizadas por médicas (Sexo feminino). Classifique a listagem em ordem alfabética.
    
	Campos exigidos: Código, Nome, Especialidade, Data_Consulta (dd/mm/yyyy) e Paciente.
    
*/

SELECT atend.id_atendimento AS "Numeração da Consulta", DATE_FORMAT(atend.data_a, "%d/%m/%Y") AS "Data da Consulta", TIME_FORMAT(atend.horario_a, "%H:%i:%s") AS "Hora da Consulta",
pac.nome AS "Paciente", med.nome AS "Médica", espec.descritivo AS "Especialidade da Médica"

FROM atendimentos atend

INNER JOIN medicos med ON (med.id_medico = atend.id_medico)
INNER JOIN pacientes pac ON (pac.id_paciente = atend.id_paciente)
INNER JOIN especialidades espec ON (med.id_especialidade = espec.id_especialidade)

WHERE med.sexo = "F"

ORDER BY med.nome ASC;

/*

	04: Liste todos os exames realizados. Classifique a listagem pelo nome do exame em ordem decrescente.
    
	Campos exigidos: Código, Descritivo, Valor (FORMAT(valor,2,"de_DE")), Data_Exame (dd/mm/yyyy) e Paciente.
    
*/

SELECT re_exa.id_realizae AS "Numeração do Exame", exa.descritivo AS "Nome do Exame", DATE_FORMAT(re_exa.data_e, "%d/%m/%Y") AS "Data de Realização do Exame",
TIME_FORMAT(re_exa.horario_a, "%H:%i:%s") AS "Hora de Realização do Exame", FORMAT(exa.valor, 2, "de_DE") AS "Preço do Exame", pac.nome AS "Paciente"

FROM realiza_exames re_exa

INNER JOIN exames exa ON (exa.id_exame = re_exa.id_exame)
INNER JOIN pacientes pac ON (pac.id_paciente = re_exa.id_paciente)

ORDER BY exa.descritivo DESC;

/*

	06: Liste todos os médicos que nunca realizaram nenhuma consulta (Atendimento). Classifique a listagem com base na data de nascimento, em ordem crescente.
    
	Campos exigidos: Código, Nome, Data_Nascimento (dd/mm/yyyy) e Especialidade.
    
*/

SELECT med.id_medico AS "Códido do(a) Médico(a)", med.nome AS "Médico(a)",
DATE_FORMAT(med.data_nasc, "%d/%m/%Y") AS "Data de Nascimento", espec.descritivo AS "Especialidade"

FROM atendimentos atend

RIGHT JOIN medicos med ON (med.id_medico = atend.id_medico)
INNER JOIN especialidades espec ON (espec.id_especialidade = med.id_especialidade)

WHERE atend.id_atendimento IS NULL

ORDER BY med.data_nasc ASC;