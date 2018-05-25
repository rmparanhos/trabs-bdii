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


insert into restaurante(nome,dono,endereco,telefone,categoria,precisa_cpf) values('mc donalds',1,'rua x','5132-6734','sanduiche',true);
insert into restaurante(nome,dono,endereco,telefone,categoria,precisa_cpf) values('dominos',2,'rua y','9643-0729','pizza',true);
insert into restaurante(nome,dono,endereco,telefone,categoria,precisa_cpf) values('konoha',3,'rua z','2987-4536','japonesa',true);
insert into restaurante(nome,dono,endereco,telefone,categoria,precisa_cpf) values('burguer king',1,'rua w','1212-6161','sanduiche',true);
insert into restaurante(nome,dono,endereco,telefone,categoria,precisa_cpf,valor_min) values('pizzahut',1,'rua x','1337-7331','pizza',true,20);

insert into produto(loja_id,nome,descricao,preco) values(1,'bic mac','pao no meio',22);
insert into produto(loja_id,nome,descricao,preco) values(1,'quarteirao','apice do mc donald',20);
insert into produto(loja_id,nome,descricao,preco) values(2,'calabresa','qualidade',29.90);
insert into produto(loja_id,nome,descricao,preco) values(2,'pepperoni','tipo calabresa so q mais apimentando',29.90);
insert into produto(loja_id,nome,descricao,preco) values(3,'sushi','konnichwa',15);
insert into produto(loja_id,nome,descricao,preco) values(3,'sashimi','ohayou',15);
insert into produto(loja_id,nome,descricao,preco) values(4,'whooper','nada se comparado ao msa5.0',23.49);
insert into produto(loja_id,nome,descricao,preco) values(4,'mega stacker atomico 5.0','to com fome',23.50);
insert into produto(loja_id,nome,descricao,preco) values(5,'mussarela','qualidade',15);
insert into produto(loja_id,nome,descricao,preco) values(5,'quatro queijos','tipo mussarela so q com mais 3 queijos',15);
 
insert into endereco values(1,'rua 1');
insert into endereco values(1,'rua 2');
insert into endereco values(1,'rua 3');
insert into endereco values(2,'rua x');
insert into endereco values(2,'rua 4');


insert into pedido(comprador,restaurante,pagamento,subtotal,endereco,momento) values (1,1,'dinheiro',0,'rua 1',current_timestamp);
insert into pedido(comprador,restaurante,pagamento,subtotal,endereco,momento) values (1,1,'dinheiro',0,'rua 1',current_timestamp);
insert into pedido(comprador,restaurante,pagamento,subtotal,endereco,momento) values (3,1,'dinheiro',0,'rua 1',current_timestamp);
insert into pedido(comprador,restaurante,pagamento,subtotal,endereco,momento) values (2,5,'dinheiro',0,'rua x',current_timestamp);


insert into compras_pedido(pedido,produto,pontuacao) values(11,1,3);
insert into compras_pedido(pedido,produto,pontuacao) values(11,2,5);
insert into compras_pedido(pedido,produto,pontuacao) values(12,1,4);
insert into compras_pedido(pedido,produto,pontuacao) values(12,2,2);
insert into compras_pedido(pedido,produto,pontuacao) values(17,9,5);
insert into compras_pedido(pedido,produto,pontuacao) values(17,10,1);

insert into areas_entrega values (1,'rua 1');
