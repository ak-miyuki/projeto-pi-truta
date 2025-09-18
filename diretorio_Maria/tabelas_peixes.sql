use CCOK;
CREATE TABLE cadastro (
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
empresa VARCHAR (300) NOT NULL,
CNPJ VARCHAR (50)NOT NULL,
IE VARCHAR (50)NOT NULL,
estado CHAR (2) NOT NULL,
email VARCHAR (50) NOT NULL,
senha CHAR (8) NOT NULL
);

INSERT INTO cadastro (empresa, CNPJ, IE, estado, email, senha ) VALUES
	('Shark Powder','64.457.668/0001-45','512.930.908.0211','SP', 'suporte@danieleemanuellyconstrucoesme.com.br', '12345678'),
    ('Peixes Atoa','39.816.224/0001-01','852.838.270.784','BH', 'contabil@catarinaealessandraeletronicaltda.com.br', '12345678'),
    ('Trutas Leves Demais', '56.034.304/0001-24', '524.332.499.370', 'ES','qualidade@trutaslevesdemais.com.br','12345678'),
    ('Como pode um peixe vivo', '48.408.364/0001-31', '081.643.741.335', 'AM','comopodeum@peixevivo.com','12345678'),
    ('Nadando entre leões','53.944.185/0001-59','032.025.728.706', 'SC', 'nadandoentretecnico@gmail.com','12345678');
    
SELECT * FROM cadastro;

ALTER TABLE peixe ADD COLUMN telefone VARCHAR (30) NOT NULL; 

CREATE TABLE peixe (
idPeixe INT PRIMARY KEY AUTO_INCREMENT,
temperatura DECIMAL (4,1),
tanque VARCHAR (300),
empresa VARCHAR (300),
dtHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
qtPeixes VARCHAR (2000),
especie VARCHAR (300) CHECK ( especie IN ( 'Arco-íris','Marrom'))
);

ALTER TABLE peixe ADD COLUMN fase VARCHAR (200);

ALTER TABLE peixe ADD CONSTRAINT chkFase
	CHECK (fase IN ( 'Crescimento','Engorda','Reprodução'));


INSERT peixe (temperatura, tanque, empresa, qtPeixes, especie, fase )VALUES 
(10.2,'TANQUE X', 'Shark Powder', '203','Marrom','Crescimento'),
(12.5,'Tanque y', 'Peixes Atoa', '396', 'Arco-íris','Crescimento'),
(18.0,'Tanque G', 'Peixes Atoa', '25', 'Arco-íris','Engorda'),
(11.3,'Tanque EX', 'Trutas Leves Demais', '1250', 'Arco-íris','Reprodução'),
(15.5,'Tanque Solitário','Como pode um peixe vivo', '500', 'Marrom','Reprodução'),
(16.0,'Tanque YK','Nadando entre leões','671', 'Marrom','Engorda');

SELECT * FROM peixe;

CREATE TABLE arduino (
idArduiono INT PRIMARY KEY AUTO_INCREMENT,
temperatura DECIMAL (4,1),
dtHora DATETIME,
cliente VARCHAR (300),
tanque VARCHAR (300)
);

INSERT INTO arduino (temperatura, dtHora, tanque, cliente) VALUES
('18.6', '2025-08-27 16:52:00', 'Tanque solitário', 'Como pode um peixe vivo' ),
('12.0', '2025-08-27 16:52:00', 'tanque X', ' Shark Powder'),
('16.8','2025-08-27 16:52:00', 'Tanque G', 'Peixes Atoa'),
('15.0','2025-08-27 16:52:00', 'Tanque y', 'Peixes Atoa'),
('14.7','2025-08-27 16:52:00', 'Tanque 67', 'Peixes Atoa'),
('13.8','2025-08-27 16:52:00','Tanque YK','Nadando entre leões');






