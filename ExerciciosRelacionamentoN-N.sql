-- Criação Da Tabela pessoas --
CREATE TABLE pessoas(
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf VARCHAR(11) NOT NULL UNIQUE,
PRIMARY KEY(id)
);
-- Criação Da Tabela computadores --
CREATE TABLE computadores(
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
marca VARCHAR(50) NOT NULL,
modelo VARCHAR(50) NOT NULL,
pessoa_id INT UNSIGNED,
PRIMARY KEY(id),
FOREIGN KEY(pessoa_id) REFERENCES pessoas(id) on DELETE CASCADE
);
-- Criação Da Tabela pessoas_computadores --
CREATE TABLE pessoas_computadores(
pessoas_id INT UNSIGNED NOT NULL,
computadores_id INT UNSIGNED NOT NULL,
FOREIGN KEY (pessoas_id) REFERENCES pessoas(id),
FOREIGN KEY (computadores_id) REFERENCES computadores(id),
PRIMARY KEY(pessoas_id,computadores_id)
);
-- Conferir As tabelas -- 
SELECT * FROM pessoas;
SELECT * FROM computadores;
SELECT * FROM pessoas_computadores;

-- Inserindo Dados Na Tabela pessoa --
INSERT INTO pessoas (nome,cpf)
VALUES ("Nathan","11111111111"),("Gabriel","22222222222"),("Jefferson","33333333333"),("Mario","44444444444"),("Raoni","55555555555");

-- Conferindo A Inserção Dos Dados --
SELECT * FROM pessoas;

-- Inserindo Dados Na Tabela computadores --
INSERT INTO computadores (marca,modelo)
VALUES ("Acer","Aspire 3"),("Acer","Aspire 5"),("Lenovo","ThinkPad"),("Lenovo","IdeaPad"),("Samsung","Samsung Book 2");

-- Conferindo A Inserção Dos Dados --
SELECT * FROM computadores;

-- Inserindo Dados Na Tabela pessoas_computadores --
INSERT INTO pessoas_computadores(pessoas_id,computadores_id)
VALUES (1,1),(1,2),(1,3),(2,3),(2,4),(2,5),(3,1),(3,3),(4,2),(4,5),(4,1),(5,2),(5,3),(5,5);

-- Conferindo A Inserção Dos Dados --
SELECT * FROM pessoas_computadores;

-- Conferindo E Juntando As Tabelas --
SELECT p.id as IDP, p.nome as Nome, p.cpf as CPF, c.id as IDC, c.marca as Marca, c.modelo as Modelo, pc.computadores_id as IDPC, pc.pessoas_id as IDPP
FROM pessoas p, computadores c, pessoas_computadores pc
WHERE p.id = pc.pessoas_id and c.id = pc.computadores_id;
