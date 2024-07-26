/* Who has won the Golden Boot since 2018? How many goals did the winner score?

Calculate how many Goals each Player has scored per Season */

WITH season_goals AS (
	SELECT player_id, season,
		SUM(CASE WHEN type_of_event = 'Goals' THEN 1 ELSE 0 END) AS total_goals
	FROM game_event JOIN game
		ON game_event.game_id = game.game_id
	GROUP BY season, player_id

/* Find the maximum number of Goals scored per Season */
	
), max_goals AS (
	SELECT season, MAX(total_goals) AS max_goals
	FROM season_goals
	GROUP BY season
)

/* Joining the CTEs and then joining Player table to get Full Name for top scorer 
Filtering with BETWEEN to get winners since 2018 and then ordering from most current season */
	
SELECT season_goals.season, full_name AS top_scorer, total_goals
FROM season_goals JOIN max_goals
	ON season_goals.season = max_goals.season AND season_goals.total_goals = max_goals.max_goals
JOIN player
	ON season_goals.player_id = player.player_id
WHERE season_goals.season BETWEEN 2018 AND 2024
ORDER BY season DESC