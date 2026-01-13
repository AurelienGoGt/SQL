<h1 align="center">🎯 Case #001: The Vanishing Briefcase </h1>


<h2 align="center"> English description : </h2>

Set in the gritty 1980s, a valuable briefcase has disappeared from the Blue Note Lounge. A witness reported that a man in a trench coat was seen fleeing the scene. Investigate the crime scene, review the list of suspects, and examine interview transcripts to reveal the culprit.

<h3> Mission : </h3>

  1. Retrieve the correct crime scene details to gather the key clue.
  2. Identify the suspect whose profile matches the witness description.
  3. Verify the suspect using their interview transcript.

<h2 align="center"> Description en francais : </h2>

Située dans l’atmosphère sombre des années 1980, une mallette de grande valeur a disparu du Blue Note Lounge. Un témoin a signalé avoir vu un homme portant un trench-coat prendre la fuite. Examinez la scène de crime, analysez la liste des suspects et étudiez les transcriptions des interrogatoires afin d’identifier le coupable.

<h3> Mission : </h3>

  1. Récupérer les informations correctes de la scène de crime afin d’identifier l’indice clé.
  2. Identifier le suspect dont le profil correspond à la description du témoin.
  3. Vérifier le suspect à l’aide de la transcription de son interrogatoire.


<h2 align="center"> Étape 1 : Récupérer les informations de la scène de crime :</h2>

```sql
SELECT *
FROM crime_scene
WHERE location = 'Blue Note Lounge';

Ici on aura la visualisation de toute les personnes etant alle au Blue Note Lounge

Resultat :

/*****************************************************************************************************

| id | date       | type  | location          | description                                  |
|----|------------|-------|-------------------|----------------------------------------------|
| 76 | 1985-11-20 | theft | Blue Note Lounge  | A briefcase containing sensitive documents   |
|    |            |       |                   | vanished. A witness reported a man in a      |
|    |            |       |                   | trench coat with a scar on his left cheek    |
|    |            |       |                   | fleeing the scene.                           |

 INTERPRÉTATION :
  - On doit rechercher quelqu'un possedant un "trench coat" et possedant une "scar on his left cheek"

*****************************************************************************************************\
```

<h2 align="center"> Étape 2 : Identifier les suspects qui correspondent à la description : </h2>

```sql
SELECT *
FROM suspects
WHERE attire = 'trench coat'
  AND scar = 'left cheek';

Ici on va avoir la visualisation de tout les suspects possedant un trench coat (Impermeable) et ayant scar on his left cheek (une cicatrice sur la joue gauche)

Resultat :

/*****************************************************************************************************

| id  | name             | attire       | scar       |
|-----|------------------|--------------|------------|
| 3   | Frankie Lombardi | trench coat  | left cheek |
| 183 | Vincent Malone   | trench coat  | left cheek |

 INTERPRÉTATION :
  - Ici nous avons trouve 2 suspects, on va devoir ecouter les interviews des 2 personnes
*****************************************************************************************************\
```

<h2 align="center"> Étape 3 : Examiner les interviews des suspects filtrés : </h2>

```sql
SELECT s.name,
       i.transcript
FROM interviews i
JOIN suspects s
  ON s.id = i.suspect_id
WHERE s.attire = 'trench coat'
  AND s.scar = 'left cheek';


Ici on a les aveux de la personne qui a vole

Resultat :

/*****************************************************************************************************

| name             | transcript                              |
|------------------|------------------------------------------|
| Frankie Lombardi | NULL                                     |
| Vincent Malone   | I wasn’t going to steal it, but I did.   |

 INTERPRÉTATION :
  - Ici aucune interpreation possible, le coupable est : Vincent Malone
*****************************************************************************************************\
```

<h2 align="center"> Étape 4 : Valider le cas : </h2>

```
Case Solved!
Congratulations, detective! You have successfully identified Vincent Malone as the culprit.

Explanation :
First, you retrieved the crime scene details from the 'crime_scene' table which mentioned a man in a trench coat 
with a scar on his left cheek. Next, querying the 'suspects' table narrowed the field down to two individuals. 
Finally, examining the 'interviews' table confirmed that Vincent Malone indeed stole the briefcase.
```
