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

<h2 align="center"> Étape 3 : Rechercher l'alibi des 2 coupables : </h2>

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
