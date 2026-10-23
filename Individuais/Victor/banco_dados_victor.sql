USE VaxControl;

CREATE TABLE empresa (
id_empresa INT PRIMARY KEY AUTO_INCREMENT,
cnpj CHAR(14) UNIQUE,
razao_social VARCHAR(70) NOT NULL,
codigo_ativacao CHAR(8),
endereco VARCHAR(100),
id_filial INT,  
FOREIGN KEY (id_filial) REFERENCES empresa(id)
);

CREATE TABLE usuario (
id_usuario INT PRIMARY KEY AUTO_INCREMENT, 
nome_completo VARCHAR(70) NOT NULL,
email VARCHAR(60) UNIQUE NOT NULL,
senha VARCHAR(30) NOT NULL,
idempresa INT,
FOREIGN KEY (idempresa) REFERENCES empresa(id) 
);

CREATE TABLE camara (
id_camara INT PRIMARY KEY AUTO_INCREMENT,
nome_camara VARCHAR (45),
idempresa INT,
FOREIGN KEY (idempresa) REFERENCES empresa(id)
);


CREATE TABLE sensor (
id_sensor INT PRIMARY KEY AUTO_INCREMENT,
nome_sensor VARCHAR(45),
status_sensor VARCHAR(20) DEFAULT 'ativo',
CONSTRAINT chStatus CHECK (status_ IN ('ativo', 'inativo', 'manutencao')),
id_camara INT,
FOREIGN KEY (id_camara) REFERENCES camara(id_camara)
);


CREATE TABLE leitura ( 
id INT PRIMARY KEY AUTO_INCREMENT, 
temperatura FLOAT, -- FLOAT POR QUE EU ACREDITO Q É UM DADO FLOAT COMO USAMOS IGUAL NO ARDUINO VALOR PARSE FLOAT
dtRegistros DATETIME DEFAULT CURRENT_TIMESTAMP,
idsensor INT,
FOREIGN KEY (idsensor) REFERENCES sensor(idsensor)
);

SELECT * FROM leitura;