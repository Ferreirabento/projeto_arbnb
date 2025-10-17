-- SQL script para o Projeto Airbnb--
use projeto_airbnb;

-- Criação da tabela listings
SELECT * FROM listings;

-- Criação da tabela dataset--
CREATE TABLE dataset(
    id_dataset INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    visinhanca Text,
    preco int
);

-- Inserção dos dados na tabela dataset--
INSERT INTO dataset (visinhanca, preco)
SELECT neighbourhood, AVG(price) FROM listings
GROUP BY neighbourhood;

-- Consulta para verificar os dados inseridos na tabela dataset--
SELECT * from dataset;


-- transformação dos dados na tabela dataset para csv--
