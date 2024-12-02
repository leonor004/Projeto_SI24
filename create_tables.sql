CREATE TABLE cliente (
	saldo		 BIGINT,
	data_nasc		 DATE,
	nif		 BIGINT,
	utilizador_nome	 BIGINT,
	utilizador_email	 VARCHAR(512),
	utilizador_password VARCHAR(512),
	PRIMARY KEY(utilizador_email)
);

CREATE TABLE administrador (
	utilizador_nome	 BIGINT,
	utilizador_email	 VARCHAR(512),
	utilizador_password VARCHAR(512),
	PRIMARY KEY(utilizador_email)
);

CREATE TABLE carro (
	matricula			 VARCHAR(512),
	marca				 VARCHAR(512),
	modelo			 VARCHAR(512),
	n_lugares			 INTEGER,
	gasto_dia			 BIGINT,
	administrador_utilizador_email VARCHAR(512) NOT NULL,
	PRIMARY KEY(matricula)
);

CREATE TABLE reserva (
	codigo			 VARCHAR(512),
	data_ini		 TIMESTAMP,
	data_fim		 TIMESTAMP,
	custo			 BIGINT,
	carro_matricula		 VARCHAR(512) NOT NULL,
	cliente_utilizador_email VARCHAR(512) NOT NULL,
	PRIMARY KEY(codigo)
);

CREATE TABLE hist_preco (
	preco_atual			 BIGINT,
	data_alt_hora			 TIMESTAMP,
	administrador_utilizador_email VARCHAR(512),
	carro_matricula		 VARCHAR(512) NOT NULL,
	PRIMARY KEY(data_alt_hora,administrador_utilizador_email)
);

CREATE TABLE hist_disp (
	disponibilidade		 BOOL,
	data_alt_hora			 TIMESTAMP,
	administrador_utilizador_email VARCHAR(512),
	carro_matricula		 VARCHAR(512) NOT NULL,
	PRIMARY KEY(data_alt_hora,administrador_utilizador_email)
);

ALTER TABLE carro ADD CONSTRAINT carro_fk1 FOREIGN KEY (administrador_utilizador_email) REFERENCES administrador(utilizador_email);
ALTER TABLE reserva ADD CONSTRAINT reserva_fk1 FOREIGN KEY (carro_matricula) REFERENCES carro(matricula);
ALTER TABLE reserva ADD CONSTRAINT reserva_fk2 FOREIGN KEY (cliente_utilizador_email) REFERENCES cliente(utilizador_email);
ALTER TABLE hist_preco ADD CONSTRAINT hist_preco_fk1 FOREIGN KEY (administrador_utilizador_email) REFERENCES administrador(utilizador_email);
ALTER TABLE hist_preco ADD CONSTRAINT hist_preco_fk2 FOREIGN KEY (carro_matricula) REFERENCES carro(matricula);
ALTER TABLE hist_disp ADD CONSTRAINT hist_disp_fk1 FOREIGN KEY (administrador_utilizador_email) REFERENCES administrador(utilizador_email);
ALTER TABLE hist_disp ADD CONSTRAINT hist_disp_fk2 FOREIGN KEY (carro_matricula) REFERENCES carro(matricula);

