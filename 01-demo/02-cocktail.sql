--CREATE DATABASE invitation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE invitation;
CREATE TABLE personne (
    id int NOT NULL AUTO_INCREMENT,
    prenom varchar(255) not null,
    nom varchar(255) not null,
    age tinyint(1) not null,
    inscription date not null,
    statut boolean,
    membre enum ('membre', 'non membre') not null,
    profil text not null,
    salaire annuel int

) ENGINE=InnoDB;

