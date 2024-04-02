--CREATE DATABASE invitation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- Contrainte DEFAULT

USE invitation;
CREATE TABLE personne (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    prenom varchar(255) not null,
    nom varchar(255) not null,
    age tinyint(1) not null,
    inscription date not null DEFAULT CURRENT_TIMESTAMP,
    statut tinyint(1) not null DEFAULT 1,
    membre ENUM('membre', 'non membre') not null DEFAULT 'non membre',
    profil text,
    salaire int not null

) ENGINE=InnoDB;

--Test personnes brad pitt et george
INSERT INTO personne (prenom, nom, age, inscription, statut, membre, profil, salaire) VALUES
('BRAD', 'PITT', 60, '1970-01-01', 1, 'non membre', 'fin amateur de degustation d''huitres', '2000000' ),
('GEORGE', 'CLOONEY', 62, '1999-01-01', 1, 'non membre', 'adore le cafe', '4000000'),
('JEAN', 'DUJARDIN', 51, '1994-01-01', 0, 'non membre', 'il se fait souvent couper', '4000000');

--Exo 02 cocktails

SELECT MIN(salaire)
FROM personne

SELECT MAX(salaire)
FROM personne



SELECT nom FROM personne
where salaire = (SELECT MAX(salaire) FROM personne);

SELECT nom FROM personne
where salaire = (SELECT MAX(salaire) FROM personne);



SELECT AVG(salaire) FROM personne;

SELECT COUNT(nom) FROM personne;
SELECT nom FROM personne
where salaire BETWEEN 3000000 AND 6000000;


SELECT UCASE(nom) FROM personne;
SELECT LOWER(prenom) FROM personne;

SELECT * FROM personne
where nom LIKE '%a%'

SELECT * FROM personne 
where salaire LIKE '%2%'