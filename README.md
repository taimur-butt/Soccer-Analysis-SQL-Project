# Soccer Data Analysis

## Table of Contents
1. [Project Description](#project-description)
2. [Data](#data)
3. [Analysis](#analysis)

## Project Description
This project involves analyzing soccer data sourced from Kaggle. The data includes information on game events, games, players, clubs, and competitions. The project schema consists of five tables: `game_events`, `games`, `players`, `clubs`, and `competitions`. Using PostgreSQL in pgAdmin, various queries were created to answer a set of predefined questions about the data.

## Data
### Database Schema
The data used in this project was sourced from [Kaggle](https://www.kaggle.com/datasets/davidcariboo/player-scores). I created five PostgreSQL tables to match the structure of five CSV files from the dataset, and then imported the CSV data into the tables.

- **Game Events:** Stores data about game events such as goals, assists, substitutions, and cards
- **Games:** Contains data about individual games
- **Players:** Contains player details
- **Clubs:** Contains club details
- **Competitions:** Contains information about competitions/leagues

The code for the creation of the tables can be found [here](https://github.com/taimur-butt/Soccer-Analysis-SQL-Project/blob/main/analysis/setup/Table-Creation.sql)

### ER Diagram
![ERD](/assets/img/Soccer-Schema.png)

## Analysis
### Tools Used
- **Excel:** The CSV files with the data can be found in [Source Data](https://github.com/taimur-butt/Soccer-Analysis-SQL-Project/tree/main/analysis/setup/source-data)
- **PostgreSQL/pgAdmin:** The queries that address each question can be found in [SQL Queries](https://github.com/taimur-butt/Soccer-Analysis-SQL-Project/tree/main/analysis/sql-queries)

### Questions
I created a [set of questions](https://github.com/taimur-butt/Soccer-Analysis-SQL-Project/blob/main/analysis/setup/Questions.txt) based on my knowledge of the data, common soccer analyses, and the level of SQL proficiency I aimed to demonstrate. Below is each question with a screenshot of the query result ***(click on any screenshot to see specific query)***:

**1) Which players have scored more than 200 goals? What are their total goals, assists, yellow cards, and red cards?**

[![Answer1](assets/img/(A1)-Top-Scorers-Stats.png)](https://github.com/taimur-butt/Soccer-Analysis-SQL-Project/blob/main/analysis/sql-queries/(A1)-Top-Scorers-Stats.sql)

**2) How many assists does Messi have?**

[![Answer2](assets/img/(A2)-Messi-Assists.png)](https://github.com/taimur-butt/Soccer-Analysis-SQL-Project/blob/main/analysis/sql-queries/(A2)-Messi-Assists.sql)

**3) Who has won the Golden Boot since 2018? How many goals did the winner score?**

[![Answer3](assets/img/(A3)-Golden-Boot-Winners.png)](https://github.com/taimur-butt/Soccer-Analysis-SQL-Project/blob/main/analysis/sql-queries/(A3)-Golden-Boot-Winners.sql)

**4) Which teams have had the best Goal Difference in the past two seasons?**

[![Answer4](assets/img/(A4)-Best-Goal-Difference.png)](https://github.com/taimur-butt/Soccer-Analysis-SQL-Project/blob/main/analysis/sql-queries/(A4)-Best-Goal-Difference.sql)

**5) What are the Win/Draw/Loss numbers for teams in the Premier League?**

[![Answer5](assets/img/(A5)-Premier-League-Team-Results.png)](https://github.com/taimur-butt/Soccer-Analysis-SQL-Project/blob/main/analysis/sql-queries/(A5)-Premier-League-Team-Results.sql)

