-- Inserções na tabela Usuario. Senhas com mais ou menos de 8 caracteres, geram um erro, devido ao Check.

INSERT INTO Usuario(usu_nome, usu_email, usu_senha) VALUES("Marcos", "marcos@gmail.com", "marquito"),("Doro Pesh", "doro@doro.com", "furimmer");

-- Inserções na tabela Playlist.

INSERT INTO Playlist(play_nome, play_obs, fk_usuario) VALUES("Sextou do Marcos", NULL, 1),("Fear np Evil", "O usuário sabe inglês.", 2);

UPDATE Playlist SET play_usu_nome = (SELECT usu_nome FROM Usuario WHERE Usuario.usu_id = Playlist.fk_usuario);

-- Atualizações na tabela Playlist.

UPDATE Playlist SET play_nome = "Músicas para trabalhar" WHERE play_id = 1;

-- Deleções na tabela Playlist.

DELETE FROM Playlist WHERE play_id = 2;

-- Exibição dos registros das tabelas.

SELECT * FROM Usuario;

SELECT * FROM Playlist;