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
    senha VARCHAR(20) NOT NULL,
        CONSTRAINT chkSeguranca
            CHECK (senha NOT LIKE '%123%'),   -- Príncipio de representação de conceitos de segurança relacionado à senha. 
    cnpj CHAR(18)NOT NULL UNIQUE,
    dtCadastro DATE NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

DESC cliente;

INSERT INTO cliente VALUES
	(default,'Fish Company','5511987614433','huwiefh124','10.245.633/0001-13','2025-11-16','fishcompany@gmail.com'),
	(default,'Peixes Co','5513987610000','renoh3389','78.687.100/0001-25','2023-07-17','peixesco@gmail.com'),
	(default,'Filhos da Truta','551892761100','vb3894','66.800.473/0001-81','2021-05-27','filhosdatruta@gmail.com'),
	(default,'Kamehame Peixes','5511922224000','n4op8912','46.668.258/0001-61','2023-12-30','kamehamepeixes@gmail.com'),
	(default,'Truta Olimpica','5511956619000','fbiup238','70.035.407/0001-30','2024-01-01','trutaolimpica@gmail.com'),
	(default,'Como pode um peixe','98572-7465','kdmjs874','86.852.658/0001-80','2025-08-03','peixevivo@outlook.com'),
    (default,'Shark Powder','99325-7863','kfoei987c','52.687.852/0001-95','2025-06-19','sharkpowder@outlook.com')
;

SELECT * FROM cliente;

SELECT concat(senha ,' ', email) AS login FROM cliente
	WHERE dtCadastro > '2023-05-27' ORDER BY empresa DESC;

SELECT empresa, cnpj FROM cliente ORDER BY empresa ASC;
    
SELECT empresa AS 'Nome da empresa',
	CASE
    WHEN telefone NOT LIKE '55_1%' THEN 'Não é de São Paulo - SP'
    ELSE 'É de São Paulo - SP'
    END
    AS 'Tanques localizados em:'
    FROM cliente;

INSERT INTO cliente VALUES
	(default,'Peixes','5511987614324','senha123','10.245.633/1000-12','2025-11-16','empresadopeixe@gmail.com'); -- Exemplo de violação da regra de segurança aplicada. 

SELECT empresa AS 'Nome da empresa',
	CASE
		WHEN dtCadastro <> '2024-01-01' THEN CONCAT(empresa, ' Login: ', cnpj)
		ELSE CONCAT(empresa, ' Contato: ', email)
    END AS InformacaoCliente
FROM cliente ORDER BY dtCadastro DESC;

SELECT empresa AS 'Nome da empresa',
 date_format(dtCadastro, '%d/%m/%Y %h:%m:%s') AS DataCadastro FROM cliente;

SELECT empresa AS 'Nome da Empresa',
	CASE
		WHEN dtCadastro >= '2025-01-01' THEN 'Cliente Novo'
        WHEN dtCadastro BETWEEN '2023-01-01' AND '2024-12-31' THEN 'Cliente Recente'
        WHEN dtCadastro < '2023-01-01' THEN 'Cliente Antigo'
        ELSE 'Cadastro não identificado'
    END AS ClassificacaoCadastro
FROM cliente;



-- AS TABELAS Login E Cliente são relacionais, e a tabela Login só recebe os dados para validar o login e senha. (Chave estrangeira)
CREATE TABLE login (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(13) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL,
    cnpj CHAR(18)NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE
);


insert into login values
	(default,'Fish Company' ,'96817-8615' ,'huwiefh124' ,'10.245.633/0001-13' ,'fishcompany@gmail.com'),
	(default,'Peixes Co' ,'96786-1662' ,'renoh3389' ,'78.687.100/0001-25' ,'peixesco@gmail.com'),
	(default,'Filhos da Truta' ,'97659-7323' ,'vb3894' ,'66.800.473/0001-81' ,'filhosdatruta@gmail.com'),
	(default,'Kamehame Peixes' ,'99256-1461' ,'n4op8912' ,'46.668.258/0001-61' ,'kamehamepeixes@gmail.com'),
	(default,'Truta Olimpica' ,'99287-6462' ,'fbiup238' ,'70.035.407/0001-30', 'trutaolimpica@gmail.com'),
    
    (default,'Como pode um peixe','98572-7465','kdmjs874','86.852.658/0001-80','peixevivo@outlook.com'),
    (default,'Shark Powder','99325-7863','kfoei987c','52.687.852/0001-95','sharkpowder@outlook.com')
;


SELECT concat(senha ,' ', email) AS login FROM cliente
	WHERE dtCadastro > '2023-05-27' ORDER BY empresa DESC;


SELECT email FROM login 
	WHERE email ='gmail';
    
SELECT empresa AS 'Nome da empresa',
 date_format(dtCadastro, '%d/%m/%Y %h:%m:%s') AS DataCadastro FROM cliente;

SELECT empresa AS 'Nome da Empresa',
	CASE
		WHEN dtCadastro >= '2025-01-01' THEN 'Cliente Novo'
        WHEN dtCadastro BETWEEN '2023-01-01' AND '2024-12-31' THEN 'Cliente Recente'
        WHEN dtCadastro < '2023-01-01' THEN 'Cliente Antigo'
        ELSE 'Cadastro não identificado'
    END AS ClassificacaoCadastro
FROM cliente;



CREATE TABLE coletaArduino (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL,
    tanque INT NOT NULL,
    dtColeta datetime,
    temperatura DECIMAL(4,1)
    );

DESC coletaArduino;

INSERT INTO coletaArduino VALUES
	(default,'Fish Company', 1,'2025-08-10 11:30:40', 29),
	(default,'Peixes Co', 1,'2025-07-10 13:40:59', 19.5),
	(default,'Filhos da Truta', 1,'2024-08-10 17:50:33', 15.3),
	(default,'Kamehame Peixes', 1,'2023-01-15 22:22:16', 18.9),
	(default,'Truta Olimpica', 1,'2021-08-30 23:10:31', 16),
    (default,'Como pode um peixe', 1,'2025-08-03 15:10:12', 8),
	(default,'Shark Powder', 1,'2025-06-19 15:10:12', 6.3);
    
SELECT * FROM coletaArduino;

SELECT CONCAT(tanque ,' ', temperatura) AS medidor FROM coletaArduino
	WHERE dtColeta > '2023-05-27' ORDER BY temperatura DESC;
    
SELECT empresa AS 'Nome da empresa',
		tanque AS 'Número do tanque',
		CONCAT('ATENÇÃO!!! A TEMPERATURA DO TANQUE NÚMERO ', tanque, ' ESTÁ ACIMA DO IDEAL (', temperatura, '°C).') AS Aviso
        FROM coletaArduino
        WHERE temperatura > 20;
        -- empresa: tanque X precisa de atenção. temperatura em x graus
SELECT tanque AS 'Número do tanque',
	CONCAT(empresa,': O tanque ',tanque,' precisa de atenção. Temperatura em ',temperatura,' graus.') AS aviso
    FROM coletaArduino
    WHERE temperatura <10 OR temperatura>20;
    
CREATE TABLE tanque (
	idTanque INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(50) NOT NULL,
    tanque INT NOT NULL,
	temperaturaTanque DECIMAL(3,1) NOT NULL,
	temperaturaIdealMinima DECIMAL(3,1) NOT NULL,
	temperaturaMedia DECIMAL(3,1) NOT NULL,
	temperaturaIdealMaxima DECIMAL(3,1) NOT NULL,
	qtdTruta INT NOT NULL, 
	faseTruta VARCHAR(30),
			CONSTRAINT chkFase
				CHECK(faseTruta IN('crescimento','cultivo')),
	periodoFertil BOOLEAN
);

DESC tanque;

INSERT INTO tanque VALUES 
	(default, 'Fish Company', 1, 29, 10, 15, 20, 100, 'cultivo', true),
	(default, 'Peixes Co', 1, 19.5, 10, 15, 20, 30, 'cultivo', false),
	(default, 'Filhos da Truta', 1, 15.3, 10, 15, 20, 50, 'cultivo', true),
	(default, 'Kamehame Peixes', 1, 18.9, 15, 16, 17, 300, 'crescimento', false),
	(default, 'Truta Olimpica', 1, 16, 15, 16, 17, 400, 'crescimento', false),
	(default, 'Como pode um peixe', 1, 18.3, 10, 15, 20, 750, 'cultivo', true),
	(default, 'Shark Powder', 1, 17.6, 15, 16, 17, 83, 'crescimento', false)
    ;
    
    SELECT * FROM tanque;
    
    SELECT * FROM tanque
		WHERE temperaturaMedia < 17 AND temperaturaMedia > 15;
        
	SELECT * FROM tanque
		WHERE faseTruta = "crescimento";
        
	SELECT empresa AS 'Nome da empresa',
			CONCAT('As trutas do tanque número ', tanque, ' estão no período fértil. Mantenha a temperatura por volta dos 10°C.') AS Aviso
            FROM tanque
            WHERE periodoFertil = true
            ORDER BY empresa;


SELECT empresa, tanque, faseTruta as 'Fase',
 CASE
 WHEN periodoFertil = 'true' THEN 'Seus peixes estão em período fértil'
 ELSE 'Seus peixes não estão em período fértil'
 END AS 'Período fértil'
 FROM tanque ORDER BY periodoFertil ASC;
 
 SELECT * FROM tanque
	WHERE faseTruta = "cultivo";

SELECT empresa AS 'Nome da empresa',
	CONCAT('As trutas do tanque número ', tanque, ' não estão no período fértil. Não precisa alterar a temperatura da água') AS Aviso
	FROM tanque
	WHERE periodoFertil = false
	ORDER BY empresa;

SELECT empresa AS 'Nome da empresa', faseTruta as 'fase de crescimento' FROM tanque
	WHERE periodoFertil = false
	AND faseTruta = 'cultivo'
	ORDER BY empresa;
