	create database banco;

use banco;

create table banco(
codigo int(1) not null primary key,
nome varchar(15)
);
create table agencia(
cod_banco int(1) not null ,
numeroagencia int(5) ,
endereco varchar(25) ,
primary key (cod_banco,numeroagencia)
);

create table cliente (
cpf varchar(12) not null primary key,
nome varchar(15) ,
sexo char(1),
endereco varchar(25)
);
create table historico(
cpf_cliente varchar(12)    not null,
num_conta int(5) not null,
data_inicio date,
primary key(cpf_cliente,num_conta)
);

create table conta (
numero_conta int(5) not null primary key,
saldo float(9,2),
tipoconta char(1),
num_agencia  int(5) not null
);

create table telefone_cliente (
cpf_cli varchar(12) not null  ,
telefone integer(11)   not null,
primary key(cpf_cli,telefone)
);

ALTER TABLE agencia ADD FOREIGN KEY (cod_banco) REFERENCES banco (Codigo);

alter table historico add foreign key (cpf_cliente) references cliente(cpf);

alter table historico add foreign key(num_conta) references conta(numero_conta);

alter table telefone_cliente add foreign key(cpf_cli) references cliente(cpf);

alter table conta add foreign key(num_agencia) references agencia(numeroagencia);

INSERT INTO `banco`.`agencia` (`cod_banco`, `numeroagencia`, `endereco`) VALUES ('4', '0562', 'Rua JOaquin Teixeira ,1555');
INSERT INTO `banco`.`agencia` (`cod_banco`, `numeroagencia`, `endereco`) VALUES ('1', '3153', 'Av. Marcelino Pires ,1960');

insert into cliente(cpf,nome,sexo,endereco) 
values ('111222333-44', 'Jeniffer B Souza' , 'f' , 'Rua Joaquin Teixeira Alves, 1555'),
			('666777888-99' , 'Caetano K Lima' , 'm', 'Rua Ivinhaema ,879'),
            ('555444777-33', 'Silvia Macedo' , 'f' , 'Rua Estados Unidos ,735');
            
INSERT INTO `banco`.`conta` (`numero_conta`, `saldo`, `tipoconta`, `num_agencia`) VALUES ('86340-2', '763.05', '2', '3153');
INSERT INTO `banco`.`conta` (`numero_conta`, `saldo`, `tipoconta`, `num_agencia`) VALUES ('23584-7', '3879.12', '1', '0562');

INSERT INTO `banco`.`historico` (`cpf_cliente`, `num_conta`, `data_inicio`) VALUES ('111222333-44', '23584-7', '1997-12-1997');
INSERT INTO `banco`.`historico` (`cpf_cliente`, `num_conta`, `data_inicio`) VALUES ('66677788899', '23584-7', '1997-12-17');
INSERT INTO `banco`.`historico` (`cpf_cliente`, `num_conta`, `data_inicio`) VALUES ('55544477733', '86340-2', '2010-11-29');

INSERT INTO `banco`.`telefone_cliente` (`cpf_cli`, `telefone`) VALUES ('111222333-44', '6734227788');
INSERT INTO `banco`.`telefone_cliente` (`cpf_cli`, `telefone`) VALUES ('666777888-99', '67 34239900');

alter table cliente add email varchar(15);

select cpf,endereco from cliente
where nome = 'Paulo A Lima';

select numeroagencia from agencia
where cod_banco ='1';

select numero_conta , num_agencia , cliente.nome from conta
join cliente;

select *from cliente 
where sexo='m';

select agencia.numeroagencia, agencia.endereco , agencia.cod_banco ,banco.codigo , banco.nome 
from agencia join banco
where numeroagencia='0582';

delete from conta where numero_conta = 86340-2;

UPDATE conta
SET num_agencia = 6342
WHERE numero_conta = 86340-2; 

select * from cliente;

UPDATE `banco`.`cliente` SET `email` = 'caetanolima@gmail.com' WHERE (`cpf` = '111222333-44');

select saldo * 1.1 as 'aumenrto'	
 from conta
where numero_conta = 23584-7; 





            