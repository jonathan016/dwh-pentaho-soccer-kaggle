USE `soccer_dwh`;

ALTER TABLE `match_goals_fact`
  DROP INDEX `team`,
  DROP FOREIGN KEY `match_goals_fact_fk_4`;

ALTER TABLE `match_goals_fact`
  CHANGE `team` `home_team` INT(11) NOT NULL;

ALTER TABLE `match_goals_fact`
  ADD COLUMN `away_team` INT(11) NOT NULL;

ALTER TABLE `match_goals_fact`
  ADD KEY `home_team` (`home_team`),
  ADD KEY `away_team` (`away_team`),
  ADD CONSTRAINT `match_goals_fact_fk_4` FOREIGN KEY (`home_team`) REFERENCES `team_dim` (`id`);
