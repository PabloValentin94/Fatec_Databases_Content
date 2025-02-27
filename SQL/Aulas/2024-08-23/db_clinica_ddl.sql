CREATE DATABASE db_clinica;

USE db_clinica;

CREATE TABLE Endereco(

    id INT AUTO_INCREMENT PRIMARY KEY,
    estado CHAR(2) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    logradouro VARCHAR(255)

);

CREATE TABLE Paciente(

    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sexo ENUM("Masculino", "Feminino", "Outro") NOT NULL,
    data_nascimento DATE NOT NULL,
    
    fk_endereco INT NOT NULL,
    CONSTRAINT fk_endereco_paciente FOREIGN KEY(fk_endereco) REFERENCES Endereco(id)

);

CREATE TABLE Especializacao(

    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL

);

CREATE TABLE Medico (

    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sexo ENUM("Masculino", "Feminino", "Outro") NOT NULL,
    data_nascimento DATE NOT NULL,
    crm VARCHAR(15) NOT NULL,
    
    fk_especializacao INT NOT NULL,
    CONSTRAINT fk_especializacao_medico FOREIGN KEY(fk_especializacao) REFERENCES Especializacao(id)

);

CREATE TABLE Atendimento (

    id INT AUTO_INCREMENT PRIMARY KEY,
    data_ocorrencia DATE NOT NULL DEFAULT CURRENT_DATE,
    hora_ocorrencia TIME NOT NULL DEFAULT CURRENT_TIME,
    
    fk_paciente INT NOT NULL,
    CONSTRAINT fk_paciente_atendimento FOREIGN KEY(fk_paciente) REFERENCES Paciente(id),
    
    fk_medico INT NOT NULL,
    CONSTRAINT fk_medico_atendimento FOREIGN KEY(fk_medico) REFERENCES Medico(id)

);

CREATE TABLE Exame(

    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    preco DOUBLE NOT NULL

);

CREATE TABLE Paciente_Exame_Assoc(

    id INT AUTO_INCREMENT PRIMARY KEY,
    data_ocorrencia DATE NOT NULL DEFAULT CURRENT_DATE,
    hora_ocorrencia TIME NOT NULL DEFAULT CURRENT_TIME,
    
    fk_paciente INT NOT NULL,
    CONSTRAINT fk_paciente_exame_assoc FOREIGN KEY(fk_paciente) REFERENCES Paciente(id),
    
    fk_exame INT NOT NULL,
    CONSTRAINT fk_exame_paciente_assoc FOREIGN KEY(fk_exame) REFERENCES Exame(id)

);