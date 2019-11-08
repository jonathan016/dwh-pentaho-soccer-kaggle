USE `soccer_dwh`;

DROP TABLE IF EXISTS `match_goals_fact`;

CREATE TABLE `match_goals_fact`(
  `team` INT(11) NOT NULL,
  `month` INT(11) NOT NULL,
  `season` INT(11) NOT NULL,
  `league` INT(11) NOT NULL,
  `goal_for` INT(11) NOT NULL,
  `goal_against` INT(11) NOT NULL,
  `total_goal` INT(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
