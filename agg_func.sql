SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;	

SELECT * FROM information_schema.columns where table_name = 'banco';
SELECT column_name,data_type FROM information_schema.columns where table_name = 'banco';

SELECT * FROM cliente_transacoes;
select avg(valor) from cliente_transacoes;--average
select count(numero) from cliente;--count
-- Para ver o numero e o email
select count(numero),email from cliente
where email ilike '%gmail.com' group by email;

select max(numero) from cliente;
select min(numero) from cliente;
select max(valor) from cliente_transacoes;
select min(valor) from cliente_transacoes;

SELECT MAX(valor),tipo_transacao_id FROM cliente_transacoes
GROUP BY tipo_transacao_id;
SELECT MIN(valor),tipo_transacao_id FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT COUNT(id), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
HAVING COUNT(id) > 150;

SELECT SUM(valor)
FROM cliente_transacoes;
SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

