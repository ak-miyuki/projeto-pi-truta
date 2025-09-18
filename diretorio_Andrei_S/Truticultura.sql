CREATE DATABASE truticultura;
USE truticultura;

CREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
empresa VARCHAR(50) NOT NULL,
CEP VARCHAR(9) UNIQUE NOT NULL,
telefone VARCHAR(13) UNIQUE NOT NULL,
email  VARCHAR(50) UNIQUE NOT NULL
);

DESCRIBE cliente;

INSERT INTO cliente VALUES
(default,'José','Fish Company','07804-077','5511987614433', 'fishcompany@gmail.com'),
(default,'Maria','Peixes Co','78104-475','5513987610000','peixesco@gmail.com'),
(default,'Pedro','Filhos da Truta','93804-097','551892761100','filhosdatruta@gmail.com'),
(default,'Goku','Kamehame Peixes','30817-180','5511922224000','kamehamepeixes@gmail.com'),
(default,'Jaspion','Truta Olimpica','48264-353','5511956619000','trutaolimpica@gmail.com');

SELECT * FROM cliente;

SELECT * FROM cliente 
	WHERE nome LIKE 'P%';
    
INSERT INTO cliente VALUES
(default,'Pedro','Filhos do Truto','93804-096','551892761100','filhosdotruto@gmail.com');

SELECT * FROM cliente 
	WHERE nome != 'Pedro' AND empresa != 'Filhos da Truta';
    
SELECT nome FROM cliente
	WHERE empresa LIKE '%t%';
    
SELECT concat(nome,' ', empresa) AS Companhia FROM cliente;

SELECT * FROM cliente
	WHERE cep = '48264-353';

CREATE TABLE truticultor (
idTruticultor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
tanques INT NOT NULL,
qtdTruta INT NOT NULL
);

DESCRIBE truticultor;

INSERT INTO truticultor VALUES
(default,'José', 10, 100),
(default,'Maria', 3, 30),
(default,'Pedro', 4, 50),
(default,'Goku', 1000, 10000),
(default,'Jaspion', 500, 4000);

SELECT * FROM truticultor;
    
SELECT nome FROM truticultor
	WHERE qtdTruta > 50 ORDER BY qtdTruta DESC;
    
SELECT concat(tanques,' ', qtdTruta) AS Medidor FROM truticultor;

SELECT * FROM truticultor order by nome desc;
	

CREATE TABLE login (
idLogin INT PRIMARY KEY AUTO_INCREMENT,
senha VARCHAR(50) NOT NULL,
username VARCHAR(50) UNIQUE NOT NULL
);

DESCRIBE login;

INSERT INTO login VALUES
(default,'huwiefh124', 'Joseph'),
(default,'renoh3389','Marri'),
(default,'vb3894', 'Pedrito'),
(default,'n4op8912', 'Kakarotto'),
(default,'fbiup238', 'Metalhero');

SELECT * FROM login;

SELECT * FROM login 
	WHERE username LIKE '_a%';
    
SELECT username FROM login
	WHERE senha = 'vb3894';
    
SELECT concat(senha,' ', username) AS empresa FROM login;

sELECT * FROM login
	WHERE senha LIKE '%3%';


CREATE TABLE coletaArduino (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tempo DATETIME NOT NULL,
temperatura DECIMAL(3,1) NOT NULL
);

INSERT INTO coletaArduino VALUES
(default,'2025-08-10 11:30:40', 29),
(default,'2025-07-10 13:40:59', 19.5),
(default,'2024-08-10 17:50:33', 15.3),
(default,'2023-01-15 22:22:16', 18.9),
(default,'2021-08-30 23:10:31', 16);

SELECT * FROM coletaArduino;

SELECT * FROM coletaArduino 
	WHERE temperatura > 18;
    
SELECT temperatura FROM coletaArduino
	WHERE tempo < '2023-08-15';
    
SELECT concat(tempo,' ', temperatura) AS dadoscoletados FROM coletaArduino;

SELECT * FROM coletaArduino
	WHERE temperatura LIKE '2%';
    
    CREATE TABLE tanque (                                         
idTanque INT PRIMARY KEY AUTO_INCREMENT,
temperaturaTanque DECIMAL(3,1) NOT NULL,
temperaturaIdealMinima DECIMAL(3,1) NOT NULL,
temperaturaMedia DECIMAL(3,1) NOT NULL,
temperaturaIdealMaxima DECIMAL(3,1) NOT NULL,
qtdTruta INT NOT NULL, 
faseTruta VARCHAR(30)
CONSTRAINT chkFase
	CHECK(faseTruta IN('crescimento','cultivo')),
periodoFertil BOOLEAN
);

INSERT INTO tanque VALUES 
-- Tanques do Truticultor José
(default, 29, 10, 11.5, 13, 10, 'cultivo', true),
(default, 10, 10, 11.5, 13, 10, 'cultivo', true),
(default, 15, 10, 15, 20, 10, 'cultivo', false),
(default, 16, 10, 15, 20, 10, 'cultivo', false), 
(default, 12, 10, 15, 20, 10, 'cultivo', false), 
(default, 16, 15, 16, 17, 10, 'crescimento', false), 
(default, 15, 15, 16, 17, 10, 'crescimento', false), 
(default, 11, 15, 16, 17, 10, 'crescimento', false), 
(default, 19, 15, 16, 17, 10, 'crescimento', false), 
(default, 15, 15, 16, 17, 10, 'crescimento', false); 

SELECT * FROM tanque;

SELECT * FROM tanque 
	WHERE temperaturatanque < 13 AND temperaturatanque > 10;
    
SELECT temperaturatanque FROM tanque 
	WHERE temperaturaMedia < 20 AND temperaturaMedia > 15;
    
SELECT * FROM tanque
	WHERE faseTruta = 'cultivo';
    
    










