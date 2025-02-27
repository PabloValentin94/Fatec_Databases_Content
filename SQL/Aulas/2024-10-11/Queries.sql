/*

	01: Liste todos os produtos com suas respectivas categorias. Classifique a listagem pelo preço do produto.
	
	Campos exigidos: Código, Nome, Preço de Venda e Categoria.
    
*/

SELECT prod.id_produto AS "Código", prod.descritivo AS "Produto", prod.venda AS "Preço de Venda",
cat.descritivo AS "Categoria"

FROM Produtos prod

INNER JOIN categorias cat ON (cat.id_categoria = prod.id_categoria)

ORDER BY prod.venda DESC;

/*

	02: Liste todos os produtos que não tiveram nenhum venda.
	
	Campos exigidos: Código, Nome e Categoria.
    
*/

SELECT prod.id_produto AS "Código", prod.descritivo AS "Produto", cat.descritivo AS "Categoria"

FROM itens_nfv i_nfv

RIGHT JOIN produtos prod ON (prod.id_produto = i_nfv.id_produto)
INNER JOIN categorias cat ON (cat.id_categoria = prod.id_categoria)

WHERE i_nfv.id_produto IS NULL;

/*

	03: Liste todos os produtos cujo estoque esteja abaixo de 100 unidades e o preço de venda entre R$200,00 e R$300,00. Classifique a listagem pelo nome do produto.
	
	Campos exigidos: Código, Nome, Preço de Venda, Estoque e Categoria.
    
*/

SELECT prod.id_produto AS "Código", prod.descritivo AS "Produto", prod.venda AS "Preço de Venda",
prod.estoque AS "Estoque", cat.descritivo AS "Categoria"

FROM produtos prod

INNER JOIN categorias cat ON (cat.id_categoria = prod.id_categoria)

WHERE prod.estoque < 100 AND prod.venda BETWEEN 200.00 AND 300.00

ORDER BY prod.descritivo ASC;

/*

	04: Transforme a Query do exercício 02 em uma View.
    
*/

CREATE OR REPLACE VIEW view_produtos_nao_vendidos AS

SELECT prod.id_produto AS "Código", prod.descritivo AS "Produto", cat.descritivo AS "Categoria"

FROM itens_nfv i_nfv

RIGHT JOIN produtos prod ON (prod.id_produto = i_nfv.id_produto)
INNER JOIN categorias cat ON (cat.id_categoria = prod.id_categoria)

WHERE i_nfv.id_produto IS NULL;

SELECT * FROM view_produtos_nao_vendidos;

/*

	05: Liste todas as notas fiscais de vendas. Classifique pela data de emissão da nota fiscal.
    
    Campos exigidos: Número, Data de Emissão, Valor, Vendedor e Cliente.
    
*/

SELECT nfv.id_nfv AS "Número", DATE_FORMAT(nfv.emissao, "%d/%m/%Y") AS "Data de Emissão",
CONCAT("R$", FORMAT(nfv.valor, 2, "de_DE")) AS "Valor", vend.nome AS "Vendedor", cli.nome AS "Cliente"

FROM nf_vendas nfv

INNER JOIN vendedores vend ON (vend.id_vendedor = nfv.id_vendedor)
INNER JOIN clientes cli ON (cli.id_cliente = nfv.id_cliente)

ORDER BY nfv.emissao DESC;

/*

	06: Transforme a Query do exercício 03 em uma View.
    
*/

CREATE OR REPLACE VIEW produtos_baratos_acabando AS

SELECT prod.id_produto AS "Código", prod.descritivo AS "Produto", prod.venda AS "Preço de Venda",
prod.estoque AS "Estoque", cat.descritivo AS "Categoria"

FROM produtos prod

INNER JOIN categorias cat ON (cat.id_categoria = prod.id_categoria)

WHERE prod.estoque < 100 AND prod.venda BETWEEN 200.00 AND 300.00

ORDER BY prod.descritivo ASC;

SELECT * FROM produtos_baratos_acabando;

/*

	07: Liste o total vendido por cada vendedor.
	
	Campos exigidos: Código, Nome e Total Vendido.
    
*/

SELECT vend.id_vendedor AS "Código", vend.nome AS "Vendedor",
SUM(i_nfv.quantidade) AS "Quantidade Total Vendida"

FROM itens_nfv i_nfv

INNER JOIN nf_vendas nfv ON (nfv.id_nfv = i_nfv.id_nfv)
INNER JOIN vendedores vend ON (vend.id_vendedor = nfv.id_vendedor)

GROUP BY vend.id_vendedor

ORDER BY vend.nome ASC;

/*

	08: Liste todos os produtos vendidos. Classifique pelo nome do produto.
	
	Campos exigidos: Código, Nome, Quantidade Total Vendida e Preço de Venda.
    
*/

SELECT prod.id_produto AS "Código", prod.descritivo AS "Produto",
SUM(i_nfv.quantidade) AS "Quantidade Total Vendida", prod.venda AS "Preço de Venda"

FROM itens_nfv i_nfv

INNER JOIN Produtos prod ON (prod.id_produto = i_nfv.id_produto)

GROUP BY i_nfv.id_produto

ORDER BY prod.descritivo ASC;

/*

	09: Liste a quantidade total vendida de cada produto. Exiba somente aqueles que tiverem mais de 2 unidades vendidas.
	
	Campos exigidos: Código, Nome e Quantidade Total Vendida.
    
*/

SELECT prod.id_produto AS "Código", prod.descritivo as "Produto", SUM(i_nfv.quantidade) AS "Quantidade Total Vendida"

FROM itens_nfv i_nfv

INNER JOIN produtos prod ON (prod.id_produto = i_nfv.id_produto)

GROUP BY i_nfv.id_produto

HAVING SUM(i_nfv.quantidade) > 2

ORDER By prod.descritivo ASC;

/*

	10: Calcule o valor de comissão a ser recebido por cada vendedor, com base no lucro bruto obtido por cada um.
    
    Fórmula: Valor_a_Receber = salario_fixo + (comissão/100*total vendido).
	
	Campos exigidos: Código, Nome, Percentual de Comissão, Salário, Lucro Gerado, Valor da Comissão e Ganho Total.
    
*/

SELECT vend.id_vendedor AS "Código", vend.nome AS "Vendedor", CONCAT("R$", FORMAT(vend.salario_fixo, 2, "de_DE")) AS "Salário",
CONCAT("R$", FORMAT(SUM(nfv.valor), 2, "de_DE")) AS "Lucro Gerado", CONCAT(vend.comissao, "%") AS "Percentual de Comissão",
CONCAT("R$", FORMAT((SUM(nfv.valor) * (vend.comissao / 100)), 2, "de_DE")) AS "Comissão",
CONCAT("R$", FORMAT(vend.salario_fixo + (SUM(nfv.valor) * (vend.comissao / 100)), 2, "de_DE")) AS "Ganho Total"

FROM nf_vendas nfv

INNER JOIN vendedores vend ON (vend.id_vendedor = nfv.id_vendedor)

GROUP BY nfv.id_vendedor

ORDER BY vend.nome ASC;

/*

	11: Liste todos os vendedores que tiverem sua média de lucro maior do que a média de lucro geral da empresa.
	
	Campos exigidos: Código, Nome e Média de Lucro.
    
*/

SELECT vend.id_vendedor AS "Código", vend.nome AS "Vendedor",
CONCAT("R$", FORMAT(AVG(nfv.valor), 2, "de_DE")) AS "Média de Lucro do Vendedor",
CONCAT("R$", FORMAT((SELECT AVG(valor) FROM nf_vendas), 2, "de_DE")) AS "Média de Lucro Geral"

FROM nf_vendas nfv

INNER JOIN vendedores vend ON (vend.id_vendedor = nfv.id_vendedor)

GROUP BY nfv.id_vendedor

HAVING AVG(nfv.valor) > (SELECT AVG(valor) FROM nf_vendas)

ORDER BY vend.nome ASC;

/*

	12: Liste todos os produtos cujo preço de venda é maior do que o preço médio de venda dos produtos da empresa.
	
	Campos exigidos: Código, Nome, Preço de Venda e Categoria.
    
*/

SELECT prod.id_produto AS "Código", prod.descritivo AS "Produto", CONCAT("R$", FORMAT(prod.venda, 2, "de_DE")) AS "Preço de Venda",
CONCAT("R$", FORMAT((SELECT AVG(venda) FROM produtos), 2, "de_DE")) AS "Preço Médio Geral"

FROM produtos prod

WHERE prod.venda > (SELECT AVG(venda) FROM produtos)

ORDER BY prod.descritivo ASC;

/*

	13: Atualize o preço de todos os produtos que nunca foram vendidos com um desconto de 20%.
    
*/

UPDATE produtos SET venda = venda * 0.8 WHERE id_produto IN (
    SELECT prod.id_produto
    
    FROM itens_nfv i_nfv
    
    RIGHT JOIN produtos prod ON (prod.id_produto = i_nfv.id_produto)
    
    WHERE i_nfv.id_produto IS NULL
);