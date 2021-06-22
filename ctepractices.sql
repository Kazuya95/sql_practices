select numero,nome from banco;
select banco_numero,numero,nome from agencia;
-- uso de CTE
with tbl_tmp_banco as(
	select numero,nome
	from banco
)
select numero,nome from tbl_tmp_banco;
-- retorna um resultado
with param as (
	select 213 as banco_numero
), tbl_tmp_banco as (
	select numero,nome
	from banco
	join param on param.banco_numero = banco.numero
)
select numero,nome from tbl_tmp_banco;

select banco.numero, banco.nome
from banco
join (
	select 213 as banco_numero
) params on params.banco_numero = banco.numero;

with clientes_e_transacoes as (
	select cliente.nome as cliente_nome,
			tipo_transacao.nome as tipo_transacao_nome,
			cliente_transacoes.valor as tipo_transacao_valor
	from cliente_transacoes
	join cliente on cliente.numero = cliente_transacoes.cliente_numero
	join tipo_transacao on tipo_transacao.id = cliente_transacoes.tipo_transacao_id
)
select cliente_nome,tipo_transacao_nome,tipo_transacao_valor
from clientes_e_transacoes;

with clientes_e_transacoes as (
	select cliente.nome as cliente_nome,
			tipo_transacao.nome as tipo_transacao_nome,
			cliente_transacoes.valor as tipo_transacao_valor
	from cliente_transacoes
	join cliente on cliente.numero = cliente_transacoes.cliente_numero
	join tipo_transacao on tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	join banco on banco.numero = cliente_transacoes.banco_numero 
	and banco.nome ilike '%Itaú%'
)
select cliente_nome,tipo_transacao_nome,tipo_transacao_valor
from clientes_e_transacoes;