<h1 align="center">🎯 Case #002: The stolen sound </h1>


<h2 align="center"> English description : </h2>

In the neon glow of 1980s Los Angeles, the West Hollywood Records store was rocked by a daring theft. A prized vinyl record, worth over $10,000, vanished during a busy evening, leaving the store owner desperate for answers. Vaguely recalling the details, you know the incident occurred on July 15, 1983, at this famous store. Your task is to track down the thief and bring them to justice.

<h3> Objectives : </h3>

  1.  Retrieve the crime scene report for the record theft using the known date and location.
  2.  Retrieve witness records linked to that crime scene to obtain their clues.
  3.  Use the clues from the witnesses to find the suspect in the suspects table.
  4.  Retrieve the suspect's interview transcript to confirm the confession.

<h2 align="center"> Description en francais : </h2>

Sous les néons de Los Angeles dans les années 1980, le magasin West Hollywood Records a été secoué par un vol audacieux. Un disque vinyle de grande valeur, estimé à plus de 10 000 $, a disparu au cours d’une soirée particulièrement animée, laissant le propriétaire du magasin désespéré de trouver des réponses. Se souvenant vaguement des faits, vous savez que l’incident s’est produit le 15 juillet 1983, dans ce magasin emblématique. Votre mission est de retrouver le voleur et de le traduire en justice.

<h3> Objectifs : </h3>

  1.  Récupérer le rapport de la scène de crime concernant le vol du disque en utilisant la date et le lieu connus.
  2.  Consulter les témoignages des témoins liés à cette scène de crime afin d’obtenir leurs indices.
  3.  Utiliser les indices fournis par les témoins pour identifier le suspect dans la table des suspects.
  4.  Récupérer la transcription de l’interrogatoire du suspect afin de confirmer les aveux.

<h2 align="center"> Étape 1 : Récupérer le rapport de la scène de crime concernant le vol du disque en utilisant la date et le lieu connus : </h2>

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

| id | date     | type  | location               | description                          |
|----|----------|-------|------------------------|--------------------------------------|
| 65 | 19830715 | theft | West Hollywood Records | A prized vinyl record was stolen     |
|    |          |       |                        | from the store during a busy evening.|

Ici, on peut voir qu'on a une ID (65) pour le cas,
il va falloir rechercher dans les autrestables pour avoir des suspects 
*****************************************************************************************************\
```

<h2 align="center"> Étape 2 : Consulter les témoignages des témoins liés à cette scène de crime afin d’obtenir leurs indices. : </h2>

```sql

SELECT *
FROM witnesses
WHERE crime_scene_id = 65;

Pour cette deuxieme requete, on recherche les temoins de la scene de crime avec
cette requete cela nous permet d'avoir plusieurs suspects

Resultat :

/*****************************************************************************************************

+----+-----------------+------------------------------------------------------------+
| ID | Crime Scene ID  | Clue                                                       |
+----+-----------------+------------------------------------------------------------+
| 28 | 65              | I saw a man wearing a red bandana rushing out of the store |
| 75 | 65              | The main thing I remember is that he had a distinctive     |
|    |                 | gold watch on his wrist                                    |
+----+-----------------+------------------------------------------------------------+



Ici, on peut voir qu'on a une ID (65) pour le cas,
il va falloir rechercher dans les autrestables pour avoir des suspects 
*****************************************************************************************************\

```

<h2 align="center"> Étape 3 : Utiliser les indices fournis par les témoins pour identifier le suspect dans la table des suspects. : </h2>

```sql

SELECT *
FROM suspects
WHERE bandana_color = 'red'
   AND accessory = 'gold watch';


Pour cette troisieme requete, on liste toute les personnes ayant un bandana rouge et une montre en or

Resultat :

/*****************************************************************************************************


+----+----------------+------------------+-----------------+
| ID | Name           | Bandana Color    | Accessory       |
+----+----------------+------------------+-----------------+
| 35 | Tony Ramirez   | red              | gold watch      |
| 44 | Mickey Rivera  | red              | gold watch      |
| 97 | Rico Delgado   | red              | gold watch      |
+----+----------------+------------------+-----------------+


Ici, on peut voir qu'on a 3 suspects, il va donc falloir rechercher leur alibis pour trouver le coupable
*****************************************************************************************************\

```

<h2 align="center"> Étape 4 : Récupérer la transcription de l’interrogatoire du suspect afin de confirmer les aveux. : </h2>

```sql

SELECT *
FROM interviews
WHERE suspect_id IN (35, 44, 97);


Pour cette derniere requete, on va checker les interviews de chaque suspect.

Resultat :

/*****************************************************************************************************


+------------+------------------------------------------------------------+
| suspect_id | transcript                                                 |
+------------+------------------------------------------------------------+
| 35         | I wasn't anywhere near West Hollywood Records that night.  |
| 44         | I was busy with my music career; 
|            | I have nothing to do with this theft.                      |
| 97         | I couldn't help it. I snapped and took the record.         |
+------------+------------------------------------------------------------+



Ici, on peut voir que le coupable est la personne avec l'ID 97 qui corresponds a Rico Delgado 
*****************************************************************************************************\

```
<h2 align="center"> Étape 5 : Valider le cas : </h2>

```
Case Solved!
Excellent work, detective! Rico Delgado has confessed to stealing the prized vinyl record.

Explanation
You began by querying the 'crime_scene' table with the date (19830715) and location (West Hollywood Records) to find the incident report. Then, you retrieved the two witness records from the 'witnesses' table, which revealed that: • The suspect wore a red bandana. • The suspect had a distinctive gold watch. Next, you queried the 'suspects' table, and there were 3 suspects matching the clues. Finally, you found the confession from Rico Delgado in the 'interviews' table.
```
