CREATE DATABASE VaxControl;

USE VaxControl;

CREATE TABLE empresa(
id INT PRIMARY KEY AUTO_INCREMENT,
nome_fantasia VARCHAR(70),
razao_social VARCHAR(70) NOT NULL,
cnpj CHAR(14) UNIQUE,
codigo_identificacao CHAR(8),
id_filial INT,
FOREIGN KEY (id_filial) REFERENCES empresa(id)
);

CREATE TABLE usuario (
idusuario INT PRIMARY KEY AUTO_INCREMENT, 
nome_completo VARCHAR(70) NOT NULL,
email VARCHAR(60) UNIQUE NOT NULL,
senha VARCHAR(30) NOT NULL,
idempresa INT,
FOREIGN KEY (idempresa) REFERENCES empresa(id) 
);

CREATE TABLE camara (
id_camara INT PRIMARY KEY AUTO_INCREMENT,
nome_camara VARCHAR (10),
idempresa INT,
FOREIGN KEY (idempresa) REFERENCES empresa(id)
);

CREATE TABLE sensor(
idsensor INT PRIMARY KEY AUTO_INCREMENT,
identificacao CHAR(5),
status_ VARCHAR(20) DEFAULT 'ativo',
CONSTRAINT chStatus CHECK (status_ IN ('ativo', 'inativo', 'concerto')),
id_camara INT,
FOREIGN KEY (id_camara) REFERENCES camara(id_camara)
);

CREATE TABLE leitura( 
id INT PRIMARY KEY AUTO_INCREMENT, 
temperatura FLOAT,
dtRegistros DATETIME DEFAULT CURRENT_TIMESTAMP,
idsensor INT,
FOREIGN KEY (idsensor) REFERENCES sensor(idsensor)
);

CREATE TABLE endereco (
id INT PRIMARY KEY AUTO_INCREMENT,
rua VARCHAR (45),
numero VARCHAR (10),
logradouro VARCHAR(45),
complemento VARCHAR(45),
bairro VARCHAR(45),
cidade VARCHAR(30),
uf CHAR(2),
idempresa INT,
FOREIGN KEY (idempresa) REFERENCES empresa(id)
);