drop database if exists TechStore;
create database TechStore;
show databases;
use TechStore;
create table Cliente(
id_Cliente int unsigned not null auto_increment,
Nome varchar(45) not null,
Telefone varchar(9) not null,
Cidade varchar(25) not null,
CPF varchar(11) not null,
primary key (id_Cliente)
);
create table Categoria(
id_Categoria int unsigned not null auto_increment,
Nome varchar(45) not null,
primary key (id_Categoria)
);
create table Vendedor(
id_Vendedor int unsigned not null auto_increment,
Nome varchar(45) not null,
Setor varchar(45) not null,
primary key (id_Vendedor)
);
create table Pedido(
id_Pedido int unsigned not null auto_increment,
Data_Pedido date not null,
Situacao varchar(45) not null,
Quantidade int not null,
Preco_Unitario decimal (8,2)  not null,
primary key (id_Pedido),
id_Cliente int unsigned not null,
id_Vendedor int unsigned not null,
constraint foreign key(id_Cliente) references Cliente(id_Cliente),
constraint foreign key(id_Vendedor) references Vendedor(id_Vendedor)
);
create table Produto(
id_Produto int unsigned not null auto_increment,
Nome varchar(45) not null,
Preco decimal(8,2) not null,
Quantidade int not null,
primary key (id_Produto),
id_Categoria int unsigned not null,
constraint foreign key (id_Categoria) references Categoria(id_Categoria)
);
create table Prod_Ped(
id_Prod_Ped int unsigned not null auto_increment,
primary key (id_Prod_Ped),
id_Produto int unsigned not null,
id_Pedido int unsigned not null,
constraint foreign key (id_Produto) references Produto(id_Produto),
constraint foreign key (id_Pedido) references Pedido(id_Pedido)
);

# Para fazer insert use: insert into Cliente (Nome, Telefone, Cidade, CPF) values

insert into Cliente (Nome, Telefone, Cidade, CPF) values
('Ana Silva', '912345678', 'São Paulo', '12345678901'),
('Bruno Costa', '987654321', 'Rio de Janeiro', '98765432100'),
('Carlos Souza', '954321098', 'Belo Horizonte', '45678912311'),
('Gabriella Souza', '966428751', 'Goiania', '24659781236'),
('Miguel Reis', '964521873', 'Goiania', '25136563189'),
('Pedro Faria', '958234756', 'Aparecida de Goiania', '25387465225'),
('Jorge Sousa', '946321857', 'Goiania', '02215754896'),
('Maria Conceicao', '963485214', 'São Paulo', '02468525254'),
('Nathan Prado', '983216532', 'Rio de Janeiro', '95200144789'),
('Ricardo Carvalho', '934629637', 'Goiania', '74752213663'),
('Aline Pereira', '936987356', 'São Paulo', '00548335587'),
('Sueli Fraga', '953658525', 'Goiania', '99522353387'),
('Benjamin Kent', '968874144', 'Belo Horizonte', '66933211477'),
('Carlos Ferraz', '983566754', 'Rio de Janeiro', '00152587363'),
('Joao Paulo','964827966', 'Goiania', '6329716489');

select * from Cliente;

insert into Categoria (Nome) values
('Periféricos'),
('Armazenamento'),
('Computadores'),
('Monitores');

select * from Categoria;

insert into Vendedor (Nome, Setor) values
('Marcos Oliveira', 'Vendas Atacado'),
('Junior Marques', 'Vendas Varejo'),
('Sonia Barros', 'Vendas Atacado'),
('Mateus Braga', 'Vendas Varejo'),
('Juliana Lima', 'Televendas');

select * from Vendedor;

insert into Produto (Nome, Preco, Quantidade, id_Categoria) values
('Mouse Sem Fio Ergonomico', 500.00, 50, 1),
('Teclado Gamer', 240.00, 40, 1),
('Headset Gamer', 350.00, 40, 1),
('Microfone', 279.90, 15, 1),
('Webcam', 169.90, 15, 1),
('Mousepad', 99.00, 30, 1),
('SSD 1TB', 500.00, 80, 2),
('SSD 480GB', 209.00, 60, 2),
('HD Externo 2TB', 559.00, 20, 2),
('Micro SD 128GB', 99.90, 15, 2),
('Pen Drive 64GB', 50.00, 15, 2),
('SSD 1TB Resistente', 799.90, 20, 2),
('Desktop Home Office', 1909.90, 20, 3),
('PC Gamer Ultimate', 4150.90, 14, 3 ),
('NotebookGamer', 4599.00, 9, 3),
('Mini PC Pro', 1699.90, 11, 3),
('Workstation Profissional', 13500.00, 4, 3),
('Monitor 24"Led ', 929.00, 10, 4),
('Monitor Profissional 27" ', 2090.90, 15, 4),
('Monitor Ultrawide 29" ', 1210.00, 14, 4),
('Monitor Curvo 32" ', 1900.00, 20, 4),
('Monitor básico 21.5" ', 500.00, 10, 4),
('Monitor Portátil', 890.00, 5, 4);

select * from Produto;

insert into Pedido (Data_Pedido, Situacao, Quantidade, Preco_Unitario, id_Cliente, id_Vendedor) values
('2026-09-01', 'Concluido', 2, 559.00, 15, 5),
('2026-09-03', 'Pendente', 1, 799.90, 9, 2),
('2026-09-04', 'Cancelado', 5, 2090.90, 12, 1),
('2026-09-04', 'Concluido', 1, 559.00, 5, 2),
('2026-09-05', 'Pendente', 2, 890.00, 6, 3),
('2026-09-07', 'Concluido', 2, 50.00, 14, 5),
('2026-09-07', 'Pendente', 2, 4150.90, 5, 2),
('2026-09-07', 'Concluido', 4, 350.00, 11, 1),
('2026-09-08', 'Concluido', 1, 929.00, 11, 1),
('2026-09-09', 'Pendente', 3, 799.90, 8, 3),
('2026-09-10', 'Pendente', 2, 240.00, 8, 3),
('2026-09-10', 'Concluido', 3, 4150.90, 10, 2), 
('2026-09-10', 'Pendente', 1, 350.00, 2, 5),
('2026-09-11', 'Concluido', 2, 890.00, 13, 5),
('2026-09-12', 'Cancelado', 3, 890.00, 7, 4);

select * from Pedido;

insert into Prod_Ped (id_Produto, id_Pedido) values
(9, 1), # O pedido 1 contém o produto 9
(12, 2),
(19, 3),
(9, 4),
(23, 5),
(11, 6),
(14, 7),
(3, 8),
(18, 9),
(12, 10),
(2, 11),
(14, 12),
(3, 13),
(23, 14),
(23, 15);

select * from Prod_Ped;
