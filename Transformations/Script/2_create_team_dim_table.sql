USE `soccer_dwh`;

DROP TABLE IF EXISTS `team_dim`;

CREATE TABLE `team_dim`(
  `id` INT(11) AUTO_INCREMENT NOT NULL,
  `fifa_id` INT(11) NOT NULL,
  `name` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
