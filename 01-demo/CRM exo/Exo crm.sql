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

SELECT client.nom, facture.reference FROM client 
INNER JOIN projet ON client.id = projet.client_id
INNER JOIN devis ON projet.id = devis.projet_id
INNER JOIN facture ON devis.id = facture.devis_id;


--2 - Afficher le nombre de factures par client afficher 0 factures si il n'y a pas de factures

SELECT client.nom, COUNT(facture.reference) FROM client
LEFT JOIN projet ON client.id = projet.client_id
LEFT JOIN devis ON projet.id = devis.projet_id
LEFT JOIN facture ON devis.id = facture.devis_id
GROUP BY client.nom;


--3 - afficher le chiffre d'affaire par client

SELECT client.nom, SUM(facture.total) FROM client
JOIN projet ON client.id = projet.client_id
JOIN devis on projet.id = devis.projet_id
JOIN facture ON devis.id = facture.devis_id
GROUP BY client.nom;


--4 - afficher le CA total

Select SUM(facture.total) FROM client
JOIN projet ON client.id = projet.client_id
JOIN devis on projet.id = devis.projet_id
JOIN facture ON devis.id = facture.devis_id



--5 - afficher la somme des factures en attente de paiement

SELECT SUM(facture.total) FROM client
JOIN projet ON client.id = projet.client_id
JOIN devis on projet.id = devis.projet_id
JOIN facture ON devis.id = facture.devis_id
WHERE facture.date_paiement IS NULL;


--6 - afficher les factures en retard de paiment 30 jours max avec le nombre de jours de retard

SELECT facture.reference , DATEDIFF(curdate(), facture.date_crea)  as jours

FROM client
JOIN projet ON client.id = projet.client_id
JOIN devis on projet.id = devis.projet_id
JOIN facture ON devis.id = facture.devis_id
where facture.date_paiement IS NULL 
OR DAY(facture.date_paiement) > 30;

-- 3e Partie creation du diagram

Table client {
  id integer [pk, not null]
  nom varchar(255) [not null]
}

Table projet {
  id integer [pk, not null]
  client_id INT [not null]
  nom varchar(255) [not null]
}

Table devis {
  id INT [pk, not null]
  version INT [not null]
  reference varchar(10) [not null]
  prix float [not null]
  projet_id INT [not null]

}

Table facture {
  id INT [pk, not null]
  reference varchar(10) [not null]
  info varchar(255) [not null]
  total float [not null]
  date_crea date [not null]
  date_paiement date
  devis_id INt [not null]
}



Ref: "client"."id" < "projet"."client_id"

Ref: "projet"."id" < "devis"."projet_id"

Ref: "devis"."id" < "facture"."devis_id"