<h1 align="center">🎯 Case #003: The Miami Marina Murder </h1>


<h2 align="center"> English description : </h2>

A body was found floating near the docks of Coral Bay Marina in the early hours of August 14, 1986. Your job, detective, is to find the murderer and bring them to justice. This case might require the use of JOINs, wildcard searches, and logical deduction. Get to work, detective.

<h3> Objectives : </h3>

  1.  Find the murderer. ( Start by finding the crime scene and go from there )

<h2 align="center"> Description en francais : </h2>

Un corps a été retrouvé flottant près des quais de Coral Bay Marina aux premières heures du 14 août 1986.
Votre mission, détective, est d’identifier le meurtrier et de le traduire en justice.
Cette enquête pourra nécessiter l’utilisation de JOIN, de recherches avec jokers (wildcards) et de déductions logiques.
Au travail, détective.

<h3> Objectifs : </h3>

  1.  Trouvez le meurtrier. (Commencez par identifier la scène de crime, puis progressez à partir de là.)

<h2 align="center"> Étape 1 : Identifier la scene de crime et trouver des indices : </h2>

```sql

SELECT * 
FROM crime_scene
WHERE date = '19830715'
  AND location = 'West Hollywood Records'
  AND type = 'theft';

Pour cette premiere requete, on va devoir rechercher la date au format YYYYMMDD, avec ca on a directement le resultat.
Si on veut aller plus loin on peut ajouter location = West Hollywood Records et type = theft

Resultat :

/*****************************************************************************************************

+----+----------+-------------------+----------------------------------------------------------------------------+
| id | date     | location          | description                                                                |
+----+----------+-------------------+----------------------------------------------------------------------------+
| 43 | 19860814 | Coral Bay Marina  | The body of an unidentified man was found near the docks.                  |
|    |          |                   | Two people were seen nearby:                                               |
|    |          |                   | - one who lives on 300ish "Ocean Drive"                                    |
|    |          |                   | - another whose first name ends with "ul" and last name ends with "ez".    |
+----+----------+-------------------+----------------------------------------------------------------------------+

*****************************************************************************************************\

Ici, on peut voir des informations sur 2 suspects qu'on va devoir identifies, il va falloir trouver leur alibi

```

<h2 align="center"> Étape 2 : Retrouver les 2 suspects : </h2>

```sql

SELECT p.*, 'Ocean Drive (300ish)' AS witness_type
FROM person p
WHERE p.address LIKE '%Ocean Drive%'
  AND CAST(SUBSTR(p.address, 1, INSTR(p.address, ' ') - 1) AS INTEGER) BETWEEN 300 AND 399

UNION ALL

SELECT p.*, 'Name pattern (*ul *ez)' AS witness_type
FROM person p
WHERE p.name LIKE '%ul %ez'

ORDER BY witness_type, address;


Pour cette deuxieme requete on doit rechercher une personne habitant a Ocean drive et son numero
d'addresse est compris entre 300 et 399, le deuxieme son prenom finit par  ul et son
nom de famille par ez

Resultat :

/*****************************************************************************************************

+-----+-----------------+-----------+------------------+------------------+--------------------------+
| id  | name            | alias     | occupation       | address          | witness_type             |
+-----+-----------------+-----------+------------------+------------------+--------------------------+
| 102 | Raul Gutierrez  | The Cobra | Nightclub Owner  | 45 Sunset Ave    | Name pattern (*ul *ez)   |
| 101 | Carlos Mendez   | Los Ojos  | Fisherman        | 369 Ocean Drive  | Ocean Drive (300ish)     |
+-----+-----------------+-----------+------------------+------------------+--------------------------+

*****************************************************************************************************\

Ici, on a pu detecter 2 suspects, maintenant il va falloir faire en sorte de trouver le coupable

```

<h2 align="center"> Étape 3 : Rechercher l'alibi des 2 suspects : </h2>

```sql

SELECT *
FROM interviews
WHERE person_id IN (101, 102);


Pour cette troisieme requete on doit ecouter les 2 temoins pour trouver des indices

Resultat :

/*****************************************************************************************************

+-----+-----------------+--------------------------------------------------------------------------+
| id  | person_id       | transcript                                                               |
+-----+-----------------+--------------------------------------------------------------------------+
| 101 | 101             |  I saw someone check into a hotel on August 13. The guy looked nervous.  |
| 102 | 102             |  I heard someone checked into a hotel with "Sunset" in the name.         |
+-----+-----------------+--------------------------------------------------------------------------+

*****************************************************************************************************\

Ici, on a pu avoir d'autres informations a verifie pour le futur coupable un hotel le 13 Aout
et l'hotel Sunset

```
<h2 align="center"> Étape 4 : Rechercher des potentiels coupables : </h2>

```sql

SELECT hc.hotel_name, p.id, p.name, p.occupation, p.address
FROM hotel_checkins hc
JOIN person p ON p.id = hc.person_id
WHERE hc.check_in_date = 19860813
  AND hc.hotel_name LIKE '%Sunset%'
  AND hc.hotel_name LIKE '%Hotel%'
  AND (
        p.address LIKE '%Marina%'
     OR p.address LIKE '%Coral%'
     OR p.address LIKE '%Bay%'
     OR p.address LIKE '%Ocean Drive%'
  )
ORDER BY p.name;

Pour cette quatrieme requete on doit chercher les personnes qui etait dans un hotel avec Sunset dans le nom le  13/08/1986

Resultat :

/*****************************************************************************************************

+---------------------+----+------------------+-------------------+------------------+
| hotel_name          | id | name             | occupation        | address          |
+---------------------+----+------------------+-------------------+------------------+
| Sunset Beach Hotel  |  9 | David Clark      | Warehouse Manager | 567 Bay Drive    |
| Sunset Lagoon Hotel | 47 | Lawrence Powell  | Zoo Keeper        | 123 Coral Drive  |
| Sunset Coast Hotel  | 14 | Richard Moore    | Restaurant Owner  | 321 Coral Way    |
+---------------------+----+------------------+-------------------+------------------+

*****************************************************************************************************\

Ici, on a pu trouve 3 suspects, il va falloir voir ce que faisait les 3 suspects le jour du meurtre

```

<h2 align="center"> Étape 5 : Ecouter les confessions des differents suspects : </h2>

```sql

SELECT *
FROM confessions
WHERE person_id IN (9, 47, 14);

Pour cette cinquieme requete on ecoute les differentes confessions des 3 suspects

Resultat :

/*****************************************************************************************************

+----+-----------+--------------------------------------------------+
| id | person_id | confession                                       |
+----+-----------+--------------------------------------------------+
|  3 |         9 | Who are you to question me? I'm an innocent man. |
|  8 |        14 | I was home with my family that night.            |
| 41 |        47 | I demand to speak to my lawyer.                  |
+----+-----------+--------------------------------------------------+


*****************************************************************************************************\

Ici, on a pu avoir les 3 confession avec le numero 47 Lawrence Powell qui est relativement etrange.
On va donc prendre plus d'info a son sujet



```

IN PROGRESS UNE ERREUR DANS LES REQUETES

<h2 align="center"> Étape Bonus : Trouver le coupable version facile : </h2>

```sql

SELECT
  c.id,
  c.person_id,
  p.name,
  c.confession
FROM confessions c
JOIN person p ON p.id = c.person_id
WHERE c.confession LIKE '%marina%'
   OR c.confession LIKE '%Coral%'
   OR c.confession LIKE '%Bay%';


Pour cette requete bonus en tapant le lieu du crime dans les confessions on est capable de trouver directement le coupable.

Resultat :

/*****************************************************************************************************

+----+-----------+--------------+--------------------------------------------------------------------------+
| id | person_id | name         | confession                                                               |
+----+-----------+--------------+--------------------------------------------------------------------------+
| 73 |         8 | Thomas Brown | Alright! I did it. I was paid to make sure he never left the marina alive. |
+----+-----------+--------------+--------------------------------------------------------------------------+

*****************************************************************************************************\

Ici, on a pu avoir les 3 confession avec le numero 47 Lawrence Powell qui est relativement etrange.
On va donc prendre plus d'info a son sujet

```
