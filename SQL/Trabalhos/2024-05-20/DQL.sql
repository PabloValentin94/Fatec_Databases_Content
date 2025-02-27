-- Consulta - Veículos:

    Select vei.renavam as "Renavam", vei.placa as "Placa", vei.ano as "Ano", pro.nome as "Proprietário" From Veiculo vei JOIN Proprietario pro ON pro.id = vei.fk_proprietario;

-- Consulta - Salas:

    Select Sala.nome AS "Sala", Bloco.descricao AS "Bloco" From Sala JOIN Bloco ON Bloco.id = Sala.fk_bloco;