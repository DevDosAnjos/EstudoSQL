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
pessoa_id INT UNSIGNED NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(pessoa_id) REFERENCES pessoas(id) on DELETE CASCADE
);

-- Conferir As tabelas -- 
SELECT * FROM pessoas;
SELECT * FROM computadores;

-- Inserindo Dados Na Tabela pessoa --
INSERT INTO pessoas (nome,cpf)
VALUES ("Nathan","11111111111"),("Gabriel","22222222222"),("Jefferson","33333333333"),("Mario","44444444444"),("Raoni","55555555555");

-- Conferindo A Inserção Dos Dados --
SELECT * FROM pessoas;

-- Inserindo Dados Na Tabela computadores --
INSERT INTO computadores (marca,modelo,pessoa_id)
VALUES ("Acer","Aspire 3",2),("Acer","Aspire 5",5),("Lenovo","ThinkPad",3),("Lenovo","IdeaPad", 4),("Samsung","Samsung Book 2",2);

-- Conferindo A Inserção Dos Dados --
SELECT * FROM computadores;

-- Conferindo,Juntando E Ordenando As Tabelas --
SELECT *
FROM pessoas p
INNER JOIN computadores c on p.id = c.pessoa_id
ORDER BY p.id;