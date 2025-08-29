/*
Andrei Sato	04252015
Andreia Miyuki Kubota 04252015
Deivid Duarte Oliveira 04252007
João  Ricardo Jortieke Junior 04252002
Maria Maia 04252011
Pedro Augusto Lemos Rodrigues 04252020
Victor Gastardeli 04252050
*/



CREATE DATABASE SPRINT1;

USE SPRINT1; 

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(13) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL UNIQUE,
        CONSTRAINT chkSeguranca
            CHECK (senha NOT LIKE '%123%'),   -- Idéia de preocupação com segurança
    cnpj CHAR(18)NOT NULL UNIQUE,
    dtCadastro DATE,
    email VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO cliente VALUES
(default,'Fish Company','5511987614433','huwiefh124','10.245.633/0001-13','2025-11-16','fishcompany@gmail.com'),
(default,'Peixes Co','5513987610000','renoh3389','78.687.100/0001-25','2023-07-17','peixesco@gmail.com'),
(default,'Filhos da Truta','551892761100','vb3894','66.800.473/0001-81','2021-05-27','filhosdatruta@gmail.com'),
(default,'Kamehame Peixes','5511922224000','n4op8912','46.668.258/0001-61','2023-12-30','kamehamepeixes@gmail.com'),
(default,'Truta Olimpica','5511956619000','fbiup238','70.035.407/0001-30','2024-01-01','trutaolimpica@gmail.com');

SELECT concat(senha ,' ', email) AS login FROM cliente
	WHERE dtCadastro > '2023-05-27' ORDER BY empresa DESC;

-- AS TABELAS Login E Cliente são relacionais, e a tabela Login só recebe os dados para validar o login e senha. (Chave estrangeira)
CREATE TABLE login (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(13) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL UNIQUE,
    cnpj CHAR(18)NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE
);

/*
insert into login values
	(default,'Fish Company' ,'5511987614433' ,'huwiefh124' ,'10.245.633/0001-13' ,'fishcompany@gmail.com'),
	(default,'Peixes Co' ,'5511987614433' ,'renoh3389' ,'78.687.100/0001-25' ,'peixesco@gmail.com'),
	(default,'Filhos da Truta' ,'5511987614433' ,'vb3894' ,'66.800.473/0001-81' ,'filhosdatruta@gmail.com'),
	(default,'Kamehame Peixes' ,'5511987614433' ,'n4op8912' ,'46.668.258/0001-61' ,'kamehamepeixes@gmail.com'),
	(default,'Truta Olimpica' ,'5511987614433' ,'fbiup238' ,'70.035.407/0001-30', 'trutaolimpica@gmail.com');
*/

SELECT concat(senha ,' ', email) AS login FROM cliente
	WHERE dtCadastro > '2023-05-27' ORDER BY empresa DESC;

CREATE TABLE coletaArduino (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL,
    tanque INT NOT NULL,
    dtColeta datetime,
    temperatura DECIMAL(4,1)
    );

INSERT INTO coletaArduino VALUES
	(default,'Fish Company', 1,'2025-08-10 11:30:40', 29),
	(default,'Peixes Co', 1,'2025-07-10 13:40:59', 19.5),
	(default,'Filhos da Truta', 1,'2024-08-10 17:50:33', 15.3),
	(default,'Kamehame Peixes', 1,'2023-01-15 22:22:16', 18.9),
	(default,'Truta Olimpica', 1,'2021-08-30 23:10:31', 16);

SELECT concat(tanque ,' ', temperatura) AS medidor FROM coletaArduino
	WHERE dtColeta > '2023-05-27' ORDER BY temperatura DESC;
    
CREATE TABLE tanque (
	idTanque INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL,
    tanque INT NOT NULL,
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
	(default, 'Fish Company', 1, 29, 10, 15, 20, 100, 'cultivo', true),
	(default, 'Peixes Co', 1, 19.5, 10, 15, 20, 30, 'cultivo', false),
	(default, 'Filhos da Truta', 1, 15.3, 10, 15, 20, 50, 'cultivo', true),
	(default, 'Kamehame Peixes', 1, 18.9, 15, 16, 17, 300, 'crescimento', false),
	(default, 'Truta Olimpica', 1, 16, 15, 16, 17, 400, 'crescimento', false);
    
    SELECT * FROM tanque
		WHERE temperaturaMedia < 17 AND temperaturaMedia > 15;