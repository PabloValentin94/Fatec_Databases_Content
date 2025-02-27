-- Exemplo 01:

DELIMITER //
DROP TRIGGER IF EXISTS Atualizar_Estoque//
CREATE TRIGGER Atualizar_Perda_Estoque AFTER INSERT ON itens_nfv FOR EACH ROW
BEGIN

    UPDATE produtos SET estoque = estoque - NEW.quantidade WHERE id_produto = NEW.id_produto;

END//
DELIMITER ;

-- Teste:

SELECT * FROM produtos;

INSERT INTO itens_nfv(id_nfv, id_produto, quantidade, venda) VALUES(1, 10, 2, 72.48);

-- Exemplo 02:

DELIMITER //
DROP TRIGGER IF EXISTS Atualizar_Ganho_Estoque//
CREATE TRIGGER Atualizar_Ganho_Estoque AFTER DELETE ON itens_nfv FOR EACH ROW
BEGIN

    UPDATE produtos SET estoque = estoque + OLD.quantidade WHERE id_produto = OLD.id_produto;

END//
DELIMITER ;

-- Teste:

SELECT * FROM itens_nfv;

SELECT * FROM produtos;

DELETE FROM itens_nfv WHERE id_nfv = 1 AND id_produto = 1;

-- Exemplo 03:

DELIMITER //
DROP TRIGGER IF EXISTS Verificar_Itens_Nota_Fiscal//
CREATE TRIGGER Verificar_Itens_Nota_Fiscal BEFORE DELETE ON nf_vendas FOR EACH ROW
BEGIN

    IF (OLD.id_nfv IN (SELECT DISTINCT(id_nfv) FROM itens_nfv)) THEN
    
        DELETE FROM itens_nfv WHERE id_nfv = OLD.id_nfv;
    
    END IF;

END//
DELIMITER ;

-- Teste:

SELECT * FROM itens_nfv ORDER BY id_nfv ASC;

SELECT * FROM nf_vendas;

DELETE FROM nf_vendas WHERE id_nfv = 1;

-- Exemplo 04:

DELIMITER //
DROP TRIGGER IF EXISTS Aplicar_Desconto_Aniversario//
CREATE TRIGGER Aplicar_Desconto_Aniversario BEFORE INSERT ON nf_vendas FOR EACH ROW
BEGIN

    IF (MONTH(NEW.emissao) = (SELECT MONTH(datan) FROM clientes WHERE id_cliente = NEW.id_cliente)) THEN
    
        SET NEW.valor = NEW.valor * 0.8; -- Desconto de 20%.
    
    END IF;

END//
DELIMITER ;

-- Teste:

SELECT * FROM nf_vendas;

INSERT INTO nf_vendas(emissao, valor, id_fp, id_vendedor, id_cliente) VALUES(CURRENT_DATE, 500.00 , 1, 1, 5);

INSERT INTO nf_vendas(emissao, valor, id_fp, id_vendedor, id_cliente) VALUES("2024-04-21", 500.00 , 1, 1, 1);

-- Exemplo 05:

DELIMITER //
DROP TRIGGER IF EXISTS Buscar_Preco_Venda_Produto//
CREATE TRIGGER Buscar_Preco_Venda_Produto BEFORE INSERT ON itens_nfv FOR EACH ROW
BEGIN

    if (NEW.id_produto IN (SELECT id_produto FROM produtos)) THEN
    
        SET NEW.venda = (SELECT venda FROM produtos WHERE id_produto = NEW.id_produto);
    
    END IF;

END//
DELIMITER ;

-- Teste:

SELECT * FROM produtos;

SELECT * FROM itens_nfv ORDER BY id_nfv ASC;

INSERT INTO itens_nfv(id_nfv, id_produto, quantidade) VALUES(6, 10, 1);