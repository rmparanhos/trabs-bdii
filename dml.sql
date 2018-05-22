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

insert into restaurante(nome,dono,endereco,telefone,categoria) values('mc donalds',3,'rua x','5132-6734','sanduiche');
insert into restaurante(nome,dono,endereco,telefone,categoria) values('dominos',4,'rua y','9643-0729','pizza');
insert into restaurante(nome,dono,endereco,telefone,categoria) values('konoha',5,'rua z','2987-4536','japonesa');
insert into restaurante(nome,dono,endereco,telefone,categoria) values('burguer king',3,'rua w','1212-6161','sanduiche');

insert into produto(loja_id,nome,descricao,preco) values(2,'bic mac','pao no meio',22);
insert into produto(loja_id,nome,descricao,preco) values(2,'quarteirao','apice do mc donald',20);
insert into produto(loja_id,nome,descricao,preco) values(3,'calabresa','qualidade',29.90);
insert into produto(loja_id,nome,descricao,preco) values(3,'pepperoni','tipo calabresa so q mais apimentando',29.90);
insert into produto(loja_id,nome,descricao,preco) values(4,'sushi','konnichwa',15);
insert into produto(loja_id,nome,descricao,preco) values(4,'sashimi','ohayou',15);
insert into produto(loja_id,nome,descricao,preco) values(5,'whooper','nada se comparado ao msa5.0',23.49);
insert into produto(loja_id,nome,descricao,preco) values(5,'mega stacker atomico 5.0','to com fome',23.50);

insert into endereco values(3,'rua 1');
insert into endereco values(4,'rua 2');
insert into endereco values(5,'rua 3');

insert into pedido(comprador,pagamento,endereco,momento) values (3,'dinheiro','rua 1',current_timestamp);

insert into compras_pedido(pedido,produto,pontuacao) values(2,2,3);
insert into compras_pedido(pedido,produto,pontuacao) values(2,3,5);
insert into compras_pedido(pedido,produto,pontuacao) values(2,3,4);
insert into compras_pedido(pedido,produto,pontuacao) values(2,2,2);
insert into compras_pedido(pedido,produto,pontuacao) values(2,3,5);
