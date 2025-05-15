# 🏀 SportCourt - Système de Gestion de Réservation de Terrains Sportifs

## 📋 Description

**SportCourt** est une solution complète pour la gestion de réservation de terrains sportifs. Elle permet aux clients de :
- Réserver des terrains de différents types (basketball, football, tennis, etc.)
- Gérer leurs abonnements
- Bénéficier de promotions
- Consulter leur historique d’activités

## 🏗️ Structure de la Base de Données

Le système repose sur une base de données relationnelle organisée autour des tables principales suivantes :

- **Client** : Informations des clients
- **Terrain** : Gestion des terrains (type, localisation)
- **Reservation** : Suivi des réservations
- **Abonnement** : Programmes d’abonnement
- **Promotion** : Offres et réductions
- **Paiement** : Transactions financières
- **Avis** : Évaluations et feedbacks
- **Evenement_Sportif** : Organisation d’événements
- **Support_Technique** : Assistance aux utilisateurs
- **Fidelite** : Programme de fidélité
- **Responsable** : Gestion du personnel

## 🔍 Fonctionnalités Principales

- Réservation de terrains sportifs
- Gestion des abonnements et des promotions
- Système de paiement multimodal
- Historique des réservations
- Programme de fidélité
- Organisation d’événements sportifs
- Support technique intégré
- Évaluations des terrains
- Reporting et statistiques d’utilisation

## 📊 Requêtes SQL Disponibles

Le fichier `testDB.sql` contient **30 requêtes SQL** prêtes à l’emploi, dont :

1. Liste complète des clients  
2. Terrains disponibles par type de sport  
3. Réservations confirmées à venir  
4. Promotions actives  
5. Moyenne des notes par terrain  
6. Dépenses totales par client  
7. Événements sportifs à venir  
8. Réservations avec promotion appliquée  
9. Clients avec abonnements actifs  
10. Demandes de support non résolues  
11. Historique des réservations par client  
12. Classement des terrains par tarif  
13. Liste des responsables par rôle  
14. Abonnements avec promotions associées  
15. Classement des clients par points de fidélité  
16. Suivi des réservations annulées  
17. Analyse des paiements par méthode  
18. Identification des avis négatifs  
19. Durée moyenne des réservations  
20. Terrains sans évaluation  
21. Clients sans abonnement  
22. Analyse des revenus par type de terrain  
23. Suivi des promotions expirées  
24. Distribution des réservations par jour  
25. Clients les plus actifs  
26. Événements par responsable  
27. Comparaison des tarifs avec/sans promotion  
28. Clients avec demandes de support en cours  
29. Terrains les plus populaires  
30. Détails complets des réservations  

## 🚀 Installation

```bash
# Cloner le dépôt
git clone https://github.com/Ahmed-Abdelhedi/complexe-sportif-database
cd complexe-sportif-database

# Importer la base de données (Oracle)
sqlplus username/password@//host:port/service_name @testDB.sql
