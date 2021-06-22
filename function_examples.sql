--funcao somador de inteiros
create or replace function func_somar(integer, integer)
returns integer
security definer
--returns null on null input
called on null input
language SQL
as $$
	-- usar coalesce() para retorna o primeiro valor nao nulo
	select COALESCE($1,0) + COALESCE($2,0);
$$;

select func_somar(1,2);
select func_somar(1,99);
select func_somar(1,null);

-- Em PLPGSQL
CREATE OR REPLACE FUNCTION bancos_add(p_numero INTEGER,p_nome VARCHAR,p_ativo BOOLEAN)
RETURNS INTEGER
SECURITY INVOKER
LANGUAGE PLPGSQL
CALLED ON NULL INPUT
AS $$
DECLARE variavel_id INTEGER;
BEGIN
	IF p_numero IS NULL OR p_nome IS NULL OR p_ativo IS NULL THEN
		RETURN 0;
	END IF;
	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;
	
	IF variavel_id IS NULL THEN
		INSERT INTO banco(numero, nome,ativo)
		values (p_numero, p_nome,p_ativo);
	ELSE
		RETURN variavel_id;
	END IF;
	
	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;
	
	RETURN variavel_id;
END; $$;

--SELECT bancos_add(5432,'Banco Novo', FALSE);
SELECT bancos_add(5433,'Banco Novo', FALSE);
SELECT numero, nome,ativo FROM banco WHERE numero = 5433;
