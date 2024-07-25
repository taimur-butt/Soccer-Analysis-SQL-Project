/* How many assists does Messi have?

Assists will be found in Game Event table, using Player Assist ID column
Full Name column is in Players table
Writing Subquery to use Full Name to find Total Assists */

SELECT COUNT(*) AS assists
FROM game_event
WHERE player_assist_id = (
	SELECT player_id
	FROM player
	WHERE full_name = 'Lionel Messi'
	)