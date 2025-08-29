/*
Andrei Sato	04252015
Andreia Kubota 04252015
Deivid Duarte Oliveira 04252007
João  Ricardo Jortieke Junior 04252002
Maria Maia 04252011
Pedro Augusto Lemos Rodrigues 04252020
Victor Gastardeli 04252050
*/



CREATE DATABASE SPRINT1;

USE SPRINT1; 

CREATE TABLE Cliente (
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

INSERT INTO Login (empresa,telefone, senha, cnpj, email) VALUES
(default,'Fish Company','5511987614433','huwiefh124' ,'' ,'fishcompany@gmail.com'),
(default,'Peixes Co','5513987610000','renoh3389' ,'' ,'peixesco@gmail.com'),
(default,'Filhos da Truta','551892761100','vb3894' ,'' ,'filhosdatruta@gmail.com'),
(default,'Kamehame Peixes','5511922224000','n4op8912' ,'' ,'kamehamepeixes@gmail.com'),
(default,'Truta Olimpica','5511956619000','fbiup238' ,'' ,'trutaolimpica@gmail.com');



-- AS TABELAS Login E Cliente são relacionais, e a tabela Login só recebe os dados para validar o login e senha. (Chave estrangeira)
CREATE TABLE Login (
    idLogin (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(13) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL UNIQUE,
    cnpj CHAR(18)NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE
);

insert into login values
(default,'Fish Company' ,'5511987614433' ,'huwiefh124' ,'' ,'fishcompany@gmail.com'),
(default,,'Peixes Co' ,'5511987614433' ,'renoh3389' ,'' ,'peixesco@gmail.com'),
(default,,'Filhos da Truta' ,'5511987614433' ,'vb3894' ,'' ,'filhosdatruta@gmail.com'),
(default,,'Kamehame Peixes' ,'5511987614433' ,'n4op8912' ,'' ,'kamehamepeixes@gmail.com'),
(default,'Truta Olimpica' ,'5511987614433' ,'fbiup238' ,'', 'trutaolimpica@gmail.com');



CREATE TABLE Arduino (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    empresa INT NOT NULL,
    tanque INT NOT NULL,
    temperatura DECIMAL(4,1)
    );

insert into coletaArduino values
(default ,'Fish Company' ,'2025-08-10 11:30:40',29 ),
(default ,'Peixes Co' ,'2025-07-10 13:40:59',19.5 ),
(default ,'Filhos da Truta' ,'2024-08-10 17:50:33',15.3 ),
(default ,'Kamehame Peixes','2023-01-15 22:22:16',18.9 ),
(default ,'Truta Olimpica' ,'2021-08-30 23:10:31',16 );


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

insert into tanque values 
(default,29 ,10 ,15 ,20 ,100 ,'cultivo' ,true),
(default,19.5 ,10 ,15 ,20 ,30 ,'cultivo' ,false),
(default,15.3 ,10 ,15 ,20 ,50 ,'cultivo' ,true),
(default,18.9 ,15 ,16 ,17 ,10000 ,'crescimento' ,false),
(default,500 ,16 ,15 ,16 ,17 ,4000 ,'crescimento' ,false);