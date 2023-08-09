-- Populando a tabela Cliente OK
INSERT INTO ecommerce.cliente (nome, sobrenome, cpf_cnpj, email, telefone)
VALUES
('João', 'Silva', '12345678901', 'joao@gmail.com', '999999999'),
('Maria', 'Santos', '98765432109', 'maria@gmail.com', '888888888'),
('Pedro', 'Almeida', '65498732105', 'pedro@gmail.com', '777777777'),
('Ana', 'Pereira', '32165498703', 'ana@gmail.com', '666666666'),
('Carlos', 'Oliveira', '98732165400', 'carlos@gmail.com', '555555555');

-- Populando a tabela Pagamento OK
INSERT INTO ecommerce.pagamento (tipo_pagamento, status_pagamento)
VALUES
('AVISTA', 'APROVADO'),
('CARTAO', 'PENDENTE'),
('PIX', 'APROVADO'),
('AVISTA', 'CANCELADO'),
('CARTAO', 'PENDENTE');

-- Populando a tabela Entrega OK
INSERT INTO ecommerce.entrega (cod_rastreio, status_entrega)
VALUES
('ABC123', 'A ENVIAR'),
('DEF456', 'EM ROTA'),
('GHI789', 'ENTREGUE'),
('JKL012', 'A ENVIAR'),
('MNO345', 'CANCELADO');

-- Populando a tabela Pedido OK

INSERT INTO ecommerce.pedido (status_pedido, descricao, fk_idcliente, frete)
VALUES
('Em andamento', 'Pedido de teste 6', 6, 10.5),
('Em andamento', 'Pedido de teste 7', 7, 7.2),
('Em andamento', 'Pedido de teste 8', 8, 15.0),
('Em andamento', 'Pedido de teste 9', 9, 12.3),
('Em andamento', 'Pedido de teste 10', 9, 9.8);

-- Inserção do primeiro pedido
-- Inserir instância na tabela pagamento
INSERT INTO pagamento (tipo_pagamento, status_pagamento) VALUES ('PENDENTE', 'PENDENTE');
SET @idpagamento = LAST_INSERT_ID();

-- Inserir instância na tabela entrega
INSERT INTO entrega (cod_rastreio, status_entrega) VALUES (CONCAT('R', @idpagamento), 'A ENVIAR');
SET @identrega = LAST_INSERT_ID();


-- Inserção do segundo pedido
INSERT INTO pedido (status_pedido, descricao, fk_idcliente, frete, fk_idpagamento, fk_identrega)
VALUES ('Em andamento', 'Pedido 78', 8, 8.50, @idpagamento, @identrega);

-- Inserir instância na tabela pagamento
INSERT INTO pagamento (tipo_pagamento, status_pagamento) VALUES ('PENDENTE', 'PENDENTE');
SET @idpagamento = LAST_INSERT_ID();

-- Inserir instância na tabela entrega
INSERT INTO entrega (cod_rastreio, status_entrega) VALUES (CONCAT('R', @idpagamento), 'A ENVIAR');
SET @identrega = LAST_INSERT_ID();

-- Inserção do terceiro pedido
INSERT INTO pedido (status_pedido, descricao, fk_idcliente, frete, fk_idpagamento, fk_identrega)
VALUES ('Em andamento', 'Pedido 3', 9, 12.00, @idpagamento, @identrega);




-- Populando a tabela Produto OK
INSERT INTO ecommerce.produto (categoria, descricao, valor)
VALUES
('Eletrônicos', 'Smartphone Motorola', 1500.00),
('Eletrodomésticos', 'Geladeira Frost Free', 2500.00),
('Móveis', 'Sofá 3 Lugares', 1200.00),
('Roupas', 'Camiseta Regata', 50.00),
('Acessórios', 'Relógio Seiko', 300.00);

-- Populando a tabela Fornecedor OK
INSERT INTO ecommerce.fornecedor (nome_fantasia, razao_social, cnpj)
VALUES
('Fornecedor A', 'Empresa A LTDA', '12345678901234'),
('Fornecedor B', 'Empresa B LTDA', '98765432109876'),
('Fornecedor C', 'Empresa C LTDA', '65432109876543'),
('Fornecedor D', 'Empresa D LTDA', '32109876543210'),
('Fornecedor E', 'Empresa E LTDA', '09876543210987');

-- Populando a tabela DisponibilizaProduto OK
INSERT INTO ecommerce.disponibiliza_produto (fk_idfornecedor, fk_idproduto)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Populando a tabela Estoque OK
INSERT INTO ecommerce.estoque (local)
VALUES
('Nordeste'),
('Norte'),
('Centro-Oeste'),
('Sudeste'),
('Sul');

-- Populando a tabela Produto_has_Estoque OK
INSERT INTO ecommerce.produto_has_estoque (fk_idproduto, fk_idestoque, quantidade)
VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 8),
(2, 4, 12),
(3, 5, 15),
(3, 1, 10),
(4, 2, 5),
(4, 3, 8),
(5, 4, 12),
(5, 5, 15);

-- Populando a tabela RelacaoProdutoPedido OK
INSERT INTO ecommerce.relacao_produto_pedido (fk_idProduto, fk_idPedido, quantidade)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 7),
(5, 5, 4);

-- Populando a tabela TerceiroVendedor
INSERT INTO ecommerce.terceiro_vendedor (razao_social, cnpj, local)
VALUES
('Vendedor A', '12345678901255', 'São Paulo'),
('Vendedor B', '12345678901266', 'Rio de Janeiro'),
('Vendedor C', '12345678901277', 'Belo Horizonte'),
('Vendedor D', '12345678901288', 'Brasília'),
('Vendedor E', '12345678901299', 'Salvador');

-- Populando a tabela TerceiroVendedor_has_Produto
INSERT INTO ecommerce.terceiro_vendedor_has_produto (fk_idTerceirovendedor, fk_idproduto, quantidade)
VALUES
(1, 1, 3),
(2, 2, 2),
(3, 3, 4),
(4, 4, 1),
(5, 5, 5);

-- Populando a tabela Endereco OK
INSERT INTO ecommerce.endereco (logradouro, bairro, cidade, estado, fk_idcliente)
VALUES
('Rua A', 'Centro', 'São Paulo', 'SP', 1),
('Avenida B', 'Copacabana', 'Rio de Janeiro', 'RJ', 2),
('Rua C', 'Savassi', 'Belo Horizonte', 'MG', 3),
('Rua D', 'Asa Sul', 'Brasília', 'DF', 4),
('Avenida E', 'Barra', 'Salvador', 'BA', 5);