insert into categoria values ('sanduiche');
insert into categoria values ('pizza');
insert into categoria values ('italiano');
insert into categoria values ('japonesa');
insert into categoria values ('chinesa');

insert into tipo_pagamento values('credito online');
insert into tipo_pagamento values('dinheiro');
insert into tipo_pagamento values('credito');
insert into tipo_pagamento values('debito');

insert into usuario(nome,email,cpf) values('raffael','raffael@trabalhobd2','12125');
insert into usuario(nome,email,cpf) values('raphael','raphael@trabalhobd2','89213');
insert into usuario(nome,email) values('luis felipe','luis_felipe@trabalhobd2');
truncate table restaurante cascade
insert into restaurante(nome,dono,endereco,telefone,categoria,precisa_cpf) values('mc donalds',4,'rua x','5132-6734','sanduiche',true);
insert into restaurante(nome,dono,endereco,telefone,categoria,precisa_cpf) values('dominos',5,'rua y','9643-0729','pizza',true);
insert into restaurante(nome,dono,endereco,telefone,categoria,precisa_cpf) values('konoha',6,'rua z','2987-4536','japonesa',true);
insert into restaurante(nome,dono,endereco,telefone,categoria,precisa_cpf) values('burguer king',4,'rua w','1212-6161','sanduiche',true);

insert into produto(loja_id,nome,descricao,preco) values(12,'bic mac','pao no meio',22);
insert into produto(loja_id,nome,descricao,preco) values(12,'quarteirao','apice do mc donald',20);
insert into produto(loja_id,nome,descricao,preco) values(13,'calabresa','qualidade',29.90);
insert into produto(loja_id,nome,descricao,preco) values(13,'pepperoni','tipo calabresa so q mais apimentando',29.90);
insert into produto(loja_id,nome,descricao,preco) values(14,'sushi','konnichwa',15);
insert into produto(loja_id,nome,descricao,preco) values(14,'sashimi','ohayou',15);
insert into produto(loja_id,nome,descricao,preco) values(15,'whooper','nada se comparado ao msa5.0',23.49);
insert into produto(loja_id,nome,descricao,preco) values(15,'mega stacker atomico 5.0','to com fome',23.50);

insert into endereco values(4,'rua 1');
insert into endereco values(5,'rua 2');
insert into endereco values(6,'rua 3');

insert into pedido(comprador,restaurante,pagamento,subtotal,endereco,momento) values (4,12,'dinheiro',0,'rua 1',current_timestamp);
insert into pedido(comprador,restaurante,pagamento,subtotal,endereco,momento) values (4,12,'dinheiro',0,'rua 1',current_timestamp);
insert into pedido(comprador,restaurante,pagamento,subtotal,endereco,momento) values (6,14,'dinheiro',0,'rua 1',current_timestamp);

insert into compras_pedido(pedido,produto,pontuacao) values(16,11,3);
insert into compras_pedido(pedido,produto,pontuacao) values(16,12,5);
insert into compras_pedido(pedido,produto,pontuacao) values(17,11,4);
insert into compras_pedido(pedido,produto,pontuacao) values(17,12,2);
insert into compras_pedido(pedido,produto,pontuacao) values(17,11,5);
