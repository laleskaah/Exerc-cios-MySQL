drop database if exists Veterinaria;
create database Veterinaria;
show databases;
use Veterinaria;


create table Cliente(
id_Cliente int unsigned unique not null auto_increment,
primary key (id_Cliente),
Nome varchar(45) not null,
Telefone varchar(9) not null,
Cidade varchar(25) not null,
CPF varchar(11) not null unique
);

create table Animal(
id_Animal int unsigned unique not null auto_increment,
primary key (id_Animal),
Nome varchar(45) not null,
Especie varchar(45) not null,
Raca varchar (45) not null,
Data_Nascimento date not null,
id_Cliente int unsigned not null,
Constraint Foreign key(id_Cliente) references Cliente(id_Cliente)
);

create table Veterinario(
id_Veterinario int unsigned unique not null auto_increment,
primary key (id_Veterinario),
Nome varchar(45) not null,
CRMV varchar(25) not null,
Especialidade varchar(30) not null
);

create table Procedimento(
id_Procedimento int unsigned unique not null auto_increment,
primary key (id_Procedimento),
Nome varchar(100) not null,
Valor_P decimal(8,2) not null
);

Create table Consulta(
id_Consulta int unsigned unique not null auto_increment,
primary key (id_Consulta),
Data_Consulta date not null,
Valor_C decimal(6,2) not null,
Stattus varchar(45) not null,
id_Veterinario int unsigned not null,
constraint foreign key (id_Veterinario) references Veterinario(id_Veterinario),
id_Animal int unsigned not null,
constraint foreign key (id_Animal) references Animal(id_Animal)
);

create table Con_Pro(
id_Con_Pro int unsigned unique not null auto_increment,
primary key (id_Con_Pro),
Quantidade_Pro int not null,
Valor_Total decimal (8,2) not null,
id_Consulta int unsigned not null,
constraint foreign key(id_Consulta) references Consulta(id_Consulta),
id_Procedimento int unsigned not null,
constraint foreign key(id_Procedimento) references Procedimento(id_Procedimento)
);

insert into Cliente (Nome, Telefone, Cidade, CPF) VALUES
('Ana Silva', '912345678', 'São Paulo', '12345678901'),
('Bruno Costa', '987654321', 'Rio de Janeiro', '98765432100'),
('Carlos Souza', '954321098', 'Belo Horizonte', '45678912311'),
('Gabriella Souza', '966428751', 'Goiania', '24659781236'),
('Miguel Reis', '964521873', 'Goiania', '25136563189'),
('Pedro Faria', '958234756', 'Aparecida de Goiania', '25387465225');

insert into Animal (Nome, Especie, Raca, Data_Nascimento, id_Cliente) values
('Kent', 'Reptil', 'Jabuti', '2020-08-15',3),
('Branquelo', 'Peixe', 'Betta', '2025-11-05', 1),
('Rex', 'Cao', 'Golden Retrivier', '2022-02-27',4),
('Caramelo', 'Gato', 'Siamês', '2024-06-24',5),
('Prince', 'Cao', 'Sem raca definida', '2020-03-02', 1),
('Betoven', 'Gato', 'Persa', '2019-07-07',6),
('Bart', 'Ave', 'Calopsita', '2019-10-08',2),
('Zeus', 'Roedor', 'Hamster Sirio', '2024-12-03',4),
('Apolo', 'Coelho', 'Mini Lionhead', '2016-08-06',2),
('Zara', 'Reptil', 'Iguana-verde', '2014-11-22',1);

insert into Veterinario (Nome, CRMV, Especialidade) values
('Jorge Reis', 'CRMV-GO nº 8452', 'Dermatologia'),
('Luana Garcia', 'CRMV-GO nº 9113', 'Oncologia'),
('Pedro Araujo', 'CRMV-GO nº 10421', 'Anestesiologia'),
('Joana Prado', 'CRMV-GO nº 7639', 'Cardiologia');

insert into Procedimento (Nome,Valor_P) values
('Vacina', 79.00),
('Exames laboratoriais', 29.00),
('Exames de imagem', 129.00),
('Injeção', 109.00),
('Curativo', 10.00),
('Cirurgia', 600.00);

insert into Consulta (Data_Consulta, Valor_C, Stattus, id_Veterinario, id_Animal) Values
('2023-03-09', 60.00, 'Agendada', 4, 9),
('2023-05-19', 60.00, 'Realizada', 4,1),
('2023-05-24', 89.00, 'Agendada', 1, 6),
('2023-11-21', 89.00, 'Realizada', 3, 7),
('2024-04-10', 59.00, 'Agendada', 1, 3),
('2024-09-15', 100.00, 'Agendada', 2, 2),
('2024-12-28', 100.00, 'Realizada', 2, 6),
('2025-10-25', 59.00, 'Realizada', 1, 6),
('2025-11-18', 89.00, 'Agendada', 3, 8),
('2025-12-06', 10.00, 'Cancelada', 2, 2),
('2026-03-02', 89.00, 'Agendada', 3, 1),
('2026-06-03', 10.00, 'Cancelada', 3, 5),
('2026-09-16', 60.00, 'Realizada', 4, 7),
('2026-10-14', 60.00, 'Agendada', 4, 5),
('2026-11-09', 10.00, 'Cancelada', 3, 10);

insert into Con_Pro (Quantidade_Pro, Valor_Total, id_Consulta, id_Procedimento) values
(1, 139.00, 2, 1),
(1, 189.00, 4, 3),
(5, 70.00, 7, 5),
(3, 118.00, 8, 2),
(2, 700.00, 13, 6),
(6, 129.00, 4, 2),
(1, 659.00, 13, 6),
(2, 660.00, 2, 2),
(6, 118.00, 7, 2),
(5, 610.00, 8, 6),
(2, 139.00, 13, 1),
(1, 218.00, 5, 3),
(3, 659.00, 2, 6),
(4, 99.00, 4, 5),
(6, 209.00, 8, 4),
(5, 69.00, 13, 5),
(2, 39.00, 2, 2),
(1, 168.00, 7, 1),
(3, 179.00, 8, 1),
(1, 139.00, 13, 1);

# Questão 1
select * from Cliente;
# Questão 2
SELECT
    Nome AS 'Nome do Animal',
    Especie AS 'Espécie',
    Raca AS 'Raça'
FROM Animal;
# Questão 3
select Nome from Veterinario order by Nome ASC;
# Questão 4
Select
id_Consulta, Valor_C
from Consulta
Where Valor_C>89.00;
# Questão 5
Select
id_Consulta, Stattus
From Consulta
Where Stattus = 'Realizada';
# Questão 6
Select
Nome as 'Nome',
Especie As 'Espécie'
From Animal
Where Especie = 'Cao';
# Questão 7
select
id_Consulta, Stattus
from Consulta
where Stattus = 'Agendada' or Stattus= 'Cancelada';
# Questão 8
Select
id_Consulta, Valor_C
from Consulta
Where Valor_C between 60.00 and 100.00;
# Questão 9
Select
id_Consulta, Data_Consulta
from Consulta
where Data_Consulta between '2023-01-01' and '2024-05-30';
# Questão 10
Select * from Cliente
WHERE Nome like 'A%';
# Questão 11
select * from Animal where Nome like '%A%';
# Questão 12
select * from Veterinario where Nome like '%A';
# Questão 13
select * from Animal where Especie in ('Cao', 'Gato');
# Questão 14
select Cidade from Cliente
group by Cidade;
# Questão 15
Select count(*) as Total_Clientes from Cliente;
# Questão 16
select count(*) as Total_Animais from Animal;
# Questão 17
select avg(Valor_C) as Preço_Médio from Consulta;
# Questão 18
select MAX(Valor_C) as Preço_Máximo from Consulta;
# Questão 19
select MIN(Valor_C) as Preço_Minimo_Consulta from Consulta;
# Questão 20
select SUM(Con_Pro.Quantidade_Pro * Procedimento.Valor_P) As Valor_Total
from Con_Pro
inner join Procedimento on Con_Pro.id_Procedimento = Procedimento.id_Procedimento
inner join Consulta on Con_Pro.id_Consulta = Consulta.id_Consulta
where Consulta.Stattus = 'Realizada';

# Questão 21
select count(*) as Quantidade,
Especie as Nome
from Animal group by Especie;
# Questão 22
select count(*) as Quantidade,
Cidade as Cidade
from Cliente group by Cidade;
# Questão 23
select count(*) as Quantidade,
Stattus as Situação
from Consulta group by Stattus;
# Questão 24
select avg(Valor_C) as Preço_Médio ,
Stattus as Situação
from Consulta
group by Stattus;
# Questão 25
select Especie,
count(*) as Quantidade
from Animal
group by Especie
having Quantidade >1;
# Questão 26
select Cidade,
count(*) as Quantidade
from Cliente
group by Cidade
having Quantidade>1;

# Questão 27
select
v.Nome,
count(c.id_Consulta) as Total_Consultas
from Veterinario v
inner join Consulta c
on v.id_veterinario = c.id_Veterinario
group by
v.id_Veterinario, v.Nome
having Total_Consultas >3;

# Questão 28
select
a.Nome as 'Nome do Animal', Cl.Nome as 'Responsábel'
from Animal a
inner join Cliente cl on a.id_Cliente = cl.id_Cliente;

# Questão 29
select
c.id_Consulta as 'Codigo da Consulta', c.Data_Consulta as 'Data', c.Stattus as 'Situação',
a.Nome as Nome_Animal,
v.Nome as Nome_Veterinario
from Consulta c
inner join Animal a on c.id_Animal = a.id_Animal
inner join Veterinario v on c.id_Veterinario = v.id_Veterinario;

# Questão 30

select
a.nome as Nome_Animal,
v.Nome as Nome_Veterinario
from Consulta c
inner join Animal a on c.id_Animal = a.id_Animal
inner join Veterinario v on c.id_veterinario = v.id_Veterinario
where v.Nome = 'Jorge Reis';

# Questão 31
select
c.Data_Consulta,
a.Nome as Nome_Animal,
cl.Nome as Nome_Propietário
from Consulta c
inner Join Animal a on c.id_Animal =a.id_Animal
inner Join Cliente cl on a.id_Cliente = cl.id_Cliente;

# Questão 32
select
cp.id_Consulta, 
p.Nome as Procedimento,
cp.Quantidade_Pro,
p.Valor_P,
cp.Quantidade_Pro * p.Valor_P as Valor_Total
from Con_Pro cp
inner join Procedimento p on cp.id_Procedimento =p.id_Procedimento
order by cp.id_Consulta;

# Questão 33
select
a.Nome as Paciente,
p.Nome as Procedimento
from Con_Pro cp
inner join Consulta c on cp.id_Consulta = c.id_Consulta
inner join Animal a on c.id_Animal=a.id_Animal
inner join Procedimento p on cp.id_Procedimento=p.id_Procedimento;

# Questão 34
select
a.Nome as Paciente,
v.Nome as Veterinario,
p.Nome as Procedimento,
cp.Quantidade_Pro as Quantidade,
((cp.Quantidade_Pro * p.Valor_P) + c.Valor_C) as Valor_Total
from Con_Pro cp
inner join Procedimento p on cp.id_Procedimento = p.id_Procedimento
inner join Consulta c on cp.id_Consulta=c.id_Consulta
inner join Animal a on c.id_Animal = a.id_Animal
inner join Veterinario v on c.id_Veterinario=v.id_Veterinario;

# Questão 35
select
p.Nome as Procedimento,
cp.Quantidade_Pro,
(cp.Quantidade_Pro * p.Valor_P) as Valor_Total
from Con_Pro cp
inner join Procedimento p on cp.id_Procedimento =p.id_Procedimento
order by cp.id_Consulta;

# Questão 36
select
c.id_Consulta as Consulta,
SUM(cp.Quantidade_Pro * p.Valor_P) as Valor_Total
from Con_Pro cp
inner join Procedimento p on cp.id_Procedimento = p.id_Procedimento
inner join Consulta c on cp.id_Consulta=c.id_Consulta
group by c.id_Consulta
having Valor_Total >300
order by cp.id_Consulta
;
# Questão 37
select
v.Nome as Nome_Veterinario,
SUM(c.Valor_C) as Faturamento_Total
from Consulta c
inner join Veterinario v on c.id_Veterinario = v.id_Veterinario
where c.Stattus = 'Realizada'
Group by v.id_Veterinario, v.Nome;

# Questão 38
select id_Consulta, Valor_C
from Consulta
order by Valor_C Desc;

# Questão 39
select id_Consulta, Valor_C
from Consulta
order by Valor_C DESC
limit 3;
# Questão 40
select id_Procedimento, Valor_P
from Procedimento
order by Valor_P Desc
limit 3;
# Questão 41
select
a.Nome as Nome_Animal,
c.Stattus as Consulta
from Animal a
left join Consulta c on a.id_Animal=c.id_Animal;

# Questão 42

SELECT a.Nome AS Nome_Animal, c.Stattus AS Status_Consulta
FROM Animal a
LEFT JOIN Consulta c ON a.id_Animal = c.id_Animal
where c.Stattus is null;

# Desafio
select
cl.Nome as Nome_Cliente,
COUNT(c.id_Consulta) as Quantidade_Consultas_Realizadas,
SUM(c.Valor_C) as Valor_Total
from Cliente cl
inner join Animal a on cl.id_Cliente =a.id_Cliente
inner join Consulta c on a.id_Animal= c.id_Animal
where c.Stattus = 'Realizada'
group by cl.id_Cliente
having Valor_Total>100.00
order by Valor_Total DESC
;
