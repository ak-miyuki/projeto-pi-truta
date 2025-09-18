CREATE DATABASE SPRINT_1;

USE SPRINT_1;

CREATE TABLE dClientes (
idCliente INT PRIMARY KEY auto_increment,
Nome VARCHAR(30) NOT NULL,
CadastroPJ VARCHAR(30) UNIQUE,
dtCadastro DATE,
Localidade VARCHAR(30)
);

INSERT INTO dClientes(Nome, CadastroPJ, dtCadastro, Localidade) VALUES 
('Trutinhas', '35.333.797/0001-23', '2025-08-10', 'São Paulo'), 
('TelePeixe', '51.332.609/0001-07', '2025-02-04', 'Campinas'),
('Fish Inc.', '14.781.567/0001-57', '2025-05-12', 'Itú'),
('Blue Fish.', '10.800.207/0001-02', '2024-03-12', 'São Bernardo');

ALTER TABLE dClientes ADD COLUMN LoginUser VARCHAR(12) UNIQUE;

ALTER TABLE dClientes ADD COLUMN LoginPassword VARCHAR(12) check (LoginPassword NOT LIKE '%123%');

SELECT * FROM dClientes WHERE idCliente BETWEEN 1 AND 4;

SELECT Nome as Cliente, CadastroPJ as CNPJ FROM dClientes;

-- Segunda tabela

CREATE TABLE dArduino (
idSensor INT PRIMARY KEY auto_increment,
idReservatório INT, 
dtMonitoramento DATE,
LocalidadeSensor VARCHAR(30)
);

INSERT INTO dArduino(idReservatório, dtMonitoramento, LocalidadeSensor) VALUES
(1, '2024-02-12', 'Estoque 1 de Trutas'),
(2, '2025-02-20', 'Ambiente Externo'),
(3, '2025-12-12', 'Estoque 3 do setor de Trutas');

SELECT * FROM dArduino;

INSERT INTO dArduino(idReservatório, dtMonitoramento, LocalidadeSensor) VALUES
(8, '2025-01-01', 'Estoque 1 de Trutas');


CREATE TABLE Trutas (
idTruta INT PRIMARY Key auto_increment,
QtdPeixes VARCHAR(50),
Espécie VARCHAR(30) check (Espécie IN('Arco-íris', 'Marrom')),
localReservatório VARCHAR(30),
faseCrescimento VARCHAR(30)
);

INSERT INTO Trutas (QtdPeixes, Espécie, localReservatório, faseCrescimento) VALUES
(90, 'Arco-íris', 'Estoque 1', 'Juvenil'),
(59, 'Marrom', 'Estoque 2', 'Adulto'), 
(40, 'Arco-íris', 'Estoque 2', 'Adulto'),
(70, 'Arco-íris', 'Estoque 1', 'Engorda'),
(89, 'Marrom', 'Estoque 1', 'Juvenil');

SELECT * FROM Trutas WHERE QtdPeixes > 40;

SELECT * FROM Trutas WHERE faseCrescimento = 'Juvenil';