CREATE DATABASE Projeto;

USE Projeto;

CREATE TABLE empresa(
id INT PRIMARY KEY AUTO_INCREMENT,
razao_social VARCHAR(70) NOT NULL,
cnpj CHAR(14) UNIQUE
);

CREATE TABLE usuario (
idusuario INT PRIMARY KEY AUTO_INCREMENT, 
nome_completo VARCHAR(70) NOT NULL,
email VARCHAR(60) UNIQUE NOT NULL,
senha VARCHAR(30) NOT NULL,
cpf CHAR(11) UNIQUE NOT NULL,
acesso VARCHAR(20),
idempresa INT,
CONSTRAINT chCheck CHECK (acesso IN ('administrador', 'suporte', 'normal', 'cliente')),
FOREIGN KEY (idempresa) REFERENCES empresa(id) 
);


CREATE TABLE sensor(
idsensor INT PRIMARY KEY AUTO_INCREMENT,
identificacao VARCHAR(50) NOT NULL,
status_ VARCHAR(20) DEFAULT 'ativo'
CONSTRAINT chStatus CHECK (status_ IN ('ativo', 'inativo', 'concerto')),
idempresa INT,
FOREIGN KEY (idempresa) REFERENCES empresa(id)
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
nome VARCHAR (45),
cep CHAR(8),
numero VARCHAR (10),
idempresa INT,
FOREIGN KEY (idempresa) REFERENCES empresa(id)
);