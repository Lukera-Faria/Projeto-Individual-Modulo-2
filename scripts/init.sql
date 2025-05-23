CREATE TABLE users (
  idUser INTEGER PRIMARY KEY,
  nome VARCHAR(255),
  senha VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE localizacoes (
  idLocalizacao INTEGER PRIMARY KEY,
  nomeLocal VARCHAR(255),
  endereco VARCHAR(255),
  andar VARCHAR(255)
);

CREATE TABLE salas (
  idSala INTEGER PRIMARY KEY,
  nomeSala VARCHAR(255),
  tamanho VARCHAR(255),
  idLocalizacao INTEGER NOT NULL,
  FOREIGN KEY (idLocalizacao) REFERENCES localizacoes(idLocalizacao)
);

CREATE TABLE precos (
  idPreco INTEGER PRIMARY KEY,
  sala_id INTEGER NOT NULL,
  diaSemana VARCHAR(255),
  horaInicio TIME,
  horaFim TIME,
  preco DECIMAL(10,2),
  FOREIGN KEY (sala_id) REFERENCES salas(idSala)
);

CREATE TABLE reservas (
  idReserva INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  sala_id INTEGER NOT NULL,
  status VARCHAR(255),
  data DATE,
  horario TIME,
  preco DECIMAL(10,2),
  FOREIGN KEY (user_id) REFERENCES users(idUser),
  FOREIGN KEY (sala_id) REFERENCES salas(idSala)
);