SELECT numero, nome FROM banco;
SELECT count(1) FROM banco;--poderia ser count(id)
SELECT count(1) FROM agencia;
--296 registro
SELECT banco.numero, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

SELECT banco.numero
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
GROUP BY banco.numero;

SELECT count(distinct banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

select banco.numero, banco.nome,agencia.numero,agencia.nome
from banco
left join agencia on agencia.banco_numero = banco_numero;

select agencia.numero,agencia.nome,banco.numero, banco.nome
from agencia
right join banco on banco.numero = agencia.banco_numero;

select banco.numero, banco.nome,agencia.numero,agencia.nome
from banco
full join agencia on agencia.banco_numero = banco.numero;
-- teste com cross join
create table if not exists teste_a(id serial primary key, valor varchar(10));
create table if not exists teste_b(id serial primary key, valor varchar(10));
insert into teste_a (valor) values ('teste1');
insert into teste_a (valor) values ('teste2');
insert into teste_b (valor) values ('testea');
insert into teste_b (valor) values ('testeb');
select tbla.valor,tblb.valor from teste_a tbla
cross join teste_b tblb;

drop table if exists teste_a;
drop table if exists teste_b;

SELECT banco.nome,
	   agencia.nome,
	   conta_corrente.numero,
	   conta_corrente.digito,
	   cliente.nome
from banco
join agencia on agencia.banco_numero = banco.numero
join conta_corrente 
	on conta_corrente.banco_numero = banco.numero 
	and conta_corrente.agencia_numero = agencia.numero
join cliente
	on cliente.numero = conta_corrente.cliente_numero;
		
-- tentar montar algo com as transacoes