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

>  *«Les organisateurs veulent identifier les joueurs vivants les plus vulnérables, susceptibles d’être facilement manipulés pour le prochain jeu.»*

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
SELECT * 
FROM player -- Choix de la table player
WHERE status = 'alive' -- Personnes vivantes uniquement
  AND debt > 400000000 -- Dette >= 400 millions
  AND (
    age > 65 -- Âgés ou
    OR (vice = 'Gambling' AND has_close_family IS FALSE) -- jeux d'argent et pas de famille proche
  );
```

<hr> <h2 align="center">🏁 Mission 2 : </h2> 

<h3>🎯 Détail de la mission : </h3> 

<h4 align="center">Objectif : </h4>

<p align="center"> 
  <img src="https://datalemur.com/sql-game/images/squid-rations.jpeg" 
    alt="Illustration Squid Game SQL trouve sur le site du jeu" width="420"> 
</p> 

>  *«Les organisateurs doivent calculer combien de portions de nourriture retenir afin de créer la tension adéquate.»*

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
SELECT 
    FLOOR(COUNT(*) * 0.90) AS "Rations nécessaires", -- Nombre de rations nécessaires (90% des joueurs vivants non-insiders)
    FLOOR(COUNT(*) * 0.90) <= (SELECT amount FROM rations) AS "Possède‑t‑on assez de nourriture ?" -- True/False si suffisant
FROM player
WHERE status = 'alive' -- Joueurs vivants uniquement
  AND IsInsider IS FALSE; -- Joueurs extérieurs seulement
```

SUITE IN PROGRESS
