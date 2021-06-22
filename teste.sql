--SELECT numero,nome, ativo from banco;
--SELECT banco_numero,numero,nome FROM agencia;
--SELECT id,nome FROM tipo_transacao;
CREATE TABLE IF NOT EXISTS teste(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS teste;

CREATE TABLE IF NOT EXISTS teste(
	cpf VARCHAR(11) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(cpf)
);

INSERT INTO teste (cpf,nome,created_at)
VALUES ('22344566712', 'Jose Gouveia','2021-06-20 19:51:30') ON CONFLICT (cpf) DO NOTHING;

UPDATE teste SET nome = 'Pedro Alvares' WHERE cpf = '22344566712';
SELECT * FROM teste;