-- João Ricardo Jortieke Junior RA 04252002 1CCOK --

CREATE DATABASE TroustSolutions;

USE TroustSolutions;

CREATE TABLE cadastro(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    CEP CHAR(9) NOT NULL,
    telefone CHAR(13) NOT NULL UNIQUE,
    empresa VARCHAR(60) NOT NULL,
    CNPJ CHAR(14) NOT NULL UNIQUE
);

INSERT INTO cadastro VALUES
	(DEFAULT, 'Fulane', 'Silva', 66617590, 6398773635, 'Trousty Culture', 81657004000149),
    (DEFAULT, 'Silvane', 'Fula', 88806640, 4697313340, 'Truti Culture SA', 36407402000152);

CREATE TABLE login(
	id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    senha CHAR(8) NOT NULL,
		CONSTRAINT chksenha
			CHECK (senha NOT LIKE '%123'),
    email_rec VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO login VALUES
	(DEFAULT, 'TroustyCult', 'a!38400s', 'trousty@empresa.br'),
    (DEFAULT, 'TrutiSA', 'tru@sa#2', 'trutisa@empresa.br');

CREATE TABLE truticultura(
	id INT PRIMARY KEY AUTO_INCREMENT,
    qtde_tanques INT,
    trutas_por_tanque INT,
    temperatura_média DECIMAL (4,2),
    temperatura_maxima DECIMAL (4,2),
    temperatura_minima DECIMAL (4,2),
    especie_truta VARCHAR(20)
		CONSTRAINT chkespecie_truta
			CHECK (especie_truta IN ('Truta Arco Iris', 'Truta Marrom')),
    fase_truta VARCHAR(50)
		CONSTRAINT chkfasetruta
			CHECK (fase_truta IN ('Reprodução', 'Engorda', 'Crescimento')),
	produçao_media DECIMAL(10,2),
    gastos_alimentação DECIMAL (10,2)
);

INSERT INTO truticultura VALUES
	(DEFAULT, 2, 50, 22.30, 18.50, 'Truta Arco Iris', 'Engorda', 340, 3500.85),
	(DEFAULT, 3, 25, 15.30, 13.50, 'Truta Arco Iris', 'Reprodução', 140, 1500.90);

CREATE TABLE sensordata(
	id INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DECIMAL(4,2),
    hora_data DATETIME,
    tanque INT
);    

INSERT INTO sensordata VALUES
	(DEFAULT, 20.10, '2025-08-27 13:31:05', 1),
	(DEFAULT, 20.00, '2025-08-27 13:31:07', 1),
	(DEFAULT, 19.50, '2025-08-27 13:31:09', 1),
	(DEFAULT, 20.00, '2025-08-27 13:31:11', 1),
	(DEFAULT, 17.10, '2025-08-27 13:31:13', 1),
	(DEFAULT, 17.10, '2025-08-27 13:31:15', 1),
	(DEFAULT, 17.20, '2025-08-27 13:31:17', 1),
	(DEFAULT, 17.15, '2025-08-27 13:31:19', 1),
	(DEFAULT, 18.00, '2025-08-27 13:31:21', 1),
	(DEFAULT, 20.10, '2025-08-27 13:31:23', 1),
	(DEFAULT, 20.15, '2025-08-27 13:31:25', 1);

SELECT * FROM sensordata
	WHERE temperatura > 20;
    
