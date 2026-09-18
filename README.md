# modelo_fisico_loja_de_pedidos# Modelo Físico — Loja de Pedidos

Projeto de banco de dados relacional desenvolvido em PostgreSQL para representar uma **loja de pedidos**, incluindo cadastro de clientes e produtos, registro de pedidos e seus respectivos itens.

## Sobre o projeto

O script SQL contempla as etapas de criação e manipulação do banco de dados:

- Criação do banco de dados `loja_pedidos`;
- Criação das tabelas `cliente`, `produto`, `pedido` e `item_pedido`;
- Definição de chaves primárias e estrangeiras;
- Cadastro de dados de exemplo;
- Consultas SQL simples;
- Alterações (`UPDATE`) em registros;
- Exclusão (`DELETE`) de um produto de teste.

## 🗂️ Estrutura do banco

### Cliente

Armazena os dados dos clientes.

|    Campo   |      Tipo      |    Descrição    |
|------------|----------------|-----------------|
|  `codigo`  |     `SERIAL`   |  Chave primária |
|   `nome`   |  `VARCHAR(30)` | Nome do cliente |
| `telefone` |  `VARCHAR(11)` |     Telefone    |
|   `email`  | `VARCHAR(100)` |      E-mail     |

### Produto

Armazena os produtos disponíveis.

|       Campo      |       Tipo      |     Descrição     |
|------------------|-----------------|-------------------|
|     `codigo`     |     `SERIAL`    |   Chave primária  |
|      `nome`      |  `VARCHAR(100)` |  Nome do produto  |
|      `preco`     | `NUMERIC(10,2)` |  Preço do produto |
| `unidade_medida` |   `VARCHAR(2)`  | Unidade de medida |

O campo `preco` possui uma restrição para aceitar somente valores maiores que zero.

### Pedido

Registra os pedidos realizados pelos clientes.

|       Campo      |       Tipo      |         Descrição         |
|------------------|-----------------|---------------------------|
|     `codigo`     |     `SERIAL`    |       Chave primária      |
|   `dt_entrada`   |      `DATE`     | Data de entrada do pedido |
|  `dt_embarque`   |      `DATE`     |      Data de embarque     |
|  `valor_total`   | `NUMERIC(10,2)` |   Valor total do pedido   |
|    `desconto`    | `NUMERIC(10,2)` |     Desconto aplicado     |
|      `tipo`      |  `VARCHAR(50)`  |       Tipo do pedido      |
| `codigo_cliente` |    `INTEGER`    |   Referência ao cliente   |

`codigo_cliente` é uma chave estrangeira que referencia `cliente(codigo)`.

### Item do Pedido

Relaciona os pedidos aos produtos e registra a quantidade e o subtotal de cada item.

|      Campo     |       Tipo      |       Descrição       |
|----------------|-----------------|-----------------------|
|  `id_pedidofk` |    `INTEGER`    |  Referência ao pedido |
| `id_produtofk` |    `INTEGER`    | Referência ao produto |
|  `quantidade`  |    `INTEGER`    | Quantidade do produto |
|   `sub_total`  | `NUMERIC(10,2)` |    Subtotal do item   |

A tabela utiliza uma **chave primária composta** por `id_pedidofk` e `id_produtofk`, além de chaves estrangeiras para `pedido` e `produto`.

## Relacionamentos

O modelo possui os seguintes relacionamentos:

- Um **cliente** pode possuir vários **pedidos**.
- Um **pedido** pertence a um **cliente**.
- Um **pedido** pode possuir vários **itens**.
- Um **produto** pode aparecer em vários **itens de pedido**.
- `item_pedido` funciona como tabela associativa entre `pedido` e `produto`.

MER:
<img width="1067" height="636" alt="image" src="https://github.com/user-attachments/assets/3bb03369-007c-46e7-befb-fdafe68c102f" />

## Dados cadastrados

O script inclui dados de exemplo para:

- **5 clientes**;
- **8 produtos**;
- **6 pedidos**;
- **12 itens de pedido**.

Entre os produtos cadastrados estão Arroz, Feijao, Refrigerante, Chocolate, Agua Mineral, Papel Sulfite, Notebook e Caneta.

## Consultas SQL

O projeto apresenta **30 consultas** envolvendo:

- Listagem de clientes, produtos e pedidos;
- Ordenação de registros;
- Busca com `LIKE`;
- Filtros com `WHERE`;
- Verificação de valores `NULL`;
- Uso de `BETWEEN` e `IN`;
- Consultas por datas;
- Contagem de registros com `COUNT`;
- Maior e menor preço com `MAX` e `MIN`;
- Média de preços com `AVG`;
- Soma dos valores dos pedidos com `SUM`.

## Alteração e exclusão de dados

Também são demonstradas operações de manipulação de dados:

### UPDATE

- Alteração do telefone de um cliente;
- Aumento de 10% no preço de um produto;
- Registro da data de embarque de um pedido;
- Alteração do desconto de um pedido;
- Consultas para conferência após as alterações.

### DELETE

É criado um produto de teste (`Produto Teste`), realizada uma consulta para confirmação e, posteriormente, o registro é excluído utilizando sua chave primária.

## Como executar

1. Instale o **PostgreSQL**.
2. Crie ou acesse um banco de dados PostgreSQL.
3. Execute o arquivo SQL deste projeto.
4. O script cria o banco `loja_pedidos` e suas tabelas.
5. Execute as consultas e comandos apresentados no arquivo para visualizar e manipular os dados.

> **Observação:** dependendo da ferramenta utilizada (por exemplo, pgAdmin, DBeaver ou `psql`), a criação do banco e a execução das demais instruções podem precisar ser realizadas em etapas diferentes.

## 📁 Arquivo principal

```text
gustavo_sacomani_rafael_modelo_fisico.sql
```

O arquivo contém todo o script SQL do projeto, desde a criação do banco até as consultas, alterações e exclusões.

## 👥 Autor

- Gustavo Sacomani Rafael

## Tecnologias

- PostgreSQL
