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

/* GRUPO NÃO ACHOU NECESSIDADE DESSA TABELA.
CREATE TABLE camara(
idcamara INT PRIMARY KEY AUTO_INCREMENT,
identificacao VARCHAR(50) NOT NULL,
comprimento_metros DECIMAL (4,2),
temp_minima DECIMAL(4,2) DEFAULT 2.00,
temp_maxima DECIMAL(4,2) DEFAULT 8.00,
idempresa INT,
FOREIGN KEY (idempresa) REFERENCES empresa(id)
);
*/

CREATE TABLE sensor(
idsensor INT PRIMARY KEY AUTO_INCREMENT,
posicao_interna VARCHAR(50),
status_ VARCHAR(20) DEFAULT 'ativo'
CONSTRAINT chStatus CHECK (status_ IN ('ativo', 'inativo', 'concerto')),
idcamara INT,
FOREIGN KEY (idcamara) REFERENCES camara(idcamara)
);


CREATE TABLE leitura( 
id INT PRIMARY KEY AUTO_INCREMENT, 
temperatura DECIMAL(4,2),
dtRegistros DATETIME DEFAULT CURRENT_TIMESTAMP,
idsensor INT,
FOREIGN KEY (idsensor) REFERENCES sensor(idsensor)
);

/*
CRIAR A TABELA ENDEREÇO
QUAIS DADOS COLOCAR?
COM A OPINIÃO DE TODOS

- NOME VARCHAR (45)
- CEP CHAR (8)
- NUMERO VARCHAR (10)
- COMPLEMENTO VARCHAR (50)
- BAIRRO VARCHAR (50)
- CIDADE CHAR (2)
*/