USE `soccer_dwh`;

DROP TABLE IF EXISTS `league_dim`;

CREATE TABLE `league_dim`(
  `id` INT(11) AUTO_INCREMENT NOT NULL,
  `name` text COLLATE utf8_bin NOT NULL,
  `country_name` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
