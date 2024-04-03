-- création database

CREATE DATABASE zoo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Création table chat
USE zoo;
CREATE table chat(
    id int AUTO_INCREMENT PRIMARY KEY,
    nom varchar(255) not null,
    yeux varchar(255) not null,
    age tinyint(1) not null
)
ENGINE=InnoDB

-- Ajout des données

INSERT INTO chat (nom, yeux, age) VALUES
('maine coon', 'marron', 20),
('siamois', 'bleu', 15),
('bengal', 'marron', 18),
('Scottish Fold', 'marron', 10);

-- affichage des données

SELECT nom FROM chat
WHERE id=2

-- tri nom age
SELECT * FROM chat
ORDER BY nom, age

-- chats entre 11 et 19

SELECT * FROM chat
WHERE age > 11 AND age < 19

-- nom chats "sia"

SELECT * FROM chat
WHERE nom like "%ia%"

-- moyenne age des chats

SELECT AVG(age) FROM chat

-- nombre de chats 

SELECT COUNT(*) FROM chat