create database ProjetoPI; use ProjetoPI; 

create table Cadastros( id int primary key auto_increment,
 nome varchar(50) not null, 
 sobrenome varchar(50) not null, 
 email varchar(50) unique not null, 
 senha varchar(50) not null, 
 telefone decimal(11,0) unique not null, 
cnpj decimal(14,0) unique not null 
); 

insert into Cadastros values
(default, 'Nome 1', 'Sobrenome 1', 'nome1sobrenome1@email.com', 'Senha1', '11999999999', '12345678912345'), 
(default, 'Nome 2', 'Sobrenome 2', 'nome2sobrenome2@email.com', 'Senha2', '11999999992', '12345678912342'),
(default, 'Nome 3', 'Sobrenome 3', 'nome3sobrenome3@email.com', 'Senha3', '11999999993', '12345678912343'); 

desc Cadastros; 

select * from Cadastros; 

create table dadosArduino( 
id int primary key auto_increment, 
temperatura decimal(4,1), 
dia date, hora time,
numTanque int, /* check com limitação de tanques, ex: se existem 3 tanques só 1,2,3 serão aceitos  */
alert  /* se temperatura > x, alert = 1 ou seja ativado*/ 
); 

insert into dadosArduino values (default, '20.5', '2025-01-01', '12:23:10', '1'), (default, '24.6', '2025-12-11', '18:40:01', '2'), (default, '30.1', '2025-02-03', '07:11:07', '3'); 

desc dadosArduino; 

select * from dadosArduino; 

create table Trutas( 
idPeixe int primary key auto_increment,
numTanque int , /* chave instrangeira inteligando tabelas */ 
pesoGramas int,/* as exibindo "gramas" na dashboard */ 
idade date /* = Data atual - data inserida */
); 

insert into Trutas values
(default, 1, 350, '2024-11-10'),
(default, 2, 420, '2025-01-15'),
(default, 3, 280, '2025-03-02');

 