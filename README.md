# mirauction
## 1. Contexte et Objectifs

**Contexte :**  
Plateforme d’enchères dédiée aux produits CBD, dans laquelle les utilisateurs peuvent s’inscrire, se connecter, participer à des enchères en temps réel (avec timer et notifications) et gérer leur profil personnel.

**Objectifs :**  
- Permettre aux utilisateurs de suivre en temps réel le temps restant avant la fin d’une enchère via un timer.
- Informer les utilisateurs via notifications (e-mail et/ou in-app) sur des événements clés (approche de la fin, victoire, etc.).
- Offrir une interface de gestion de profil permettant à l’utilisateur de modifier ses informations personnelles et de consulter l’historique de ses enchères remportées.

---

## 2. Périmètre du Projet

- **Fonctionnalités Utilisateurs :**  
  - Inscription, connexion.
  - Accès aux enchères avec timer, mises par incréments (1 €, 2 €, 5 €) et notifications.
  - Page profil pour la gestion des informations personnelles et l’affichage des enchères remportées.
- **Gestion des enchères :**  
  - Ouverture/fermeture automatique selon l’horaire défini.
  - Conditions d’enchères (vérification que l’utilisateur n’est pas le dernier enchérisseur).
- **Gestion des lots :** Divers produits CBD avec informations détaillées.
- **Système de notifications et timer :**  
  - Timer dynamique pour le décompte en temps réel.
  - Notifications déclenchées à différents moments (avant fin d’enchère, confirmation de mise, résultat final).

---

## 3. Spécifications Fonctionnelles

### 3.1. Inscription et Authentification
- **Inscription :**  
  - Inscription via pseudo, mot de passe et adresse e-mail.
  - Vérification de l’unicité du pseudo et de l’e-mail.
  - Envoi d’un e-mail de confirmation.
- **Authentification :**  
  - Connexion sécurisée (pseudo/e-mail et mot de passe).
  - Gestion de la récupération de mot de passe.

### 3.2. Accès à la Page d’Enchères
- **Accès sécurisé :**  
  - Seuls les utilisateurs authentifiés peuvent accéder aux enchères.
  - Vérification par session ou token.
- **Affichage des enchères :**  
  - Liste des lots avec dates/heures d’ouverture et de clôture.
  - Affichage du dernier enchérisseur et du montant actuel.

### 3.3. Système d’Enchères
- **Conditions de mise :**  
  - L’enchère ne démarre qu’à l’heure prévue.
  - L’utilisateur ne peut enchérir s’il est déjà le dernier enchérisseur.
- **Montants des mises :**  
  - Incréments fixes de 1 €, 2 € ou 5 €.
- **Gestion du Timer :**  
  - Affichage en temps réel d’un compte à rebours jusqu’à la fin de l’enchère.
  - Actualisation dynamique (via JavaScript et WebSockets ou AJAX).

### 3.4. Notifications
- **Déclencheurs de notifications :**  
  - Avant la fin de l’enchère (alerte quelques minutes avant).
  - Confirmation de la prise en compte d’une enchère.
  - Notification du résultat final (victoire ou non).
- **Modes :**  
  - Notifications par e-mail et notifications in-app.
  - Option d’ajouter des alertes SMS (selon budget et configuration).

### 3.5. Clôture de l’Enchère
- **Processus de clôture :**  
  - Arrêt automatique des mises à l’expiration du timer.
  - Identification et enregistrement du dernier enchérisseur en base de données.
- **Communication :**  
  - Notification immédiate au vainqueur et aux autres participants.

### 3.6. Gestion du Profil Utilisateur (Nouvelle Page Profil)
- **Accès à la page profil :**  
  - Accessible depuis l’interface principale après authentification.
- **Modification des informations personnelles :**  
  - Possibilité de mettre à jour son pseudo, adresse e-mail, mot de passe, etc.
  - Processus de vérification pour chaque modification (par exemple, confirmation par e-mail lors du changement d’adresse).
- **Historique des enchères remportées :**  
  - Affichage d’un tableau ou d’une liste récapitulant les enchères remportées par l’utilisateur.
  - Informations détaillées sur chaque enchère gagnée (lot, montant final, date de l’enchère).
- **Interface conviviale :**  
  - Design épuré et intuitif permettant une gestion simple et rapide du profil.

---

## 4. Spécifications Techniques

### 4.1. Architecture Système
- **Architecture Web :**  
  - Application en mode client-serveur avec API REST pour la communication entre front-end et back-end.
- **Technologies recommandées :**  
  - **Front-end :** HTML, CSS, JavaScript (frameworks tels que React, Vue ou Angular), avec intégration de WebSockets/AJAX pour le timer.
  - **Back-end :** Node.js, Python (Django/Flask), ou PHP (Laravel).
  - **Base de données :** MySQL, PostgreSQL ou autre SGBD relationnel.
- **Mécanisme du Timer et des Notifications :**  
  - Utilisation de WebSockets ou de requêtes AJAX pour actualiser le timer.
  - Intégration d’un système de notifications en temps réel (par exemple, via des services tiers ou une solution custom).

### 4.2. Sécurité
- **Protocoles sécurisés :** HTTPS, stockage sécurisé des mots de passe (hashing + salt).
- **Gestion des sessions :** Tokens ou cookies sécurisés.
- **Protection contre attaques :** Prévention des injections SQL, XSS, et CSRF.

### 4.3. Performance et Scalabilité
- **Temps réel :** Optimisation pour la mise à jour instantanée du timer et des notifications.
- **Scalabilité :** Architecture conçue pour gérer un trafic élevé durant les pics d’enchères.

---

## 5. Spécifications de l’Interface Utilisateur (UI/UX)

- **Design global :** Interface claire, épurée et responsive pour tous les appareils.
- **Page d’enchères :**  
  - Affichage du timer, des lots et des notifications en temps réel.
- **Page profil :**  
  - Accès facile depuis le menu principal.
  - Section d’édition des informations personnelles avec formulaires intuitifs.
  - Affichage clair de l’historique des enchères remportées avec filtres et détails consultables.

---

## 6. Cas d’Utilisation

### 6.1. Inscription et Connexion  
*(Identique aux versions précédentes.)*

### 6.2. Participation à une Enchère
1. L’utilisateur se connecte et accède à la page des enchères.
2. Il consulte le timer pour vérifier le temps restant et place une enchère (1 €, 2 € ou 5 €) si les conditions sont remplies.
3. Le système envoie des notifications à différents moments (confirmation de mise, alerte avant fin, résultat final).

### 6.3. Gestion du Profil Utilisateur (Page Profil)
1. **Accès à la page profil :**  
   - L’utilisateur clique sur le lien "Mon Profil" depuis le menu.
2. **Modification des informations :**  
   - L’utilisateur peut mettre à jour son pseudo, son e-mail, ou son mot de passe.
   - Une confirmation (via e-mail ou interface) est requise pour valider les changements.
3. **Consultation des enchères remportées :**  
   - Affichage d’un historique récapitulatif des enchères gagnées, avec détails (lot, montant final, date).

### 6.4. Clôture de l’Enchère
1. Le timer atteint zéro, arrêtant toute nouvelle mise.
2. Le dernier enchérisseur est enregistré en tant que vainqueur.
3. Une notification est envoyée à l’ensemble des participants, et le vainqueur est mis à jour dans son historique de profil.

---

## 7. Contraintes et Exigences Non Fonctionnelles

- **Sécurité et Confidentialité :** Conformité aux normes (RGPD, etc.) pour la gestion des données personnelles.
- **Disponibilité :** Haute disponibilité durant les périodes d’enchères.
- **Performance :** Réactivité en temps réel pour le timer et les notifications.
- **Maintenance :** Documentation technique complète pour faciliter les évolutions et la maintenance.

---

## 8. Livrables et Planning

- **Livrables :**  
  - Cahier des charges complet et mis à jour incluant la gestion du profil.
  - Maquettes et prototypes intégrant l’ensemble des fonctionnalités (enchères, timer, notifications, et page profil).
  - Code source et documentation technique détaillée.
- **Planning :**  
  - Phase de conception et validation des spécifications.
  - Développement et tests des différentes fonctionnalités.
  - Mise en production selon le planning global du projet.
