insert into cliente (nome_cliente, telefone_cliente, email_cliente) 
values
	( 'Bruno Silva','81988880000','bf_silva@hotmail.com'),
	( 'João Silva','81988880000','joao.silva@hotmail.com'),
	( 'Maria Helena','8199996666','maria.h123@hotmail.com'),
	( 'Roberto Marques','8199997777','rmarques.rm@hotmail.com'),
	( 'Andreza Lima','8188205555','al.andreza@hotmail.com'),
	( 'Victor Paz','8199966665','paz.victor@hotmail.com'),
	( 'Ystevão Peres','8188885555','ystevao_psilva@hotmail.com'),
	( 'José Silva','8188995555','jose.silva@hotmail.com'),
	( 'Marina Silva','8199999999','marina.silva@hotmail.com'),
	( 'Maria Heloísa','8199995777','mh.paz@hotmail.com');
	
insert into veiculo (marca, Sdelo, ano, categoria, placa, fk_idcliente) 
values
	('VW','GOL','2010','HATCH','MNR2K85',1),
	('RENAULT','SANDERO','2019','HATCH','PCR2K75',2),
	('GM','Celta','2010','HATCH','KKT3S14',7),
	('VW','GOL','2015','HATCH','RRR2R85',3),
	('VW','VIRTUS','2019','SEDÃ','KKK3K25',4),
	('FORD','FIESTA','2008','HATCH','DDD2D85',5),
	('VW','VOYAGE','2021','SEDÃ','SSS2S25',6),
	('PEUGEOT','208','2022','HATCH','MKK2H85',8),
	('FIAT','GOL','2008','HATCH','LLL2L85',9),
	('GM','S10','2020','PICKUP','MMM2J85',10);
	
insert into equipe (especialidade)
values
    ('Alinhameno/Balanceamento'),
    ('Auto-Elétrica'),
    ('Mecânica Geral'),
    ('Mecânica Stor'),
    ('Funilaria'),
    ('Pintura');
    
insert into pecas (descricao, valor)
values
    ('Óleo do Motor', 40.00),
    ('Filtro de Ar', 25.00),
    ('Kit Pastilhas de Freio', 86.00),
    ('ASrtecedores', 180.00),
    ('Bateria', 459.90),
    ('Correia Dentada', 79.84),
    ('Jogo Velas de Ignição', 116.00),
    ('Sensor de Oxigênio', 30.00),
    ('Radiador', 372.00),
    ('Filtro de Combustível', 20.00),
    ('Kit Embreagem', 290.00),
    ('Jogo Cabo de Vela', 88.00),
    ('Junta do Cabeçote', 60.00),
    ('TerSstato', 12.00),
    ('Bombas de Água', 75.00),
    ('Filtro de Óleo', 22.00),
    ('Correia de Alternador', 18.00),
    ('Suspensão', 150.00),
    ('Válvula TerSstática', 28.00),
    ('Sonda Lambda', 40.00);
	
insert into servicos (descricao, valor) 
values
	('Alinhamento', 60.00),
    ('Balanceamento', 10.00),
    ('Troca de óleo', 20.00),
	('Arrefecimento', 70.00);
	
insert into avaliacao (data, validade, descrição_queixa, fk_idveiculo, fk_idequipe)
values
    ((select curdate()), (SELECT DATE_ADD(CURDATE(), INTERVAL 30 DAY)), 'Troca do óleo', 10, 3);
    
insert into ordem_de_servico (status, fk_idavaliacao)
values
	('Em andamento',4);
    
insert into os_servicos (fk_idordem_de_servico, fk_idservico)
values
	(4, 1),
    (4, 2);
    
insert into os_pecas (fk_idordem_de_servico, fk_idpecas, quantidade)
values
	(1,4,2),
    (1,3,1),
    (1,17,1);


insert into avaliacao (data, validade, descrição_queixa, fk_idveiculo, fk_idequipe)
values
    ('2023-08-10', '2023-09-10', 'Problema no freio', 1, 3);
    
insert into ordem_de_servico (status, fk_idavaliacao)
values
	('Em andamento',3);
    
insert into os_servicos (fk_idordem_de_servico, fk_idservico)
values
	(3,5);
    
insert into os_pecas (fk_idordem_de_servico, fk_idpecas, quantidade)
values
	(4,1,4),
    (4,16,1);

insert into servicos (descricao, valor) 
values
	('Troca pastilhas de freio', 135.00);


    
-- Calcula o valor total das peças para a ordem de serviço 1
SET @valor_pecas = (
    SELECT SUM(P.valor * OSP.quantidade)
    FROM os_pecas OSP
    JOIN pecas P ON OSP.fk_idpecas = P.idpecas
    WHERE OSP.fk_idordem_de_servico = 4
);

-- Calcula o valor total da mão de obra para a ordem de serviço 1
SET @valor_mao_de_obra = (
    SELECT SUM(S.valor)
    FROM os_servicos OSS
    JOIN servicos S ON OSS.fk_idservico = S.idservico
    WHERE OSS.fk_idordem_de_servico = 4
);

-- Calcula o valor total da ordem de serviço (peças + mão de obra)
SET @valor_total = @valor_pecas + @valor_mao_de_obra;

-- Insere o pagamento na tabela Pagamento
INSERT INTO Pagamento (status, valor, fk_idcliente, fk_idordem_de_servico)
VALUES ('PENDENTE', @valor_total, 10, 4); -- Substitua 1 pelo id do cliente e id da ordem de serviço reais

    

