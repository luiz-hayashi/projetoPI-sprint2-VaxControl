CREATE DATABASE vaxcontrol;

USE vaxcontrol;

CREATE TABLE empresa(
id INT PRIMARY KEY AUTO_INCREMENT,
razao_social VARCHAR(45),
cnpj CHAR(14) UNIQUE,
codigo_ativacao CHAR(6) UNIQUE,
endereco VARCHAR(100)
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
status_ VARCHAR(20),
id_camara INT,
	CONSTRAINT fk_camara FOREIGN KEY (id_camara) REFERENCES camara(id)
);

CREATE TABLE leitura (
id INT PRIMARY KEY AUTO_INCREMENT,
temperatura FLOAT,
momento DATETIME,
id_sensor INT,
	CONSTRAINT fk_camara_leitura FOREIGN KEY (id_sensor) REFERENCES sensor(id)
);

INSERT INTO empresa (razao_social, cnpj, codigo_ativacao, endereco) VALUES
('Farmacêutica Vacinas Brasil Ltda', 01987652301, 'A1B2C3', 'Av. Paulista, 1000 - São Paulo/SP'),
('Laboratório Saúde & Vida S.A.', 98765432100, 'C1B2A3', 'Rua das Flores, 500 - Rio de Janeiro/RJ'),
('Merck Sharp & Dohme Farmacêutica Ltda.', '03560974000118', 'B1C2A3', 'Av. Dr. Chucri Zaidan, 296 - São Paulo/SP');

INSERT INTO usuario (nome, email, senha, id_empresa) VALUES
('Carlos Silva', 'carlos.silva@farmavacina.com', 'senha123', 1),
('Ana Souza', 'ana.souza@saudevida.com', 'senha456', 2),
('Brian Duran', 'brian.duran@msd.com', 'senha789', 3);

INSERT INTO camara (nome, id_empresa) VALUES 
('CAM-01', 1),
('CAM-02', 1),
('CAM-01A', 2),
('CAMA-02A', 2),
('CAM-01B', 3),
('CAM-02B', 3);

INSERT INTO sensor (nome_sensor, status_, id_camara) VALUES 
('XYZ', 'Ativa', 1),
('ABC', 'Ativa', 2),
('RST', 'Ativa', 3),
('DEF', 'Manutenção', 4),
('JKL', 'Ativa', 5),
('GHI', 'Manutenção', 6);



