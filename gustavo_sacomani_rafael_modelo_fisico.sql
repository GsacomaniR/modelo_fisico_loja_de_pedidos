-- Etapa 1 — Criação do banco de dados
CREATE DATABASE loja_pedidos;

-- Etapa 2 — Conversão do MER para o modelo relacional

-- Tabela Cliente
CREATE TABLE cliente(
	codigo		SERIAL PRIMARY KEY,
	nome		VARCHAR(30) NOT NULL,
	telefone	VARCHAR(11),
	email		VARCHAR(100)
);

-- Tabela Produto
CREATE TABLE produto (
    codigo		SERIAL PRIMARY KEY,
    nome		VARCHAR(100) NOT NULL,
    preco		NUMERIC(10,2) NOT NULL CHECK (preco > 0),
    unidade_medida VARCHAR(2) NOT NULL
);

-- Tabela Pedido
CREATE TABLE pedido (
    codigo SERIAL PRIMARY KEY,
    dt_entrada DATE NOT NULL,
    dt_embarque DATE,
    valor_total NUMERIC(10,2) NOT NULL,
    desconto NUMERIC(10,2),
    tipo VARCHAR(50),
    codigo_cliente INTEGER NOT NULL,

    FOREIGN KEY (codigo_cliente)
    REFERENCES cliente(codigo)
);

-- Tabela Item Pedido
CREATE TABLE item_pedido (
    id_pedidofk INTEGER NOT NULL,
    id_produtofk INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    sub_total NUMERIC(10,2) NOT NULL,

    PRIMARY KEY (id_pedidofk, id_produtofk),

    FOREIGN KEY (id_pedidofk)
    REFERENCES pedido(codigo),

    FOREIGN KEY (id_produtofk)
    REFERENCES produto(codigo)
);

-- Etapa 3 — Cadastro dos dados

-- Cadastro Cliente
INSERT INTO cliente (nome, email, telefone)
VALUES ('Ana Silva', 'ana@email.com', '11999998888');

INSERT INTO cliente (nome, email, telefone)
VALUES ('Bruno Souza', 'bruno@email.com', NULL);

INSERT INTO cliente (nome, email, telefone)
VALUES ('Carlos Pereira', 'carlos@email.com', '11977776666');

INSERT INTO cliente (nome, email, telefone)
VALUES ('Daniela Rocha', 'daniela@email.com', NULL);

INSERT INTO cliente (nome, email, telefone)
VALUES ('Eduardo Lima', 'eduardo@email.com', '11955554444');

-- Cadastro Produto
INSERT INTO produto (nome, unidade_medida, preco)
VALUES ('Arroz', 'KG', 25.90);

INSERT INTO produto (nome, unidade_medida, preco)
VALUES ('Feijao', 'KG', 8.50);

INSERT INTO produto (nome, unidade_medida, preco)
VALUES ('Refrigerante', 'L', 7.99);

INSERT INTO produto (nome, unidade_medida, preco)
VALUES ('Chocolate', 'UN', 6.50);

INSERT INTO produto (nome, unidade_medida, preco)
VALUES ('Agua Mineral', 'L', 2.99);

INSERT INTO produto (nome, unidade_medida, preco)
VALUES ('Papel Sulfite', 'CX', 35.00);

INSERT INTO produto (nome, unidade_medida, preco)
VALUES ('Notebook', 'UN', 3500.00);

INSERT INTO produto (nome, unidade_medida, preco)
VALUES ('Caneta', 'UN', 2.50);

-- Cadastro Pedido

INSERT INTO pedido
(dt_entrada, dt_embarque, valor_total, desconto, tipo, codigo_cliente)
VALUES
('2026-09-01', '2026-09-03', 150.00, 10.00, 'Normal', 1);

INSERT INTO pedido
(dt_entrada, dt_embarque, valor_total, desconto, tipo, codigo_cliente)
VALUES
('2026-09-02', NULL, 520.00, 0.00, 'Urgente', 2);

INSERT INTO pedido
(dt_entrada, dt_embarque, valor_total, desconto, tipo, codigo_cliente)
VALUES
('2026-09-03', '2026-09-04', 95.00, 5.00, 'Normal', 3);

INSERT INTO pedido
(dt_entrada, dt_embarque, valor_total, desconto, tipo, codigo_cliente)
VALUES
('2026-09-04', NULL, 3800.00, 300.00, 'Especial', 4);

INSERT INTO pedido
(dt_entrada, dt_embarque, valor_total, desconto, tipo, codigo_cliente)
VALUES
('2026-09-05', '2026-09-06', 75.00, 0.00, 'Normal', 5);

INSERT INTO pedido
(dt_entrada, dt_embarque, valor_total, desconto, tipo, codigo_cliente)
VALUES
('2026-09-06', NULL, 650.00, 50.00, 'Urgente', 1);

-- Item Pedido

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (1, 1, 2, 51.80);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (1, 3, 5, 39.95);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (2, 6, 4, 140.00);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (2, 4, 10, 65.00);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (3, 2, 5, 42.50);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (3, 5, 8, 23.92);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (4, 7, 1, 3500.00);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (4, 8, 20, 50.00);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (5, 1, 1, 25.90);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (5, 4, 3, 19.50);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (6, 6, 10, 350.00);

INSERT INTO item_pedido
(id_pedidofk, id_produtofk, quantidade, sub_total)
VALUES (6, 1, 5, 129.50);

-- Etapa 4 — Consultas simples

-- 1) Liste todos os clientes
SELECT * FROM cliente;

-- 2) Mostre o nome e o telefone dos clientes
SELECT nome, telefone FROM cliente;

-- 3) Liste os clientes em ordem alfabética
SELECT * FROM cliente ORDER BY nome;

-- 4) Localize os clientes cujo nome começa com A
SELECT * FROM cliente WHERE nome LIKE 'A%';

-- 5) Localize os clientes cujo nome contém Silva
SELECT * FROM cliente WHERE nome LIKE '%Silva%';

-- 6) Mostre os clientes sem telefone cadastrado
SELECT * FROM cliente WHERE telefone IS NULL;

-- 7) Liste todos os produtos
SELECT * FROM produto;

-- 8) Mostre o nome e o preço dos produtos
SELECT nome, preco FROM produto;

-- 9) Liste os produtos em ordem crescente de preço
SELECT * FROM produto ORDER BY preco ASC;

-- 10) Mostre os produtos com preço superior a R$ 50,00
SELECT * FROM produto WHERE preco > 50.00;

-- 11) Mostre os produtos com preço entre R$ 10,00 e R$ 100,00
SELECT * FROM produto WHERE preco BETWEEN 10.00 AND 100.00;

-- 12) Mostre os produtos cuja unidade de medida é UN
SELECT * FROM produto WHERE unidade_medida = 'UN';

-- 13) Mostre os produtos cuja unidade de medida é KG ou L
SELECT * FROM produto WHERE unidade_medida IN ('KG', 'L');

-- 14) Liste todos os pedidos
SELECT * FROM pedido;

-- 15) Mostre os pedidos com desconto maior que zero
SELECT * FROM pedido WHERE desconto > 0;

-- 16) Mostre os pedidos que ainda não foram embarcados
SELECT * FROM pedido WHERE dt_embarque IS NULL;

-- 17) Mostre os pedidos que já foram embarcados
SELECT * FROM pedido WHERE dt_embarque IS NOT NULL;

-- 18) Mostre os pedidos realizados em uma data específica
SELECT * FROM pedido WHERE dt_entrada = '2026-09-01';

-- 19) Mostre os pedidos realizados entre duas datas
SELECT * FROM pedido WHERE dt_entrada BETWEEN '2026-09-01' AND '2026-09-05';

-- 20) Liste os pedidos em ordem decrescente de valor total
SELECT * FROM pedido ORDER BY valor_total DESC;

-- Consulta 21: Mostre os pedidos com valor total superior a R$ 500,00
SELECT * FROM pedido WHERE valor_total > 500.00;

-- 22) Mostre os itens cuja quantidade seja maior que três
SELECT * FROM item_pedido WHERE quantidade > 3;

-- 23) Mostre os itens com subtotal superior a R$ 100,00
SELECT * FROM item_pedido WHERE sub_total > 100.00;

-- 24) Conte quantos clientes estão cadastrados
SELECT COUNT(*) AS total_clientes FROM cliente;

-- 25) Conte quantos produtos estão cadastrados
SELECT COUNT(*) AS total FROM produto;

-- 26) Mostre o maior preço dos produtos
SELECT MAX(preco) AS maior_preco FROM produto;

-- 27) Mostre o menor preço dos produtos
SELECT MIN(preco) AS menor_preco FROM produto;

-- 28) Calcule a média dos preços
SELECT AVG(preco) AS media_precos FROM produto;

-- 29) Calcule a soma dos valores dos pedidos
SELECT SUM(valor_total) AS soma_valores FROM pedido;

-- 30) Conte quantos pedidos ainda não foram embarcados
SELECT COUNT(*) AS pedidos_nao_embarcados FROM pedido WHERE dt_embarque IS NULL;

-- Etapa 5 — Alteração e exclusão de dados

-- 1) Alterar o telefone de um cliente
UPDATE cliente SET telefone = '11988887777' WHERE codigo = 1;

-- 2) Aumente o preço de um produto em 10%
UPDATE produto SET preco = preco * 1.10 WHERE codigo = 1;

-- 3) Registre a data de embarque de um pedido
UPDATE pedido SET dt_embarque = '2026-09-10' WHERE codigo = 2;

-- 4) Altere o desconto de um pedido
UPDATE pedido SET desconto = 15.00 WHERE codigo = 3;

-- 5) Utilize SELECT para conferir os registros antes e depois das alterações

-- 1)
SELECT * FROM cliente WHERE codigo = 1;

-- 2)
SELECT * FROM produto WHERE codigo = 1;

-- 3)
SELECT * FROM pedido WHERE codigo = 2;

-- 4)
SELECT * FROM pedido WHERE codigo = 3;

-- Utilizando DELETE

-- 1) Cadastre um produto de teste que não esteja relacionado a nenhum pedido
INSERT INTO produto (nome, unidade_medida, preco) VALUES ('Produto Teste', 'UN', 9.99);

-- 2) Consulte o produto para confirmar seu cadastro
SELECT * FROM produto WHERE nome = 'Produto Teste';

-- 3) Exclua o produto utilizando sua chave primária
DELETE FROM produto WHERE codigo = 9;

-- 4) Consulte novamente para confirmar a exclusão
SELECT * FROM produto WHERE nome = 'Produto Teste';