# Data Warehouse Creation

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
* [Opening Dashboard](#opening-dashboard)
* [Opening Report](#opening-report)

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

1. Run XAMPP and import database from `Data/soccer.zip`. This will create `soccer` database. Follow the guide from [this link](https://stackoverflow.com/questions/44366004/fatal-error-out-of-memory-allocated-761004032-tried-to-allocate-755370216-by) to import large database file to XAMPP's MySQL.
2. Run all scripts in `Transformation/Scripts` folder in ordered manner according to file name. Those script initializes the data warehouse schema.
3. [Download](https://sourceforge.net/projects/pentaho/) and open Pentaho Data Integration.
4. Copy binaries in `Other Utilities` folder to `lib` in Pentaho Data Integration folder.
5. Open transformations in `Transformation` folder and run them with respect to this ordering:
	- `month_dim.ktr`
	- `season_dim.ktr`
	- `league_dim.ktr`
	- `team_dim.ktr`
	- `match_goals_fact.ktr`

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
9. `team_dim` table in `soccer_dwh` database should contain **288** rows.
10. `match_goals_fact` table in `soccer_dwh` database should contain **25,629** rows.

Should you require an SQL query to validate the migrated results, you may do so with this query:

~~~~sql
SELECT *
FROM `match`
WHERE 
	home_team_api_id NOT IN 
		(SELECT team_api_id FROM `team` WHERE team_fifa_api_id IS NULL)
AND
	away_team_api_id NOT IN 
		(SELECT team_api_id FROM `team` WHERE team_fifa_api_id IS NULL)
~~~~

The query above should be done in `soccer` database, then compare the results with the ones in `match_goals_fact` table in `soccer_dwh` database.

### Opening Dashboard

1. [Register](https://www.qlik.com/us/try-or-buy/download-qlik-sense) for Qlik Sense account.
2. [Download](https://www.qlik.com/us/try-or-buy/download-qlik-sense) Qlik Sense Desktop, and do login with registered data.
3. Put the `soccer_dashboard.qvf` file on `C:\Users\<username>\Documents\Qlik\Sense\Apps` folder on Windows.
4. Open Qlik Sense, you should be able to see the project.
5. Open `Analysis` tab.

### Opening Report

1. [Download](https://sourceforge.net/projects/pentaho/files/Report%20Designer/) Pentaho Report Designer.
2. Copy binaries in `Other Utilities` folder to `lib` in Pentaho Report Designer folder.
3. Open Pentaho Report Designer.
4. Open all reports in folder `Report` with extension `.prpt`.
