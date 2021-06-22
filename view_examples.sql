select numero, nome, ativo
from banco;

create or replace view vw_bancos as (
	select numero,nome,ativo
	from banco
);

select numero, nome, ativo from vw_bancos; -- 180ms, 151 rows

create or replace view vw_bancos_2 (banco_numero,banco_nome,banco_ativo) as(
	select numero,nome,ativo
	from banco
);
select banco_numero, banco_nome, banco_ativo from vw_bancos_2; -- 180ms, 151 rows

insert into vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
values (51,'Banco Boa Ideia', TRUE);

select banco_numero, banco_nome, banco_ativo from vw_bancos_2 
where banco_numero = 51;

update vw_bancos_2 SET banco_ativo = FALSE where banco_numero = 51;
delete from vw_bancos_2 where banco_numero = 51;
-- valido so nesta guia
create or replace temporary view vw_agencia as (
	select nome from agencia
);
select nome from vw_agencia;

create or replace view vw_bancos_ativos as (
	select numero,nome,ativo
	from banco
	where ativo is TRUE
) WITH local check option; -- da erro
insert into vw_bancos_ativos (numero,nome,ativo)
values (51,'Banco boas Ideias', FALSE);

create or replace view vw_bancos_com_a as (
	select numero,nome,ativo
	from vw_bancos_ativos
	where nome ilike 'a%'
) WITH local check option;
select numero,nome,ativo from vw_bancos_com_a;

insert into vw_bancos_com_a values (333,'Alpha Omega', true);
insert into vw_bancos_com_a values (331,'Alpha Gamma', false);
--permitir que Aplpha Gamma seja adicionada
create or replace view vw_bancos_ativos as (
	select numero,nome,ativo
	from banco
	where ativo is TRUE
);