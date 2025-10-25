<h1 align="center">🎯 Jeu : SQL Squid Game</h1>

<p align="center">
  <a href="https://datalemur.com/sql-game" target="_blank">🎮 Lien du jeu : datalemur.com/sql-game</a><br>
  <strong>Langue :</strong> Anglais<br>
  <strong>Nombre de niveaux :</strong> <em>À ajouter</em><br>
  <strong>Explication :</strong> <em>À ajouter</em>
</p>

<hr>

<h2 align="center">🏁 Mission 1 : </h2>

<h3>🎯 Détail de la mission : </h3>

<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4wSDNEcOktEKQjPOuILceXY-VVaaY6eWR1Q&s" 
       alt="Illustration Squid Game SQL trouve sur Google" 
       width="420">
</p>

>  *« Bienvenue, Data Scientist ! C’est moi, le Front Man. Je vois que vous avez accepté ma… proposition d’emploi pour le moins… unique.
> Nous avons installé nos opérations sur une île privée – et avant que vous ne posiez la question, non, pas CE genre d’île privée.
> Vous êtes arrivé au bon moment : le premier jeu de « Feu Rouge, Feu Vert » vient de se terminer et nous avons généré des données fraîches à analyser… et des corps frais à récolter. »*

<strong>Objectif :</strong> Trouver tous les joueurs qui sont <strong>en vie</strong>, <strong>gravement endettés</strong> (dette > 400 000 000 ₩),
et qui sont soit <strong>âgés</strong> (âge > 65 ans) <strong>OU</strong> ont pour vice le <strong>jeu d’argent</strong> (<em>Gambling</em>) et <strong>aucun lien familial</strong>.

---

<h3>🗂️ Table SQL : </h3>

<p align="center">
  <img src="https://datalemur.com/sql-game/images/schemas/level1.jpg" 
       alt="Schéma de la table SQL Player de la mission 1" 
       width="420">
</p>

<h3>💡 Solution SQL : </h3>

```sql

-- Étape 1 : Identifier les personnes vivantes ayant une dette de plus de 400 millions

SELECT * 
FROM player -- Choix de la table player
WHERE status = 'alive' -- Personnes vivantes uniquement
  AND debt > 400000000 -- Dette > 400 millions

-- Étape 2 : Identifier les personnes agés de plus de 65 ans ou les personnes qui ont comme vice les jeux d'argent et ceux qui ne possede pas de famille

  AND (
    age > 65 -- Âgés ou
    OR (vice = 'Gambling' AND has_close_family IS FALSE) -- jeux d'argent et pas de famille proche

/*****************************************************************************************************

Resultat :


| id | first_name | last_name | age | statut | debt          | vice              | has_close_family |
|----|------------|-----------|-----|--------|---------------|-------------------|------------------|
| 2  | Seokjin    | Nam       | 68  | alive  | 684,587,725   | Negative thinking | false            |
| 6  | Taehyung   | Yu        | 84  | alive  | 1,262,497,885 | Procrastination   | false            |
| 17 | Taehyung   | Yu        | 71  | alive  | 864,049,939   | Smoking           | true             |
| 23 | Yuna       | Tang      | 76  | alive  | 1,118,463,531 | Road rage         | true             |
| 27 | Hun        | Han       | 68  | alive  | 1,116,516,209 | Sleeping in       | false            |

Showing 5 of 99 rows

 INTERPRÉTATION :
  - Pour un meilleur visuel j'ai pris exemple sur la fonction .head() de python et j'ai limite a 5 au lieu de 20 normalement

*****************************************************************************************************\

```

<hr> <h2 align="center">🏁 Mission 2 : </h2> 

<h3>🎯 Détail de la mission : </h3> 

<h4 align="center">Objectif : </h4>

<p align="center"> 
  <img src="https://datalemur.com/sql-game/images/squid-rations.jpeg" 
    alt="Illustration Squid Game SQL trouve sur le site du jeu" width="420"> 
</p> 

>  *«Ah, vous avez passé le Niveau 1 ! Je savais que vous aviez du potentiel quand vous n’avez pas bronché face à nos « métriques de vulnérabilité des joueurs ». Je veux dire, sérieusement – quel Data Scientist ne peut pas identifier nos participants les plus susceptibles ?
> L’un des derniers Data Scientists qui a travaillé ici avait même suggéré de « ne pas exploiter les personnes vulnérables ». Vous vous rendez compte ? Moi, je n’aurais jamais pu. Et, d’ailleurs, lui non plus maintenant…»*

Dans un tableau, calculer combien de rations nourriraient 90 % des joueurs restants (<strong>vivants</strong>) qui ne sont pas des insiders (arrondi à l'entier inférieur), et dans une autre colonne, indiquer si l'approvisionnement actuel en rations est suffisant (<strong>Vrai</strong> ou <strong>Faux</strong>).

---

</p> <h3>🗂️ Table SQL : </h3>

<p align="center"> 
  <span style="display:inline-block; margin-right:20px;"> 
    <img src="https://datalemur.com/sql-game/images/schemas/level2.jpg" 
      alt="Schéma de la table SQL Mission 2 - Image 1" width="420"> </span> 
</p> 

<h3>💡 Solution SQL : </h3>

```sql

-- Étape 1 : Identifier les Rations nécessaires et si on en possede suffisamment

SELECT 
    FLOOR(COUNT(*) * 0.90) AS "Rations nécessaires", -- Nombre de rations nécessaires (90% des joueurs vivants non-insiders)
    FLOOR(COUNT(*) * 0.90) <= (SELECT amount FROM rations) AS "Possède‑t‑on assez de nourriture ?" -- True/False si suffisant
FROM player

-- Étape 2 : Identifier personnes vivantes

WHERE status = 'alive' -- Joueurs vivants uniquement

-- Étape 3 : Identifier si ils sont etrangeres ou non

  AND IsInsider IS FALSE; -- Joueurs extérieurs seulement

/****************************************************************

Resultat :

| Rations nécessaires| Possède‑t‑on assez de nourriture ? |
|--------------------|------------------------------------|
|        329	     |                true                |

 INTERPRÉTATION :
  - True/False sont les seuls reponses valables dans un Boolean

****************************************************************\

``` 

<hr> <h2 align="center">🏁 Mission 3 : </h2> 

<h3>🎯 Détail de la mission : </h3> 

<h4 align="center">Objectif : </h4>

<p align="center"> 
  <img src="https://datalemur.com/sql-game/images/honeycomb_game.jpg" 
    alt="Illustration Squid Game SQL trouve sur le site du jeu" width="420"> 
</p> 

>  *«Eh bien, eh bien ! Regardez donc qui devient un véritable atout pour notre organisation. Tes compétences en optimisation des ressources étaient… chef’s kiss… absolument délicieuses ! Le chaos qui a suivi dans le dortoir à cause des rations limitées a offert un spectacle des plus divertissants pour nos VIP.
La bagarre du dortoir du jeu du calmar, un classique.
Et puisqu’on parle de divertissement, passons à une petite séance d’analytique historique. Le jeu du Honeycomb a toujours été un favori du public — il y a quelque chose de sinistrement fascinant à observer des joueurs prendre ce jeu d’enfant avec un tel sérieux.
Notre département de météorologie (oui, oui, nous en avons un) a suivi avec une rigueur scientifique les données de température et les performances des joueurs pendant des décennies. Tu vois, nous ne sommes pas simplement sadiques — ahem — sélectifs dans la conception de nos jeux. Il y a une véritable science derrière nos méthodes.
L’organisation s’intéresse particulièrement à l’optimisation du niveau de difficulté selon les variations saisonnières. Nous avons remarqué que beaucoup de joueurs utilisent la stratégie consistant à faire fondre le biscuit pendant les mois les plus chauds.
Pas très équitable pour nos candidats d’hiver, tu ne trouves pas ?»*

Dans un tableau, calculer le <strong>temps moyen de complétion</strong> pour chaque <strong>forme</strong> du jeu <em>Honeycomb</em> pendant les <strong>mois les plus chauds et les plus froids</strong>, en utilisant uniquement les <strong>données des 20 dernières années</strong>, puis dans une colonne, indiquer si la forme est <strong>plus rapide pendant le mois chaud</strong> ou non, et <strong>classer les résultats par temps moyen croissant</strong>.


---

</p> <h3>🗂️ Table SQL : </h3>

<p align="center"> 
  <span style="display:inline-block; margin-right:20px;"> 
    <img src="https://datalemur.com/sql-game/images/schemas/level3.jpg" 
      alt="Schéma de la table SQL Mission 3 - Image 1" width="550"> </span> 
</p> 

<h3>💡 Solution SQL : </h3>

```sql

-- Étape 1 : Identifier le mois le plus chaud et le plus froid
WITH temperature_extremes AS (
    SELECT month AS Mois
    FROM monthly_temperatures 
    WHERE avg_temperature = (SELECT MAX(avg_temperature) FROM monthly_temperatures) -- Le plus chaud
       OR avg_temperature = (SELECT MIN(avg_temperature) FROM monthly_temperatures) -- Le plus froid
)

-- Étape 2 : Calculer le temps moyen de complétion pour chaque forme pendant ces mois
SELECT 
    h.shape AS Forme,                          -- Affichage de la forme + changement de nom
    EXTRACT(MONTH FROM h.date) AS Mois,        -- Affichage du mois + changement de nom
    AVG(h.average_completion_time) AS moy_duree -- Temps moyen pour le mois et la forme

FROM honeycomb_game h                          -- On utilise la table des parties du jeu

-- Étape 3 : On ne garde que les lignes correspondant aux mois les plus froids et les plus chauds
WHERE EXTRACT(MONTH FROM h.date) IN (
    SELECT Mois FROM temperature_extremes
)

-- Étape 4 : On limite au 20 derniers mois
AND h.date >= CURRENT_DATE - INTERVAL '20 years'

-- Étape 5 : On regroupe les résultats par forme et par mois
GROUP BY Forme, EXTRACT(MONTH FROM h.date)

-- Étape 6 : On classe par durée moyenne par forme de la plus rapide a la plus lente 
ORDER BY moy_duree;

/**********************************************************************************************

Resultat :

| shape    | month | avg_time |
|----------|-------|----------|
| triangle | 8     | 5.85     |
| circle   | 8     | 6.15     |
| star     | 8     | 6.70     |
| triangle | 1     | 6.95     |
| circle   | 1     | 7.25     |
| umbrella | 8     | 7.35     |
| star     | 1     | 7.80     |
| umbrella | 1     | 8.40     |


 INTERPRÉTATION :
  - Les mois (1 = Janvier, 8 = Aout) représentent les plus froids et les plus chauds.
  - On voit comment la performance moyenne varie selon la température du mois.

Ma reponse differe de celle du site, parce que j'ai voulu rendre le visuel plus agreable en ajoutant un round() parce que les scores etaient a rallonge avec beacoup de 0
J'ai aussi change toute les features en francais pour plus de visibilite
exemple : 5.8500000000000000

**********************************************************************************************\

```

SUITE IN PROGRESS
