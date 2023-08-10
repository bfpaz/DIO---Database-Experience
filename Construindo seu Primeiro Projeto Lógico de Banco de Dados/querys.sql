select * from pedido
where status_pedido = 'Em andamento';

select concat(nome, ' ', sobrenome) as Nome, email, telefone from cliente;

select * from pedido
join cliente on pedido.idcliente = cliente.idcliente;

select idpedido, NOME, status_pedido, status_pagamento, status_entrega from pedido
join entrega on identrega = fk_identrega
join pagamento on idpagamento = fk_idpagamento
join cliente on idcliente = fk_idcliente;


select p.idpedido, concat(c.nome,' ', c.sobrenome) as 'Nome Completo' , pp.quantidade, pr.descricao from pedido_has_produto pp
join pedido p on p.idpedido = pp.fk_idPedido
join cliente c on c.idcliente = p.fk_idcliente
join produto pr on pr.idproduto = pp.fk_idProduto;


select idproduto, categoria, descricao, quantidade, valor, (quantidade*valor) as valor_total, local from produto_has_estoque
join produto on idproduto = fk_idproduto
join estoque on idestoque = fk_idestoque
order by valor_total;


select sum(quantidade*valor) as valor_total, local from produto_has_estoque
join produto on idproduto = fk_idproduto
join estoque on idestoque = fk_idestoque
group by idestoque
having valor_total <= 10000;


