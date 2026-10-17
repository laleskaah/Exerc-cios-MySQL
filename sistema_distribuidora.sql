drop database if exists Distribuidora_Eletronicos;
create database Distribuidora_Eletronicos;
show databases;
use Distribuidora_Eletronicos;

create table Cidade(
id_Cidade int unsigned not null auto_increment,
primary key (id_Cidade),
Nome_Cidade varchar (30) not null,
UF varchar (2)
);

create table Cliente(
id_Cliente int unsigned not null auto_increment,
primary key (id_Cliente),
Nome varchar(45) not null,
Telefone varchar(11) not null,
CPF varchar(11) unique not null,
id_Cidade int unsigned not null,
constraint foreign key (id_Cidade) references Cidade(id_Cidade)
);

create table Categoria(
id_Categoria int unsigned not null auto_increment,
Nome varchar(45) not null,
primary key (id_Categoria)
);
create table Vendedor(
id_Vendedor int unsigned not null auto_increment,
primary key (id_Vendedor),
Nome varchar(45) not null,
Comissao decimal (6,2) not null
);
create table Pedido(
id_Pedido int unsigned not null auto_increment,
Data_Pedido date not null,
Situacao varchar(45) not null,
primary key (id_Pedido),
id_Cliente int unsigned not null,
id_Vendedor int unsigned not null,
constraint foreign key(id_Cliente) references Cliente(id_Cliente),
constraint foreign key(id_Vendedor) references Vendedor(id_Vendedor)
);
create table Produto(
id_Produto int unsigned not null auto_increment,
primary key (id_Produto),
Nome varchar(45) not null,
Preco_Unidade decimal(8,2) not null,
id_Categoria int unsigned not null,
constraint foreign key (id_Categoria) references Categoria(id_Categoria)
);
create table Prod_Ped(
Quantidade int not null,
Preco_Venda decimal (8,2) not null,
id_Produto int unsigned not null,
id_Pedido int unsigned not null,
Primary key (id_Produto, id_Pedido),
constraint foreign key (id_Produto) references Produto(id_Produto),
constraint foreign key (id_Pedido) references Pedido(id_Pedido)
);

insert into Cidade(Nome_Cidade, UF) values
('Goiânia', 'GO'),
('Anápolis', 'GO'),
('Campo Limpo de Goiás', 'GO'),
('Aparecida de Goiânia', 'GO'),
('Rio de Janeiro', 'RJ'),
('São Paulo', 'SP'),
('Brasilia', 'DF');

insert into Cliente (Nome, Telefone, CPF, id_Cidade) values
('Ana Silva', '912345678', '12345678901', 1),
('Bruno Costa', '987654321', '98765432100', 4),
('Carlos Souza', '954321098', '45678912311', 5),
('Gabriella Souza', '966428751', '24659781236', 4),
('Miguel Reis', '964521873', '25136563189', 6),
('Pedro Faria', '958234756', '25387465225', 2),
('Jorge Sousa', '946321857', '02215754896', 1),
('Maria Conceicao', '963485214', '02468525254', 3),
('Nathan Prado', '983216532', '95200144789', 7),
('Ricardo Carvalho', '934629637', '74752213663', 6),
('Aline Pereira', '936987356', '00548335587', 5),
('Sueli Fraga', '953658525', '99522353387', 4),
('Benjamin Kent', '968874144', '66933211477', 3),
('Carlos Ferraz', '983566754', '00152587363', 2),
('Joao Paulo','964827966',  '6329716489', 1);

insert into Categoria (Nome) values
('Periféricos'),
('Armazenamento'),
('Computadores'),
('Monitores'),
('Componentes');


insert into Vendedor (Nome, Comissao) values
('Marcos Oliveira', 5.00),
('Junior Marques', 3.50),
('Sonia Barros', 5.00),
('Mateus Braga', 8.00),
('Juliana Lima', 8.00);


insert into Produto (Nome, Preco_Unidade, id_Categoria) values
('Mouse Sem Fio Ergonomico', 500.00, 1),
('Teclado Gamer', 240.00, 1),
('Headset Gamer', 350.00, 1),
('Microfone', 279.90, 1),
('Webcam', 169.90, 1),
('Mousepad', 99.00, 1),
('SSD 1TB', 500.00, 2),
('SSD 480GB', 209.00, 2),
('HD Externo 2TB', 559.00, 2),
('Micro SD 128GB', 99.90, 2),
('Pen Drive 64GB', 50.00, 2),
('SSD 1TB Resistente', 799.90, 2),
('Desktop Home Office', 1909.90, 3),
('PC Gamer Ultimate', 4150.90, 3 ), #14
('NotebookGamer', 4599.00, 3),
('Mini PC Pro', 1699.90, 3),
('Workstation Profissional', 13500.00, 3),
('Monitor 24"Led ', 929.00, 4),
('Monitor Profissional 27" ', 2090.90, 4),
('Monitor Ultrawide 29" ', 1210.00, 4),
('Monitor Curvo 32" ', 1900.00, 4),
('Monitor básico 21.5" ', 500.00, 4),
('Monitor Portátil', 890.00, 4),
('Processador Intel Core i5', 1200.00, 5), #24
('Placa de Vídeo RTX 4060', 2100.00, 5),
('Placa-Mãe ATX DDR5', 950.00, 5),
('Memória RAM 16GB DDR5', 450.00, 5),
('Fonte Nominal 650W Modular', 520.00, 5)
;

insert into Pedido (Data_Pedido, Situacao, id_Cliente, id_Vendedor) values
('2026-09-01', 'Concluido', 15, 5),
('2026-09-03', 'Pendente', 9, 2),
('2026-09-04', 'Cancelado', 12, 1),
('2026-09-04', 'Concluido', 5, 2),
('2026-09-05', 'Pendente', 6, 3),
('2026-09-07', 'Concluido', 14, 5),
('2026-09-07', 'Pendente', 5, 2),
('2026-09-07', 'Concluido', 11, 1),
('2026-09-08', 'Concluido', 11, 1),
('2026-09-09', 'Pendente', 8, 3),
('2026-09-10', 'Pendente', 8, 3),
('2026-09-10', 'Concluido', 10, 2), 
('2026-09-10', 'Pendente', 2, 5),
('2026-09-11', 'Concluido', 13, 5),
('2026-09-12', 'Cancelado', 7, 4);

insert into Prod_Ped (Quantidade, Preco_Venda, id_Produto, id_Pedido) values
(2, 590.00 , 9, 1), # O pedido 1 contém o produto 9
(1, 820.00, 12, 2),
(5, 2160.0, 19, 3),
(1, 600.00, 9, 4),
(2, 920.00, 23, 5),
(2, 55.00, 11, 6),
(2, 4180.00, 14, 7),
(4, 365.00, 3, 8),
(1, 937.00, 18, 9),
(3, 838.00, 12, 10),
(2, 253.0, 2, 11),
(3, 4280.00, 14, 12),
(1, 360.00, 3, 13),
(1, 912.00, 23, 14),
(3, 910.00, 23, 15),
(1, 535.00, 28, 4),
(2, 1010.00, 26, 6)
;

#Questão 1- Porque você causa confusão de dados, quando a tabela pedido for pegar o id_Produto, se eles estiverem no mesmo campo, 
#como ele saberá se é Monitor ou HD? Para evitar esses erros, cada produto deve ficar em um campo dentro da tabela Produto.

#Questão 2- Sistema Vendas:  id_Cidade, nome_Cidade, UF, id_Cliente, Nome_Cliente, CPF_Cliente, Telefone_Cliente, id_Vendedor, Nome_Vendedor, 
#Comissao_Vendedor, id_Categoria, Nome_Categoria, Preco_Produto, id_Produto, Nome_Produto, id_Pedido, Data_Pedido, Situacao, Quantidade, Preco_Venda

#Questão 3-Atributos que dependem apenas do id_Pedido: Acho que nenhuma.
#Atributos que dependem apenas do id_Produto: Nenhuma.
#Quais dependem da chave completa: Quantidade e Preco_Venda porque eu só sei a quantidade se eu souber o produto e o pedido, e só sei o valor de venda praticado se eu souber o produto e o pedido. 

#Questão 4- Acho que não tem dependência transitavas no código, ao fazer as associações as chaves estrangeiras necessárias já foram inseridas na devida tabela.

#Questão 5- Não identifiquei.

#Questão 6-  id_Cidade → Nome_Cidade, UF || id_Cliente → id_Cidade || id_Categoria → Nome_Categoria || id_Produto → id_Categoria

#Questão 7
select *from Cliente;
#Questão 8
Select
Nome, Telefone, CPF
from Cliente;
#Questão 9
Select 
Nome, Preco_Unidade
from Produto
Where Preco_Unidade>500.00;
#Questão 10
Select Nome, Preco_Unidade from Produto
Where Preco_Unidade between 200.00 and 1000.00;

#Questão 11
select * from Pedido Where Situacao= 'Concluído';

#Questão 12
Select * from Pedido where Situacao in ('Pendente', 'Cancelado');

#Questão 13
Select * from Cliente Where Nome like 'a%';

#Questão 14
Select * from Produto where Nome like '%Mouse%';

#Questão 15
Select Nome, Preco_Unidade from Produto order by Preco_Unidade Desc;

#Questão 16
Select Nome, Preco_Unidade from Produto order by Preco_Unidade Desc limit 4;

#Questão 17
Select count(*) as Quantidade_Produtos from Produto;

#Questão 18
Select count(*) as Quantidade_Pedidos from Pedido;

#Questão 19
Select AVG(Preco_Unidade) as Preco_Medio from Produto;

#Questão 20
select Max(Preco_Unidade) as Maior_Preco,
MIN(Preco_Unidade) as Menor_Preco
from Produto;

#Questão 21
select Situacao, 
count(*) as Quantidade 
from Pedido 
group by Situacao;

#Questão 22
Select 
c.Nome_Cidade,
COUNT(*) as Quantidade
from Cliente cl
inner join Cidade c on cl.id_Cidade = c.id_Cidade
group by cl.id_Cidade, c.Nome_Cidade;

#Questão 23
select cat.Nome,
count(*) as Quantidade
from Produto p
inner join Categoria cat on p.id_Categoria = cat.id_Categoria
group by p.id_Categoria, cat.Nome;

#Questão 24
Select 
cat.Nome,
AVG(Preco_Unidade) as Preco_Medio
from Produto p
inner join Categoria cat on p.id_Categoria=cat.id_Categoria
group by p.id_Categoria, cat.Nome;

#Questão 25
Select cat.Nome as Nome_Categoria,
count(p.id_Produto) as Quantidade
from Categoria cat
inner join Produto p on cat.id_Categoria = p.id_Categoria
group by cat.id_Categoria, cat.Nome having Quantidade >5;

#Questão 26
Select 
c.Nome_Cidade as Nome_Cidade,
count(cl.id_Cliente) as Quantidade
from Cidade c
inner join Cliente cl on c.id_Cidade=cl.id_Cidade
group by c.id_Cidade, c.Nome_Cidade having Quantidade >2;

#Questão 27
Select 
cat.Nome as Nome_Categoria,
AVG(Preco_Unidade) as Preco_Medio
from Categoria cat
inner join Produto p on cat.id_Categoria = p.id_Categoria
group by cat.id_Categoria, cat.Nome having Preco_Medio >500;

#Questão 28
select cl.Nome, c.Nome_Cidade as Nome_Cidade
from Cidade c
inner join Cliente cl on c.id_Cidade=cl.id_Cidade;

#Questão 29
select
p.id_Pedido, p.Data_Pedido, p.Situacao, cl.Nome
from Pedido p
inner join Cliente cl on p.id_Cliente=cl.id_Cliente;

#Questão 30
select
p.id_Pedido, p.Data_Pedido, p.Situacao, cl.Nome as Nome_Cliente, v.Nome as Nome_Vendedor
from Pedido p
inner join Cliente cl on p.id_Cliente=cl.id_Cliente
inner join Vendedor v on p.id_Vendedor=v.id_Vendedor;

#Questão 31
select pr.Nome as Nome_Produto, cat.Nome as Nome_Categoria
from Produto pr
inner join Categoria cat on pr.id_Categoria=cat.id_Categoria;

#Questão 32
Select
pp.id_Pedido, pr.Nome as Nome_Produto, pp.Quantidade as Quantidade, pp.Preco_Venda
from Prod_Ped pp
inner join Produto pr on pp.id_Produto=pr.id_Produto
inner join Pedido p on pp.id_Pedido=p.id_Pedido;

#Questão 33
Select
pp.id_Pedido, pr.Nome as Nome_Produto, pp.Quantidade as Quantidade, pp.Preco_Venda, 
pp.Quantidade*pp.Preco_Venda as Subtotal
from Prod_Ped pp
inner join Produto pr on pp.id_Produto=pr.id_Produto
inner join Pedido p on pp.id_Pedido=p.id_Pedido;

#Questão 34
select
id_Pedido, Quantidade*Preco_Venda as Total
from Prod_Ped; 

#Questão 35
select
id_Pedido,
SUM(Quantidade*Preco_Venda) as Total
from Prod_Ped
group by id_Pedido
having Total >2000;

#Questão 36
Select cl.Nome,
count(p.id_Pedido) as Quantidade_Pedidos
from Cliente cl
inner join Pedido p on cl.id_Cliente = p.id_Cliente
group by cl.id_Cliente, cl.Nome;

#Questão 37
Select p.id_Pedido, cl.Nome as Cliente, p.Data_Pedido,
pp.Quantidade*pp.Preco_Venda as Total
from Pedido p 
inner join Cliente cl on p.id_Cliente=cl.id_Cliente
INNER JOIN Prod_Ped pp on p.id_Pedido=pp.id_Pedido
where Situacao='Concluido'
group by p.id_Pedido, cl.Nome, p.Data_Pedido;

#Questão 38
Select p.id_Pedido, cl.Nome as Cliente,
sum(pp.Quantidade*pp.Preco_Venda) as Total
from Pedido p 
inner join Cliente cl on p.id_Cliente=cl.id_Cliente
INNER JOIN Prod_Ped pp on p.id_Pedido=pp.id_Pedido
where Situacao='Concluido'
group by cl.Nome
having Total >2000;

#Questão 39
Select 
v.Nome,
COUNT(p.id_Pedido) as Quantidade_Pedidos
From Vendedor v inner join Pedido p on v.id_Vendedor=p.id_Vendedor
group by v.id_Vendedor, v.Nome;

#Questão 40
Select v.Nome as Vendedor, 
SUM(pp.Quantidade*pp.Preco_Venda) as Total
from Vendedor v 
inner join Pedido p on v.id_Vendedor = p.id_Vendedor
inner Join Prod_Ped pp on p.id_Pedido=pp.id_Pedido
where p.Situacao = 'Concluido'
group by v.id_Vendedor, v.Nome;

#Questão 41
Select
pr.Nome as Produto,
SUM(pp.Quantidade) as Quantidade_Vendida
from Produto pr inner join Prod_Ped pp on pr.id_Produto=pp.id_Produto
group by pp.id_Produto, pr.Nome;

#Questão 42
Select
pr.Nome as Produto,
SUM(pp.Quantidade) as Quantidade_Vendida
from Produto pr inner join Prod_Ped pp on pr.id_Produto=pp.id_Produto
group by pp.id_Produto, pr.Nome
Order by Quantidade_Vendida DESC
limit 5;

#Questão 43
select cl.Nome, p.id_Pedido
from Cliente cl
left join Pedido p on cl.id_Cliente=p.id_Cliente;

#Questão 44
select cl.Nome, p.id_Pedido
from Cliente cl
left join Pedido p on cl.id_Cliente=p.id_Cliente
where p.id_Pedido is null;

#Questão 45
select
cl.Nome as Nome_Cliente, 
c.Nome_Cidade as Cidade, 
COUNT( DISTINCT pp.id_Pedido) as Quantidade_Pedido_Concluídos,
SUM(pp.Quantidade*pp.Preco_Venda) as Total
from Prod_Ped pp
inner Join Pedido p
ON pp.id_Pedido = p.id_Pedido
inner join Cliente cl
on p.id_Cliente = cl.id_Cliente 
inner join Cidade c
on cl.id_Cidade = c.id_Cidade
where p.Situacao = "Concluido"
group by cl.id_Cliente, cl.Nome, c.Nome_Cidade
having(Total > 2000) 
order by Total desc
;

#Questão 46 - A dependência parcial é quando um atributo depente de uma parte da chave primaria composta. 
#E a dependência transistia é quando um atributo depende de outro atributo. 

#Questão 47 - Na estrutura inicial a data do pedido depende do id do pedido independente do id do produto.

#Questão 48 - O nome do cliente depende do pedido de forma transitiva. Porque o nome do cliente depende do id cliente que depende do id pedido.

#Questão 49- Devem ser separados porque um pedido pode ter mais de um produto, se eu colocar tudo junto vai dar erro. Cada pedido seria linhas de códigos
#imensas, separar pedido e produto garante fluidez no sistema.

#Questão 50 - Fazendo isso eu não preciso digitar tantas linhas de código, pensando nas varias "combinações" existentes. Imagina escrever linha por linha de 
#todas as possíveis combinações de categoria e produto. 

