USE `soccer_dwh`;

DROP TABLE IF EXISTS `season_dim`;

CREATE TABLE `season_dim`(
  `id` INT(11) AUTO_INCREMENT NOT NULL,
  `period` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
