#EXERCÍCIOS COMANDOS DDL E DML

/*Executem todos os comandos SQL para 
criação do banco de dados, sua seleção e a criação
de suas tabelas ANTES de resolver os exercícios.*/

CREATE DATABASE exercicios;
USE exercicios;

#1
/*
a) Altere o campo marca para marca_produto, adicionando NOT NULL
a ele e ao campo preco_produto.

b) Exclua a linha na qual o preço do produto é R$890,00 e adicione 
um novo produto.

c) Adicione uma nova coluna que informará se o produto está
disponível ou indisponível, além de inserir os valores.
*/
CREATE TABLE produtos(
id_produto CHAR(8) PRIMARY KEY,
nome_produto VARCHAR(255) NOT NULL,
marca VARCHAR(255) NULL,
preco_produto DECIMAL(10,2)
);

INSERT INTO produtos (id_produto,nome_produto,marca_produto,preco_produto)
VALUES ("12345678","Processador - Ryzen 5 5600","AMD",850.00),
("02666845","Placa-Mãe - B550M AORUS Elite","Gigabyte",890.00),
("88556496","Memória RAM - Vengeance LPX 16GB (2x8GB) DDR4 3200MHz","Corsair",320.00),
("45888512","Placa de Vídeo (GPU) - GeForce RTX 4060 8GB","MSI",1950.00),
("22012142","Armazenamento (SSD) - NV2 1TB NVMe M.2 (PCIe 4.0)","Kingston",420.00);

#2
/*Dada as seguintes tabelas que relacionam animais com seus respectivos responsáveis,
realize as seguintes alterações em sua estrutura:

a) Altere a tabela animais, excluindo a chave primária (PRIMARY KEY)
e definindo tanto a coluna nome_animal quanto id_animal como PK.

b) Use o comando DESCRIBE na tabela animais e adicione a restrição
na(s) coluna(s) que não estão definidias como NOT NULL.

c)Tanto na tabela animais quando na tabela responsavel, existem alguns
campos fora do padrão de nomenclatura adotado na criação destas tabelas. 
Altere APENAS os nomes destas colunas.
*/
CREATE TABLE animais(
id_animal VARCHAR(11) PRIMARY KEY,
especie_animal VARCHAR(255) NOT NULL,
nome_animal VARCHAR(255),
cor VARCHAR(255) NOT NULL,
peso_animal DECIMAL(7,2)
);

CREATE TABLE responsavel(
cpf VARCHAR(11) PRIMARY KEY,
nome_responsavel VARCHAR(255) NOT NULL,
telefone_responsavel VARCHAR(11) NOT NULL,
dt_nasc VARCHAR(100) NOT NULL,
id_animal_fk VARCHAR(11) NOT NULL,
nome_animal_fk VARCHAR(255) NOT NULL,
FOREIGN KEY (id_animal_fk,nome_animal_fk) 
REFERENCES animais(id_animal,nome_animal)
);

