# PENTAHO DATA INTEGRATION

---

## Creating Data Warehouse from Transactional Database

Dataset in this project is obtained from [Kaggle](https://www.kaggle.com/hugomathien/soccer), and migration from transactional to data warehouse is run using [Pentaho Data Integration](https://sourceforge.net/projects/pentaho/). The dataset is modified to have more dimension in the data warehouse.

### Created By:
- Andreas Pangestu Lim (2201916962)
- Jonathan (2201917006)

---

## Table of Contents
* [Folder Structure](#folder-structure)
* [Running Migration to Data Warehouse](#running-migration-to-data-warehouse)
* [Validation of Result](#validation-of-result)

---

### Folder Structure

This folder is organized by 4 more specific folders, and each will be described below:
	1. Data
		Contains all data from our dataset, and exported in format of SQL file. The SQL file is based on MySQL dialect, run using XAMPP 7.0.30. This is to ease user to import the schema and the data from our dataset.
	2. Other Utilities
		Contains `mysql-connector-java` and `mariadb-java-client` binaries. Please note that these connectors are used to connect with XAMPP as our database is hosted by XAMPP.
	3. Schema
		Contains overall schema (ERD - Entity Relational Diagram) for our transactional database and data warehouse schema, in PNG format.
	4. Transformations
		Contains all transformations used to make the migration possible.

---

### Running Migration to Data Warehouse

1. Run XAMPP and import database from `Data/soccer.sql.zip`. This will create `soccer` database.
2. Create database with name `soccer_dwh`.
3. [Download](https://sourceforge.net/projects/pentaho/) and open Pentaho Data Integration.
4. Open transformations and run them with respect to this ordering:
	- `month_dim.ktr`
	- `season_dim.ktr`
	- `league_dim.ktr`
	- `team_dim.ktr`
	- `home_team_goals_fact.ktr`

---

### Validation of Result

1. `country` table in `soccer` database should contain **11** rows.
2. `league` table in `soccer` database should contain **11** rows.
3. `match` table in `soccer` database should contain **25,979** rows.
4. `season` table in `soccer` database should contain **8** rows.
5. `team` table in `soccer` database should contain **299** rows.
6. `month_dim` table in `soccer_dwh` database should contain **12** rows.
7. `season_dim` table in `soccer_dwh` database should contain **8** rows.
8. `league_dim` table in `soccer_dwh` database should contain **11** rows.
9. `team_dim` table in `soccer_dwh` database should contain **299** rows.
10. `home_team_goals_fact` table in `soccer_dwh` database should contain **14,046** rows.

Should you require an SQL query to validate the migrated results, you may do so with this query:

~~~~sql
SELECT
  `season_id` AS `season`,
  `team`.`team_fifa_api_id` AS `team`,
  MONTHNAME(`date`) AS `month`,
  SUM(`home_team_goal`) AS `goal_for`,
  SUM(`away_team_goal`) AS `goal_against`,
  (SUM(`home_team_goal`) - SUM(`away_team_goal`)) AS `total_goal`
FROM `match`
  JOIN `team`
    ON `match`.`home_team_api_id` = `team`.`team_api_id`
GROUP BY `team`, `season`, `month`
  HAVING `team`.`team_fifa_api_id` IS NOT NULL
ORDER BY `team`, `month`, `season`
~~~~

The query above should be done in `soccer` database, then compare the results with the ones in `home_team_goals_fact` table in `soccer_dwh` database.
