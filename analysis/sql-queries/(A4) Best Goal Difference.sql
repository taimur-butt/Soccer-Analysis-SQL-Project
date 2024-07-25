/* Which teams have had the best Goal Difference in the past two seasons?

Calculate how many goals each club has scored and conceded as the home team
Calculate how many goals each club has scored and conceded as the away team
Filter both SELECTs for the past two seasons */

WITH goals_scored AS (
    SELECT home_club_id AS club_id, home_club_name AS club,
        SUM(home_club_goals) AS goals_scored,
        SUM(away_club_goals) AS goals_conceded
    FROM game
	WHERE season IN (2022, 2023)
    GROUP BY home_club_id, home_club_name
	
    UNION ALL
	
    SELECT away_club_id AS club_id, away_club_name AS club,
        SUM(away_club_goals) AS goals_scored,
        SUM(home_club_goals) AS goals_conceded
    FROM game
	WHERE season IN (2022, 2023)
    GROUP BY away_club_id, away_club_name

/* Take UNION CTE and calculate total amount each club has scored and conceded */
	
), total_goals AS (
    SELECT club_id, club,
        SUM(goals_scored) AS total_goals_scored,
        SUM(goals_conceded) AS total_goals_conceded
    FROM goals_scored
    GROUP BY club_id, club
)

/* Order Clubs by Goal Difference, which is easy calculation of goals scored
subtracted by goals conceded */

SELECT club, total_goals_scored, total_goals_conceded,
    total_goals_scored - total_goals_conceded AS goal_difference
FROM total_goals
ORDER BY goal_difference DESC;