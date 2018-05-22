create table restaurante(
	ident_r serial, --int auto increment
	nome varchar not null,
	dono int not null,
	endereco varchar not null,
	telefone varchar not null,
	categoria varchar,
	pontuacao float, --ideia: fazer um trigger que calcula a pontuacao toda vez q recebe um review da compra de um produto
	valor_min float,
	constraint pk_restaurante primary key(ident_r),
	constraint fk1_restaurante foreign key(dono) references usuario(ident_u),
	constraint fk2_restaurante foreign key(categoria) references categoria(nome)
);


create table usuario(
	ident_u serial,
	nome varchar not null,
	email varchar not null,
	cpf varchar,
	constraint pk_usuario primary key(ident_u)
);

create table categoria(
	nome varchar not null,
	constraint pk_categoria primary key(nome)
);

create table produto(
	ident_p serial,
	loja_id int not null,
	nome varchar not null,
	descricao varchar not null,
	preco float not null,
	pontuacao float, --ideia: uma trigger q calcule a pontuacao do produto a cada compra do mesmo
	constraint pk_produto primary key(ident_p),
	constraint fk1_produto foreign key(loja_id) references restaurante(ident_r)
);

create table pedido(
	ident_pe serial,
	comprador int not null,
	restaurante int not null,
	subtotal float, --trigger
	pagamento varchar not null,
	numero_cartao varchar,
	endereco varchar not null,
	momento timestamp not null,
	constraint pk_pedido primary key(ident_pe),
	constraint fk1_pedido foreign key(comprador) references usuario(ident_u),
	constraint fk2_pedido foreign key(pagamento) references tipo_pagamento(nome),
	constraint fk3_pedido foreign key(numero_cartao) references cartao(numero),
	constraint fk4_pedido foreign key(endereco) references endereco(rua),
	constraint fk5_pedido foreign key(restaurante) references restaurante(ident_r)
);

create table compras_pedido(
	ident_cp serial,
	pedido int not null,
	produto int not null,
	pontuacao float, --trigger pra permitir apenas de 0 a 5
	constraint pk_compras_pedido primary key(ident_cp),
	constraint fk1_compras_pedido foreign key(pedido) references pedido(ident_pe),
	constraint fk2_compras_pedido foreign key(produto) references produto(ident_p)
);

create table tipo_pagamento(
	nome varchar not null,
	constraint pk_tipo_pagamento primary key(nome)
);

create table endereco(
	morador int not null,
	rua varchar not null,
	constraint pk_endereco primary key(rua),
	constraint fk_endereco foreign key(morador) references usuario(ident_u)
);

create table cartao(
	titular int not null,
	numero varchar not null,
	codigo varchar not null,
	validade varchar not null,
	bandeira varchar not null,
	constraint pk_cartao primary key(numero),
	constraint fk_cartao foreign key(titular) references usuario(ident_u)
);

CREATE TRIGGER check_pontuacao
BEFORE INSERT ON compras_pedido
FOR EACH ROW
EXECUTE PROCEDURE check_pontuacao();

CREATE OR REPLACE FUNCTION check_pontuacao() RETURNS trigger AS $$
BEGIN
	if (new.pontuacao > 5 or new.pontuacao <0) then
		raise exception 'pontuacao fora do range 0 < x < 5';
  	end if;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER calc_pontuacao_produto
AFTER INSERT ON compras_pedido
FOR EACH ROW
EXECUTE PROCEDURE calc_pontuacao_produto();

CREATE OR REPLACE FUNCTION calc_pontuacao_produto() RETURNS trigger AS $$
DECLARE
 curs cursor for select pontuacao from compras_pedido where produto = new.produto;
 soma float = 0;
 contador int = 0;
BEGIN
	for record in curs loop
		soma = soma + record.pontuacao;
		contador = contador + 1;
	end loop;
	update produto
	set pontuacao = soma/contador
	where ident_p = new.produto;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER calc_pontuacao_restaurante
AFTER UPDATE ON produto
FOR EACH ROW
EXECUTE PROCEDURE calc_pontuacao_restaurante();

CREATE OR REPLACE FUNCTION calc_pontuacao_restaurante() RETURNS trigger AS $$
DECLARE
 curs cursor for select pontuacao from produto where loja_id = new.loja_id;
 soma float = 0;
 contador int = 0;
BEGIN
	for record in curs loop
		soma = soma + record.pontuacao;
		contador = contador + 1;
	end loop;
	update restaurante
	set pontuacao = soma/contador
	where ident_r = new.loja_id;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER subtotal_pedido
AFTER INSERT ON pedido
FOR EACH ROW
EXECUTE PROCEDURE subtotal_pedido();

CREATE OR REPLACE FUNCTION subtotal_pedido() RETURNS trigger AS $$
	curs cursor for select produto from compras_pedido where pedido = new.ident_pe;
	soma float = 0;
BEGIN
	for record in curs loop
		soma = soma + select preco from produto where ident_p = record.produto;
	end loop;
	update pedido
	set subtotal = soma
	where ident_pe = new.ident_pe
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_valor_min
AFTER UPDATE ON pedido
FOR EACH ROW
EXECUTE PROCEDURE check_valor_min();

CREATE OR REPLACE FUNCTION check_valor_min() RETURNS trigger AS $$
DECLARE
	valor_min float = 0;
BEGIN
	select valor_min
	into valor_min
	from restaurante
	where ident_r = new.restaurante;
	if(valor_min = null) then
	
	else
		if(new.subtotal < valor_min) then
			raise excpetion 'valor do pedido menor que o minimo da loja';
		end if;
	end if;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;
