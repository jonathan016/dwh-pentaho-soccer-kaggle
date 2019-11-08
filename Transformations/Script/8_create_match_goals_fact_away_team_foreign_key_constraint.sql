USE `soccer_dwh`;

ALTER TABLE `match_goals_fact`
  ADD CONSTRAINT `match_goals_fact_fk_5` FOREIGN KEY (`away_team`) REFERENCES `team_dim` (`id`)
