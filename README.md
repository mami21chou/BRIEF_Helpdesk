Helpdesk Console – Gestion de tickets (Python / MySQL / bcrypt)

Contexte

Dans un centre de formation, les demandes techniques arrivent par téléphone, email ou WhatsApp.
Elles se perdent facilement et ne sont pas suivies correctement.
L’objectif est donc de créer une application console permettant de centraliser et suivre toutes les demandes.


Objectifs du projet

  Sécuriser l’accès avec authentification
  Hacher les mots de passe avec bcrypt
  Associer chaque ticket à son créateur
  Empêcher un utilisateur de voir les tickets d’un autre
  Assurer la persistance des données avec MySQL



Technologies utilisées

  Python
  MySQL
  Bibliothèque bcrypt
  Requêtes SQL préparées



Fonctionnalités

Authentification

Inscription (nom, email unique, mot de passe haché)
Connexion sécurisée
Déconnexion

Gestion des tickets

Apprenant :

  Créer un ticket (titre, description, urgence)
  Voir l’état de ses tickets

Administrateur :

 Lister tous les tickets
 Modifier le statut (En attente, En cours, Résolu)


Structure de la base de données

-Utilisateurs

  id_user
  nom
  email
  password (haché)
  role

-Tickets

  id_ticket
  titre
  description
  niveau
  etat
  id_user (clé étrangère)

Chaque ticket appartient obligatoirement à un utilisateur.



Sécurité

- Aucun mot de passe stocké en clair
- Accès interdit sans connexion
- Isolation des données entre utilisateurs
- Requêtes préparées contre l’injection SQL



Scénario de test

1. Inscription
2. Connexion
3. Création d’un ticket
4. Déconnexion
5. Tentative d’accès par un autre utilisateur(Résultat attendu : accès refusé aux tickets d’autrui.)
6-Tentative d’accès par l'admin(accès autorise avec possibilite de changer l'etat du ticket)




Compétences mobilisées

- Conception base de données relationnelle
- Authentification sécurisée
- Manipulation CRUD SQL
- Gestion des rôles


Geste professionnel réalisé

Sécurisation d’une application métier et structuration des données pour assurer la traçabilité des demandes et la confidentialité des utilisateurs.


