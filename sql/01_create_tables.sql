create database if not exists ego;


use ego;


create table if not exists cliente (
id_cliente int auto_increment primary key,
nome_cliente varchar(150),
cpf varchar(11) not null,
endereco varchar(300),
telefone varchar(11) not null,
email varchar(100) not null,
foto_perfil VARCHAR(225)
);


create table if not exists produto (
id_produto int auto_increment primary key,
nome_produto varchar(100) not null,
tipo varchar(100) not null,
descricao text not null,
preco decimal(4, 2) not null
);


create table if not exists avaliacao (
id_cliente INT NOT NULL,
id_produto INT NOT NULL,
primary key (id_cliente, id_produto),
nota tinyint not null,
comentario VARCHAR(400),
data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);


create table if not exists entregador (
id_entregador tinyint auto_increment primary key,
placa char(7) not null,
telefone_entregador VARCHAR(20) not null,
nome_entregador varchar (150) not null,
status_disponivel bool default true
);


create table if not exists pedido (
id_pedido int auto_increment primary key,
data_pedido datetime not null,
status_entrega ENUM('processando', 'enviado', 'entregue', 'cancelado') not null,
frete decimal(3,2),
valor_total decimal(5, 2) not null,
id_cliente int not null,
id_entregador tinyint,
foreign key (id_cliente) references cliente(id_cliente),
foreign key (id_entregador) references entregador(id_entregador)
);


create table if not exists pagamento (
id_pagamento int auto_increment primary key,
valor_pagamento DECIMAL(5,2) not null,
metodo ENUM('pix', 'cartão-crédito', 'cartão-débito', 'dinheiro', 'boleto'),
data_pagamento DATETIME,
status_pagamento ENUM('pendente', 'processando', 'pago', 'cancelado'),
id_pedido INT NOT NULL,
FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);


create table if not exists item (
id_item int auto_increment primary key,
id_produto int not null,
id_pedido int not null,
quantidade int,
valor decimal(5,2) not null,
subtotal decimal(5, 2),
foreign key (id_produto) references produto(id_produto),
foreign key (id_pedido) references pedido(id_pedido)
);


create table if not exists ingrediente (
id_ingrediente int auto_increment primary key,
custo_adicional decimal(3,2) default 0,
nome_ingrediente varchar(100) not null
);


create table if not exists produto_ingrediente (
id_produto int not null,
id_ingrediente int not null,
primary key (id_produto, id_ingrediente),
obrigatorio bool default true,
foreign key (id_produto) references produto(id_produto),
foreign key (id_ingrediente) references ingrediente(id_ingrediente)
);


create table if not exists item_ingrediente (
id_item int not null,
id_ingrediente int not null,
primary key (id_item, id_ingrediente),
adicionar bool default true,
foreign key (id_item) references item(id_item),
foreign key (id_ingrediente) references ingrediente(id_ingrediente)
);
