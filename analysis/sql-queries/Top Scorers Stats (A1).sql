/* Which players have scored more than 200 goals? What are their total goals, assists, yellow cards, and red cards?

Need to count each row of Game Event table where Type of Event is Goals or Cards
Description helps identify whether it was a Yellow Card, or Second Yellow/Red Card */

WITH goal_card_stats AS (
	SELECT player_id,
		COUNT(*) FILTER (WHERE type_of_event = 'Goals') AS goals,
		COUNT(*) FILTER (WHERE type_of_event = 'Cards' AND description ILIKE '%Yellow Card%') AS yellow_cards,
		COUNT(*) FILTER (WHERE type_of_event = 'Cards' AND (description ILIKE '%Second Yellow%' OR description ILIKE '%Red Card%')) AS red_cards
	FROM game_event
	GROUP BY player_id

/* Where Type of Event is Goals, Player Assist ID is either null or has a Player ID
Need a separate CASE column to SUM every time Player ID shows up in Player Assist ID
Summed amount of Assists will be assigned to each row of Player ID in later Join */

),	assist_stats AS (
	SELECT player_assist_id, 
		SUM(CASE WHEN player_assist_id IS NOT NULL THEN 1
			ELSE 0
			END) AS assists
	FROM game_event
	GROUP BY player_assist_id

/*  Joining Player ID with Player Assist ID gives one table with all the stats
Joining Player table gives us Full name */

),	joined_stats AS (
	SELECT player.full_name, goal_card_stats.player_id, goals, assists, yellow_cards, red_cards
	FROM goal_card_stats JOIN assist_stats
		ON goal_card_stats.player_id = assist_stats.player_assist_id
	JOIN player
		ON goal_card_stats.player_id = player.player_id
)

/* SUM all the COUNTs we have for Goals, Yellow Cards, and Red Cards
Since each row for Player ID has Summed Assists, take the AVG 
Looking for players with more than 200 Goals, ordering by Full Name */

SELECT full_name, 
	SUM(goals) AS total_goals,
	ROUND(AVG(assists), 0) AS total_assists,
	SUM(yellow_cards) AS total_yellows,
	SUM(red_cards) AS total_reds
FROM joined_stats
GROUP BY player_id, full_name
HAVING SUM(goals) > 200
ORDER BY full_name