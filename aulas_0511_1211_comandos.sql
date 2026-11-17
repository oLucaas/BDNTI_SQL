# 05/11/2026
SELECT * FROM enderecos;

-- Selecionar as casas com números 
-- iguais ou maiores que 150;
SELECT * FROM enderecos
WHERE bairro = "Sao Jose" AND estado = "PE"
;

SELECT * FROM enderecos
WHERE bairro = "Sao Jose" AND estado = "PE";

-- OR, AND BETWEEN

#ATIVIDADE
/*
Escolha uma tabela e baseando-se em suas colunas
e dados, pense em algum problema/pergunta
que poderia ser respondida com os dados da tabela
a partir de uma consulta SQL.*/

/*Todos os endereços da região sudeste*/
SELECT * FROM enderecos
WHERE estado = "SP" OR 
estado = "RJ" OR 
estado = "MG" OR 
estado = "ES"
ORDER BY estado;

/*Buscar nome específico na tabela cliente*/
SELECT nome FROM clientes
WHERE nome ="maria";

/*Quais clientes estão pagando mais de
R$500.00 em ordem crescente e o id*/
SELECT preco_total, hospedagem_id
FROM alugueis
WHERE preco_total >= 500
ORDER BY preco_total ASC;

/*Qual o ticket médio das pessoas na
plataforma*/
SELECT * FROM alugueis;
-- AVG( ): média 
SELECT cliente_id, AVG(preco_total) 
AS ticket_medio
FROM alugueis 
GROUP BY cliente_id;

/*Quais dias tem maiores quantidades reservas*/
SELECT cliente_id, AVG(datediff(data_fim,data_inicio)) 
AS media_dias_estadias 
FROM alugueis
GROUP BY cliente_id
ORDER BY media_dias_estadias DESC;


/*Exibir os 10 proprietários com muitas 
propriedades ativas*/
SELECT * FROM proprietarios;
SELECT * FROM hospedagens
WHERE ativo = 1; 
/**/
#
-- Selecionar os nomes dos proprietários
SELECT p.nome AS nome_proprietario
FROM proprietarios p;

-- Contar quantas hospedagens cada proprietário tem
SELECT COUNT(h.hospedagem_id) AS total_hosp_atv
FROM hospedagens h;

-- Juntando as duas consultas
SELECT p.nome AS nome_proprietario,
COUNT(h.hospedagem_id) AS total_hosp_atv
FROM proprietarios p
JOIN hospedagens h 
ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 1
GROUP BY p.nome
ORDER BY total_hosp_atv DESC
LIMIT 10;

SELECT p.nome AS nome_proprietario,
COUNT(h.hospedagem_id) AS total_hosp_atv
FROM hospedagens h
JOIN proprietarios p 
ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 1
GROUP BY p.nome
ORDER BY total_hosp_atv DESC
LIMIT 10;

/*Encontrar as propriedades inativas 
para entender por que 
estão com propriedades sem atividade*/
SELECT p.nome AS nome_proprietario,
COUNT(h.hospedagem_id) AS total_hosp_atv
FROM hospedagens h JOIN proprietarios p 
ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 0
GROUP BY p.nome
ORDER BY total_hosp_atv DESC
LIMIT 10;

/*Consulte os meses com maior e menor demanda
de aluguéis*/
SELECT YEAR(data_inicio) AS ano,
MONTH(data_inicio) AS mes,
COUNT(*) total_alugueis
FROM alugueis
GROUP BY ano, mes
ORDER BY total_alugueis desc;


