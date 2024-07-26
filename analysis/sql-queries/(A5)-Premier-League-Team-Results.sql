/* What are the Win/Draw/Loss numbers for teams in the Premier League?

Assigning a Win/Loss/Draw to home and away teams for all games in the 
Premier League */

WITH result_assigner AS (
	SELECT home_club_id AS club_id, home_club_name AS club,
		CASE WHEN home_club_goals > away_club_goals THEN 'Win'
		WHEN home_club_goals < away_club_goals THEN 'Loss'
		ELSE 'Tie' END AS game_outcome
	FROM game
	WHERE competition_id = 'GB1'
	
	UNION ALL

	SELECT away_club_id AS club_id, away_club_name AS club,
		CASE WHEN away_club_goals > home_club_goals THEN 'Win'
		WHEN away_club_goals < home_club_goals THEN 'Loss'
		ELSE 'Draw' END AS game_outcome
	FROM game
	WHERE competition_id = 'GB1'

/* Counting each result for every team */
	
), result_counter AS (
	SELECT club_id, club,
	COUNT(*) FILTER (WHERE game_outcome = 'Win') AS wins,
	COUNT(*) FILTER (WHERE game_outcome = 'Draw') AS draws,
	COUNT(*) FILTER (WHERE game_outcome = 'Loss') AS losses
	FROM result_assigner
	GROUP BY club_id, club
)

/* Taking the COUNTs and ordering by which teams have won the most games */
	
SELECT club, wins, draws, losses
FROM result_counter
ORDER BY wins DESC