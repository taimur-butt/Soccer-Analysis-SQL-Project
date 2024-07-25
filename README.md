# Soccer Data Analysis

## Table of Contents
1. [Project Description](#project-description)
2. [Data](#data)
3. [Analysis](#analysis)

## Project Description
This project involves analyzing soccer data sourced from Kaggle. The data includes information on game events, games, players, clubs, and competitions. The project schema consists of five tables: `game_events`, `games`, `players`, `clubs`, and `competitions`. Using PostgreSQL in pgAdmin, various queries were created to answer a set of predefined questions about the data.

## Data
### Database Schema
The data used in this project was sources from [Kaggle](https://www.kaggle.com/datasets/davidcariboo/player-scores). I created five PostgreSQL tables to match the structure of five CSV files from the dataset, and then imported the CSV data into the tables.

- **Game Events:** Stores data about game events such as goals, assists, substitutions, and cards
- **Games:** Contains data about individual games
- **Players:** Contains player details
- **Clubs:** Contains club details
- **Competitions:** Contains information about competitions/leagues

The code for the creation of the tables can be found [here]()

### ER Diagram
![ERD](/assets/img/soccer_schema.png)

## Analysis
### Tools Used
- **Excel:** The CSV files with the data can be found in [here]()
- **PostgreSQL/pgAdmin:** The queries that address each question can be found in [here]()

### Questions
I created a [set of questions]() based on my knowledge of the data, common soccer analyses, and the level of SQL proficiency I aimed to demonstrate. Below is each question with a screenshot of the query result:

1) Which players have scored more than 200 goals? What are their total goals, assists, yellow cards, and red cards?
![]()

2) How many assists does Messi have?
![]()

3) Who has won the Golden Boot since 2018? How many goals did the winner score?
![]()

4) Which teams have had the best Goal Difference in the past two seasons?
![]()

5) What are the Win/Draw/Loss numbers for teams in the Premier League?
![]()

