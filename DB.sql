-- Suppression des tables si elles existent déjà
DROP TABLE Abonnement_Promotion CASCADE CONSTRAINTS;
DROP TABLE Historique_Reservation CASCADE CONSTRAINTS;
DROP TABLE Support_Technique CASCADE CONSTRAINTS;
DROP TABLE Avis CASCADE CONSTRAINTS;
DROP TABLE Evenement_Sportif CASCADE CONSTRAINTS;
DROP TABLE Abonnement CASCADE CONSTRAINTS;
DROP TABLE Fidelite CASCADE CONSTRAINTS;
DROP TABLE Responsable CASCADE CONSTRAINTS;
DROP TABLE Paiement CASCADE CONSTRAINTS;
DROP TABLE Reservation CASCADE CONSTRAINTS;
DROP TABLE Promotion CASCADE CONSTRAINTS;
DROP TABLE Terrain CASCADE CONSTRAINTS;
DROP TABLE Client CASCADE CONSTRAINTS;

-- Création des tables
CREATE TABLE Client (
    id_client NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    prenom VARCHAR2(100),
    email VARCHAR2(150),
    telephone VARCHAR2(20),
    mot_de_passe VARCHAR2(255)
);

CREATE TABLE Terrain (
    id_terrain NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    localisation VARCHAR2(150),
    type_terrain VARCHAR2(50),
    tarif_heure NUMBER(10,2)
);

CREATE TABLE Promotion (
    id_promotion NUMBER PRIMARY KEY,
    description CLOB,
    pourcentage_remise NUMBER(5,2),
    date_debut DATE,
    date_fin DATE
);

CREATE TABLE Reservation (
    id_reservation NUMBER PRIMARY KEY,
    date_reservation DATE,
    heure_debut TIMESTAMP,
    heure_fin TIMESTAMP,
    statut VARCHAR2(50),
    id_client NUMBER,
    id_terrain NUMBER,
    id_promotion NUMBER,
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_terrain) REFERENCES Terrain(id_terrain),
    FOREIGN KEY (id_promotion) REFERENCES Promotion(id_promotion)
);

CREATE TABLE Paiement (
    id_paiement NUMBER PRIMARY KEY,
    montant NUMBER(10,2),
    date_paiement DATE,
    mode_paiement VARCHAR2(50),
    id_reservation NUMBER,
    FOREIGN KEY (id_reservation) REFERENCES Reservation(id_reservation)
);

CREATE TABLE Responsable (
    id_responsable NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    prenom VARCHAR2(100),
    role VARCHAR2(50),
    email VARCHAR2(150),
    mot_de_passe VARCHAR2(255)
);

CREATE TABLE Fidelite (
    id_fidelite NUMBER PRIMARY KEY,
    points_acquis NUMBER,
    avantages CLOB,
    id_client NUMBER,
    FOREIGN KEY (id_client) REFERENCES Client(id_client)
);

CREATE TABLE Abonnement (
    id_abonnement NUMBER PRIMARY KEY,
    type_abonnement VARCHAR2(100),
    tarif NUMBER(10,2),
    duree NUMBER,
    id_client NUMBER,
    FOREIGN KEY (id_client) REFERENCES Client(id_client)
);

CREATE TABLE Evenement_Sportif (
    id_evenement NUMBER PRIMARY KEY,
    nom_evenement VARCHAR2(100),
    date_evenement DATE,
    type_sport VARCHAR2(50),
    description CLOB,
    id_responsable NUMBER,
    FOREIGN KEY (id_responsable) REFERENCES Responsable(id_responsable)
);

CREATE TABLE Avis (
    id_avis NUMBER PRIMARY KEY,
    commentaire CLOB,
    note NUMBER,
    date_avis DATE,
    id_client NUMBER,
    id_terrain NUMBER,
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_terrain) REFERENCES Terrain(id_terrain)
);

CREATE TABLE Support_Technique (
    id_support NUMBER PRIMARY KEY,
    type_demande VARCHAR2(100),
    description CLOB,
    date_demande DATE,
    statut_demande VARCHAR2(50),
    id_client NUMBER,
    id_terrain NUMBER,
    id_responsable NUMBER,
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_terrain) REFERENCES Terrain(id_terrain),
    FOREIGN KEY (id_responsable) REFERENCES Responsable(id_responsable)
);

CREATE TABLE Historique_Reservation (
    id_historique NUMBER PRIMARY KEY,
    date_reservation DATE,
    heure_debut TIMESTAMP,
    heure_fin TIMESTAMP,
    tarif_final NUMBER(10,2),
    id_client NUMBER,
    id_terrain NUMBER,
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_terrain) REFERENCES Terrain(id_terrain)
);

CREATE TABLE Abonnement_Promotion (
    id_abonnement NUMBER,
    id_promotion NUMBER,
    PRIMARY KEY (id_abonnement, id_promotion),
    FOREIGN KEY (id_abonnement) REFERENCES Abonnement(id_abonnement),
    FOREIGN KEY (id_promotion) REFERENCES Promotion(id_promotion)
);
CREATE TABLE Participation (
    id_client NUMBER,
    id_evenement NUMBER,
    PRIMARY KEY (id_client, id_evenement),
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_evenement) REFERENCES Evenement_Sportif(id_evenement)
);


-- Clients
INSERT INTO Client VALUES (1, 'Riou', 'Frederic', 'patrick32@labbe.com', '03 00 13 38 90', 'd(L8q3WJ8u');
INSERT INTO Client VALUES (2, 'Aubry', 'Susan', 'hregnier@chevalier.org', '0809310341', 'Ln$1bdMiYR');
INSERT INTO Client VALUES (3, 'Dupuy', 'Lucie', 'zoe03@gomes.org', '+33 (0)4 39 53 76 72', 'T%2sH4HP&x');
INSERT INTO Client VALUES (4, 'Andre', 'Alice', 'qevrard@voila.fr', '+33 (0)8 08 45 14 62', '0P1tqXZX*x');
INSERT INTO Client VALUES (5, 'Camus', 'Alfred', 'veronique43@guillot.com', '+33 (0)5 71 82 27 82', '%8hTenbFsL');
INSERT INTO Client VALUES (6, 'Pruvost', 'Françoise', 'aimeguerin@rolland.com', '0518347382', '+9I&aSpp%a');
INSERT INTO Client VALUES (7, 'Nicolas', 'Paul', 'elisepons@briand.fr', '+33 8 01 78 10 80', 'N33FGy7n@J');
INSERT INTO Client VALUES (8, 'Collet', 'Martin', 'letellierthomas@girard.fr', '+33 2 08 12 19 13', 'U#&a1S7hB7');
INSERT INTO Client VALUES (9, 'Hamel', 'David', 'kloiseau@legrand.net', '0125135427', 'a!m4Tz)(*(');
INSERT INTO Client VALUES (10, 'Martins', 'Marianne', 'ddeschamps@hotmail.fr', '03 40 05 24 27', '(6dR#aSJ$E');

-- Terrains
INSERT INTO Terrain VALUES (1, 'Terrain 1', 'Valette', 'Basketball', 28.91);
INSERT INTO Terrain VALUES (2, 'Terrain 2', 'Cordier-les-Bains', 'Basketball', 42.0);
INSERT INTO Terrain VALUES (3, 'Terrain 3', 'Goncalves', 'Football', 31.16);
INSERT INTO Terrain VALUES (4, 'Terrain 4', 'Pasquier', 'Football', 74.14);
INSERT INTO Terrain VALUES (5, 'Terrain 5', 'Saint Nathalie', 'Basketball', 26.96);
INSERT INTO Terrain VALUES (6, 'Terrain 6', 'Bouchet', 'Tennis', 22.54);
INSERT INTO Terrain VALUES (7, 'Terrain 7', 'Da Costa', 'Football', 37.49);
INSERT INTO Terrain VALUES (8, 'Terrain 8', 'Boutin', 'Basketball', 68.16);
INSERT INTO Terrain VALUES (9, 'Terrain 9', 'Sainte Augustedan', 'Basketball', 35.91);
INSERT INTO Terrain VALUES (10, 'Terrain 10', 'Bourgeois', 'Basketball', 76.11);

-- Promotions
INSERT INTO Promotion VALUES (1, 'Le pouvoir de louer en toute tranquillité', 15.49, DATE '2025-04-25', DATE '2025-05-25');
INSERT INTO Promotion VALUES (2, 'L''assurance de louer à l''état pur', 19.73, DATE '2025-01-02', DATE '2025-02-01');
INSERT INTO Promotion VALUES (3, 'La liberté de louer de manière efficace', 23.97, DATE '2025-02-10', DATE '2025-03-12');
INSERT INTO Promotion VALUES (4, 'L''assurance d''évoluer sans soucis', 22.45, DATE '2025-03-29', DATE '2025-04-28');
INSERT INTO Promotion VALUES (5, 'L''art de louer autrement', 11.95, DATE '2025-02-25', DATE '2025-03-27');
INSERT INTO Promotion VALUES (6, 'Le pouvoir de changer en toute tranquillité', 28.93, DATE '2025-03-28', DATE '2025-04-27');
INSERT INTO Promotion VALUES (7, 'Le pouvoir de rouler à la pointe', 7.56, DATE '2025-04-08', DATE '2025-05-08');
INSERT INTO Promotion VALUES (8, 'L''art d''atteindre vos buts plus rapidement', 7.42, DATE '2025-03-30', DATE '2025-04-29');
INSERT INTO Promotion VALUES (9, 'L''avantage de louer à l''état pur', 20.09, DATE '2025-01-12', DATE '2025-02-11');
INSERT INTO Promotion VALUES (10, 'L''assurance d''innover à l''état pur', 23.24, DATE '2025-05-18', DATE '2025-06-17');

-- Réservations
INSERT INTO Reservation VALUES (1, DATE '2025-05-08', TIMESTAMP '2025-05-08 14:00:00', TIMESTAMP '2025-05-08 15:00:00', 'Confirme', 9, 5, 10);
INSERT INTO Reservation VALUES (2, DATE '2025-05-24', TIMESTAMP '2025-05-24 17:00:00', TIMESTAMP '2025-05-24 18:00:00', 'Confirme', 2, 1, 10);
INSERT INTO Reservation VALUES (3, DATE '2025-05-15', TIMESTAMP '2025-05-15 12:00:00', TIMESTAMP '2025-05-15 13:00:00', 'Confirme', 4, 2, 6);
INSERT INTO Reservation VALUES (4, DATE '2025-05-18', TIMESTAMP '2025-05-18 15:00:00', TIMESTAMP '2025-05-18 16:00:00', 'Annule', 6, 3, 5);
INSERT INTO Reservation VALUES (5, DATE '2025-05-23', TIMESTAMP '2025-05-23 11:00:00', TIMESTAMP '2025-05-23 12:00:00', 'Annule', 5, 2, 9);
INSERT INTO Reservation VALUES (6, DATE '2025-05-11', TIMESTAMP '2025-05-11 16:00:00', TIMESTAMP '2025-05-11 17:00:00', 'Annule', 4, 3, 7);
INSERT INTO Reservation VALUES (7, DATE '2025-05-25', TIMESTAMP '2025-05-25 12:00:00', TIMESTAMP '2025-05-25 13:00:00', 'Annule', 9, 4, 10);
INSERT INTO Reservation VALUES (8, DATE '2025-05-21', TIMESTAMP '2025-05-21 08:00:00', TIMESTAMP '2025-05-21 09:00:00', 'Confirme', 1, 6, 6);
INSERT INTO Reservation VALUES (9, DATE '2025-05-18', TIMESTAMP '2025-05-18 09:00:00', TIMESTAMP '2025-05-18 10:00:00', 'Confirme', 10, 6, 3);
INSERT INTO Reservation VALUES (10, DATE '2025-06-01', TIMESTAMP '2025-06-01 14:00:00', TIMESTAMP '2025-06-01 15:00:00', 'Annule', 8, 3, 4);

-- Paiements
INSERT INTO Paiement VALUES (1, 31.17, DATE '2025-05-17', 'Cheque', 1);
INSERT INTO Paiement VALUES (2, 66.77, DATE '2025-05-26', 'Especes', 2);
INSERT INTO Paiement VALUES (3, 37.55, DATE '2025-05-09', 'Cheque', 3);
INSERT INTO Paiement VALUES (4, 59.48, DATE '2025-05-04', 'Carte', 4);
INSERT INTO Paiement VALUES (5, 32.23, DATE '2025-05-11', 'Cheque', 5);
INSERT INTO Paiement VALUES (6, 53.77, DATE '2025-05-05', 'Especes', 6);
INSERT INTO Paiement VALUES (7, 50.53, DATE '2025-05-30', 'Cheque', 7);
INSERT INTO Paiement VALUES (8, 40.11, DATE '2025-05-01', 'Cheque', 8);
INSERT INTO Paiement VALUES (9, 77.66, DATE '2025-05-18', 'Cheque', 9);
INSERT INTO Paiement VALUES (10, 47.21, DATE '2025-05-19', 'Especes', 10);

-- Responsables
INSERT INTO Responsable VALUES (1, 'Lejeune', 'Victor', 'Admin', 'francoise23@noos.fr', 'sX6V!9Jx_M');
INSERT INTO Responsable VALUES (2, 'Delmas', 'Amile', 'Coach', 'eric34@orange.fr', '$2oAIYbdO6');
INSERT INTO Responsable VALUES (3, 'Schmitt', 'Suzanne', 'Admin', 'pascalpaul@yahoo.fr', 'bz*2ZXfonS');
INSERT INTO Responsable VALUES (4, 'Diaz', 'Robert', 'Reception', 'robertbesnard@hotmail.fr', '+s^HG+iIC4');
INSERT INTO Responsable VALUES (5, 'Grenier', 'Alphonse', 'Reception', 'wrobert@club-internet.fr', 'glRO8NGx&6');
INSERT INTO Responsable VALUES (6, 'Michel', 'Anaas', 'Coach', 'weissaurelie@pinto.org', '&5GGno&@Rz');
INSERT INTO Responsable VALUES (7, 'Faivre', 'Antoine', 'Reception', 'virginielefebvre@dupuis.com', '6wW3fjOBU)');
INSERT INTO Responsable VALUES (8, 'Allain', 'Marie', 'Admin', 'grenierpenelope@pottier.com', 'JF0DLmrx)n');
INSERT INTO Responsable VALUES (9, 'Chauvet', 'Susan', 'Reception', 'unguyen@bouygtel.fr', 'r6MXCio1^3');
INSERT INTO Responsable VALUES (10, 'Dubois', 'Diane', 'Admin', 'guillotmichelle@camus.net', 'Ok&47UVw+J');

-- Fidélité
INSERT INTO Fidelite VALUES (1, 891, 'monetize dot-com e-services', 1);
INSERT INTO Fidelite VALUES (2, 640, 'embrace dynamic vortals', 2);
INSERT INTO Fidelite VALUES (3, 305, 'embrace viral solutions', 3);
INSERT INTO Fidelite VALUES (4, 861, 'architect compelling niches', 4);
INSERT INTO Fidelite VALUES (5, 654, 'drive front-end platforms', 5);
INSERT INTO Fidelite VALUES (6, 519, 'e-enable dynamic technologies', 6);
INSERT INTO Fidelite VALUES (7, 623, 'enhance bricks-and-clicks ROI', 7);
INSERT INTO Fidelite VALUES (8, 203, 'monetize value-added users', 8);
INSERT INTO Fidelite VALUES (9, 156, 'enable efficient paradigms', 9);
INSERT INTO Fidelite VALUES (10, 382, 'streamline distributed channels', 10);

-- Abonnements
INSERT INTO Abonnement VALUES (1, 'Mensuel', 184.84, 365, 1);
INSERT INTO Abonnement VALUES (2, 'Annuel', 131.04, 30, 2);
INSERT INTO Abonnement VALUES (3, 'Trimestriel', 269.68, 90, 4);
INSERT INTO Abonnement VALUES (4, 'Mensuel', 110.22, 365, 2);
INSERT INTO Abonnement VALUES (5, 'Mensuel', 232.98, 30, 9);
INSERT INTO Abonnement VALUES (6, 'Mensuel', 82.1, 90, 9);
INSERT INTO Abonnement VALUES (7, 'Mensuel', 116.26, 365, 7);
INSERT INTO Abonnement VALUES (8, 'Mensuel', 282.23, 365, 4);
INSERT INTO Abonnement VALUES (9, 'Annuel', 127.93, 365, 6);
INSERT INTO Abonnement VALUES (10, 'Trimestriel', 274.9, 90, 2);

-- Evenements Sportifs
INSERT INTO Evenement_Sportif VALUES (1, 'Evenement 1', DATE '2025-08-03', 'Tennis', 'Abri huit notre echapper.', 2);
INSERT INTO Evenement_Sportif VALUES (2, 'Evenement 2', DATE '2025-08-26', 'Tennis', 'Fuir pere choisir interesser.', 10);
INSERT INTO Evenement_Sportif VALUES (3, 'Evenement 3', DATE '2025-10-20', 'Tennis', 'Surtout inspirer durant.', 10);
INSERT INTO Evenement_Sportif VALUES (4, 'Evenement 4', DATE '2025-07-27', 'Tennis', 'Tempete question savoir.', 2);
INSERT INTO Evenement_Sportif VALUES (5, 'Evenement 5', DATE '2025-11-29', 'Basketball', 'Coup repousser sortir faible.', 1);
INSERT INTO Evenement_Sportif VALUES (6, 'Evenement 6', DATE '2025-07-29', 'Tennis', 'Blanc souvenir chair ignorer.', 1);
INSERT INTO Evenement_Sportif VALUES (7, 'Evenement 7', DATE '2025-08-24', 'Tennis', 'Visible fait teche pauvre.', 9);
INSERT INTO Evenement_Sportif VALUES (8, 'Evenement 8', DATE '2025-07-31', 'Football', 'Existence reserver noire.', 8);
INSERT INTO Evenement_Sportif VALUES (9, 'Evenement 9', DATE '2025-07-25', 'Basketball', 'Vert obeir etroit.', 3);
INSERT INTO Evenement_Sportif VALUES (10, 'Evenement 10', DATE '2025-10-25', 'Basketball', 'Beaux manger fer.', 8);

-- Avis
INSERT INTO Avis VALUES (1, 'Rapidement armer avouer heure.', 2, DATE '2025-05-31', 7, 4);
INSERT INTO Avis VALUES (2, 'Jour hesiter donner rappeler calme gris.', 1, DATE '2025-05-07', 7, 6);
INSERT INTO Avis VALUES (3, 'Poche note mal en dans.', 4, DATE '2025-05-27', 8, 1);
INSERT INTO Avis VALUES (4, 'As courir troisieme refuser réduire eaux cas lettre.', 1, DATE '2025-05-04', 7, 6);
INSERT INTO Avis VALUES (5, 'Completement fidele prendre levre scene riche.', 1, DATE '2025-05-16', 4, 4);
INSERT INTO Avis VALUES (6, 'Forme que haine importer.', 5, DATE '2025-05-29', 3, 7);
INSERT INTO Avis VALUES (7, 'Six moyen mourir presque.', 2, DATE '2025-05-18', 8, 4);
INSERT INTO Avis VALUES (8, 'Eaux francois vers comment trou importer.', 1, DATE '2025-05-29', 9, 2);
INSERT INTO Avis VALUES (9, 'Battre sens dernier noire mais forcer.', 1, DATE '2025-05-01', 2, 4);
INSERT INTO Avis VALUES (10, 'Queue danser rendre avant partager.', 2, DATE '2025-05-27', 8, 8);

-- Support Technique
INSERT INTO Support_Technique VALUES (1, 'Probleme terrain', 'Devenir compagnie chien realite.', DATE '2025-05-26', 'En cours', 3, 7, 1);
INSERT INTO Support_Technique VALUES (2, 'Reclamation', 'Intention parole retirer nommer.', DATE '2025-05-17', 'Resolu', 5, 7, 9);
INSERT INTO Support_Technique VALUES (3, 'Demande info', 'Ou livre inconnu mien.', DATE '2025-06-01', 'En cours', 4, 5, 4);
INSERT INTO Support_Technique VALUES (4, 'Probleme terrain', 'Ligne commun designer haut.', DATE '2025-05-04', 'Resolu', 1, 1, 10);
INSERT INTO Support_Technique VALUES (5, 'Reclamation', 'Bete plan loi agent en type etat.', DATE '2025-05-11', 'En cours', 9, 2, 3);
INSERT INTO Support_Technique VALUES (6, 'Probleme terrain', 'Bande clair hors loup sauvage.', DATE '2025-05-05', 'En cours', 7, 2, 10);
INSERT INTO Support_Technique VALUES (7, 'Probleme terrain', 'Garder foret faveur.', DATE '2025-05-03', 'En cours', 7, 10, 10);
INSERT INTO Support_Technique VALUES (8, 'Demande info', 'Chambre dur sauter pousser.', DATE '2025-05-21', 'Resolu', 4, 6, 4);
INSERT INTO Support_Technique VALUES (9, 'Reclamation', 'Devenir se mensonge.', DATE '2025-05-26', 'En cours', 5, 8, 6);
INSERT INTO Support_Technique VALUES (10, 'Probleme terrain', 'Seconde lever mari parole.', DATE '2025-05-01', 'Resolu', 10, 10, 2);

-- Historique de Réservation
INSERT INTO Historique_Reservation VALUES (1, DATE '2025-03-05', TIMESTAMP '2025-03-05 16:00:00', TIMESTAMP '2025-03-05 17:00:00', 37.05, 5, 3);
INSERT INTO Historique_Reservation VALUES (2, DATE '2025-04-29', TIMESTAMP '2025-04-29 13:00:00', TIMESTAMP '2025-04-29 14:00:00', 90.47, 4, 6);
INSERT INTO Historique_Reservation VALUES (3, DATE '2025-03-19', TIMESTAMP '2025-03-19 10:00:00', TIMESTAMP '2025-03-19 11:00:00', 55.05, 9, 5);
INSERT INTO Historique_Reservation VALUES (4, DATE '2025-04-09', TIMESTAMP '2025-04-09 18:00:00', TIMESTAMP '2025-04-09 19:00:00', 62.32, 9, 5);
INSERT INTO Historique_Reservation VALUES (5, DATE '2025-04-29', TIMESTAMP '2025-04-29 18:00:00', TIMESTAMP '2025-04-29 19:00:00', 28.29, 3, 5);
INSERT INTO Historique_Reservation VALUES (6, DATE '2025-03-08', TIMESTAMP '2025-03-08 09:00:00', TIMESTAMP '2025-03-08 10:00:00', 79.39, 3, 5);
INSERT INTO Historique_Reservation VALUES (7, DATE '2025-03-19', TIMESTAMP '2025-03-19 17:00:00', TIMESTAMP '2025-03-19 18:00:00', 36.85, 6, 4);
INSERT INTO Historique_Reservation VALUES (8, DATE '2025-04-13', TIMESTAMP '2025-04-13 18:00:00', TIMESTAMP '2025-04-13 19:00:00', 88.23, 9, 8);
INSERT INTO Historique_Reservation VALUES (9, DATE '2025-03-17', TIMESTAMP '2025-03-17 08:00:00', TIMESTAMP '2025-03-17 09:00:00', 27.38, 7, 5);
INSERT INTO Historique_Reservation VALUES (10, DATE '2025-03-03', TIMESTAMP '2025-03-03 08:00:00', TIMESTAMP '2025-03-03 09:00:00', 46.68, 3, 5);

-- Abonnement_Promotion
INSERT INTO Abonnement_Promotion VALUES (3, 8);
INSERT INTO Abonnement_Promotion VALUES (9, 7);
INSERT INTO Abonnement_Promotion VALUES (9, 1);
INSERT INTO Abonnement_Promotion VALUES (2, 2);
INSERT INTO Abonnement_Promotion VALUES (3, 9);
INSERT INTO Abonnement_Promotion VALUES (1, 6);
INSERT INTO Abonnement_Promotion VALUES (10, 9);
INSERT INTO Abonnement_Promotion VALUES (3, 7);
INSERT INTO Abonnement_Promotion VALUES (3, 1);
INSERT INTO Abonnement_Promotion VALUES (5, 6);

INSERT INTO Participation (id_client, id_evenement) VALUES (1, 1);
INSERT INTO Participation (id_client, id_evenement) VALUES (2, 2);
INSERT INTO Participation (id_client, id_evenement) VALUES (3, 3);
INSERT INTO Participation (id_client, id_evenement) VALUES (4, 4);
INSERT INTO Participation (id_client, id_evenement) VALUES (5, 5);
INSERT INTO Participation (id_client, id_evenement) VALUES (6, 1);
INSERT INTO Participation (id_client, id_evenement) VALUES (7, 2);
INSERT INTO Participation (id_client, id_evenement) VALUES (8, 3);
INSERT INTO Participation (id_client, id_evenement) VALUES (9, 4);
INSERT INTO Participation (id_client, id_evenement) VALUES (10, 5);
