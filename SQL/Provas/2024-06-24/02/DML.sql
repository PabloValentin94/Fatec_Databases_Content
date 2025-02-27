-- Inserções na tabela Pedidos.

INSERT INTO Pedidos(ped_vendedor, ped_produto, ped_nome_produto, ped_valor) VALUES(1, 10, "Teclado", 100),(1, 100, "Cooler", 150),(2, 11, "Mouse", 50),(3, 10, "Teclado", 100);

-- Seleções na tabela Pedidos.

SELECT * FROM Pedidos WHERE ped_vendedor = 1;

SELECT * FROM Pedidos WHERE ped_produto = 10;

-- Deleções na tabela Pedidos.

DELETE FROM Pedidos WHERE ped_vendedor = 1;

-- Atualizações na tabela Pedidos.

UPDATE Pedidos SET ped_nome_produto = "Teclado Gamer" WHERE ped_nome_produto = "Teclado";

-- Exibição dos registros da tabela.

SELECT * FROM Pedidos;