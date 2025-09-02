CREATE DATABASE truta;

USE truta;

CREATE TABLE cadastro(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50),
email VARCHAR (100),
senha VARCHAR (50),
nomeEmpresa VARCHAR(50),
endereco VARCHAR(100),
cnpj VARCHAR(200),
telefone VARCHAR (50)
);

INSERT INTO cadastro values
	(default, 'Geraldo', 'geraldoProdutor@gamil.truticultor.com', '12345', 'Truta Produtos', 'Rua Rio Niteroi', '09616462000102', '(31) 2332-3173'), 
    (default, 'Miguel', 'miguelPeixes@gmail.truticultor.com', 45678, 'Peixeiro Truta', 'Rua Sorocaba', '88649638000107', '(65) 3643-2696'),
    (default, 'Amanda', 'amandaPeixaria@gmail.truticultora.com', 9101112, 'Pescados amanda', 'Rua Mato Grosso', '44571865000183', '(27) 3657-8158' );
    
SELECT * FROM cadastro;



CREATE TABLE sensor(
id INT PRIMARY KEY AUTO_INCREMENT,
registro DECIMAL(4,2), 
dataRegistro DATETIME
);



INSERT INTO sensor values
	(DEFAULT, 12.69, '2020-03-10 15:50:48'),
    (DEFAULT, 10.45, '2020-01-06 12:34:57'),
    (DEFAULT, 18.04, '2020-06-11 13:53:06');
    
SELECT * FROM sensor;  
    
    
    
CREATE TABLE tanque(
id INT PRIMARY KEY AUTO_INCREMENT,
altura VARCHAR(100),
largura DECIMAL (4,2),
qtdLitros VARCHAR(200),
qtdPeixes INT
);
 
INSERT INTO tanque values
	(DEFAULT, 20.4, 50.00, 500.0 , 900),
	(DEFAULT, 20.4, 50.00, 500.0, 678),
	(DEFAULT, 12.5, 20.60, 300.4, 500);

SELECT * FROM TANQUE;













































































