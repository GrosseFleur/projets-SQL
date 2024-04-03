-- Création de la bdd

CREATE DATABASE crm CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Création des tables

USE crm
CREATE TABLE client(
    id int AUTO_INCREMENT PRIMARY KEY,
    nom varchar(255) not null 
)
ENGINE=InnoDB;
CREATE TABLE projet(
    id int AUTO_INCREMENT PRIMARY KEY,
    client_id int not null,
    nom varchar(255) not null,
    FOREIGN KEY(client_id) REFERENCES client(id)
)
ENGINE=InnoDB;
CREATE TABLE devis(
    id int AUTO_INCREMENT PRIMARY KEY,
    version int not null,
    reference varchar(10) not null,
    prix float not null,
    projet_id int not null,
    FOREIGN KEY(projet_id) REFERENCES projet(id)
ENGINE=InnoDB
)
CREATE TABLE facture(
    id int AUTO_INCREMENT PRIMARY KEY,
    reference varchar(10) not null,
    info varchar(255) not null,
    total float not null,
    date_crea date not null,
    date_paiement date,
    devis_id int not null,
    FOREIGN KEY(devis_id) REFERENCES devis(id)
)
ENGINE=InnoDB


--1 - Afficher toutes les factures avec le nom des clients

SELECT facture, nom FROM client;


--2 - Afficher le nombre de factures par client afficher 0 factures si il n'y a pas de factures


--3 - afficher le chiffre d'affaire par client


--4 - afficher le CA total


--5 - afficher la somme des factures en attente de paiement


--6 - afficher les factures en retard de paiment 30 jours max avec le nombre de jours de retard