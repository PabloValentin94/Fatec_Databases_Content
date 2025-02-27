-- Selecionar registros:

SELECT * FROM realiza_exames;

-- Apagar registros:

DELETE FROM realiza_exames WHERE id_realizae = 1;

-- Atualizar registros:

UPDATE realiza_exames SET id_paciente = 1 WHERE id_realizae = 2;

-- Selecionar registros com dados aninhados (INNER JOIN):

SELECT atend.id_atendimento AS "Atendimento", DATE_FORMAT(data_a, "%d/%m/%Y") AS "Data de Atendimento", horario_a AS "Hora de Atendimento",
pac.nome AS "Paciente", pac.sexo AS "Sexo do Paciente", med.nome AS "Médico", med.sexo AS "Sexo do Médico"

FROM atendimentos atend

INNER JOIN medicos med ON (atend.id_medico = med.id_medico)
INNER JOIN pacientes pac ON (atend.id_paciente = pac.id_paciente)

ORDER BY atend.data_a ASC, atend.horario_a ASC;