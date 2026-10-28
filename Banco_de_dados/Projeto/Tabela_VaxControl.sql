CREATE DATABASE vaxcontrol;

USE VaxControl;

CREATE TABLE empresa(
id INT PRIMARY KEY AUTO_INCREMENT,
razao_social VARCHAR(45),
cnpj CHAR(14) UNIQUE,
endereco VARCHAR(100),
codigo_unico CHAR(6) UNIQUE
);

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45) UNIQUE, 
senha VARCHAR(45),
id_empresa INT,
	CONSTRAINT fk_empresa_usuario FOREIGN KEY (id_empresa) REFERENCES empresa(id)
);

CREATE TABLE camara (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
id_empresa INT,
	CONSTRAINT fk_empresa_camara FOREIGN KEY (id_empresa) REFERENCES empresa(id)
);

CREATE TABLE sensor (
id INT PRIMARY KEY AUTO_INCREMENT,
nome_sensor VARCHAR(45),
status VARCHAR(20),
id_camara INT,
	CONSTRAINT fk_camara FOREIGN KEY (id_camara) REFERENCES camara(id)
);

CREATE TABLE leitura (
id INT PRIMARY KEY AUTO_INCREMENT,
temperatura FLOAT,
momento DATETIME DEFAULT CURRENT_TIMESTAMP,
id_sensor INT,
	CONSTRAINT fk_camara_leitura FOREIGN KEY (id_sensor) REFERENCES sensor(id)
);

CREATE TABLE alerta (
id INT PRIMARY KEY AUTO_INCREMENT,
descricao VARCHAR (50),
id_sensor INT,
id_leitura  INT,
	CONSTRAINT fk_alerta_sensor FOREIGN KEY (id_sensor) REFERENCES sensor(id),
	CONSTRAINT fk_alerta_leitura FOREIGN KEY (id_leitura) REFERENCES leitura(id)
);

INSERT INTO empresa (razao_social, cnpj, codigo_unico, endereco) VALUES
('Merck Sharp & Dohme Farmacêutica Ltda.', '03560974000118', 'B1C2A3', 'Av. Dr. Chucri Zaidan, 296 - São Paulo/SP'),
('Farmacêutica Vacinas Brasil Ltda', 01987652301, 'A1B2C3', 'Av. Paulista, 1000 - São Paulo/SP'),
('Laboratório Saúde & Vida S.A.', 98765432100, 'C1B2A3', 'Rua das Flores, 500 - Rio de Janeiro/RJ');

INSERT INTO usuario (nome, email, senha, id_empresa) VALUES
('Brian Duran', 'brian.duran@msd.com', 'senha789', 3),
('Carlos Silva', 'carlos.silva@farmavacina.com', 'senha123', 1),
('Ana Souza', 'ana.souza@saudevida.com', 'senha456', 2);

INSERT INTO camara (nome, id_empresa) VALUES 
('Câmara 2AB', 1),
('Câmera 3DC', 1),
('Câmara 1FG', 1),
('Câmara 4VX', 1);

INSERT INTO sensor (nome_sensor, status_, id_camara) VALUES 
('Sensor01AB', 'Ativo', 1),
('Sensor02AB', 'Ativo', 1),
('Sensor03AB', 'Ativo', 1),
('Sensor04AB', 'Inativo', 1),
('Sensor01DC', 'Ativo', 2),
('Sensor02DC', 'Ativo', 2),
('Sensor03DC', 'Ativo', 2),
('Sensor04DC', 'Inativo', 2),
('Sensor01FG', 'Ativo', 3),
('Sensor02FG', 'Ativo', 3),
('Sensor03FG', 'Ativo', 3),
('Sensor04FG', 'Inativo', 3),
('Sensor01VX', 'Ativo', 4),
('Sensor02VX', 'Ativo', 4),
('Sensor03VX', 'Ativo', 4),
('Sensor02VX', 'Inativo', 4);

INSERT INTO leitura (temperatura, id_sensor) VALUES
-- Sensor 1: Sensor01AB
(4.5, 1),
(5.2, 1),
(3.8, 1),
(6.1, 1),
(1.5, 1),
(4.9, 1),

-- Sensor 2: Sensor02AB
(3.2, 2),
(4.7, 2),
(5.5, 2),
(6.3, 2),
(7.1, 2),
(8.5, 2),

-- Sensor 3: Sensor03AB
(4.1, 3),
(3.7, 3),
(5.8, 3),
(6.5, 3),
(2.4, 3),
(1.8, 3),

-- Sensor 4: Sensor04AB
(5.0, 4),
(4.3, 4),
(6.2, 4),
(7.4, 4),
(8.7, 4),
(5.6, 4),

-- Sensor 5: Sensor01DC
(3.5, 5),
(4.8, 5),
(5.1, 5),
(6.7, 5),
(7.3, 5),
(4.2, 5),

-- Sensor 6: Sensor02DC
(5.4, 6),
(6.1, 6),
(4.6, 6),
(3.9, 6),
(1.2, 6),
(5.7, 6),

-- Sensor 7: Sensor03DC
(2.8, 7),
(3.6, 7),
(4.9, 7),
(5.5, 7),
(6.4, 7),
(9.1, 7),

-- Sensor 8: Sensor04DC
(4.4, 8),
(5.3, 8),
(6.2, 8),
(7.0, 8),
(3.7, 8),
(5.8, 8),

-- Sensor 9: Sensor01FG
(3.1, 9),
(4.5, 9),
(5.7, 9),
(6.3, 9),
(7.6, 9),
(4.8, 9),

-- Sensor 10: Sensor02FG
(5.2, 10),
(6.4, 10),
(4.1, 10),
(3.5, 10),
(1.7, 10),
(5.9, 10),

-- Sensor 11: Sensor03FG
(2.5, 11),
(3.8, 11),
(4.6, 11),
(5.4, 11),
(6.7, 11),
(8.9, 11),

-- Sensor 12: Sensor04FG
(4.3, 12),
(5.6, 12),
(6.1, 12),
(3.9, 12),
(7.2, 12),
(4.7, 12),

-- Sensor 13: Sensor01VX
(3.4, 13),
(4.8, 13),
(5.5, 13),
(6.2, 13),
(7.1, 13),
(5.0, 13),

-- Sensor 14: Sensor02VX
(4.6, 14),
(5.3, 14),
(6.5, 14),
(3.7, 14),
(1.4, 14),
(5.8, 14),

-- Sensor 15: Sensor03VX
(2.9, 15),
(3.8, 15),
(4.7, 15),
(5.6, 15),
(6.3, 15),
(9.4, 15),

-- Sensor 16: Sensor02VX
(4.2, 16),
(5.1, 16),
(6.0, 16),
(3.6, 16),
(7.4, 16),
(5.5, 16);