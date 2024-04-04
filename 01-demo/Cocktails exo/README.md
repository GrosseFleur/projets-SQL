# structure

```mysql
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
```
) ENGINE=InnoDB;

# les data
```mysql
INSERT INTO personne (prenom, nom, age, inscription, statut, membre, profil, salaire) VALUES
('BRAD', 'PITT', 60, '1970-01-01', 1, 'non membre', 'fin amateur de degustation d''huitres', '2000000' ),
('GEORGE', 'CLOONEY', 62, '1999-01-01', 1, 'non membre', 'adore le cafe', '4000000'),
('JEAN', 'DUJARDIN', 51, '1994-01-01', 0, 'non membre', 'il se fait souvent couper', '4000000');

```
# exo

```mysql
SELECT MIN(salaire)
FROM personne

SELECT MAX(salaire)
FROM personne

-- Avoir plus gros salaire et plus petit salaire


SELECT nom FROM personne
where salaire = (SELECT MAX(salaire) FROM personne);

SELECT nom FROM personne
where salaire = (SELECT MAX(salaire) FROM personne);

-- Avoir plus gros salaire et plus petit salaire

SELECT * FROM personne 
ORDER BY salaire DESC
LIMIT 1;

SELECT * FROM personne 
ORDER BY salaire ASC
LIMIT 1;


-- Moyenne salaire

SELECT AVG(salaire) FROM personne;


SELECT COUNT(nom) FROM personne;
SELECT nom FROM personne
where salaire BETWEEN 3000000 AND 6000000;

-- Mettre en minuscule ou en majuscule

SELECT UCASE(nom) FROM personne;
SELECT LOWER(prenom) FROM personne;

-- recherche avec condition caractère

SELECT * FROM personne
where nom LIKE '%a%'

SELECT * FROM personne 
where salaire LIKE '%2%'

-- Renommer 

SELECT nom AS blase
FROM personne

-- Tri par age puis nom

SELECT * FROM personne 
WHERE age = (SELECT MAX(age) FROM personne)
ORDER BY nom;

SELECT * FROM personne
ORDER BY age,nom DESC
```