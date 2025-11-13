<h1 align="center">🎯 Jeu : SQL Police Department </h1>

<p align="center">
  <a href="https://sqlpd.com" target="_blank">🎮 Lien du jeu : Ici </a><br>
  <strong>Langue :</strong> Anglais<br>
  <strong>Nombre de niveaux :</strong> <em> 10 </em><br>
  
  <strong>Explication :</strong> 
  
>  SQL Police Department — jeu de simulation où on va enquêter sur des bases de données fictives pour retrouver des indices et reconstituer des preuves.

> On pose nos requêtes SQL, on vérifie la provenance des preuves et prends des décisions d’enquête — pour nous permettre de trouver la solution a nos differents problemes.

> Le jeu est composé de 10 niveaux .

</p>

<hr>

<h2 align="center">🏁 Mission 1 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Les serveurs d’un site illégal ont été saisis lors d’une opération récente.
Votre tâche consiste à soumettre les détails de tous les utilisateurs présents sur ces serveurs.

---

<h3>💡 Solution SQL : </h3>

```sql

SELECT *
FROM users ;


Resultat :

*****************************************************************************************************

FirstName | FamilyName | Email                        | Joined     | Children
----------+------------+------------------------------+------------+---------
Emily     | Simmons    | simmonse@hotmail.com         | 2024-11-09 | 0
Andrew    | Edwards    | edwardsa@me.com              | 2024-12-03 | 0
Nathan    | Scott      | scott.nathan@googlemail.com  | 2022-12-27 | 2
Jose      | Mitchell   | mitchellj989@hotmail.com     | 2022-11-24 | 2
Michelle  | Watson     | michelle.watson@gmail.com    | 2023-05-29 | 2

*****************************************************************************************************

```

---

<h2 align="center">🏁 Mission 2 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Une liste de diffusion d’un service en ligne illégal a été envoyée à la ligne directe du SQLPD.
Veuillez soumettre les détails de toutes les entrées.

---

<h3>💡 Solution SQL : </h3>

```sql

SELECT *
FROM mailing_list ;


Resultat :

*****************************************************************************************************

FirstName  | FamilyName | Email                       | Joined     | PassChangeCount
-----------+------------+-----------------------------+------------+----------------
Paul       | Turner     | tpaul1974@gmail.com         | 2024-08-24 | 7
Kevin      | Young      | kevin.young1987@gmail.com   | 2024-07-02 | 6
Ethan      | Parker     | parker.ethan@googlemail.com | 2025-07-08 | 10
Philip     | Baker      | bphilip@gmail.com           | 2024-07-29 | 0
Billy      | Martinez   | mbilly@yahoo.com            | 2025-07-14 | 0


*****************************************************************************************************

```

---

<h2 align="center">🏁 Mission 3 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Une liste de diffusion appartenant à un service en ligne illégal a été transmise à la ligne directe du SQLPD.
Veuillez soumettre les détails de tous les enregistrements, incluant les dates d’inscription et les adresses e-mail.

---

<h3>💡 Solution SQL : </h3>

```sql

SELECT EmailAdress, Joined
FROM mailing_list ;


Resultat :

*****************************************************************************************************

Email                       | Joined
----------------------------+------------
tpaul1974@gmail.com         | 2024-08-24
kevin.young1987@gmail.com   | 2024-07-02
parker.ethan@googlemail.com | 2025-07-08
bphilip@gmail.com           | 2024-07-29
mbilly@yahoo.com            | 2025-07-14


*****************************************************************************************************

```

---

<h2 align="center">🏁 Mission 4 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Un hacker « white hat » (hacker éthique) a transmis à la SQLPD les détails des abonnés exposés d’un site louche lié à diverses personnes d’intérêt.
Veuillez soumettre les noms d’utilisateur, les mots de passe hachés et les noms complets de tous les abonnés.

---

<h3>💡 Solution SQL : </h3>

```sql

SELECT Username, HashedPassword, FullName
FROM subscribers;


Resultat :

*****************************************************************************************************

Username         | HashedPassword             | FullName
-----------------+----------------------------+---------------
young.donna2007  | d56l ea39c3fle43f6dc7      | Donna Young
mary!            | 3ec7a|2cf0 If |95260a      | Mary Lee
clark.denise     | 7c20876360bf046|6de        | Denise Clark
garcia.evelyn    | За99aca8279c3a3d8f9e       | Evelyn Garcia
nancy.hall380    | 5dbOffe02b155e7224fd       | Nancy Hall


*****************************************************************************************************

```

---

<h2 align="center">🏁 Mission 5 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Une liste de diffusion d’un service en ligne illégal a été envoyée à la ligne directe du SQLPD. Veuillez soumettre les noms de famille de tous les enregistrements. Assurez-vous qu’il n’y ait pas de doublons.

---

<h3>💡 Solution SQL : </h3>

```sql

SELECT DISTINCT LastName
FROM mailing_ list; 

Resultat :

*****************************************************************************************************

| LastName |
|----------|
|   Adams  |
| Alexander|
|   Allen  |
| Anderson | 
|  Bailey  |

*****************************************************************************************************

```

---

<h2 align="center">🏁 Mission 6 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Les serveurs d’un site illégal ont été saisis lors d’une opération récente. Veuillez soumettre les détails de tous les utilisateurs, triés par nom de famille par ordre croissant.

---

<h3>💡 Solution SQL : </h3>

```sql


SELECT *
FROM users
ORDER BY Surname ASC; 

Resultat :

*****************************************************************************************************

GivenName  | Surname    | EmailAddress                 | Access      |  Time  | Downloads
-----------+------------+------------------------------+-------------+--------+-----------
Doris      | Adams      | adamsd@icloud.com            | 11/11/2025  | 10:38  | 84
Jonathan   | Adams      | adams.jonathan1972@yahoo.com | 24/10/2025  | 07:38  | 95
Diana      | Adams      | adiana@gmail.com             | 01/11/2025  | 17:28  | 19
Martha     | Alexander  | amartha@hotmail.com          | 28/10/2025  | 23:05  | 41
Bradley    | Alexander  | alexander.bradley@gmail.com  | 25/09/2025  | 02:53  | 67

*****************************************************************************************************


```

---


<h2 align="center">🏁 Mission 7 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Les données des abonnés d’un site piraté ont été publiées sur un forum du darknet. Veuillez soumettre les détails de tous les abonnés — noms complets, nombre de commentaires et empreintes de mot de passe (hashs) — triés par nombre de commentaires par ordre décroissant. Veuillez vous assurer qu’il n’y ait pas de doublons.

---

<h3>💡 Solution SQL : </h3>

```sql

SELECT DISTINCT FullName, PasswordHash, NumberOfComments
FROM subscribers
ORDER BY NumberOfComments DESC; 

Resultat :

*****************************************************************************************************

FullName            | PasswordHash                      | NumberOfComments
--------------------+-----------------------------------+------------------
Kenneth Hayes       | f903736d3e6911d4c666              | 200
Amber Bennett       | Oac0|99b5d |83ed04eab             | 200
Harold Baker        | cfccf9eal c53b65e204c             | 199
Roy Collins         | 9c966e6b|4eaab28dc| |             | 198
Katherine Martinez  | 80абеа98f7c5 l e00f558            | 198

*****************************************************************************************************

```

---

<h2 align="center">🏁 Mission 8 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Une liste de diffusion d’un service en ligne illégal a été envoyée à la ligne directe du SQLPD.
Veuillez soumettre les prénoms de toutes les entrées ainsi que leurs dates d’inscription, triés d’abord par prénom par ordre croissant, puis par date d’inscription par ordre croissant :

---

<h3>💡 Solution SQL : </h3>

```sql

SELECT FirstName, JoinDate
FROM matling_11st
ORDER BY FirstName ASC, JoinDate ASC;

Resultat :

*****************************************************************************************************

FirstName  | JoinDate
-----------+------------
Aaron      | 2024-08-07
Aaron      | 2025-02-09
Abigail    | 2024-12-16
Alan       | 2024-03-25
Alan       | 2025-01-31

*****************************************************************************************************


```

---

<h2 align="center">🏁 Mission 9 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Une liste de diffusion d’un service en ligne illégal a été envoyée à la ligne directe du SQLPD.
Veuillez soumettre les trois premiers enregistrements lorsque les données sont triées par adresses e-mail par ordre décroissant, puis par prénom par ordre décroissant.

---

<h3>💡 Solution SQL : </h3>

```sql

SELECT *
FROM mailing_ list
ORDER BY Email DESC, FirstName DESC
LIMIT 3;

Resultat :

*****************************************************************************************************

FirstName   | FamilyName | Email                   | JoinDate    | PassChangeCount
------------+------------+-------------------------+-------------+----------------
Ronald      | Young      | youngr934@me.com        | 2024-03-11  | 0
Catherine   | Young      | youngc@gmail.com        | 2024-06-02  | 4
Charles     | Young      | youngc20@googlemail.com | 2024-03-04  | 0

*****************************************************************************************************


```

---
<h2 align="center">🏁 Mission 10 : </h2>

<h3>🎯 Détail de la mission : </h3>

<strong>Objectif :</strong> Mission - Confidentiel :

Les données des membres d’un site piraté ont été publiées sur un forum du darknet.
Veuillez soumettre les empreintes de mot de passe et les adresses postales des cinq premiers membres, triés d’abord par adresse postale par ordre décroissant, puis par empreinte de mot de passe par ordre croissant. Veuillez vous assurer qu’il n’y ait aucun doublon.

---

<h3>💡 Solution SQL : </h3>

```sql

SELECT DISTINCT PasswordHash, MailingAddress
FROM members
ORDER BY MailingAddress DESC, PasswordHash ASC
LIMIT 5 ; 

Resultat :

****************************************************************************************************

PasswordHash                    | MailingAddress
--------------------------------+-----------------------
716e921520492098fic8            | 99 Porcupine Avenue
6b90d3dcfba833d69142            | 99 Bee Place
bb4ebff6aa446o738621            | 98 Wilson Grove
978eI622315b4be0fb8a            | 98 Powell Place
2a560e19cf709624ae40            | 98 Nelson Drive

*****************************************************************************************************


```

---
