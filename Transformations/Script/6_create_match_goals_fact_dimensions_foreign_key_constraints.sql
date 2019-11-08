USE `soccer_dwh`;

ALTER TABLE `match_goals_fact`
  ADD KEY `league` (`league`),
  ADD KEY `season` (`season`),
  ADD KEY `month` (`month`),
  ADD KEY `team` (`team`);

ALTER TABLE `match_goals_fact`
  ADD CONSTRAINT `match_goals_fact_fk_1` FOREIGN KEY (`league`) REFERENCES `league_dim` (`id`),
  ADD CONSTRAINT `match_goals_fact_fk_2` FOREIGN KEY (`season`) REFERENCES `season_dim` (`id`),
  ADD CONSTRAINT `match_goals_fact_fk_3` FOREIGN KEY (`month`) REFERENCES `month_dim` (`id`),
  ADD CONSTRAINT `match_goals_fact_fk_4` FOREIGN KEY (`team`) REFERENCES `team_dim` (`id`);
