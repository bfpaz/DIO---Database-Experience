

select idcliente, nome_cliente, sum(valor) total_gasto from pagamento p
join cliente c on c.idcliente = p.fk_idcliente
group by idcliente
having total_gasto > 200;


select os.idordem_de_servico, s.descricao ,c.nome_cliente, s.valor from os_servicos oss
join servicos s on s.idservico = oss.fk_idservico
join ordem_de_servico os on os.idordem_de_servico = oss.fk_idordem_de_servico
join avaliacao a on a.idavaliacao = os.fk_idavaliacao
join veiculo v on idveiculo = a.fk_idveiculo
join cliente c on c.idcliente = v.fk_idcliente;

select os.idordem_de_servico, c.nome_cliente , p.descricao , op.quantidade, p.valor, p.valor*op.quantidade as total from os_pecas op
join pecas p on p.idpecas = op.fk_idpecas
join ordem_de_servico os on os.idordem_de_servico = op.fk_idordem_de_servico
join avaliacao a on a.idavaliacao = os.fk_idavaliacao
join veiculo v on idveiculo = a.fk_idveiculo
join cliente c on c.idcliente = v.fk_idcliente;


SELECT SUM(P.valor * OSP.quantidade)
    FROM os_pecas OSP
    JOIN pecas P ON OSP.fk_idpecas = P.idpecas
    WHERE OSP.fk_idordem_de_servico = 4;
    
SELECT SUM(S.valor)
    FROM os_servicos OSS
    JOIN servicos S ON OSS.fk_idservico = S.idservico
    WHERE OSS.fk_idordem_de_servico = 4;
    
select * from veiculo;
select * from cliente;
select * from avaliacao;
select * from pecas;
select* from ordem_de_servico;
select * from servicos;
select * from os_servicos;
select * from pagamento;

delete from pagamento
where idpagamento = 5;

update pagamento set valor = 272 where idpagamento = 4;
