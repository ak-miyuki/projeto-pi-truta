/*
--------------------------------------------------------- Tabelas SQL INDIVIDUAL --------------------------------------------------------- 

													Andreia Miyuki Kubota - RA: 04252014
                                                    
------------------------------------------------------------------------------------------------------------------------------------------                                                    
*/

CREATE DATABASE ProjetoPI;

USE ProjetoPI;

-- ---------------------------------------------------------- TABELA CLIENTE ----------------------------------------------------------

CREATE TABLE cliente (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(40) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL,
    telefone VARCHAR(13) NOT NULL,
    cnpj CHAR(18)NOT NULL UNIQUE
);

DESC cliente;

INSERT INTO cliente VALUES
	(DEFAULT,'Filhos da Truta','filhos.da.truta@email.com','n!aA7wHr','(12)3517-8252','10.245.633/0001-13'),
	(DEFAULT,'Truta e CIA','truta.cia@email.com','Z$Fe4ac5','(31)3680-6219','78.687.100/0001-25'),
	(DEFAULT,'Família Truta','familia.truta@email.com','h4^edX@8','(48)2555-3516','66.800.473/0001-81'),
	(DEFAULT,'Arco-Íris','arco.iris@email.com','Q&FSg79v','(54)3577-3214','46.668.258/0001-61'),
	(DEFAULT,'Salmonadas','trutas.salmonadas@email.com','p6Z^5w6d','(48)3967-6961','70.035.407/0001-30'),
	(DEFAULT,'Batrutinhas','batrutinhas@email.com','n5JxF#2G','(14)2778-5234','61.520.448/0001-20');

SELECT * FROM cliente;

SELECT * FROM cliente 
	WHERE empresa LIKE 'F%';
    
SELECT empresa AS 'Nome da Empresa',
		email AS 'E-mail',
        telefone AS 'Telefone para contato',
        cnpj AS CNPJ
	FROM cliente
        WHERE cnpj NOT LIKE '_6%'
			ORDER BY empresa;

-- ---------------------------------------------------------- TABELA ARDUÍNO ----------------------------------------------------------

CREATE TABLE arduinoTemperatura (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(40) NOT NULL,
    tanque INT NOT NULL,
    temperatura DECIMAL(4,1),
    dtColeta DATETIME
);

DESC arduinoTemperatura;

INSERT INTO arduinoTemperatura VALUES
	(DEFAULT,'Filhos da Truta',1,15.1,'2025-08-14 09:30:54'),
	(DEFAULT,'Filhos da Truta',2,16.4,'2025-08-15 15:34:25'),
	(DEFAULT,'Filhos da Truta',3,18,'2025-08-15 19:57:35'),
    (DEFAULT,'Truta e CIA',1,17.3,'2025-08-15 09:40:45'),
	(DEFAULT,'Truta e CIA',1,24.5,'2025-08-15 09:45:12'),
	(DEFAULT,'Família Truta',1,16.4,'2025-08-16 15:30:10'),
	(DEFAULT,'Família Truta',2,14.4,'2025-08-16 20:46:18'),
	(DEFAULT,'Arco-Íris',1,19.2,'2025-08-17 14:57:45'),
	(DEFAULT,'Salmonadas',1,15.8,'2025-08-18 10:20:55'),
	(DEFAULT,'Salmonadas',2,17.1,'2025-08-19 16:20:55'),
	(DEFAULT,'Batrutinhas',1,21.5,'2025-08-20 15:40:47');
    
SELECT * FROM arduinoTemperatura;

SELECT empresa AS 'Nome da empresa',
		tanque AS 'Número do tanque',
        temperatura AS 'Temperatura do tanque',
        dtColeta AS 'Data da coleta'
	FROM arduinoTemperatura
        ORDER BY dtColeta DESC;

SELECT empresa AS 'Nome da Empresa',
		CONCAT('ATENÇÃO!!! O tanque número ', tanque, ' está com a temperatura ACIMA DO IDEAL (', temperatura, '°C)!!!') AS AVISO
	FROM arduinoTemperatura
        WHERE temperatura > 20 AND dtColeta > '2025-08-17';


-- ---------------------------------------------------------- TABELA TANQUES ----------------------------------------------------------
    
CREATE TABLE tanques (
	idTanque INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(40) NOT NULL,
    tanque INT NOT NULL,
    qtTrutas INT DEFAULT 0,
    fase VARCHAR(20) NOT NULL,
		CONSTRAINT chkfase
			CHECK( fase IN('juvenil','engorda','fértil','-'))
	);

DESC tanques;

INSERT INTO tanques VALUES
	(DEFAULT,'Filhos da Truta',1,300,'juvenil'),
	(DEFAULT,'Filhos da Truta',2,200,'fértil'),
	(DEFAULT,'Filhos da Truta',3,DEFAULT,'-'),
	(DEFAULT,'Truta e CIA',1,310,'juvenil'),
	(DEFAULT,'Truta e CIA',1,250,'engorda'),
	(DEFAULT,'Família Truta',1,200,'juvenil'),
	(DEFAULT,'Família Truta',2,300,'fértil'),
	(DEFAULT,'Arco-Íris',1,190,'engorda'),
	(DEFAULT,'Salmonadas',1,240,'juvenil'),
	(DEFAULT,'Salmonadas',2,150,'fértil'),
	(DEFAULT,'Batrutinhas',1,270,'engorda');
    
SELECT * FROM tanques;

SELECT empresa AS 'Nome da empresa',
		CASE
			WHEN fase = 'juvenil' THEN CONCAT('As trutas do tanque ', tanque, ' estão na fase juvenil, mantenha a temperatura entre 15°C e 17°C.')
			WHEN fase = 'engorda' THEN CONCAT('As trutas do tanque ', tanque, ' estão na fase de engorda, mantenha a temperatura entre 10°C e 20°C.')
			WHEN fase = 'fértil' THEN CONCAT('As trutas do tanque ', tanque, ' estão no período fértil, mantenha a temperatura da água em torno de 10°C.')
			ELSE CONCAT('O tanque ', tanque, ' está vazio.')
		END
		AS 'Recomendação'
    FROM tanques;
    
SELECT empresa AS 'Nome da empresa',
		tanque AS 'Número do tanque',
        qtTrutas AS 'Quantidade de trutas',
        fase AS Fase
	FROM tanques
        WHERE qtTrutas >= 250 AND fase NOT LIKE '%i_'
			ORDER BY tanque;
            
SELECT * FROM tanques
	WHERE idTanque LIKE '1%';
        
