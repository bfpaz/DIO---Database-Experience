select * from pedido
where status_pedido = 'Em andamento';

select concat(nome, ' ', sobrenome) as Nome, email, telefone from cliente;

select * from pedido
join cliente on pedido.idcliente = cliente.idcliente;

select idpedido, NOME, status_pedido, status_pagamento, status_entrega from pedido
join entrega on identrega = fk_identrega
join pagamento on idpagamento = fk_idpagamento
join cliente on idcliente = fk_idcliente;

select * from pedido;
select * from cliente;
select * from pagamento;
select * from entrega;

