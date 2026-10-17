drop database if exists SistemaEventos;
create database SistemaEventos;
show databases;
use SistemaEventos;


create table Localizacao(
id_Local int unsigned not null auto_increment,
primary key (id_Local),
Cidade varchar (45) not null,
UF varchar (2) not null);

create table Evento(
id_Evento int unsigned not null auto_increment,
primary key (id_Evento),
Nome_Evento varchar(45) not null,
Data_Evento date not null,
Valor_Evento decimal (6,2) not null,
id_Local int unsigned not null,
constraint foreign key (id_Local) references Localizacao (id_Local));

create table Participante(
id_Participante int unsigned not null auto_increment,
primary key (id_Participante),
Nome_Participante varchar(45) not null,
Email varchar(25) not null,
CPF varchar(11) not null unique
);

create table Inscricao(
Stattus varchar (10) not null,
id_Participante int unsigned not null,
id_Evento int unsigned not null,
primary key (id_Participante, id_Evento),
constraint foreign key (id_Participante) references Participante (id_Participante),
constraint foreign key (id_Evento) references Evento(id_Evento));

insert into Localizacao(Cidade, UF) values
('Goiânia', 'GO'),
('Brasília', 'DF'),
('Belo Horizonte', 'MG');

insert into Evento(Nome_Evento, Data_Evento, Valor_Evento, id_Local) values
('Workshop de Fotografia', '2026-07-20', 120.00, 1),
('Marketing Digital', '2026-08-15', 80.00, 2),
('Empreendedorismo', '2026-09-15', 100.00, 1),
('Linguagem e Postura', '2026-10-15', 180.00, 3);

insert into Participante(Nome_Participante, Email, CPF) values
('Joana Avila', 'joanaa@email.com', '5216748235'),
('Clark Kent', 'clarkk@gmail.com', '2516853492'),
('Bruce Wayne', 'brucew@email.com', '3486215746'),
('Diana Trevor', 'dianat@gmail.com', '3585652391'),
('Alerquina Pine', 'alerquinap@gmail.com', '52852478752');

insert into Inscricao(Stattus, id_Participante, id_Evento) values
('Confirmada', 1, 1),
('Cancelada', 5, 2),
('Pendente', 4, 2),
('Pendente', 5, 4),
('Confirmada', 1, 3),
('Cancelada', 3, 3),
('Confirmada', 4, 3),
('Cancelada', 3, 4);

#Questão a
update Participante
set Email = 'avilajoana@email.com' where id_Participante = 1;

#Questão b
update Evento 
set Valor_Evento = Valor_Evento*1.15 
where id_Evento=3;
select * from Evento;

#Questão c
DELETE FROM Participante
where

select * from Participante;

#Questão 1
select e.Nome_Evento, e.Data_Evento, l.Cidade, e.Valor_Evento
from Evento e
inner join Localizacao l on e.id_Local=l.id_Local;

#Questão 2
select e.Nome_Evento, p.Nome_Participante, p.Email, i.Stattus
from Inscricao i
inner join Participante p on i.id_Participante=p.id_Participante
inner join Evento e on i.id_Evento=e.id_Evento;

#Questão 4
select e.Nome_Evento,
count(i.id_Participante) as Quantidade
from Evento e
inner join Inscricao i on e.id_Evento=i.id_Evento
group by e.id_Evento, e.Nome_Evento;

#Questão 5
select e.Nome_Evento,
count(i.id_Participante) as Quantidade
from Evento e
inner join Inscricao i on e.id_Evento=i.id_Evento
group by e.id_Evento, e.Nome_Evento
having Quantidade>1;

#Questão 6
select Nome_Evento, Valor_Evento
from Evento
where Valor_Evento > (
    select AVG(Valor_Evento) from Evento 
);

#Questão 7
select p.Nome_Participante,
count(i.id_Evento) as Eventos_Confirmados,
SUM(e.Valor_Evento) as Valor_Total
from Participante p
inner join Inscricao i on p.id_Participante=i.id_Participante
inner join Evento e on i.id_Evento=e.id_Evento
where i.Stattus = 'Confirmada'
group by p.id_Participante, p.Nome_Participante
order by Valor_Total DESC;
