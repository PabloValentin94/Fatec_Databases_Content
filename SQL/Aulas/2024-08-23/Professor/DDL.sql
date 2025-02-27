-- Criação das tabela da base de dados

CREATE DATABASE clinica_medica;

USE clinica_medica;

CREATE TABLE especialidades 
(
 id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
 descritivo VARCHAR(80) NOT NULL
);

CREATE TABLE medicos 
(
  id_medico INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  sexo ENUM('F', 'M') NOT NULL,
  data_nasc DATE NOT NULL,
  CRM INT NOT NULL,
  id_especialidade INT,
  FOREIGN KEY (id_especialidade) REFERENCES especialidades(id_especialidade)
);

CREATE TABLE pacientes 
(
  id_paciente INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  sexo ENUM('F', 'M') NOT NULL,
  logradouro VARCHAR(80) NOT NULL,
  bairro VARCHAR(80) NOT NULL,
  cidade VARCHAR(80) NOT NULL,
  estado CHAR(2) NOT NULL
);

CREATE TABLE atendimentos 
(
  id_atendimento INT AUTO_INCREMENT PRIMARY KEY,
  data_a DATE NOT NULL,
  horario_a TIME NOT NULL,
  id_paciente INT,
  id_medico INT,
  FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
  FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
);

CREATE TABLE exames 
(
  id_exame INT AUTO_INCREMENT PRIMARY KEY,
  valor DECIMAL(8,2) NOT NULL,
  descritivo VARCHAR(80) NOT NULL
);

CREATE TABLE realiza_exames 
(
 id_realizae INT AUTO_INCREMENT PRIMARY KEY,
 data_e DATE NOT NULL,
 horario_a TIME NOT NULL,
 id_exame INT,
 id_paciente INT,
 FOREIGN KEY (id_exame) REFERENCES exames(id_exame),
 FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

