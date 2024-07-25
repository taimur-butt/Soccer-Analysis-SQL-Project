/* Create Tables */

/* -- Table: club */

CREATE TABLE club (
	club_id INTEGER PRIMARY KEY,
	club_code TEXT,
	club_name TEXT,
	domestic_competition_id TEXT,
	total_market_value INTEGER,
	squad_size INTEGER,
	average_age DECIMAL(4, 1),
	foreigners_number INTEGER,
	foreigners_percentage DECIMAL(4, 1),
	national_team_players INTEGER,
	stadium_name TEXT,
	stadium_seats INTEGER,
	net_transfer_record TEXT,
	coach_name TEXT,
	last_season INTEGER,
	file_name TEXT,
	url TEXT
)

/* -- Table: player */

CREATE TABLE player (
	player_id INTEGER PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	full_name TEXT,
	last_season INTEGER,
	current_club_id INTEGER,
	player_code TEXT,
	country_of_birth TEXT,
	city_of_birth TEXT,
	country_of_citizenship TEXT,
	date_of_birth DATE,
	sub_position TEXT,
	main_position TEXT,
	preferred_foot TEXT,
	height_in_cm INTEGER,
	contract_expiration_date DATE,
	agent_name TEXT,
	image_url TEXT,
	url TEXT,
	current_club_domestic_competition_id TEXT,
	current_club_name TEXT,
	market_value_in_euros INTEGER,
	highest_market_value_in_euros INTEGER
)

/* -- Table: competition */

CREATE TABLE competition (
	competition_id TEXT PRIMARY KEY,
	competition_code TEXT,
	competition_name TEXT,
	sub_type TEXT,
	primary_type TEXT,
	country_id INTEGER,
	country_name TEXT,
	domestic_league_code TEXT,
	confederation TEXT,
	url TEXT,
	is_major_national_league BOOLEAN
)

/* -- Table: game */

CREATE TABLE game (
	game_id INTEGER PRIMARY KEY,
	competition_id TEXT REFERENCES competition(competition_id),
	season INTEGER,
	round TEXT,
	date_of_game DATE,
	home_club_id INTEGER,
	away_club_id INTEGER,
	home_club_goals INTEGER,
	away_club_goals INTEGER,
	home_club_position INTEGER,
	away_club_position INTEGER,
	home_club_manager_name TEXT,
	away_club_manager_name TEXT,
	stadium TEXT,
	attendance INTEGER,
	referee TEXT,
	url TEXT,
	home_club_formation TEXT,
	away_club_formation TEXT,
	home_club_name TEXT,
	away_club_name TEXT,
	aggregate_score TEXT,
	competition_type TEXT
)

/* -- Table: game_event */

CREATE TABLE game_event (
	game_event_id TEXT PRIMARY KEY,
	date_of_event DATE,
	game_id INTEGER REFERENCES game(game_id),
	minute_of_event INTEGER,
	type_of_event TEXT,
	club_id INTEGER REFERENCES club(club_id),
	player_id INTEGER REFERENCES player(player_id),
	description TEXT,
	player_in_id INTEGER,
	player_assist_id INTEGER
)






