<h1 align="center">🎯 Jeu : SQL Police Department </h1>

<p align="center">
  <a href="https://sqlpd.com" target="_blank">🎮 Lien du jeu : Ici </a><br>
  <strong>Langue :</strong> Anglais<br>
  <strong>Nombre de niveaux :</strong> <em> 6 / ? </em><br>
  <strong>Explication :</strong> <em>À ajouter</em>
</p>

<hr>

<h2 align="center">🏁 Mission 1 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission – Résumé Confidentiel -

Les serveurs d’un site illégal ont été saisis lors d’une opération récente.
Votre tâche consiste à soumettre les détails de tous les utilisateurs présents sur ces serveurs.

---

<h3>💡 Solution SQL : </h3>

```sql

-- Étape 1 : Identifier tout les utilisateurs 

SELECT *
FROM users ;

```

---

<h2 align="center">🏁 Mission 2 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission – Résumé Confidentiel -

Les serveurs d’un site illégal ont été saisis lors d’une opération récente.
Veuillez soumettre les détails de tous les utilisateurs.

---

<h3>💡 Solution SQL : </h3>

```sql

-- Étape 1 : Identifier tout les utilisateurs 

SELECT *
FROM users ;

```

---

<h2 align="center">🏁 Mission 3 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission – Résumé Confidentiel -

Une liste de diffusion appartenant à un service en ligne illégal a été transmise à la ligne directe du SQLPD.
Veuillez soumettre les détails de tous les enregistrements, incluant les dates d’inscription et les adresses e-mail.

---

<h3>💡 Solution SQL : </h3>

```sql

-- Étape 1 : Identifier tout les adresses mails et la date de demarrage du poste

SELECT EmailAdress, Joined
FROM mailing_list ;

```

---

<h2 align="center">🏁 Mission 4 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission – Résumé Confidentiel -

Une liste de diffusion d’un service en ligne illégal a été transmise à la ligne directe du SOLPD.
Veuillez soumettre les détails de tous les enregistrements, incluant les adresses e-mail et les noms de famille.

---

<h3>💡 Solution SQL : </h3>

```sql

-- Étape 1 : Identifier tout les adresses mails et les noms de familles

SELECT Surname, Email
FROM mailing_list;

```

---

<h2 align="center">🏁 Mission 5 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission – Résumé Confidentiel -

Une liste de diffusion d’un service en ligne illégal a été envoyée à la ligne directe du SQLPD. Veuillez soumettre les noms de famille de tous les enregistrements. Assurez-vous qu’il n’y ait pas de doublons.

---

<h3>💡 Solution SQL : </h3>

```sql

-- Étape 1 : Identifier tout les noms de famille en utilisant Distinct pour ne pas avoir de doublons

SELECT DISTINCT LastName
FROM mailing_ list; |

Resultat :

/*****************************************************************************************************

| LastName |
|----------|
|   Adams  |
| Alexander|
|   Allen  |
| Anderson | 
|  Bailey  |

*****************************************************************************************************\

J'ai montre uniquement les 5 premiers

 INTERPRÉTATION :
  - Pour un meilleur visuel j'ai pris exemple sur la fonction .head() de python et j'ai limite a 5 au lieu de 20 normalement


```

---

<h2 align="center">🏁 Mission 6 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission – Résumé Confidentiel -

Les serveurs d’un site illégal ont été saisis lors d’une opération récente. Veuillez soumettre les détails de tous les utilisateurs, triés par nom de famille par ordre croissant.

---

<h3>💡 Solution SQL : </h3>

```sql

-- Étape 1 : Identifier tout les tout les details utilisateurs par ordre croissant via le mnom de famille

SELECT *
FROM users
ORDER BY Surname ASC; |

Resultat :

/*****************************************************************************************************

|GivenName|  Surname |         EmailAddress       |  Access  | Time|Downloads|
|---------|----------|----------------------------|----------|-----|---------|				
| Doris   |	Adams    |adamsd@icloud.com           |11/11/2025|10:38|    84   |
| Jonathan|	Adams    |adams.jonathan1972@yahoo.com|24/10/2025|07:38|    95   |  
| Diana   |	Adams    |adiana@gmail.com            |01/11/2025|17:28|    19   |
| Martha  | Alexander|amartha@hotmail.com	      |28/10/2025|23:05|    41   |
| Bradley |	Alexander|alexander.bradley@gmail.com |25/09/2025|02:53|    67   |

*****************************************************************************************************\

J'ai montre uniquement les 5 premiers

 INTERPRÉTATION :
  - Pour un meilleur visuel j'ai pris exemple sur la fonction .head() de python et j'ai limite a 5 au lieu de 20 normalement


```

---

IN PROGRESS
