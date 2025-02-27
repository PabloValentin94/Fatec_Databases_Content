-- Exemplo 01:

DELIMITER // -- Altera o delimitador do SGBD (O delimitador padrão geralmente é o ponto e vírgula.).

DROP PROCEDURE IF EXISTS procedure_list_clients// -- Excluindo a procedure, caso ela já exista.

CREATE PROCEDURE procedure_list_clients(IN codigo INT) -- Criando a procedure.

BEGIN -- Iniciando o código da procedure.

    IF (codigo IS NULL) THEN
    
	SELECT * FROM clientes;
    
    ELSE
    
	IF (codigo IN (SELECT id_cliente FROM clientes)) THEN
	
	    SELECT * FROM clientes WHERE id_cliente = codigo;
	    
	ELSE
	
	    SELECT CONCAT("O código ", codigo, " não existe!") AS "Retorno";
	
	END IF;
	
    END IF;

END// -- Encerrando o código da procedure.

DELIMITER ; -- Redefine o delimitador do SGBD.

-- Testes.

CALL procedure_list_clients(NULL);

CALL procedure_list_clients(1);

CALL procedure_list_clients("");

-- Exemplo 02:

DELIMITER //

DROP PROCEDURE IF EXISTS procedure_display_screen//

CREATE PROCEDURE procedure_display_screen(IN tipo INT)

BEGIN

    IF (tipo IN (1,2)) THEN
    
	IF (tipo = 1) THEN
	
	    SELECT prod.id_produto AS "Código", prod.descritivo AS "Produto", CONCAT("R$", FORMAT(prod.custo, 2, "de_DE")) AS "Preço de Custo", 
	    CONCAT("R$", FORMAT(prod.venda, 2, "de_DE")) AS "Preço de Venda", cat.descritivo AS "Categoria"
	    
	    FROM produtos prod
	    
	    INNER JOIN categorias cat ON (cat.id_categoria = prod.id_produto);
	
	ELSE
	
	    SELECT descritivo AS "Produto", CONCAT("R$", FORMAT(venda, 2, "de_DE")) AS "Preço" FROM produtos;
	
	END IF;
    
    ELSE
    
	SELECT "Informe uma opção válida!" AS "Retorno";
    
    END IF;

END//

DELIMITER ;

-- Testes.

CALL procedure_display_screen(NULL);

CALL procedure_display_screen("");

CALL procedure_display_screen(5);

CALL procedure_display_screen(1);

CALL procedure_display_screen(2);