select numero,nome,ativo from banco order by numero;

update banco set ativo = false where numero = 0;
--inicio da transacao que sera desfeita
BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
ROLLBACK;

select numero,nome,ativo from banco where numero = 0;

SELECT id, gerente,nome FROM funcionarios;
--Magno passa a ser funcionario da Beatriz
BEGIN;
UPDATE funcionarios SET gerente = 2 WHERE id = 3;
SAVEPOINT sf_func;--salva a alteracao magno e beatriz
UPDATE funcionarios SET gerente = null;
ROLLBACK TO sf_func;
UPDATE funcionarios SET gerente = 3 WHERE id = 5;--Wagner trabalha para Crenilda
COMMIT;