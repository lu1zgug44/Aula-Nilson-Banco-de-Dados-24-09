/*Criando o Banco de Dados Festa*/
drop database if exists festa;
create database festa;
use festa;

/*Tabela Cliente*/

create table Cliente(
IdCliente int primary key auto_increment,
nomeCliente varchar(50) not null,
email varchar(50) not null
);
insert into Cliente(nomeCliente,email)
values('Luiz','luiz@gmail.com'), ("João","joao@gmail.com");

select * from Cliente;

select * from Cliente where IdCliente = 1;

update cliente set nomeCliente = "Marcos",
					email="marcos@gmail.com"
                    where IdCliente = 1;
                    
delete from cliente where IdCliente = 1;

/*Tabela Endereço*/

create table Endereco(
IdEndereco int primary key auto_increment,
Logradouro varchar(50) not null,
bairro varchar(15) not null,
cep varchar(15) not null
);
-- CRUD
insert into endereco (Logradouro, bairro, cep)
values("Rua 15","Centro","05875-120");
select Logradouro, bairro from endereco;

select * from Endereco;
select * from Endereco where IdEndereco = 1;
Delete from endereco where IdEndereco = 2;
update endereco set Logradouro = "Av. Brasil",
					bairro = "Paulista", cep = '98765-432'
                    where IdEndereco = 1;
/*Tabela Residência*/

create table Residencia(
IdResidencia int primary key auto_increment,
IdCliente int not null,
IdEndereco int not null,
Nome varchar(30) not null,
foreign key(IdCliente) references Cliente(IdCliente),
foreign key(IdEndereco) references Endereco(IdEndereco)
);

insert into Residencia(IdCliente,IdEndereco,nome)
			values(2, 1, "APTO 45, bloco B");
select * from Residencia;
select 
t1.IdResidencia, t2.nomeCliente, t3.Logradouro,
t3.bairro, t3.cep, t1.nome as Complemento, t2.email
from Residencia as t1
inner join cliente as t2 on t1.IdCliente = t2.IdCliente
inner join endereco as t3 on t1.IdEndereco = t3.IdEndereco;



/*Tabela Tema*/

create table Tema(
IdTema int primary key auto_increment,
NomeTema varchar(50) not null
);

/*Tabela Itens Tema*/

create table Itens_Tema(
IdItem int primary key auto_increment,
IdTema int not null,
NomeItem varchar(50) not null,
foreign key (IdTema) references Tema (IdTema)
); -- CRUD -> Create - Read - Update - Delete

create table festa(
IdFesta int primary key auto_increment,
IdCliente int not null,
IdTema int not null,
IdEndereco int not null,
DtFesta date not null,
ValorFesta decimal(10,2) not null
);