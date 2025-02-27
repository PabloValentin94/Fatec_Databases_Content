-- 01:

SELECT nfv.id_nfv AS "Código - Nota Fiscal", DATE_FORMAT(nfv.emissao, "%d/%m/%Y") AS "Emissão - Nota Fiscal",
vend.nome AS "Vendedor(a)", cli.nome AS "Cliente", prod.id_produto AS "Código - Produto", prod.descritivo AS "Produto",
i_nfv.quantidade AS "Quantidade", CONCAT("R$", FORMAT(prod.venda, 2, "de_DE")) AS "Preço", cat.descritivo AS "Categoria"

FROM itens_nfv i_nfv

INNER JOIN nf_vendas nfv ON (nfv.id_nfv = i_nfv.id_nfv)
INNER JOIN vendedores vend ON (vend.id_vendedor = nfv.id_vendedor)
INNER JOIN clientes cli ON (cli.id_cliente = nfv.id_cliente)
INNER JOIN produtos prod ON (prod.id_produto = i_nfv.id_produto)
INNER JOIN categorias cat ON (cat.id_categoria = prod.id_categoria)

WHERE cat.id_categoria IN (1,2,3)

ORDER BY nfv.emissao DESC;

-- 02:

SELECT cat.id_categoria AS "Código", cat.descritivo AS "Categoria", COUNT(prod.id_categoria) AS "Quantidade de Produtos"

FROM produtos prod

INNER JOIN categorias cat ON (cat.id_categoria = prod.id_categoria)

GROUP BY prod.id_categoria

HAVING COUNT(prod.id_categoria) > 3

ORDER BY cat.descritivo ASC;

-- 03:

ALTER TABLE vendedores ADD COLUMN sexo ENUM("M", "F") DEFAULT "M"; -- Adiciona uma nova coluna.

INSERT INTO vendedores(nome, comissao, salario_fixo) VALUES("Cida", 15, 1200); -- Cadastra uma nova vendedora.

UPDATE vendedores SET sexo = "F" WHERE vendedores.nome = "Cida" OR vendedores.id_vendedor IN (1,4); -- Muda o valor da coluna "sexo" para as vendedoras.

SELECT vend.id_vendedor AS "Código", vend.nome AS "Vendedora", CONCAT(vend.comissao, "%") AS "Percentual de Comissão",
CONCAT("R$", FORMAT(vend.salario_fixo, 2, "de_DE")) AS "Salário"

FROM nf_vendas nfv

RIGHT JOIN vendedores vend ON (vend.id_vendedor = nfv.id_vendedor)

WHERE vend.sexo = "F" AND nfv.id_nfv IS NULL

ORDER BY vend.nome ASC;

-- Observação: Podem aparecer nomes duplicados, pois não há nenhum tipo de agrupamento.

-- 04:

CREATE OR REPLACE VIEW lucros_vendedores AS

SELECT vend.id_vendedor AS "Código", vend.nome AS "Vendedor", COUNT(nfv.id_vendedor) AS "Quantidade de Produtos Vendidos",
CONCAT("R$", FORMAT(SUM(i_nfv.venda), 2, "de_DE")) AS "Lucro Gerado pelo Vendedor",
(SELECT CONCAT("R$", FORMAT(SUM(venda), 2, "de_DE")) FROM itens_nfv) AS "Lucro Geral da Empresa",
CONCAT(FORMAT((SUM(i_nfv.venda) / (SELECT SUM(venda) FROM itens_nfv)) * 100, 2, "de_DE"), "%") AS "Percentual de Lucro do Vendedor"

FROM itens_nfv i_nfv

INNER JOIN nf_vendas nfv ON (nfv.id_nfv = i_nfv.id_nfv)
INNER JOIN vendedores vend ON (vend.id_vendedor = nfv.id_vendedor)

WHERE vend.sexo = "M"

GROUP BY nfv.id_vendedor

ORDER BY SUM(i_nfv.venda) DESC;

SELECT * FROM lucros_vendedores;

-- 05:

UPDATE itens_nfv SET quantidade = 2, venda = (SELECT venda FROM produtos WHERE id_produto = 6) * 2 WHERE id_produto = 6; -- Aumentando o valor total de um item de venda para se adequar com a condição proposta.

UPDATE vendedores SET comissao = comissao + 2 WHERE id_vendedor IN (

	SELECT vend.id_vendedor

	FROM itens_nfv i_nfv

	INNER JOIN nf_vendas nfv ON (nfv.id_nfv = i_nfv.id_nfv)
	INNER JOIN vendedores vend ON (vend.id_vendedor = nfv.id_vendedor)

	GROUP BY nfv.id_vendedor
	
	HAVING SUM(i_nfv.venda) >= 7000
	
);

SELECT vend.id_vendedor AS "Código", vend.nome AS "Vendedor(a)", CONCAT(vend.comissao, "%") AS "Percentual de Comissão"

FROM vendedores vend

ORDER BY vend.nome ASC;