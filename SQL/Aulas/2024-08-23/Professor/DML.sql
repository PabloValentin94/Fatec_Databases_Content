-- Insert nas tabelas

INSERT INTO especialidades (descritivo) 
VALUES 
('Cardiologia'),
('Neurologia'),
('Ortopedia'),
('Dermatologia'),
('Pediatria'),
('Ginecologia'),
('Psiquiatria'),
('Oftalmologia'),
('Endocrinologia'),
('Oncologia');

INSERT INTO medicos (nome, sexo, data_nasc, CRM, id_especialidade) 
VALUES 
('Ana Souza', 'F', '1985-03-22', 123456, 1),  -- Cardiologia
('Carlos Silva', 'M', '1978-11-15', 234567, 2),  -- Neurologia
('Fernanda Lima', 'F', '1990-05-30', 345678, 3),  -- Ortopedia
('Pedro Almeida', 'M', '1982-08-09', 456789, 4),  -- Dermatologia
('Mariana Costa', 'F', '1988-12-01', 567890, 5),  -- Pediatria
('Rodrigo Oliveira', 'M', '1975-07-20', 678901, 6),  -- Ginecologia
('Beatriz Santos', 'F', '1992-02-14', 789012, 7),  -- Psiquiatria
('João Martins', 'M', '1981-09-17', 890123, 8),  -- Oftalmologia
('Luciana Ferreira', 'F', '1987-04-28', 901234, 9),  -- Endocrinologia
('Rafael Correia', 'M', '1983-06-11', 101112, 10),  -- Oncologia
('Gabriela Rocha', 'F', '1986-01-25', 111213, 1),  -- Cardiologia
('Marcelo Teixeira', 'M', '1979-10-04', 121314, 2),  -- Neurologia
('Patrícia Mendes', 'F', '1991-03-07', 131415, 3),  -- Ortopedia
('Renato Carvalho', 'M', '1984-08-19', 141516, 4),  -- Dermatologia
('Tatiana Pereira', 'F', '1989-11-22', 151617, 5),  -- Pediatria
('Felipe Barbosa', 'M', '1980-12-31', 161718, 6),  -- Ginecologia
('Juliana Neves', 'F', '1983-02-10', 171819, 7),  -- Psiquiatria
('Leonardo Farias', 'M', '1977-05-05', 181920, 8),  -- Oftalmologia
('Camila Duarte', 'F', '1985-07-13', 192021, 9),  -- Endocrinologia
('André Ribeiro', 'M', '1990-09-23', 202122, 10);  -- Oncologia


INSERT INTO pacientes (nome, sexo, logradouro, bairro, cidade, estado) 
VALUES 
('João Pereira', 'M', 'Rua das Flores, 123', 'Centro', 'São Paulo', 'SP'),
('Maria Souza', 'F', 'Avenida Brasil, 456', 'Jardim Paulista', 'São Paulo', 'SP'),
('Carlos Silva', 'M', 'Rua dos Pinheiros, 789', 'Vila Mariana', 'São Paulo', 'SP'),
('Ana Oliveira', 'F', 'Rua Santos Dumont, 101', 'Moema', 'São Paulo', 'SP'),
('Pedro Fernandes', 'M', 'Avenida Angélica, 202', 'Higienópolis', 'São Paulo', 'SP'),
('Beatriz Costa', 'F', 'Rua Augusta, 303', 'Consolação', 'São Paulo', 'SP'),
('Fernando Lima', 'M', 'Rua Bela Cintra, 404', 'Jardins', 'São Paulo', 'SP'),
('Luciana Alves', 'F', 'Avenida Paulista, 505', 'Bela Vista', 'São Paulo', 'SP'),
('Rafael Mendes', 'M', 'Rua Haddock Lobo, 606', 'Cerqueira César', 'São Paulo', 'SP'),
('Juliana Rocha', 'F', 'Rua Oscar Freire, 707', 'Jardins', 'São Paulo', 'SP'),
('Rodrigo Martins', 'M', 'Rua Frei Caneca, 808', 'Bela Vista', 'São Paulo', 'SP'),
('Patrícia Lima', 'F', 'Avenida Rebouças, 909', 'Pinheiros', 'São Paulo', 'SP'),
('André Ferreira', 'M', 'Rua da Consolação, 1010', 'Centro', 'São Paulo', 'SP'),
('Camila Santos', 'F', 'Rua 25 de Março, 1111', 'Sé', 'São Paulo', 'SP'),
('Marcelo Nunes', 'M', 'Avenida Ipiranga, 1212', 'República', 'São Paulo', 'SP'),
('Tatiana Moraes', 'F', 'Rua Vergueiro, 1313', 'Liberdade', 'São Paulo', 'SP'),
('Leonardo Duarte', 'M', 'Rua Joaquim Floriano, 1414', 'Itaim Bibi', 'São Paulo', 'SP'),
('Fernanda Ramos', 'F', 'Avenida Faria Lima, 1515', 'Pinheiros', 'São Paulo', 'SP'),
('Gustavo Barbosa', 'M', 'Rua Tabapuã, 1616', 'Itaim Bibi', 'São Paulo', 'SP'),
('Carolina Antunes', 'F', 'Avenida Cidade Jardim, 1717', 'Jardim Europa', 'São Paulo', 'SP');


INSERT INTO atendimentos (data_a, horario_a, id_paciente, id_medico) 
VALUES 
('2024-08-01', '09:00', 1, 1),
('2024-08-02', '10:30', 2, 2),
('2024-08-03', '11:15', 3, 3),
('2024-08-04', '08:45', 4, 4),
('2024-08-05', '14:00', 5, 5),
('2024-08-06', '15:30', 6, 6),
('2024-08-07', '09:45', 7, 7),
('2024-08-08', '10:00', 8, 8),
('2024-08-09', '11:30', 9, 9),
('2024-08-10', '12:00', 10, 10),
('2024-08-11', '13:30', 11, 1),
('2024-08-12', '14:45', 12, 2),
('2024-08-13', '16:00', 13, 3),
('2024-08-14', '08:30', 14, 4),
('2024-08-15', '09:15', 15, 5),
('2024-08-16', '10:00', 16, 6),
('2024-08-17', '11:00', 17, 7),
('2024-08-18', '12:15', 18, 8),
('2024-08-19', '13:00', 19, 9),
('2024-08-20', '14:30', 20, 10),
('2024-08-21', '15:00', 1, 3),
('2024-08-22', '08:00', 2, 4),
('2024-08-23', '09:30', 3, 5),
('2024-08-24', '10:15', 4, 6),
('2024-08-25', '11:45', 5, 7),
('2024-08-26', '12:30', 6, 8),
('2024-08-27', '13:15', 7, 9),
('2024-08-28', '14:45', 8, 10),
('2024-08-29', '15:30', 9, 1),
('2024-08-30', '08:15', 10, 2),
('2024-08-31', '09:00', 11, 3),
('2024-09-01', '10:30', 12, 4),
('2024-09-02', '11:15', 13, 5),
('2024-09-03', '12:00', 14, 6),
('2024-09-04', '13:45', 15, 7),
('2024-09-05', '14:30', 16, 8),
('2024-09-06', '15:15', 17, 9),
('2024-09-07', '08:30', 18, 10),
('2024-09-08', '09:45', 19, 1),
('2024-09-09', '11:00', 20, 2);

INSERT INTO exames (valor, descritivo) 
VALUES 
(150.00, 'Hemograma Completo'),
(200.00, 'Raio-X de Tórax'),
(300.00, 'Ressonância Magnética'),
(250.00, 'Tomografia Computadorizada'),
(80.00, 'Eletrocardiograma'),
(120.00, 'Ultrassonografia'),
(180.00, 'Teste Ergométrico'),
(500.00, 'Endoscopia Digestiva'),
(400.00, 'Colposcopia'),
(350.00, 'Exame de Sangue para Colesterol');


INSERT INTO realiza_exames (data_e, horario_a, id_exame, id_paciente) 
VALUES 
('2024-08-01', '09:00', 1, 1),
('2024-08-02', '10:30', 2, 2),
('2024-08-03', '11:15', 3, 3),
('2024-08-04', '08:45', 4, 4),
('2024-08-05', '14:00', 5, 5),
('2024-08-06', '15:30', 6, 6),
('2024-08-07', '09:45', 7, 7),
('2024-08-08', '10:00', 8, 8),
('2024-08-09', '11:30', 9, 9),
('2024-08-10', '12:00', 10, 10),
('2024-08-11', '13:30', 1, 11),
('2024-08-12', '14:45', 2, 12),
('2024-08-13', '16:00', 3, 13),
('2024-08-14', '08:30', 4, 14),
('2024-08-15', '09:15', 5, 15),
('2024-08-16', '10:00', 6, 16),
('2024-08-17', '11:00', 7, 17),
('2024-08-18', '12:15', 8, 18),
('2024-08-19', '13:00', 9, 19),
('2024-08-20', '14:30', 10, 20),
('2024-08-21', '15:00', 1, 2),
('2024-08-22', '08:00', 2, 3),
('2024-08-23', '09:30', 3, 4),
('2024-08-24', '10:15', 4, 5),
('2024-08-25', '11:45', 5, 6),
('2024-08-26', '12:30', 6, 7),
('2024-08-27', '13:15', 7, 8),
('2024-08-28', '14:45', 8, 9),
('2024-08-29', '15:30', 9, 10),
('2024-08-30', '08:15', 10, 11),
('2024-08-31', '09:00', 1, 12),
('2024-09-01', '10:30', 2, 13),
('2024-09-02', '11:15', 3, 14),
('2024-09-03', '12:00', 4, 15),
('2024-09-04', '13:45', 5, 16),
('2024-09-05', '14:30', 6, 17),
('2024-09-06', '15:15', 7, 18),
('2024-09-07', '08:30', 8, 19),
('2024-09-08', '09:45', 9, 20),
('2024-09-09', '11:00', 10, 1);
