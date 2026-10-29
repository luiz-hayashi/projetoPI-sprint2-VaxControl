CREATE DATABASE VaxControl;
DROP DATABASE VaxControl;
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
nome VARCHAR(45),
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
('Câmara A', 1),
('Câmera B', 1),
('Câmara C', 1),
('Câmara D', 1);

INSERT INTO sensor (nome, status, id_camara) VALUES 
('Sensor01-A', 'Ativo', 1),
('Sensor02-A', 'Ativo', 1),
('Sensor03-A', 'Ativo', 1),
('Sensor04-A', 'Inativo', 1),
('Sensor01-B', 'Ativo', 2),
('Sensor02-B', 'Ativo', 2),
('Sensor03-B', 'Ativo', 2),
('Sensor04-B', 'Inativo', 2),
('Sensor01-C', 'Ativo', 3),
('Sensor02-C', 'Ativo', 3),
('Sensor03-C', 'Ativo', 3),
('Sensor04-C', 'Inativo', 3),
('Sensor01-D', 'Ativo', 4),
('Sensor02-D', 'Ativo', 4),
('Sensor03-D', 'Ativo', 4),
('Sensor04-D', 'Inativo', 4);

INSERT INTO leitura (temperatura, id_sensor) VALUES
-- Sensor 1: Sensor01-A
(4.5, 1),
(5.2, 1),
(3.8, 1),
(6.1, 1),
(1.5, 1),
(4.9, 1),

-- Sensor 2: Sensor02-A
(3.2, 2),
(4.7, 2),
(5.5, 2),
(6.3, 2),
(7.1, 2),
(8.5, 2),

-- Sensor 3: Sensor03-A
(4.1, 3),
(3.7, 3),
(5.8, 3),
(6.5, 3),
(2.4, 3),
(1.8, 3),

-- Sensor 4: Sensor04-A
(5.0, 4),
(4.3, 4),
(6.2, 4),
(7.4, 4),
(8.7, 4),
(5.6, 4);

SELECT temperatura AS 'Temperatura',  DATE_FORMAT(momento, '%d/%m/%Y %H:%i:%s') AS 'Data e hora da leitura', 
s.nome AS 'Identificação do sensor', c.nome AS 'Identificação da câmara',
e.razao_social AS 'Empresa '
FROM leitura AS l
INNER JOIN sensor AS s ON l.id_sensor = s.id
INNER JOIN camara AS c ON c.id = s.id_camara
INNER JOIN empresa AS e ON e.id = c.id_empresa;