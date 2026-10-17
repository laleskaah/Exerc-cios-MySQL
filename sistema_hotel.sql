-- ============================================================
-- BANCO DE DADOS: SISTEMA DE RESERVAS DE HOTEL
-- Arquivo para criação da estrutura e inserção dos dados
-- ============================================================

-- Opcional: remove o banco caso ele já exista
DROP DATABASE IF EXISTS hotel_db;

-- Criação do banco
CREATE DATABASE hotel_db;

-- Seleciona o banco para uso
USE hotel_db;

-- ============================================================
-- 1. CRIAÇÃO DAS TABELAS
-- ============================================================

CREATE TABLE categoria_quarto (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL
);

CREATE TABLE quarto (
    id_quarto INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL UNIQUE,
    id_categoria INT NOT NULL,

    CONSTRAINT fk_quarto_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categoria_quarto(id_categoria)
);

CREATE TABLE hospede (
    id_hospede INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cidade VARCHAR(60)
);

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    status_reserva VARCHAR(30) NOT NULL,

    CONSTRAINT fk_reserva_hospede
        FOREIGN KEY (id_hospede)
        REFERENCES hospede(id_hospede),

    CONSTRAINT fk_reserva_quarto
        FOREIGN KEY (id_quarto)
        REFERENCES quarto(id_quarto)
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT NOT NULL UNIQUE,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    forma_pagamento VARCHAR(30),

    CONSTRAINT fk_pagamento_reserva
        FOREIGN KEY (id_reserva)
        REFERENCES reserva(id_reserva)
);

-- ============================================================
-- 2. INSERÇÃO DOS DADOS
-- ============================================================

-- Categorias dos quartos
INSERT INTO categoria_quarto
(nome_categoria, valor_diaria)
VALUES
('Standard', 180.00),
('Luxo', 320.00),
('Suíte', 520.00);

-- Quartos
INSERT INTO quarto
(numero, id_categoria)
VALUES
(101, 1),
(102, 1),
(201, 2),
(202, 2),
(301, 3),
(302, 3);

-- Hóspedes
INSERT INTO hospede
(nome, cpf, cidade)
VALUES
('Ana Souza', '111.111.111-11', 'Goiânia'),
('Bruno Lima', '222.222.222-22', 'Brasília'),
('Carla Mendes', '333.333.333-33', 'Anápolis'),
('Diego Alves', '444.444.444-44', 'Goiânia'),
('Elisa Martins', '555.555.555-55', 'Palmas'),
('Felipe Rocha', '666.666.666-66', 'Goiânia');

-- Reservas
INSERT INTO reserva
(id_hospede, id_quarto, data_entrada, data_saida, status_reserva)
VALUES
(1, 1, '2026-10-01', '2026-10-03', 'Finalizada'),
(2, 3, '2026-10-05', '2026-10-07', 'Finalizada'),
(1, 5, '2026-10-15', '2026-10-18', 'Confirmada'),
(3, 2, '2026-10-20', '2026-10-22', 'Confirmada'),
(4, 4, '2026-10-25', '2026-10-27', 'Cancelada');

-- Pagamentos
INSERT INTO pagamento
(id_reserva, valor, data_pagamento, forma_pagamento)
VALUES
(1, 360.00, '2026-10-01', 'PIX'),
(2, 640.00, '2026-10-05', 'Cartão'),
(4, 360.00, '2026-10-20', 'PIX');

-- ============================================================
-- 3. CONSULTAS INICIAIS PARA CONFERÊNCIA
-- ============================================================

SELECT * FROM categoria_quarto;
SELECT * FROM quarto;
SELECT * FROM hospede;
SELECT * FROM reserva;
SELECT * FROM pagamento;


#Questão 1
Select r.id_reserva, h.nome, r.data_entrada, r.data_saida, r.status_reserva
from reserva r
inner join hospede h on r.id_hospede=h.id_hospede;

#Questão 2
select r.id_reserva, h.nome, q.numero
from reserva r
inner join hospede h on r.id_hospede=h.id_hospede
inner join quarto q on r.id_quarto=q.id_quarto;

#Questão 3
select r.id_reserva, h.nome, q.numero, c.id_categoria as Categoria_Quarto, c.valor_diaria, r.data_entrada, r.data_saida
from reserva r
inner join hospede h on r.id_hospede=h.id_hospede
inner join quarto q on r.id_quarto=q.id_quarto
inner join categoria_quarto c on c.id_categoria=q.id_categoria;

#Questão 4
select h.nome, r.id_reserva, r.data_entrada
from hospede h
left join reserva r on r.id_hospede=h.id_hospede
;

#Questão 5
select h.nome
from hospede h
left join reserva r on r.id_hospede=h.id_hospede
where id_reserva IS NULL;

#Questão 6
select r.id_reserva, h.nome, p.valor, p.forma_pagamento
from reserva r
inner join hospede h on h.id_hospede=r.id_hospede
left join pagamento p on p.id_reserva=r.id_reserva
;

#Questão 7
select r.id_reserva, h.nome, p.valor, p.forma_pagamento
from reserva r
inner join hospede h on h.id_hospede=r.id_hospede
left join pagamento p on p.id_reserva=r.id_reserva
where p.forma_pagamento IS NULL;

#Questão 8
select r.id_reserva, q.numero, r.data_entrada, r.data_saida
from reserva r
right join quarto q on r.id_quarto=q.id_quarto
;

#Questão 9
select r.id_reserva, q.numero
from quarto q
left join reserva r on r.id_quarto=q.id_quarto
where r.id_reserva IS NULL;

#Questão 10
select q.numero, r.id_reserva
from quarto q
left join reserva r on q.id_quarto=r.id_quarto;

select q.numero, r.id_reserva
from reserva r
right join quarto q on q.id_quarto=r.id_quarto;

#para obter o mesmo resultado, mas usando comandos diferentes, precisei alterar qual tabela vinha após o "from"

#Questão 11
select r.id_reserva, h.nome, h.cidade, q.numero, c.nome_categoria, c.valor_diaria, r.data_entrada, r.data_saida
from hospede h
inner join reserva r on h.id_hospede=r.id_hospede
inner join quarto q on r.id_quarto=q.id_quarto
inner join categoria_quarto c on q.id_categoria=c.id_categoria;

#Questão 12
select 
r.id_reserva, h.nome, c.nome_categoria, 
datediff (data_saida, data_entrada) as Quantidade_Diarias, c.valor_diaria,
(DATEDIFF (data_saida, data_entrada) * c.valor_diaria) as Valor_Total
from reserva r
inner join categoria_quarto c on r.id_quarto=r.id_quarto
inner join hospede h on r.id_hospede=h.id_hospede;

#Questão 13
select
r.id_reserva, h.nome, q.numero, c.nome_categoria, 
(DATEDIFF (data_saida, data_entrada) * c.valor_diaria) as Valor_Total, 
p.valor
from reserva r
inner join quarto q on r.id_quarto=q.id_quarto
inner join categoria_quarto c on c.id_categoria=c.id_categoria
inner join hospede h on r.id_hospede=h.id_hospede
left join pagamento p on r.id_reserva=p.id_reserva;

#Questão 14
select
r.id_reserva, h.nome, q.numero, c.nome_categoria, 
(DATEDIFF (data_saida, data_entrada) * c.valor_diaria) as Valor_Total, 
p.valor
from reserva r
inner join quarto q on r.id_quarto=q.id_quarto
inner join categoria_quarto c on c.id_categoria=c.id_categoria
inner join hospede h on r.id_hospede=h.id_hospede
left join pagamento p on r.id_reserva=p.id_reserva
where p.id_reserva IS NULL;

#Questão 15
select h.nome, count(r.id_reserva) as Quantidade_de_reserva
from hospede h
left join reserva r on h.id_hospede=r.id_hospede
group by h.id_hospede, h.nome;

#Questão 16
select h.nome, count(r.id_reserva) as Quantidade_de_reserva
from hospede h
left join reserva r on h.id_hospede=r.id_hospede
group by h.id_hospede, h.nome
having Quantidade_de_reserva>1;

#Questão 17
select r.id_reserva, h.nome, q.numero, c.nome_categoria, c.valor_diaria, 
datediff (data_saida, data_entrada) as Quantidade_Diarias,
(DATEDIFF (data_saida, data_entrada) * c.valor_diaria) as Valor_Previsto,
p.valor, p.forma_pagamento, r.status_reserva
from reserva r
inner join quarto q on r.id_quarto=q.id_quarto
inner join categoria_quarto c on c.id_categoria=c.id_categoria
inner join hospede h on r.id_hospede=h.id_hospede
left join pagamento p on r.id_reserva=p.id_reserva;

#Questão 18
select h.nome, r.id_reserva
from hospede h
inner join reserva r on h.id_hospede=r.id_hospede;

select h.nome, r.id_reserva
from hospede h
left join reserva r on h.id_hospede=r.id_hospede;

#A) Quando usamos Inner Join, o sistema mostra somente os hospedes com código de reserva.
#Quando usamos Left Join, ele mostra todos os hospedes, tendo reserva código de reserva o não.
#B)Porque o comando left join mostra tudo que está a esquerda sem a necessidade do que está a direita estar com valor.
#C) Quando queremos ver todos os hospedes cadastrados no hotel.
#D)
select h.nome, r.id_reserva
from reserva r 
right join hospede h on h.id_hospede=r.id_hospede;
