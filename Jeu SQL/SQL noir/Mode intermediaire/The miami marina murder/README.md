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

SELECT id, date, location, description
FROM crime_scene
WHERE date = 19860814
  AND location = 'Coral Bay Marina';
```

Pour cette premiere requete, on va devoir rechercher la date au format YYYYMMDD, et location = Coral Bay Marin.
Avec ca on a directement les temoins de la scene de crime.

Resultat :

```
+----+----------+-------------------+----------------------------------------------------------------------------+
| id | date     | location          | description                                                                |
+----+----------+-------------------+----------------------------------------------------------------------------+
| 43 | 19860814 | Coral Bay Marina  | The body of an unidentified man was found near the docks.                  |
|    |          |                   | Two people were seen nearby:                                               |
|    |          |                   | - one who lives on 300ish "Ocean Drive"                                    |
|    |          |                   | - another whose first name ends with "ul" and last name ends with "ez".    |
+----+----------+-------------------+----------------------------------------------------------------------------+
```

Dans ce tableau, on a l'indication de 2 temoins, qui pourrait nous apporter plus d'information.



<h2 align="center"> Étape 2 : Retrouver les 2 temoins : </h2>

```sql

SELECT *
FROM person
WHERE (address LIKE '%Ocean Drive%' AND CAST(SUBSTR(address,1,INSTR(address,' ')-1) AS INTEGER) BETWEEN 300 AND 399)
   OR (name LIKE '%ul %ez');
```

Pour cette deuxieme requete on doit identifier les témoins mentionnés dans la description

Resultat :

```
+-----+-----------------+-----------+------------------+------------------+--------------------------+
| id  | name            | alias     | occupation       | address          | witness_type             |
+-----+-----------------+-----------+------------------+------------------+--------------------------+
| 102 | Raul Gutierrez  | The Cobra | Nightclub Owner  | 45 Sunset Ave    | Name pattern (*ul *ez)   |
| 101 | Carlos Mendez   | Los Ojos  | Fisherman        | 369 Ocean Drive  | Ocean Drive (300ish)     |
+-----+-----------------+-----------+------------------+------------------+--------------------------+
```

Dans ce tableau, on a recherche les personnes qui ont (*ul *ez) ou qui ont (300ish).
On va devoir trouver des indices grace a leur temoignage.


<h2 align="center"> Étape 3 : Trouver des indices avec les 2 temoins : </h2>

```sql

SELECT i.id, i.person_id, p.name, i.transcript
FROM interviews i
JOIN person p ON p.id = i.person_id
WHERE i.person_id IN (101,102);
```

Pour cette troisieme requete on doit ecouter les 2 temoins pour trouver des indices

Resultat :

```

+-----+-----------------+--------------------------------------------------------------------------+
| id  | person_id       | transcript                                                               |
+-----+-----------------+--------------------------------------------------------------------------+
| 101 | 101             |  I saw someone check into a hotel on August 13. The guy looked nervous.  |
| 102 | 102             |  I heard someone checked into a hotel with "Sunset" in the name.         |
+-----+-----------------+--------------------------------------------------------------------------+

```

Ce tableau represente les 2 temoins Carlos Mendez et Raul Gutierrez qui nous donnent une indication
sur le potentiel coupable dans un hotel "Sunset" le 13 Aout.


<h2 align="center"> Étape 4 : Rechercher des potentiels suspects : </h2>

```sql

SELECT
  hc.person_id,
  p.name,
  p.occupation,
  p.address,
  hc.hotel_name,
  hc.check_in_date
FROM hotel_checkins hc
JOIN person p ON p.id = hc.person_id
WHERE hc.check_in_date = 19860813
  AND hc.hotel_name LIKE '%Sunset%';
```

Pour cette quatrieme requete on doit chercher les personnes qui etait dans un hotel avec Sunset dans le nom le  13/08/1986.
Cela permettra d'avoir la liste de tout les potentielles coupables, on reduira par la suite.

Resultat :

```

| person_id | name              | occupation              | address             | hotel_name             | check_in_date |
| --------- + ----------------- + ----------------------- + ------------------- + ---------------------- + ------------- |
| 27        | Jacob Campbell    | Comedian                | 567 Palm Drive      | Sunset Bay Hotel       | 19860813      |
| 12        | George Davis      | Hotel Manager           | 456 Wave Street     | Sunset Harbor Hotel    | 19860813      |
| 15        | Joseph Taylor     | Musician                | 654 Sand Drive      | Sunset Palms Resort    | 19860813      |
| 17        | Christopher Lee   | Private Driver          | 234 Beach Blvd      | Sunset Shore Hotel     | 19860813      |
| 19        | Edward Baker      | Car Salesman            | 890 Marina Drive    | Sunset Marina Inn      | 19860813      |
| 6         | James Wilson      | Security Guard          | 156 Marina Way      | Sunset Inn             | 19860813      |
| 23        | Kenneth Green     | Locksmith               | 321 Wave Drive      | Sunset Reef Inn        | 19860813      |
| 25        | Jeffrey Nelson    | Attorney                | 987 Coral Street    | Sunset Lagoon Resort   | 19860813      |
| 7         | Robert Smith      | Mechanic                | 789 Beach Road      | Sunset Marina Hotel    | 19860813      |
| 29        | Nicholas Roberts  | Club DJ                 | 123 Ocean Road      | Sunset Breeze Hotel    | 19860813      |
| 31        | Stephen Cooper    | Web Developer           | 789 Harbor Drive    | Sunset Vista Hotel     | 19860813      |
| 33        | Donald Cook       | Business Owner          | 654 Coast Road      | Sunset Crest Hotel     | 19860813      |
| 35        | Charles Peterson  | Police Officer          | 234 Shell Drive     | Sunset Palms Hotel     | 19860813      |
| 37        | Philip Collins    | Insurance Agent         | 890 Sand Street     | Sunset Beach Inn       | 19860813      |
| 39        | Gregory Stewart   | Paranormal Investigator | 456 Beach Drive     | Sunset Coast Inn       | 19860813      |
| 41        | Dennis Bailey     | Jeweler                 | 321 Marina Road     | Sunset Harbor Inn      | 19860813      |
| 43        | Douglas Murphy    | Chef                    | 987 Dock Drive      | Sunset Isle Inn        | 19860813      |
| 45        | Carl Cooper       | Artist                  | 567 Wave Road       | Sunset Reef Hotel      | 19860813      |
| 47        | Lawrence Powell   | Zoo Keeper              | 123 Coral Drive     | Sunset Lagoon Hotel    | 19860813      |
| 49        | Sean Fisher       | Marine Biologist        | 789 Palm Street     | Sunset Grove Inn       | 19860813      |
| 51        | Wayne Ross        | Magician                | 654 Ocean Street    | Sunset Dunes Hotel     | 19860813      |
| 53        | Ralph Coleman     | Chess Instructor        | 234 Harbor Road     | Sunset Shores Inn      | 19860813      |
| 55        | Randy Perry       | Motorcycle Mechanic     | 890 Coast Drive     | Sunset Haven Hotel     | 19860813      |
| 9         | David Clark       | Warehouse Manager       | 567 Bay Drive       | Sunset Beach Hotel     | 19860813      |
| 11        | Paul Thompson     | Private Investigator    | 123 Coast Ave       | Sunset Bay Resort      | 19860813      |
| 8         | Thomas Brown      | Dock Worker             | 234 Port Street     | Sunset Palm Resort     | 19860813      |
| 13        | Kevin White       | Casino Dealer           | 789 Shell Road      | Sunset View Inn        | 19860813      |
| 14        | Richard Moore     | Restaurant Owner        | 321 Coral Way       | Sunset Coast Hotel     | 19860813      |
| 16        | Daniel Martin     | Boxing Trainer          | 987 Palm Street     | Sunset Sands Inn       | 19860813      |
| 18        | Steven King       | Real Estate Agent       | 567 Ocean View      | Sunset Beach Resort    | 19860813      |
| 20        | Brian Hall        | Bouncer                 | 123 Harbor Lane     | Sunset Ocean Hotel     | 19860813      |
| 21        | Ronald Scott      | Construction Worker     | 456 Dock Road       | Sunset Isle Resort     | 19860813      |
| 22        | Anthony Hill      | Sailor                  | 789 Coast Street    | Sunset Wave Hotel      | 19860813      |
| 24        | Jason Adams       | Race Car Driver         | 654 Shell Lane      | Sunset Keys Hotel      | 19860813      |
| 26        | Ryan Phillips     | Firefighter             | 234 Sand Road       | Sunset Point Inn       | 19860813      |
| 28        | Gary Mitchell     | Bodyguard               | 890 Beach Way       | Sunset Grove Resort    | 19860813      |
| 30        | Eric Carter       | Pilot                   | 456 Marina Street   | Sunset Dunes Inn       | 19860813      |
| 32        | Andrew Richardson | Painter                 | 321 Dock Lane       | Sunset Shores Resort   | 19860813      |
| 34        | Mark Morgan       | Theater Actor           | 987 Wave Street     | Sunset Haven Inn       | 19860813      |
| 36        | Sean Turner       | Martial Arts Instructor | 567 Coral Lane      | Sunset Oasis Resort    | 19860813      |
| 38        | Raymond Wood      | Barber                  | 123 Palm Road       | Sunset Marina Resort   | 19860813      |
| 40        | Joshua Reed       | Travel Agent            | 789 Ocean Lane      | Sunset Bay Lodge       | 19860813      |
| 42        | Peter Bell        | Wildlife Photographer   | 654 Harbor Street   | Sunset View Resort     | 19860813      |
| 44        | Henry Rivera      | Private Detective       | 234 Coast Lane      | Sunset Wave Resort     | 19860813      |
| 46        | Arthur Bryant     | Archery Instructor      | 890 Shell Street    | Sunset Keys Inn        | 19860813      |
| 48        | Terry Butler      | Martial Artist          | 456 Sand Lane       | Sunset Point Resort    | 19860813      |
| 50        | Bruce Barnes      | Stock Broker            | 321 Beach Road      | Sunset Breeze Resort   | 19860813      |
| 52        | Eugene Henderson  | Bird Trainer            | 987 Marina Lane     | Sunset Vista Resort    | 19860813      |
| 10        | John Anderson     | Boat Captain            | 890 Pier Lane       | Sunset Cove Inn        | 19860813      |
| 54        | Roy Jenkins       | Park Ranger             | 567 Dock Street     | Sunset Crest Resort    | 19860813      |
| --------- + ----------------- + ----------------------- + ------------------- + ---------------------- + ------------- |

```

Ce tableau représente l’ensemble complet des individus candidats, établi uniquement à partir de contraintes objectives (date et nom de l’hôtel). 


<h2 align="center"> Étape 5 : Ecouter les confessions des differents suspects : </h2>

```sql

SELECT
  c.person_id,
  p.name,
  c.confession
FROM confessions c
JOIN person p ON p.id = c.person_id
WHERE c.person_id IN (
    SELECT person_id
    FROM hotel_checkins
    WHERE check_in_date = 19860813
      AND hotel_name LIKE '%Sunset%'
);
```

Pour cette cinquieme requete on ecoute les differentes confessions de la liste de suspects

Resultat :

```

| person_id | name              | confession                                                                     |
| --------- + ----------------- + ------------------------------------------------------------------------------ |
| 6         | James Wilson      | I don't know anything about this.                                              |
| 7         | Robert Smith      | I was just walking my dog that night.                                          |
| 9         | David Clark       | Who are you to question me? I'm an innocent man.                               |
| 10        | John Anderson     | Alright! I confess - I stole those diamonds from the jewelry store.            |
| 11        | Paul Thompson     | I have no idea what you're talking about.                                      |
| 12        | George Davis      | You've got the wrong person.                                                   |
| 13        | Kevin White       | Alright! Fine! I was the one who robbed that bank last month.                  |
| 14        | Richard Moore     | I was home with my family that night.                                          |
| 15        | Joseph Taylor     | This is ridiculous, I'm innocent!                                              |
| 16        | Daniel Martin     | Alright! I admit it - I've been running an illegal gambling ring.              |
| 17        | Christopher Lee   | You can't prove anything.                                                      |
| 18        | Steven King       | I was nowhere near there that night.                                           |
| 19        | Edward Baker      | Alright! Yes, I've been selling counterfeit watches.                           |
| 20        | Brian Hall        | I don't know what you're investigating.                                        |
| 21        | Ronald Scott      | This is all a misunderstanding.                                                |
| 22        | Anthony Hill      | Alright! I confess to the art gallery heist!                                   |
| 23        | Kenneth Green     | I'm just a simple businessman.                                                 |
| 24        | Jason Adams       | You're wasting your time with me.                                              |
| 25        | Jeffrey Nelson    | Alright! I've been running a smuggling operation.                              |
| 26        | Ryan Phillips     | I have an alibi for that night.                                                |
| 27        | Jacob Campbell    | This is harassment!                                                            |
| 28        | Gary Mitchell     | Alright! I confess to the car theft ring.                                      |
| 29        | Nicholas Roberts  | I was at the movies that evening.                                              |
| 30        | Eric Carter       | You've got nothing on me.                                                      |
| 31        | Stephen Cooper    | Alright! I've been forging documents.                                          |
| 32        | Andrew Richardson | I'm an honest citizen.                                                         |
| 33        | Donald Cook       | Who put you up to this?                                                        |
| 34        | Mark Morgan       | Alright! I confess to the insurance fraud.                                     |
| 35        | Charles Peterson  | I don't have to answer your questions.                                         |
| 36        | Sean Turner       | This is all a mistake.                                                         |
| 37        | Philip Collins    | Alright! I've been running an illegal betting operation.                       |
| 38        | Raymond Wood      | I was out of town that week.                                                   |
| 39        | Gregory Stewart   | You're barking up the wrong tree.                                              |
| 40        | Joshua Reed       | Alright! I confess to the credit card scam.                                    |
| 41        | Dennis Bailey     | I'm a law-abiding citizen.                                                     |
| 42        | Peter Bell        | This is outrageous!                                                            |
| 43        | Douglas Murphy    | Alright! I've been selling stolen electronics.                                 |
| 44        | Henry Rivera      | I have nothing to say to you.                                                  |
| 45        | Carl Cooper       | Check my records, I'm clean.                                                   |
| 46        | Arthur Bryant     | Alright! I confess to the warehouse break-in.                                  |
| 47        | Lawrence Powell   | I demand to speak to my lawyer.                                                |
| 48        | Terry Butler      | You're making a big mistake.                                                   |
| 49        | Sean Fisher       | Alright! I've been running a pyramid scheme.                                   |
| 50        | Bruce Barnes      | I was at work all day.                                                         |
| 51        | Wayne Ross        | This is a waste of time.                                                       |
| 52        | Eugene Henderson  | Alright! I confess to hacking the system.                                      |
| 53        | Ralph Coleman     | I'm being framed!                                                              |
| 54        | Roy Jenkins       | You've got the wrong guy.                                                      |
| 55        | Randy Perry       | Alright! I've been selling fake IDs.                                           |
| 8         | Thomas Brown      | **Alright! I did it. I was paid to make sure he never left the marina alive.** |
| --------- + ----------------- + ------------------------------------------------------------------------------ |

```

Dans ce tableau, on voit que Thomas Brown avoue le crime. Il explique egalement le lieu du crime.
Malheusement il explique qu'il a ete paye, mais ici on ne nous donne pas plus d'informations.


<h2 align="center"> Étape Bonus : Trouver le coupable via la table confession uniquement : </h2>

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
```

Pour cette requete bonus en tapant le lieu du crime dans les confessions on est capable de trouver directement le coupable.
Ce n'est pas la bonne methodologie ici, car on osculte le reste.

Resultat :

```

+----+-----------+--------------+----------------------------------------------------------------------------+
| id | person_id | name         | confession                                                                 |
+----+-----------+--------------+----------------------------------------------------------------------------+
| 73 |         8 | Thomas Brown | Alright! I did it. I was paid to make sure he never left the marina alive. |
+----+-----------+--------------+----------------------------------------------------------------------------+

```

Thomas Brown fournit un aveu explicite et cohérent avec le lieu du crime.
L’aveu mentionne un paiement, mais l’objectif de ce cas étant l’identification du meurtrier, l’enquête s’arrête ici.
