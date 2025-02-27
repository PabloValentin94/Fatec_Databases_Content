-- Tabela - Usuário:

    ALTER TABLE Usuario MODIFY senha CHAR(32); -- O MD5, por exemplo, gera uma cadeia de caracteres aleatórios, que sempre mede 32, independente do valor passado.

    ALTER TABLE Usuario DROP COLUMN administrador;

    ALTER TABLE Usuario ADD COLUMN observacoes VARCHAR(255);

    DESC Usuario;

-- Tabela - Livro:

    ALTER TABLE Livro CHANGE nome titulo VARCHAR(255);

    ALTER TABLE Livro ADD COLUMN status BOOL DEFAULT 0; -- Em banco de dados, os booleanos são representados como valores inteiros (0/Falso ou 1/Verdadeiro.);

    -- No MySQL, a palavra "Status" é reservada, o que pode gerar um erro no futuro.

    DESC Livro;

-- Tabela - Veículo:

    INSERT INTO Proprietario(nome, cpf, data_nascimento, sexo, telefone) VALUES("Malu Marina Pereira", "87708539838", "1974-05-08", "Feminino", "14988756871"),("Felipe Benjamin Sales", "39711853809", "1963-02-12", "Masculino", "14987059913");

    INSERT INTO Veiculo(renavam, placa, ano, fk_proprietario) VALUES("52983718736", "CDJ2583", "2011", 1),("25272606788", "CVJ3139", "1992", 2);

    Select * From Veiculo;

-- Tabela - Sala:

    ALTER TABLE Sala MODIFY id INT AUTO_INCREMENT; -- Não é necessário definir como PRIMARY KEY e UNIQUE novamente.

    -- O MySQL não permite que campos que influenciam em chaves estrangeiras, sejam alterados, por isso, a tabela Disciplina foi desconsiderada na criação do banco de dados.

    DESC Sala;

    INSERT INTO Bloco(descricao) VALUES("Bloco I"),("Bloco II");

    INSERT INTO Sala(nome, fk_bloco) VALUES("Laboratório 02", 1),("Laboratório 04", 2);

    Select * From Sala;