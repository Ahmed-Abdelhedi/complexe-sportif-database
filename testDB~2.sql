-- 1. Liste de tous les clients 
PROMPT ==== 1
SELECT  id_client, nom, prenom, email, telephone FROM Client;

-- 2. Terrains disponibles pour le basketball
PROMPT ==== 2
SELECT id_terrain, nom, localisation, tarif_heure 
FROM Terrain WHERE type_terrain = 'Basketball';

-- 3. Réservations confirmées à venir
PROMPT ==== 3
SELECT r.id_reservation, c.nom, c.prenom, t.nom AS terrain, 
       r.date_reservation, r.heure_debut, r.heure_fin
FROM Reservation r
JOIN Client c ON r.id_client = c.id_client
JOIN Terrain t ON r.id_terrain = t.id_terrain
WHERE r.statut = 'Confirme' AND r.date_reservation >= SYSDATE;

-- 4. Promotions actives
PROMPT ==== 4
SELECT id_promotion, description, pourcentage_remise
FROM Promotion
WHERE date_debut <= SYSDATE AND date_fin >= SYSDATE;

-- 5. Moyenne des notes par terrain
PROMPT ==== 5
SELECT t.id_terrain, t.nom, AVG(a.note) AS moyenne_notes
FROM Avis a
JOIN Terrain t ON a.id_terrain = t.id_terrain
GROUP BY t.id_terrain, t.nom;

-- 6. Dépenses totales par client
PROMPT ==== 6
SELECT c.id_client, c.nom, c.prenom, SUM(p.montant) AS total_depense
FROM Paiement p
JOIN Reservation r ON p.id_reservation = r.id_reservation
JOIN Client c ON r.id_client = c.id_client
GROUP BY c.id_client, c.nom, c.prenom;

-- 7. Événements sportifs à venir
PROMPT ==== 7
SELECT id_evenement, nom_evenement, type_sport, date_evenement
FROM Evenement_Sportif
WHERE date_evenement >= SYSDATE
ORDER BY date_evenement;

-- 8. Réservations avec promotion appliquée
PROMPT ==== 8
SELECT r.id_reservation, c.nom, c.prenom, t.nom AS terrain,
       pr.description AS promotion, pr.pourcentage_remise
FROM Reservation r
JOIN Client c ON r.id_client = c.id_client
JOIN Terrain t ON r.id_terrain = t.id_terrain
JOIN Promotion pr ON r.id_promotion = pr.id_promotion;

-- 9. Clients avec abonnements actifs
PROMPT ==== 9
SELECT c.id_client, c.nom, c.prenom, a.type_abonnement, a.duree
FROM Client c
JOIN Abonnement a ON c.id_client = a.id_client
WHERE a.duree > 0;

-- 10. Demandes de support non résolues
PROMPT ==== 10
SELECT s.id_support, c.nom, c.prenom, s.type_demande, s.date_demande
FROM Support_Technique s
JOIN Client c ON s.id_client = c.id_client
WHERE s.statut_demande = 'En cours';

-- 11. Historique des réservations d'un client spécifique (ex: ID=5)
PROMPT ==== 11
SELECT h.id_historique, t.nom AS terrain, h.date_reservation,
       h.heure_debut, h.heure_fin, h.tarif_final
FROM Historique_Reservation h
JOIN Terrain t ON h.id_terrain = t.id_terrain
WHERE h.id_client = 5;

-- 12. Terrains les plus chers
PROMPT ==== 12
SELECT id_terrain, nom, type_terrain, tarif_heure
FROM Terrain
ORDER BY tarif_heure DESC;

-- 13. Responsables et leurs rôles
PROMPT ==== 13
SELECT id_responsable, nom, prenom, role, email
FROM Responsable
ORDER BY role, nom;

-- 14. Abonnements avec promotions associées
PROMPT ==== 14
SELECT a.id_abonnement, a.type_abonnement, p.description AS promotion
FROM Abonnement a
JOIN Abonnement_Promotion ap ON a.id_abonnement = ap.id_abonnement
JOIN Promotion p ON ap.id_promotion = p.id_promotion;

-- 15. Clients avec le plus de points de fidélité
PROMPT ==== 15
SELECT c.id_client, c.nom, c.prenom, f.points_acquis
FROM Client c
JOIN Fidelite f ON c.id_client = f.id_client
ORDER BY f.points_acquis DESC;

-- 16. Réservations annulées
PROMPT ==== 16
SELECT r.id_reservation, c.nom, c.prenom, t.nom AS terrain, r.date_reservation
FROM Reservation r
JOIN Client c ON r.id_client = c.id_client
JOIN Terrain t ON r.id_terrain = t.id_terrain
WHERE r.statut = 'Annule';

-- 17. Paiements par mode de paiement
PROMPT ==== 17
SELECT mode_paiement, COUNT(*) AS nombre_paiements, SUM(montant) AS total
FROM Paiement
GROUP BY mode_paiement;

-- 18. Avis négatifs (note <= 2)
PROMPT ==== 18
SELECT a.id_avis, c.nom, c.prenom, t.nom AS terrain, a.note, a.commentaire
FROM Avis a
JOIN Client c ON a.id_client = c.id_client
JOIN Terrain t ON a.id_terrain = t.id_terrain
WHERE a.note <= 2;

-- 19. Durée moyenne des réservations
PROMPT ==== 19
SELECT AVG(EXTRACT(HOUR FROM (heure_fin - heure_debut))) AS duree_moyenne_heures
FROM Reservation;

-- 20. Terrains sans avis
PROMPT ==== 20
SELECT t.id_terrain, t.nom
FROM Terrain t
LEFT JOIN Avis a ON t.id_terrain = a.id_terrain
WHERE a.id_avis IS NULL;

-- 21. Clients avec réservations mais sans abonnement
PROMPT ==== 21
SELECT DISTINCT c.id_client, c.nom, c.prenom
FROM Client c
JOIN Reservation r ON c.id_client = r.id_client
LEFT JOIN Abonnement a ON c.id_client = a.id_client
WHERE a.id_abonnement IS NULL;

-- 22. Revenus par type de terrain
PROMPT ==== 22
SELECT t.type_terrain, SUM(p.montant) AS revenu_total
FROM Paiement p
JOIN Reservation r ON p.id_reservation = r.id_reservation
JOIN Terrain t ON r.id_terrain = t.id_terrain
GROUP BY t.type_terrain;

-- 23. Promotions expirées
PROMPT ==== 23
SELECT id_promotion, date_fin
FROM Promotion
WHERE date_fin < SYSDATE
ORDER BY date_fin DESC;

-- 24. Réservations par jour de la semaine
PROMPT ==== 24
SELECT TO_CHAR(date_reservation, 'DAY') AS jour_semaine, COUNT(*) AS nombre_reservations
FROM Reservation
GROUP BY TO_CHAR(date_reservation, 'DAY')
ORDER BY nombre_reservations DESC;

-- 25. Clients avec le plus de réservations
PROMPT ==== 25
SELECT c.id_client, c.nom, c.prenom, COUNT(r.id_reservation) AS nombre_reservations
FROM Client c
JOIN Reservation r ON c.id_client = r.id_client
GROUP BY c.id_client, c.nom, c.prenom
ORDER BY nombre_reservations DESC;

-- 26. Événements organisés par chaque responsable
PROMPT ==== 26
SELECT r.id_responsable, r.nom, r.prenom, COUNT(e.id_evenement) AS nombre_evenements
FROM Responsable r
LEFT JOIN Evenement_Sportif e ON r.id_responsable = e.id_responsable
GROUP BY r.id_responsable, r.nom, r.prenom
ORDER BY nombre_evenements DESC;

-- 27. Comparaison tarifs terrains avec/sans promotion
PROMPT ==== 27
SELECT t.nom AS terrain, t.tarif_heure AS tarif_normal,
       t.tarif_heure * (1 - p.pourcentage_remise/100) AS tarif_promotion,
       p.description AS promotion
FROM Terrain t
JOIN Reservation r ON t.id_terrain = r.id_terrain
JOIN Promotion p ON r.id_promotion = p.id_promotion;

-- 28. Clients avec support technique ouvert
PROMPT ==== 28
SELECT DISTINCT c.id_client, c.nom, c.prenom
FROM Client c
JOIN Support_Technique s ON c.id_client = s.id_client
WHERE s.statut_demande = 'En cours';

-- 29. Terrains les plus populaires (nombre de réservations)
PROMPT ==== 29
SELECT t.id_terrain, t.nom, COUNT(r.id_reservation) AS nombre_reservations
FROM Terrain t
LEFT JOIN Reservation r ON t.id_terrain = r.id_terrain
GROUP BY t.id_terrain, t.nom
ORDER BY nombre_reservations DESC;

-- 30. Détails complets des réservations avec toutes les informations
PROMPT ==== 30
SELECT r.id_reservation, 
       c.nom || ' ' || c.prenom AS client,
       t.nom AS terrain, t.type_terrain,
       r.date_reservation, r.heure_debut, r.heure_fin,
       p.montant, p.mode_paiement,
       pr.description AS promotion, pr.pourcentage_remise,
       r.statut
FROM Reservation r
JOIN Client c ON r.id_client = c.id_client
JOIN Terrain t ON r.id_terrain = t.id_terrain
LEFT JOIN Paiement p ON r.id_reservation = p.id_reservation
LEFT JOIN Promotion pr ON r.id_promotion = pr.id_promotion;
