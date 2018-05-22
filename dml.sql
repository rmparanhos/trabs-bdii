insert into categoria values ('sanduiche');
insert into categoria values ('pizza');
insert into categoria values ('italiano');
insert into categoria values ('japonesa');
insert into categoria values ('chinesa');

insert into tipo_pagamento values('credito online');
insert into tipo_pagamento values('dinheiro');
insert into tipo_pagamento values('credito');
insert into tipo_pagamento values('debito');

insert into usuario(nome,email,endereco) values('raffael','raffael@trabalhobd2','rua um');
insert into usuario(nome,email,endereco) values('raphael','raphael@trabalhobd2','rua dois');
insert into usuario(nome,email,endereco) values('luis felipe','luis_felipe@trabalhobd2','rua tres');

insert into restaurante(nome,dono,endereco,telefone,categoria) values('mc donalds',1,'rua x','5132-6734','sanduiche');
insert into restaurante(nome,dono,endereco,telefone,categoria) values('dominos',2,'rua y','9643-0729','pizza');
insert into restaurante(nome,dono,endereco,telefone,categoria) values('konoha',3,'rua z','2987-4536','japonesa');
insert into restaurante(nome,dono,endereco,telefone,categoria) values('burguer king',1,'rua w','1212-6161','sanduiche');

insert into produto(loja_id,nome,descricao,preco) values(1,'bic mac','pao no meio',22);
insert into produto(loja_id,nome,descricao,preco) values(1,'quarteirao','apice do mc donald',20);
insert into produto(loja_id,nome,descricao,preco) values(2,'calabresa','qualidade',29.90);
insert into produto(loja_id,nome,descricao,preco) values(2,'pepperoni','tipo calabresa so q mais apimentando',29.90);
insert into produto(loja_id,nome,descricao,preco) values(3,'sushi','konnichwa',15);
insert into produto(loja_id,nome,descricao,preco) values(3,'sashimi','ohayou',15);
insert into produto(loja_id,nome,descricao,preco) values(4,'whooper','nada se comparado ao msa5.0',23.49);
insert into produto(loja_id,nome,descricao,preco) values(4,'mega stacker atomico 5.0','to com fome',23.50);

insert into compra values(8,1,current_timestamp,'dinheiro',5);
insert into compra values(3,1,current_timestamp,'dinheiro',5);
insert into compra values(2,2,current_timestamp,'credito online',3.5);
insert into compra values(1,3,current_timestamp,'credito',4);
