USE  `soccer_dwh`;

CREATE VIEW `team_total_goal_statistics` AS SELECT
    t1.name AS home_team,
    t2.name AS away_team,
    SUM(goal_for) AS total_goal_for,
    SUM(goal_against) AS total_goal_against,
    SUM(total_goal) AS total_goal,
    COUNT(*) AS meetings
FROM
    `match_goals_fact`
JOIN team_dim AS t1
ON
    match_goals_fact.home_team = t1.id
JOIN team_dim AS t2
ON
    match_goals_fact.away_team = t2.id
GROUP BY
    t1.name,
    t2.name;

--

CREATE VIEW `season_total_goal_statistics` AS SELECT
    season_dim.period,
    SUM(match_goals_fact.goal_for) AS gf,
    SUM(match_goals_fact.goal_against) AS ga,
    SUM(match_goals_fact.total_goal) AS gd
FROM
    `match_goals_fact`
JOIN `season_dim` ON match_goals_fact.season = season_dim.id
GROUP BY
    season_dim.id;

--

CREATE VIEW `league_total_goal_statistics` AS SELECT
    league_dim.name,
    SUM(match_goals_fact.goal_for) AS gf,
    SUM(match_goals_fact.goal_against) AS ga,
    SUM(match_goals_fact.total_goal) AS gd
FROM
    `match_goals_fact`
JOIN `league_dim` ON match_goals_fact.league = league_dim.id
GROUP BY
    league_dim.id;
