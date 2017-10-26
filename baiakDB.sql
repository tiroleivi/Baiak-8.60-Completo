-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: Jul 29, 2017 as 02:24 
-- Versão do Servidor: 5.1.41
-- Versão do PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `baiak`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `backup_points` int(11) NOT NULL DEFAULT '0',
  `guild_points` int(11) NOT NULL DEFAULT '0',
  `guild_points_stats` int(11) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(20) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `vip_time` int(15) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL,
  `email_new_time` int(15) NOT NULL,
  `email_code` varchar(255) NOT NULL DEFAULT '0',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  `page_lastday` int(11) NOT NULL,
  `page_access` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `last_post` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10008720 ;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `email`, `premium_points`, `backup_points`, `guild_points`, `guild_points_stats`, `password`, `salt`, `premdays`, `lastday`, `key`, `blocked`, `warnings`, `group_id`, `vip_time`, `email_new`, `email_new_time`, `email_code`, `next_email`, `created`, `page_lastday`, `page_access`, `rlname`, `location`, `flag`, `last_post`, `create_date`, `create_ip`, `vote`) VALUES
(1, '1', '', 0, 0, 0, 0, 'ds68tf6fd65216wey9y63d23303r949ef656es32sr', '', 65535, 0, '', 0, 0, 1, 0, '', 0, '0', 0, 0, 1299890479, 0, '', '', 'unknown', 0, 0, 0, 0);

--
-- Gatilhos `accounts`
--
DROP TRIGGER IF EXISTS `ondelete_accounts`;
DELIMITER //
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts`
 FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE IF NOT EXISTS `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  KEY `world_id` (`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `account_viplist`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `auction_system`
--

CREATE TABLE IF NOT EXISTS `auction_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Extraindo dados da tabela `auction_system`
--

INSERT INTO `auction_system` (`id`, `player`, `item_id`, `item_name`, `count`, `cost`, `date`) VALUES
(8, 75086, 7368, 'assassin star', 1, 1000000, 1409446798),
(7, 75086, 7368, 'assassin star', 1, 1000000, 1409446798),
(9, 75086, 7368, 'assassin star', 1, 1000000, 1409446799),
(13, 75165, 5882, 'red dragon scale', 100, 3000000, 1409500072),
(14, 75165, 5948, 'red dragon leather', 100, 3000000, 1409500089),
(19, 76819, 2789, 'brown mushroom', 1, 2000000, 1409692875),
(27, 76506, 2293, 'magic wall rune', 1, 318700, 1409695180),
(28, 76819, 2789, 'brown mushroom', 1, 1000000, 1409695209),
(32, 75045, 2789, 'brown mushroom', 100, 1000000, 1409709275),
(33, 77662, 11305, 'drakinata', 2, 200000, 1410032077),
(35, 77662, 11303, 'zaoan shoes', 3, 200000, 1410032194),
(46, 75055, 8889, 'skullcracker armor', 1, 150000, 1410205830),
(59, 75064, 7894, 'magma legs', 1, 500000, 1410709967),
(60, 75064, 7894, 'magma legs', 1, 500000, 1410709974),
(61, 75064, 12643, 'royal scale robe', 1, 7500000, 1410709991);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) unsigned NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) unsigned NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`value`),
  KEY `active` (`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=75 ;

--
-- Extraindo dados da tabela `bans`
--

INSERT INTO `bans` (`id`, `type`, `value`, `param`, `active`, `expires`, `added`, `admin_id`, `comment`, `reason`, `action`, `statement`) VALUES
(3, 1, 433067185, 4294967295, 1, 1409417302, 1409244502, 75411, 'anuncio', 4, 0, ''),
(5, 2, 75810, 2, 0, -1, 1409259354, 75027, 'Name', 1, 1, ''),
(7, 1, 2490583897, 4294967295, 0, 1409478121, 1409305322, 75027, 'anuncio', 5, 0, ''),
(9, 1, 2428519113, 4294967295, 1, 1409571132, 1409398332, 75027, 'anuncio', 5, 0, ''),
(11, 1, 2890341833, 4294967295, 1, 1409674014, 1409501214, 75027, 'anuncio', 5, 0, ''),
(13, 1, 974507720, 4294967295, 1, 1409778343, 1409605543, 75027, 'spam', 5, 0, ''),
(15, 1, 1331279283, 4294967295, 1, 1410023123, 1409850323, 75027, 'anuncio', 5, 0, ''),
(16, 2, 77991, 2, 0, -1, 1409934596, 75027, 'Trocar o nome.', 1, 1, ''),
(21, 1, 2490583897, 4294967295, 0, 1410176815, 1410004015, 75027, 'anuncio', 5, 0, ''),
(25, 1, 2770612937, 4294967295, 1, 1410229262, 1410056462, 75027, 'noob', 5, 0, ''),
(27, 1, 3813827505, 4294967295, 1, 1410275556, 1410102756, 75027, 'roubando', 6, 0, ''),
(29, 1, 2651402173, 4294967295, 1, 1410385266, 1410212466, 75027, 'spam', 5, 0, ''),
(31, 1, 4191511217, 4294967295, 1, 1410385580, 1410212780, 75027, 'anuncio', 5, 0, ''),
(34, 1, 2282893245, 4294967295, 1, 1410397630, 1410224830, 75027, 'anuncio', 5, 0, ''),
(36, 1, 330749626, 4294967295, 1, 1410397715, 1410224915, 75027, 'anuncio', 5, 0, ''),
(38, 1, 4213916091, 4294967295, 0, 1410398621, 1410225822, 75027, 'ofensa', 4, 0, ''),
(40, 1, 3511881661, 4294967295, 1, 1410473383, 1410300583, 75027, 'usando bug', 10, 0, ''),
(42, 1, 3767667643, 4294967295, 1, 1410476741, 1410303941, 75027, 'spam', 5, 0, ''),
(44, 1, 3234037691, 4294967295, 1, 1410489959, 1410317159, 75027, 'ladraozim', 6, 0, ''),
(46, 1, 2026209211, 4294967295, 1, 1410573592, 1410400792, 75027, 'noob', 6, 0, ''),
(48, 1, 4127359153, 4294967295, 1, 1410627313, 1410454513, 75027, 'anuncio', 6, 0, ''),
(50, 1, 3645050299, 4294967295, 1, 1410634315, 1410461515, 75027, 'anuncio', 6, 0, ''),
(53, 1, 1320380603, 4294967295, 1, 1410714559, 1410541759, 75027, 'anuncio', 5, 0, ''),
(55, 1, 1636305352, 4294967295, 0, 1410714568, 1410541768, 75027, 'anuncio', 5, 0, ''),
(57, 1, 2182417853, 4294967295, 1, 1410725209, 1410552409, 75027, 'anuncio', 5, 0, ''),
(60, 1, 2523437491, 4294967295, 1, 1410739038, 1410566238, 75027, 'anuncio', 6, 0, ''),
(62, 1, 2490583897, 4294967295, 1, 1410780450, 1410607651, 79979, 'Não divulga aqui. ;D', 5, 0, ''),
(64, 1, 967653309, 4294967295, 1, 1410814605, 1410641806, 75027, 'anuncio', 6, 0, ''),
(66, 1, 2384091593, 4294967295, 1, 1410818467, 1410645667, 75027, 'anuncio', 6, 0, ''),
(68, 1, 3489912506, 4294967295, 0, 1410874326, 1410701526, 79979, 'Ofensa', 4, 0, ''),
(70, 1, 1721856187, 4294967295, 1, 1410890913, 1410718113, 79979, 'Divulga aqui não..', 5, 0, ''),
(72, 1, 2347104959, 4294967295, 1, 1410901937, 1410729137, 75027, 'anuncio', 6, 0, ''),
(74, 1, 3033725119, 4294967295, 1, 1410903622, 1410730822, 75027, 'anuncio', 6, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `environment_killers`
--

CREATE TABLE IF NOT EXISTS `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `kill_id` (`kill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `environment_killers`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE IF NOT EXISTS `global_storage` (
  `key` varchar(32) NOT NULL DEFAULT '0',
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `global_storage`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `balance` bigint(20) unsigned NOT NULL,
  `description` text NOT NULL,
  `logo_gfx_name` varchar(255) NOT NULL,
  `last_execute_points` int(11) NOT NULL DEFAULT '0',
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `guilds`
--


--
-- Gatilhos `guilds`
--
DROP TRIGGER IF EXISTS `oncreate_guilds`;
DELIMITER //
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
        INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_guilds`;
DELIMITER //
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds`
 FOR EACH ROW BEGIN
        UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE IF NOT EXISTS `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `guild_invites`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_kills`
--

CREATE TABLE IF NOT EXISTS `guild_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `war_id` int(11) NOT NULL,
  `death_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_kills_ibfk_1` (`war_id`),
  KEY `guild_kills_ibfk_2` (`death_id`),
  KEY `guild_kills_ibfk_3` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `guild_kills`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4268 ;

--
-- Extraindo dados da tabela `guild_ranks`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE IF NOT EXISTS `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `enemy_id` int(11) NOT NULL,
  `begin` bigint(20) NOT NULL DEFAULT '0',
  `end` bigint(20) NOT NULL DEFAULT '0',
  `frags` int(10) unsigned NOT NULL DEFAULT '0',
  `payment` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guild_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `enemy_kills` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `guild_id` (`guild_id`),
  KEY `enemy_id` (`enemy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=361 ;

--
-- Extraindo dados da tabela `guild_wars`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) unsigned NOT NULL DEFAULT '0',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `rent` int(10) unsigned NOT NULL DEFAULT '0',
  `doors` int(10) unsigned NOT NULL DEFAULT '0',
  `beds` int(10) unsigned NOT NULL DEFAULT '0',
  `tiles` int(10) unsigned NOT NULL DEFAULT '0',
  `guild` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clear` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `houses`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `house_auctions`
--

CREATE TABLE IF NOT EXISTS `house_auctions` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `limit` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `house_auctions`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `house_data`
--

CREATE TABLE IF NOT EXISTS `house_data` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `house_data`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE IF NOT EXISTS `house_lists` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `house_lists`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `killers`
--

CREATE TABLE IF NOT EXISTS `killers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `war` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `death_id` (`death_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `killers`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `login_history`
--

CREATE TABLE IF NOT EXISTS `login_history` (
  `account_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `login` tinyint(1) NOT NULL DEFAULT '0',
  `ip` int(11) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `login_history`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `lottery`
--

CREATE TABLE IF NOT EXISTS `lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `item_name` varchar(255) NOT NULL,
  `date` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `lottery`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `marriage_system`
--

CREATE TABLE IF NOT EXISTS `marriage_system` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `partner` varchar(255) NOT NULL,
  `marriage_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marriage_system`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `lookmount` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `pvp_blessing` tinyint(1) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` bigint(20) NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) unsigned NOT NULL DEFAULT '0',
  `marrystatus` int(10) unsigned NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `exphist_lastexp` bigint(255) NOT NULL DEFAULT '0',
  `exphist1` bigint(255) NOT NULL DEFAULT '0',
  `exphist2` bigint(255) NOT NULL DEFAULT '0',
  `exphist3` bigint(255) NOT NULL DEFAULT '0',
  `exphist4` bigint(255) NOT NULL DEFAULT '0',
  `exphist5` bigint(255) NOT NULL DEFAULT '0',
  `exphist6` bigint(255) NOT NULL DEFAULT '0',
  `exphist7` bigint(255) NOT NULL DEFAULT '0',
  `onlinetimetoday` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime1` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime2` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime3` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime4` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime5` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime6` bigint(255) NOT NULL DEFAULT '0',
  `onlinetime7` bigint(255) NOT NULL DEFAULT '0',
  `onlinetimeall` bigint(255) NOT NULL DEFAULT '0',
  `auction_balance` int(15) NOT NULL,
  `created` int(11) NOT NULL,
  `nick_verify` varchar(5) NOT NULL,
  `old_name` varchar(255) NOT NULL DEFAULT '',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `show_outfit` int(11) NOT NULL DEFAULT '0',
  `show_eq` int(11) NOT NULL DEFAULT '0',
  `show_bars` int(11) NOT NULL DEFAULT '0',
  `show_skills` int(11) NOT NULL DEFAULT '0',
  `show_quests` int(11) NOT NULL DEFAULT '0',
  `stars` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `signature` text NOT NULL,
  `cast` tinyint(4) NOT NULL DEFAULT '0',
  `castViewers` int(11) NOT NULL DEFAULT '0',
  `castDescription` varchar(255) NOT NULL,
  `offlinetraining_time` smallint(5) unsigned NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `broadcasting` tinyint(4) DEFAULT '0',
  `viewers` int(1) DEFAULT '0',
  `ip` varchar(17) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`),
  KEY `account_id` (`account_id`),
  KEY `group_id` (`group_id`),
  KEY `online` (`online`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80382 ;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `lookmount`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `pvp_blessing`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `marrystatus`, `promotion`, `deleted`, `description`, `exphist_lastexp`, `exphist1`, `exphist2`, `exphist3`, `exphist4`, `exphist5`, `exphist6`, `exphist7`, `onlinetimetoday`, `onlinetime1`, `onlinetime2`, `onlinetime3`, `onlinetime4`, `onlinetime5`, `onlinetime6`, `onlinetime7`, `onlinetimeall`, `auction_balance`, `created`, `nick_verify`, `old_name`, `hide_char`, `comment`, `show_outfit`, `show_eq`, `show_bars`, `show_skills`, `show_quests`, `stars`, `create_ip`, `create_date`, `signature`, `cast`, `castViewers`, `castDescription`, `offlinetraining_time`, `offlinetraining_skill`, `broadcasting`, `viewers`, `ip`) VALUES
(1, 'Account Manager', 0, 1, 1, 8, 0, 185, 185, 4200, 0, 88, 88, 0, 134, 0, 0, 0, 35, 35, 0, 100, 2, 31650, 32669, 7, '', 850, 0, 1390918777, 1917640030, 0, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(2, 'Rook Sample', 0, 1, 1, 8, 0, 185, 185, 4200, 0, 88, 88, 0, 134, 0, 0, 0, 35, 35, 0, 100, 2, 32360, 31782, 7, '', 850, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 0, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890460, '1', '', 0, '0', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(3, 'Sorcerer Sample', 0, 1, 1, 8, 1, 185, 185, 4200, 0, 88, 88, 0, 134, 0, 0, 0, 35, 35, 0, 100, 2, 32369, 32241, 7, '', 850, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890460, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(4, 'Druid Sample', 0, 1, 1, 8, 2, 185, 185, 4200, 0, 88, 88, 0, 134, 0, 0, 0, 35, 35, 0, 100, 2, 32369, 32241, 7, '', 850, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890460, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(5, 'Paladin Sample', 0, 1, 1, 8, 3, 185, 185, 4200, 0, 88, 88, 0, 134, 0, 0, 0, 35, 35, 0, 100, 2, 32369, 32241, 7, '', 850, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890460, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0'),
(6, 'Knight Sample', 0, 1, 1, 8, 4, 185, 185, 4200, 0, 88, 88, 0, 134, 0, 0, 0, 35, 35, 0, 100, 2, 32369, 32241, 7, '', 850, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, 0, '', 4200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1299890461, '1', '', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, '', 43200, -1, 0, 0, '0');

--
-- Gatilhos `players`
--
DROP TRIGGER IF EXISTS `oncreate_players`;
DELIMITER //
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players`
 FOR EACH ROW BEGIN
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
        INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_players`;
DELIMITER //
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
        DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
        UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE IF NOT EXISTS `player_deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `player_deaths`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE IF NOT EXISTS `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_depotitems`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_inboxitems`
--

CREATE TABLE IF NOT EXISTS `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `player_id` (`player_id`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_inboxitems`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE IF NOT EXISTS `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_items`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_killers`
--

CREATE TABLE IF NOT EXISTS `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_killers`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE IF NOT EXISTS `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_namelocks`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_skills`
--

CREATE TABLE IF NOT EXISTS `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(2, 0, 10, 0),
(2, 1, 10, 0),
(2, 2, 10, 0),
(2, 3, 10, 0),
(2, 4, 10, 0),
(2, 5, 10, 0),
(2, 6, 10, 0),
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE IF NOT EXISTS `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`name`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_spells`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_statements`
--

CREATE TABLE IF NOT EXISTS `player_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `player_statements`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE IF NOT EXISTS `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`key`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_storage`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `player_viplist`
--

CREATE TABLE IF NOT EXISTS `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  KEY `player_id` (`player_id`),
  KEY `vip_id` (`vip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `player_viplist`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `polls`
--

CREATE TABLE IF NOT EXISTS `polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `poll` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `polls`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `poll_votes`
--

CREATE TABLE IF NOT EXISTS `poll_votes` (
  `poll_id` int(11) NOT NULL,
  `votes` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  KEY `poll_id` (`poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `poll_votes`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE IF NOT EXISTS `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '38'),
('encryption', '2'),
('vahash_key', 'JS9T-SW3A-HO54-7WOP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_motd`
--

CREATE TABLE IF NOT EXISTS `server_motd` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(5, 0, 'Bem-vindo ao MegaTibia, divirta-se!'),
(6, 0, 'Welcome to the MegaTibia Server!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_record`
--

CREATE TABLE IF NOT EXISTS `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL,
  UNIQUE KEY `record` (`record`,`world_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `server_record`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `server_reports`
--

CREATE TABLE IF NOT EXISTS `server_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `reads` (`reads`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `server_reports`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tiles`
--

CREATE TABLE IF NOT EXISTS `tiles` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `house_id` int(10) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `z` tinyint(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`),
  KEY `x` (`x`,`y`,`z`),
  KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tiles`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_items`
--

CREATE TABLE IF NOT EXISTS `tile_items` (
  `tile_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  `serial` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tile_items`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE IF NOT EXISTS `tile_store` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  KEY `house_id` (`house_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tile_store`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `woe`
--

CREATE TABLE IF NOT EXISTS `woe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `woe`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `zaypay_payment`
--

CREATE TABLE IF NOT EXISTS `zaypay_payment` (
  `payID` bigint(30) NOT NULL,
  `account_id` int(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`payID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `zaypay_payment`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_changelog`
--

CREATE TABLE IF NOT EXISTS `z_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `where` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `hide` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_changelog`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_featured_article`
--

CREATE TABLE IF NOT EXISTS `z_featured_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(30) NOT NULL,
  `author` varchar(50) NOT NULL,
  `read_more` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `z_featured_article`
--

INSERT INTO `z_featured_article` (`id`, `title`, `text`, `date`, `author`, `read_more`) VALUES
(1, 'IP: megatibia.net 8.60 ON-line', '<p>Somos um OTserver, utilizamos mapa global temos rates inicialmente f&aacute;ceis temos uma boa estrutura em rela&ccedil;&atilde;o a qualidade de jogo, sempre estamos melhorando o Maximo poss&iacute;vel para trazer a voc&ecirc; player, toda qualidade de', '1392585220', 'Sorcerer Sample', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE IF NOT EXISTS `z_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` tinyint(4) NOT NULL DEFAULT '1',
  `post_icon_id` tinyint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_forum`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_monsters`
--

CREATE TABLE IF NOT EXISTS `z_monsters` (
  `hide_creature` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `speed_lvl` int(11) NOT NULL DEFAULT '1',
  `use_haste` tinyint(1) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `summonable` tinyint(1) NOT NULL,
  `convinceable` tinyint(1) NOT NULL,
  `race` varchar(255) NOT NULL,
  `gfx_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_monsters`
--

INSERT INTO `z_monsters` (`hide_creature`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `gfx_name`) VALUES
(0, 'Amazon', 390, 60, 110, 1, 0, '"Yeeee ha!", "Your head shall be mine!"', '', 1, 1, 'blood', 'amazon.gif'),
(0, 'Valkyrie', 450, 85, 190, 1, 0, '"Another head for me!", "Head off!", "Your head will be mine!", "Stand still!", "One more head for me!"', '', 1, 1, 'blood', 'valkyrie.gif'),
(0, 'Carrion Worm', 380, 70, 145, 1, 0, '', '', 0, 1, 'blood', 'carrionworm.gif'),
(0, 'Rotworm', 305, 40, 65, 1, 0, '', '', 0, 1, 'blood', 'rotworm.gif'),
(0, 'Kongra', 0, 115, 340, 1, 1, '"Hugah!", "Ungh! Ungh!", "Huaauaauaauaa!"', '', 0, 0, 'blood', 'kongra.gif'),
(0, 'Merlkin', 0, 145, 235, 1, 0, '"Ugh! Ugh! Ugh!", "Holy banana!", "Chakka! Chakka!"', 'outfit, drunk, invisible', 0, 0, 'blood', 'merlkin.gif'),
(0, 'Sibang', 0, 105, 225, 1, 1, '"Eeeeek! Eeeeek", "Huh! Huh! Huh!", "Ahhuuaaa!"', 'outfit, drunk, invisible', 0, 0, 'blood', 'sibang.gif'),
(0, 'Crystal Spider', 0, 900, 1250, 60, 1, '"Screeech!"', 'paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'crystalspider.gif'),
(0, 'Giant Spider', 0, 900, 1300, 30, 1, '', 'outfit, drunk, invisible', 0, 0, 'venom', 'giantspider.gif'),
(0, 'Poison Spider', 270, 22, 26, 1, 0, '', '', 1, 1, 'venom', 'poisonspider.gif'),
(0, 'Scorpion', 310, 45, 45, 1, 0, '', '', 1, 1, 'venom', 'scorpion.gif'),
(0, 'Spider', 210, 12, 20, 1, 0, '', '', 1, 1, 'venom', 'spider.gif'),
(0, 'Tarantula', 485, 120, 225, 30, 1, '', 'outfit, drunk', 1, 1, 'venom', 'tarantula.gif'),
(0, 'Wailing Widow', 0, 450, 850, 30, 1, '"EMBRACE MY GIFTS!", "I WILL FEAST ON YOUR SOUL!"', 'paralyze, invisible, death, earth', 0, 0, 'venom', 'wailingwidow.gif'),
(0, 'Drasilla', 0, 700, 1320, 1, 0, '"FCHHHHHHHH!", "GROOOOAAAAAAAAR!", "DIRTY LITTLE HUMANS", "YOU CAN''T KEEP ME HERE FOREVER"', 'invisible, fire', 0, 0, 'blood', 'drasilla.gif'),
(0, 'Grimgor Guteater', 0, 670, 1115, 10, 0, '"Dont run, You''re burning off precious fat."', 'invisible, fire', 0, 0, 'blood', 'grimgorguteater.gif'),
(0, 'Slim', 0, 580, 1025, 1, 0, '"Zhroozzzzs."', 'invisible, death, earth', 0, 0, 'undead', 'slim.gif'),
(0, 'Spirit Of Earth', 0, 800, 1285, 1, 0, '"Show your strengh ... or perish."', 'invisible, earth', 0, 0, 'undead', 'spiritofearth.gif'),
(0, 'Spirit Of Fire', 0, 950, 2140, 1, 0, '"Feel the heat."', 'invisible, fire', 0, 0, 'blood', 'spiritoffire.gif'),
(0, 'Spirit Of Water', 0, 850, 1517, 1, 0, '"Blubb"', 'invisible, fire', 0, 0, 'undead', 'spiritofwater.gif'),
(0, 'Darakan The Executioner', 0, 1600, 3500, 1, 0, '"FIGHT LIKE A BARBARIAN!", "VICTORY IS MINE!", "I AM your father!", "To be the man you have to beat the man!"', 'invisible', 0, 1, 'blood', 'darakantheexecutioner.gif'),
(0, 'Deathbringer', 0, 5100, 10000, 40, 0, '"YOU FOOLS WILL PAY!", "YOU ALL WILL DIE!!", "DEATH, DESTRUCTION!", "I will eat your soul!"', 'fire, ice, death, invisible', 0, 0, 'undead', 'deathbringer.gif'),
(0, 'Gnorre Chyllson', 0, 4000, 7100, 75, 0, '"I am like the merciless northwind.", "Snow will be your death shroud.", "Feel the wrath of father chyll!"', 'paralyze, fire, ice, invisible', 0, 0, 'blood', 'gnorrechyllson.gif'),
(0, 'Norgle Glacierbeard', 0, 2100, 4300, 1, 0, '"I''ll extinguish you warmbloods.", "REVENGE!", "Far too hot.", "DISGUSTING WARMBLOODS!", "Revenge is sweetest when served cold."', 'invisible, ice, fire', 0, 1, 'blood', 'norgleglacierbeard.gif'),
(0, 'Svoren The Mad', 0, 3000, 6300, 1, 1, '"NO mommy NO. Leave me alone!", "Not that tower again!"', 'invisible, ice, energy, earth, fire', 0, 1, 'blood', 'svorenthemad.gif'),
(0, 'The Masked Marauder', 0, 3500, 6800, 15, 0, '"Didn''t you leave your house door open?", "Oops, your shoelaces are open!"', 'invisible, fire', 0, 0, 'blood', 'themaskedmarauder.gif'),
(0, 'The Obliverator', 0, 6000, 9500, 30, 0, '"NO ONE WILL BEAT ME!"', 'invisible, fire', 0, 0, 'fire', 'theobliverator.gif'),
(0, 'The Pit Lord', 0, 2500, 4500, 25, 1, '"I''LL GET YOU ALL!", "I won''t let you escape!", "I''ll crush you beneath my feet!"', 'invisible', 0, 0, 'blood', 'thepitlord.gif'),
(0, 'Webster', 0, 1200, 1750, 35, 1, '"You are lost!", "Come my little morsel."', 'invisible, fire, ice', 0, 0, 'undead', 'webster.gif'),
(0, 'Barbarian Bloodwalker', 590, 195, 305, 1, 1, '"YAAAHEEE!", "SLAUGHTER!", "CARNAGE!", "You can run but you can''t hide"', '', 0, 1, 'blood', 'barbarianbloodwalker.gif'),
(0, 'Barbarian Brutetamer', 0, 90, 145, 25, 0, '"To me, creatures of the wild!", "My instincts tell me about your cowardice."', 'lifedrain, paralyze, outfit, invisible', 0, 0, 'blood', 'barbarianbrutetamer.gif'),
(0, 'Barbarian Headsplitter', 450, 85, 100, 25, 0, '"I will regain my honor with your blood!", "Surrender is not option!", "Its you or me!"', 'paralyze', 0, 1, 'blood', 'barbarianheadsplitter.gif'),
(0, 'Barbarian Skullhunter', 450, 85, 135, 25, 0, '"You will become my trophy.", "Fight harder, coward.", "Show that you are a worthy opponent."', 'drunk, paralyze', 0, 1, 'blood', 'barbarianskullhunter.gif'),
(0, 'Bear', 300, 23, 80, 1, 0, '"grrrr", "groar"', '', 1, 1, 'blood', 'bear.gif'),
(0, 'Panda', 300, 23, 80, 10, 0, '"Grrrr", "Groar"', '', 1, 1, 'blood', 'panda.gif'),
(0, 'Polar Bear', 315, 28, 85, 1, 0, '"Grrrrrr", "GROARRR!"', '', 1, 1, 'blood', 'polarbear.gif'),
(0, 'Beholder', 0, 170, 260, 1, 0, '"Eye for eye!", "Here''s looking at you!", "Let me take a look at you!", "You''ve got the look!"', 'invisible', 0, 0, 'venom', 'beholder.gif'),
(0, 'Braindeath', 0, 895, 1225, 25, 0, '"You have disturbed my thoughts!", "Let me turn you into something more useful!", "Let me taste your brain!", "You will be punished!"', 'earth, death, invisible', 0, 0, 'undead', 'braindeath.gif'),
(0, 'Elder Beholder', 0, 280, 1100, 25, 0, '"Let me take a look at you!", "Inferior creatures, bow before my power!"', 'lifedrain, invisible', 0, 0, 'blood', 'elderbeholder.gif'),
(0, 'Gazer', 0, 90, 120, 10, 1, '"Mommy!?", "Buuuuhaaaahhaaaaa!", "Me need mana!"', 'invisible', 0, 0, 'venom', 'gazer.gif'),
(0, 'Bog Raider', 0, 900, 1300, 40, 1, '"Tchhh!", "Slurp!"', 'paralyze, invisible', 0, 0, 'venom', 'bograider.gif'),
(0, 'Carniphila', 0, 150, 255, 10, 0, '', 'invisible', 0, 0, 'venom', 'carniphila.gif'),
(0, 'Defiler', 0, 3700, 3650, 20, 0, '"Blubb"', 'paralyze, invisible', 0, 0, 'venom', 'defiler.gif'),
(0, 'Haunted Treeling', 0, 310, 450, 20, 0, '', 'earth', 0, 0, 'undead', 'hauntedtreeling.gif'),
(0, 'Slime', 0, 160, 150, 1, 0, '', '', 0, 0, 'venom', 'slime.gif'),
(0, 'Son Of Verminor', 0, 5900, 8500, 1, 0, '', 'poison, paralyze, invisible', 0, 0, 'venom', 'sonofverminor.gif'),
(0, 'Spit Nettle', 0, 20, 150, 1, 0, '', 'paralyze, invisible', 0, 0, 'venom', 'spitnettle.gif'),
(0, 'Chicken', 220, 0, 15, 1, 0, '"gokgoooook", "cluck cluck"', '', 1, 1, 'blood', 'chicken.gif'),
(0, 'Dire Penguin', 0, 120, 173, 1, 0, '', 'lifedrain, paralyze, outfit, invisible', 0, 0, 'blood', 'direpenguin.gif'),
(0, 'Flamingo', 250, 0, 25, 1, 0, '', '', 1, 1, 'blood', 'flamingo.gif'),
(0, 'Parrot', 250, 0, 25, 10, 0, '"BR? PL? SWE?", "Screeech!", "Neeeewbiiieee!", "You advanshed, you advanshed!", "Hope you die and loooosh it!", "Hunterrr ish PK!", "Shhtop whining! Rrah", "I''m heeerrre! Screeeech!", "Leeave orrr hunted!!", "Blesshhh my stake! Screeech!", "Tarrrrp?", "You are corrrrupt! Corrrrupt!", "You powerrrrrrabuserrrrr!", "You advanshed, you advanshed!"', '', 1, 1, 'blood', 'parrot.gif'),
(0, 'Penguin', 300, 1, 33, 1, 0, '', '', 1, 1, 'blood', 'penguin.gif'),
(0, 'Seagull', 250, 0, 25, 1, 0, '', '', 1, 0, 'blood', 'seagull.gif'),
(0, 'Terror Bird', 490, 150, 300, 30, 0, '"CRAAAHHH!", "Gruuuh Gruuuh.", "Carrah Carrah!"', '', 1, 1, 'blood', 'terrorbird.gif'),
(0, 'Acid Blob', 0, 250, 250, 1, 0, '', 'death, earth', 0, 0, 'venom', 'acidblob.gif'),
(0, 'Death Blob', 0, 300, 320, 5, 0, '', '', 0, 0, 'undead', 'deathblob.gif'),
(0, 'Mercury Blob', 0, 180, 150, 1, 0, '"Crackle"', 'death', 0, 0, 'undead', 'mercuryblob.gif'),
(0, 'Annihilon', 0, 10000, 60000, 80, 1, '"Annihilation!"', 'lifedrain, invisible', 0, 0, 'fire', 'annihilon.gif'),
(0, 'Apocalypse', 0, 80000, 160000, 90, 0, '"I AM APOCALYPSE, LORD OF DESTRUCTION!"', 'paralyze, invisible', 0, 0, 'undead', 'apocalypse.gif'),
(0, 'Apprentice Sheng', 0, 100, 95, 1, 0, '"I will protect the secrets of my master!", "This isle will become ours alone!", "Kaplar!"', 'energy', 0, 0, 'blood', 'apprenticesheng.gif'),
(0, 'Brutus Bloodbeard', 0, 500, 1200, 10, 0, '', 'invisible', 0, 0, 'blood', 'brutusbloodbeard.gif'),
(0, 'Countess Sorrow', 0, 5150, 7200, 15, 0, '', 'physical, poison, ice, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'countesssorrow.gif'),
(0, 'Deadeye Devious', 0, 500, 2000, 40, 0, '"Let''s kill ''em", "Arrrgh!", "You''ll never take me alive!"', 'invisible', 0, 0, 'blood', 'deadeyedevious.gif'),
(0, 'Demodras', 0, 4000, 4500, 5, 0, '"I WILL SET THE WORLD IN FIRE!", "I WILL PROTECT MY BROOD!"', 'paralyze, invisible', 0, 0, 'blood', 'demodras.gif'),
(0, 'Dharalion', 0, 380, 380, 10, 1, '"Feel my wrath!", "Noone will stop my ascension!", "My powers are divine!"', 'fire, poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'dharalion.gif'),
(0, 'Dracola', 0, 7750, 15850, 95, 0, '"DEATH CAN''T STOP MY HUNGER!"', 'paralyze, invisible', 0, 0, 'undead', 'dracola.gif'),
(0, 'Fernfang', 0, 400, 400, 10, 1, '"You desecrated this place!", "I will cleanse this isle!", "Grrrrrrr", "Yoooohhuuuu!"', 'invisible', 0, 0, 'blood', 'fernfang.gif'),
(0, 'Ferumbras', 0, 12000, 35000, 50, 1, '"NOONE WILL STOP ME THIS TIME!", "THE POWER IS MINE!"', 'lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'venom', 'ferumbras.gif'),
(0, 'Fluffy', 0, 3550, 4500, 45, 0, '"Wooof!"', 'drunk, invisible', 0, 0, 'blood', 'fluffy.gif'),
(0, 'General Murius', 0, 300, 550, 10, 0, '"Feel the power of the Mooh''Tah!", "You will get what you deserve!", "For the king!"', 'invisible', 0, 0, 'blood', 'generalmurius.gif'),
(0, 'Ghazbaran', 0, 15000, 60000, 90, 1, '"COME HERE AND DIE!", "COME AND GIVE ME SOME AMUSEMENT!", "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", "I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!", "FLAWLESS VICTORY!"', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'ghazbaran.gif'),
(0, 'Golgordan', 0, 10000, 40000, 65, 0, '"Latrivan your fool"', 'death', 0, 0, 'fire', 'golgordan.gif'),
(0, 'Grorlam', 0, 2400, 3000, 10, 1, '', 'paralyze, invisible', 0, 0, 'blood', 'grorlam.gif'),
(0, 'Hairman The Huge', 0, 335, 600, 5, 1, '"Hugah!", "Ungh! Ungh!", "Huaauaauaauaa!"', 'invisible', 0, 0, 'blood', 'hairmanthehuge.gif'),
(0, 'Hellgorak', 0, 10000, 40000, 70, 0, '"I''ll sacrifice yours souls to seven!", "I''m bad news for you mortals!", "No man can defeat me!", "Your puny skills are no match for me.", "I smell your fear.", "Delicious!"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'hellgorak.gif'),
(0, 'Koshei The Deathless', 0, 0, 2000, 85, 0, '"Your pain will be beyond imagination!", "You can''t defeat me! I will ressurect and take your soul!", "Death is my ally!", "Welcome to my domain, visitor!", "You will be my toy on the other side!", "What a disgusting smell of life!"', 'death, earth, paralyze, invisible', 0, 0, 'undead', 'kosheithedeathless.gif'),
(0, 'Latrivan', 0, 10000, 40000, 60, 0, '"I might reward you for killing my brother ~ with a swift dead!"', 'fire', 0, 0, 'fire', 'latrivan.gif'),
(0, 'Lethal Lissy', 0, 500, 1450, 10, 0, '', 'invisible', 0, 0, 'blood', 'lethallissy.gif'),
(0, 'Leviathan', 0, 5000, 6000, 20, 0, '"CHHHRRRR", "HISSSS!"', 'ice, lifedrain, paralyze, invisible', 0, 0, 'undead', 'leviathan.gif'),
(0, 'Lord Of The Elements', 0, 8000, 10000, 75, 0, '', 'holy, earth, physical, fire, death, invisible', 0, 0, 'undead', 'lordoftheelements.gif'),
(0, 'Mad Technomancer', 0, 55, 1000, 1, 0, '"I''m going to make them an offer they can''t refuse.", "My masterplan cannot fail!", "Gentlemen, you can''t fight here! This is the War Room!"', 'invisible', 0, 0, 'blood', 'madtechnomancer.gif'),
(0, 'Madareth', 0, 10000, 55000, 80, 0, '"I am going to play with yourself!"', 'energy, fire, invisible', 0, 0, 'fire', 'madareth.gif'),
(0, 'Man In The Cave', 0, 555, 485, 1, 0, '"THE MONKS ARE MINE", "I will rope you up! All of you!", "You have been roped up!", "A MIC to rule them all!"', 'fire, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'maninthecave.gif'),
(0, 'Massacre', 0, 9800, 30000, 85, 1, '', 'energy, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'massacre.gif'),
(0, 'Minishabaal', 0, 4000, 3500, 240, 1, '"I had Princess Lumelia as breakfast!", "Naaa-Nana-Naaa-Naaa!", "My brother will come and get you for this!", "Get them Fluffy!", "He He He!", "Pftt, Ferumbras such an upstart!", "My dragon is not that old, it''s just second hand!", "My other dragon is a red one!", "When I am big I want to become the ruthless eighth!", "WHERE''S FLUFFY?", "Muahaha!"', 'invisible', 0, 0, 'blood', 'minishabaal.gif'),
(0, 'Morgaroth', 0, 15000, 55000, 90, 1, '"I AM MORGAROTH, LORD OF THE TRIANGLE... AND YOU ARE LOST!", "MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!", "THE TRIANGLE OF TERROR WILL RISE!", "ZATHROTH! LOOK AT THE DESTRUCTION I AM CAUSING IN YOUR NAME!"', 'paralyze, invisible', 0, 0, 'fire', 'morgaroth.gif'),
(0, 'Mr. Punish', 0, 5500, 12000, 125, 0, '', 'energy, fire, poison, invisible', 0, 0, 'undead', 'mr.punish.gif'),
(0, 'Munster', 250, 23, 58, 1, 0, '"Meeeeep!"', '', 1, 1, 'blood', 'munster.gif'),
(0, 'Necropharus', 0, 700, 750, 10, 0, '"You will rise as my servant!", "Praise to my master Urgith!"', 'poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'necropharus.gif'),
(0, 'Orshabaal', 0, 9999, 22500, 80, 1, '"PRAISED BE MY MASTERS, THE RUTHLESS SEVEN!", "YOU ARE DOOMED!", "ORSHABAAL IS BACK!", "Be prepared for the day my masters will come for you!", "SOULS FOR ORSHABAAL!"', 'lifedrain, paralyze, invisible', 0, 0, 'fire', 'orshabaal.gif'),
(0, 'Pythius The Rotten', 0, 100, 9000, 50, 0, '"YOU''LL NEVER GET MY TREASURE!", "MINIONS, MEET YOUR NEW BROTHER!", "YOU WILL REGRET THAT YOU ARE BORN!", "YOU MADE A HUGE WASTE!"', 'death, earth, energy, lifedrain, invisible', 0, 0, 'undead', 'pythiustherotten.gif'),
(0, 'Ron The Ripper', 0, 500, 1500, 10, 0, '', '', 0, 0, 'blood', 'rontheripper.gif'),
(0, 'Rotworm Queen', 0, 300, 85, 1, 0, '', '', 0, 0, 'blood', 'rotwormqueen.gif'),
(0, 'The Count', 0, 1750, 4600, 75, 0, '', 'lifedrain, death, invisible', 0, 0, 'undead', 'thecount.gif'),
(0, 'The Evil Eye', 0, 500, 1200, 10, 0, '"Inferior creatures, bow before my power!"', 'invisible', 0, 0, 'blood', 'theevileye.gif'),
(0, 'The Handmaiden', 0, 3850, 14500, 115, 1, '', 'energy, fire, ice, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'thehandmaiden.gif'),
(0, 'The Horned Fox', 0, 200, 265, 1, 0, '"You will never get me!", "I''ll be back!", "Catch me, if you can!", "Help me, boys!"', 'invisible', 0, 0, 'blood', 'thehornedfox.gif'),
(0, 'The Imperor', 0, 8000, 15000, 55, 1, '"Muahaha!", "He he he!"', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'theimperor.gif'),
(0, 'The Noxious Spawn', 0, 6000, 9500, 10, 0, '"I bring you deathhhh, mortalssss."', 'paralyze, invisible', 0, 0, 'venom', 'thenoxiousspawn.gif'),
(0, 'The Old Widow', 0, 2800, 3200, 10, 1, '', 'fire, poison, lifedrain, outfit, drunk, invisible', 0, 0, 'blood', 'theoldwidow.gif'),
(0, 'The Plasmother', 0, 8900, 16050, 45, 0, '"Blubb"', 'poison, lifedrain, paralyze, invisible', 0, 0, 'venom', 'theplasmother.gif'),
(0, 'Thul', 0, 1800, 3000, 40, 0, '"Gaaahhh!"', '', 0, 0, 'undead', 'thul.gif'),
(0, 'Tiquandas Revenge', 0, 1755, 2000, 110, 0, '', 'invisible', 0, 0, 'venom', 'tiquandasrevenge.gif'),
(0, 'Undead Minion', 620, 550, 850, 5, 0, '', 'fire, poison, lifedrain, drunk', 0, 1, 'undead', 'undeadminion.gif'),
(0, 'Ushuriel', 0, 10000, 50000, 65, 1, '', 'lifedrain, paralyze, invisible', 0, 0, 'fire', 'ushuriel.gif'),
(0, 'Xenia', 450, 255, 290, 1, 0, '"Stand still!", "One more head for me!", "Head off!"', '', 1, 1, 'blood', 'xenia.gif'),
(0, 'Zugurosh', 0, 10000, 95000, 60, 0, '"You will run out of resources soon enough!!", "One little mistake and your all are mine!", "I sense your strength fading!"', 'death, paralyze, invisible', 0, 0, 'fire', 'zugurosh.gif'),
(0, 'Dog', 220, 0, 20, 1, 0, '"Wuff! Wuff!"', '', 1, 1, 'blood', 'dog.gif'),
(0, 'Hellhound', 0, 6800, 7500, 45, 0, '"GROOOWL!", "GRRRRR!"', 'paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'hellhound.gif'),
(0, 'Husky', 420, 0, 140, 1, 0, '"Yoooohuuuu!", "Grrrrrrr", "Ruff, ruff!"', '', 1, 1, 'blood', 'husky.gif'),
(0, 'War Wolf', 0, 55, 140, 1, 0, '"Grrrrrrr", "Yoooohhuuuu!"', '', 0, 1, 'blood', 'warwolf.gif'),
(0, 'Werewolf', 0, 1450, 1955, 50, 0, '"BLOOD!", "HRAAAAAAAAAARRRRRR!"', 'paralyze, invisible', 0, 0, 'blood', 'werewolf.gif'),
(0, 'Winter Wolf', 260, 20, 30, 1, 0, '', '', 1, 1, 'blood', 'winterwolf.gif'),
(0, 'Wolf', 255, 18, 25, 1, 0, '', '', 1, 1, 'blood', 'wolf.gif'),
(0, 'Chakoya Toolshaper', 0, 40, 80, 25, 0, '"Chikuva!!", "Jinuma jamjam!", "Suvituka siq chuqua!", "Kiyosa sipaju!"', '', 0, 0, 'blood', 'chakoyatoolshaper.gif'),
(0, 'Chakoya Tribewarden', 305, 40, 68, 25, 0, '"Quisavu tukavi!", "Si siyoqua jamjam!", "Achuq! jinuma!", "Si ji jusipa!"', '', 0, 1, 'blood', 'chakoyatribewarden.gif'),
(0, 'Chakoya Windcaller', 305, 48, 84, 25, 0, '"Mupi! Si siyoqua jinuma!", "Siqsiq ji jusipa!", "Jagura taluka taqua!", "Quatu nguraka!"', '', 0, 1, 'blood', 'chakoyawindcaller.gif'),
(0, 'Blood Crab', 505, 160, 290, 1, 0, '', '', 1, 0, 'blood', 'bloodcrab.gif'),
(0, 'Crab', 305, 30, 55, 1, 0, '"crab crab!"', '', 1, 1, 'blood', 'crab.gif'),
(0, 'Ice Golem', 0, 295, 385, 1, 0, '"Chrr."', 'paralyze, invisible', 0, 0, 'undead', 'icegolem.gif'),
(0, 'Acolyte Of The Cult', 0, 300, 390, 5, 0, '"Praise voodoo!"', 'invisible', 0, 0, 'blood', 'acolyteofthecult.gif'),
(0, 'Adept Of The Cult', 0, 400, 430, 1, 0, '', 'invisible', 0, 0, 'blood', 'adeptofthecult.gif'),
(0, 'Enlightened Of The Cult', 0, 500, 700, 1, 0, '', 'paralyze', 0, 0, 'blood', 'enlightenedofthecult.gif'),
(0, 'Novice Of The Cult', 0, 100, 285, 1, 0, '"Fear us!", "You will not tell anyone what you have seen.", "Your curiosity will be punished!"', '', 0, 0, 'blood', 'noviceofthecult.gif'),
(0, 'Dark Torturer', 0, 4650, 7350, 30, 0, '"You like it, don''t you?", "The torturer is in!", "It''s party time!", "Harrr, Harrr!", "IahaEhheAie!"', 'invisible, fire', 0, 0, 'blood', 'darktorturer.gif'),
(0, 'Demon', 0, 6000, 8200, 30, 1, '"MUHAHAHAHA!", "I SMELL FEEEEEAAAR!", "CHAMEK ATH UTHUL ARAK!", "Your resistance is futile!", "Your soul will be mine!"', 'lifedrain, paralyze, invisible', 0, 0, 'fire', 'demon.gif'),
(0, 'Destroyer', 0, 2500, 3700, 80, 1, '"COME HERE AND DIE!", "Destructiooooon!", "It''s a good day to destroy!"', 'paralyze, invisible', 0, 0, 'blood', 'destroyer.gif'),
(0, 'Diabolic Imp', 0, 2900, 1950, 50, 1, '"Muahaha!", "He he he!"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'diabolicimp.gif'),
(0, 'Fire Devil', 530, 145, 200, 1, 0, '"Hot, eh?", "Hell, oh hell!"', '', 1, 1, 'blood', 'firedevil.gif'),
(0, 'Fury', 0, 4500, 4100, 120, 1, '"Ahhhhrrrr!", "Waaaaah!", "Carnage!"', 'paralyze, invisible', 0, 0, 'blood', 'fury.gif'),
(0, 'Gozzler', 800, 180, 240, 20, 1, '"Huhuhuhuuu!", "Let the fun begin!", "Yihahaha!", "I''ll bite you! Nyehehehehe!"', 'invisible', 1, 0, 'blood', 'gozzler.gif'),
(0, 'Hand Of Cursed Fate', 0, 5000, 7500, 100, 1, '', 'paralyze, invisible', 0, 0, 'blood', 'handofcursedfate.gif'),
(0, 'Hellspawn', 0, 2550, 3500, 40, 1, '"Your fragile bones are like toothpicks to me.", "You little weasel will not live to see another day.", "I''m just a messenger of what''s yet to come.", "HRAAAAAAAAAAAAAAAARRRR!", "I''m taking you down with me!"', 'paralyze, invisible', 0, 0, 'blood', 'hellspawn.gif'),
(0, 'Juggernaut', 0, 8700, 20000, 140, 1, '"WAHHHH!", "RAAARRR!", "GRRRRRR!"', 'paralyze, invisible', 0, 0, 'blood', 'juggernaut.gif'),
(0, 'Nightmare', 0, 2150, 2700, 80, 1, '"Close your eyes... I want to show you something!", "I will haunt you forever!", "I will make you scream!", "Pffffrrrrrrrrrrrr.", "Take a ride with me.", "Weeeheeheeeheee!"', 'invisible, lifedrain', 0, 0, 'blood', 'nightmare.gif'),
(0, 'Nightmare Scion', 0, 1350, 1400, 120, 0, '"Weeeheeheee!", "Pffffrrrrrrrrrrrr.", "Peak a boo, I killed you!"', 'earth, death, invisible', 0, 0, 'blood', 'nightmarescion.gif'),
(0, 'Plaguesmith', 0, 4500, 8250, 60, 1, '"You are looking a bit feverish today!", "You don''t look that good!", "Hachoo!", "Cough Cough!"', 'paralyze, invisible', 0, 0, 'venom', 'plaguesmith.gif'),
(0, 'Blue Djinn', 0, 215, 330, 1, 0, '"Simsalabim", "Feel the power of my magic, tiny mortal!", "Be careful what you wish for.", "Wishes can come true."', 'paralyze, invisible', 0, 0, 'blood', 'bluedjinn.gif'),
(0, 'Efreet', 0, 410, 550, 25, 0, '"I grant you a deathwish!", "Good wishes are for fairytales"', 'paralyze, invisible', 0, 0, 'blood', 'efreet.gif'),
(0, 'Green Djinn', 0, 215, 330, 1, 0, '"I grant you a deathwish!", "Muhahahaha!", "I wish you a merry trip to hell!", "Good wishes are for fairytales"', 'paralyze, invisible', 0, 0, 'blood', 'greendjinn.gif'),
(0, 'Marid', 0, 410, 550, 1, 0, '"Simsalabim", "Feel the power of my magic, tiny mortal!", "Wishes can come true.", "Djinns will soon again be the greatest!"', 'paralyze, invisible', 0, 0, 'blood', 'marid.gif'),
(0, 'Dragon Lord', 0, 2100, 1900, 10, 0, '"ZCHHHHH", "YOU WILL BURN!"', 'fire, paralyze, invisible', 0, 0, 'blood', 'dragonlord.gif'),
(0, 'Dragon Lord Hatchling', 0, 645, 750, 1, 0, '"Fchu?", "Rooawwrr"', 'fire, paralyze, invisible', 0, 0, 'blood', 'dragonlordhatchling.gif'),
(0, 'Dragon', 0, 700, 1000, 1, 0, '"GROOAAARRR", "FCHHHHH"', 'fire, paralyze, invisible', 0, 0, 'blood', 'dragon.gif'),
(0, 'Dragon Hatchling', 0, 185, 380, 1, 0, '"Fchu?", "Rooawwrr"', 'fire, paralyze, invisible', 0, 0, 'blood', 'dragonhatchling.gif'),
(0, 'Frost Dragon', 0, 2300, 1800, 20, 0, '"YOU WILL FREEZE!", "ZCHHHHH!", "I am so cool", "Chill out!."', 'fire, ice, earth, lifedrain, paralyze, invisible', 0, 0, 'undead', 'frostdragon.gif'),
(0, 'Frost Dragon Hatchling', 0, 745, 800, 1, 0, '"Rooawwrr", "Fchu?"', 'fire, lifedrain, ice, earth, invisible', 0, 0, 'blood', 'frostdragonhatchling.gif'),
(0, 'Ghastly Dragon', 0, 4600, 7800, 95, 0, '"EMBRACE MY GIFTS!", "I WILL FEAST ON YOUR SOUL!"', 'paralyze, invisible, death, earth', 0, 0, 'undead', 'ghastlydragon.gif'),
(0, 'Wyrm', 0, 1450, 1825, 40, 0, '"GRRR!", "GROOOOAAAAAAAAR!"', 'energy, paralyze, invisible, lifedrain', 0, 0, 'blood', 'wyrm.gif'),
(0, 'Dwarf Geomancer', 0, 245, 380, 1, 0, '"Hail Durin!", "Earth is the strongest element.", "Dust to dust."', 'invisible', 0, 0, 'blood', 'dwarfgeomancer.gif'),
(0, 'Dwarf Guard', 650, 165, 245, 1, 0, '"Hail Durin!"', 'invisible', 1, 1, 'blood', 'dwarfguard.gif'),
(0, 'Dwarf Soldier', 360, 70, 135, 1, 0, '"Hail Durin!"', '', 1, 1, 'blood', 'dwarfsoldier.gif'),
(0, 'Dwarf', 320, 45, 90, 1, 0, '"Hail Durin!"', '', 1, 1, 'blood', 'dwarf.gif'),
(0, 'Dworc Fleshhunter', 0, 35, 85, 10, 0, '"Grak brrretz!", "Grow truk grrrrr.", "Prek tars, dekklep zurk."', '', 0, 1, 'blood', 'dworcfleshhunter.gif'),
(0, 'Dworc Venomsniper', 0, 30, 80, 10, 0, '"grak brrretz!", "grow truk grrrrr.", "prek tars, dekklep zurk."', '', 0, 1, 'blood', 'dworcvenomsniper.gif'),
(0, 'Dworc Voodoomaster', 0, 50, 80, 10, 1, '"grak brrretz!", "grow truk grrrrr.", "prek tars, dekklep zurk."', '', 0, 1, 'blood', 'dworcvoodoomaster.gif'),
(0, 'Elephant', 500, 160, 320, 10, 0, '"Hooooot-Toooooot!", "Tooooot.", "Troooooot!"', '', 1, 1, 'blood', 'elephant.gif'),
(0, 'Mammoth', 0, 110, 190, 1, 0, '"Troooooot!", "Hooooot-Toooooot!", "Tooooot."', '', 0, 0, 'blood', 'mammoth.gif'),
(0, 'Elf Arcanist', 0, 175, 220, 5, 0, '"Feel my wrath!", "For the Daughter of the Stars!", "I''ll bring balance upon you!", "Tha''shi Cenath!", "Vihil Ealuel!"', 'invisible', 0, 0, 'blood', 'elfarcanist.gif'),
(0, 'Elf Scout', 360, 75, 160, 3, 0, '"Tha''shi Ab''Dendriel!", "Feel the sting of my arrows!", "Thy blood will quench the soil''s thirst!", "Evicor guide my arrow.", "Your existence will end here!"', 'invisible', 1, 1, 'blood', 'elfscout.gif'),
(0, 'Elf', 320, 42, 100, 1, 0, '"Ulathil beia Thratha!", "Bahaha aka!", "You are not welcome here.", "Flee as long as you can.", "Death to the defilers!"', 'invisible', 1, 1, 'blood', 'elf.gif'),
(0, 'Charged Energy Elemental', 0, 450, 500, 25, 0, '', 'holy, fire, energy, ice, invisible', 0, 0, 'undead', 'chargedenergyelemental.gif'),
(0, 'Energy Elemental', 0, 450, 500, 15, 0, '', 'ice, fire, energy, invisible', 0, 0, 'undead', 'energyelemental.gif'),
(0, 'Energy Overlord', 0, 2800, 4000, 35, 0, '', 'energy, holy, poison, invisible', 0, 0, 'undead', 'energyoverlord.gif'),
(0, 'Massive Energy Elemental', 0, 850, 1100, 40, 0, '', 'ice, energy, fire, invisible', 0, 0, 'undead', 'massiveenergyelemental.gif'),
(0, 'Overcharged Energy Elemental', 0, 1300, 1700, 40, 0, '', 'ice, energy, invisible', 0, 0, 'undead', 'overchargedenergyelemental.gif'),
(0, 'Cat', 220, 0, 20, 1, 0, '"Mew!", "Meow!", "Meow meow!"', '', 1, 1, 'blood', 'cat.gif'),
(0, 'Lion', 320, 30, 80, 1, 0, '"Groarrr!"', '', 1, 1, 'blood', 'lion.gif'),
(0, 'Tiger', 420, 40, 75, 10, 1, '', '', 1, 1, 'blood', 'tiger.gif'),
(0, 'Azure Frog', 305, 20, 60, 5, 0, '"Ribbit, ribbit!"', '', 1, 0, 'blood', 'azurefrog.gif'),
(0, 'Coral Frog', 305, 20, 60, 5, 0, '"Ribbit!"', '', 1, 0, 'blood', 'coralfrog.gif'),
(0, 'Crimson Frog', 305, 20, 60, 5, 0, '"Ribbit!"', '', 1, 0, 'blood', 'crimsonfrog.gif'),
(0, 'Green Frog', 305, 0, 60, 5, 0, '"Ribbit!", "Ribbit! Ribbit!"', '', 1, 0, 'venom', 'greenfrog.gif'),
(0, 'Orchid Frog', 0, 20, 60, 5, 0, '', '', 0, 0, 'blood', 'orchidfrog.gif'),
(0, 'Toad', 400, 60, 135, 10, 0, '"Ribbit, ribbit!", "Ribbit!"', '', 1, 0, 'blood', 'toad.gif'),
(0, 'Damaged Worker Golem', 0, 95, 260, 25, 0, '"Klonk klonk klonk", "Failure! Failire!", "Good morning citizen. How may I serve you?", "Target identified: Rat! Termination initiated!"', 'invisible, paralyze', 0, 0, 'energy', 'damagedworkergolem.gif'),
(0, 'Earth Elemental', 0, 450, 650, 55, 0, '', 'paralyze, invisible, earth, energy', 0, 0, 'undead', 'earthelemental.gif'),
(0, 'Earth Overlord', 0, 2800, 4000, 55, 0, '', 'paralyze, invisible, earth, energy, holy', 0, 0, 'undead', 'earthoverlord.gif'),
(0, 'Gargoyle', 0, 150, 450, 15, 0, '"Harrrr Harrrr!", "Stone sweet stone.", "Feel my claws, softskin.", "Chhhhhrrrrk!", "There is a stone in your shoe!"', 'lifedrain', 0, 0, 'blood', 'gargoyle.gif'),
(0, 'Stone Golem', 590, 280, 270, 1, 0, '', 'paralyze', 1, 1, 'undead', 'stonegolem.gif'),
(0, 'Jagged Earth Elemental', 0, 1300, 1500, 30, 0, '"Stomp STOMP"', 'paralyze, invisible, earth, holy', 0, 0, 'undead', 'jaggedearthelemental.gif'),
(0, 'Massive Earth Elemental', 0, 850, 1330, 35, 0, '', 'paralyze, invisible, earth, ice', 0, 0, 'undead', 'massiveearthelemental.gif'),
(0, 'Muddy Earth Elemental', 0, 450, 650, 20, 0, '', 'paralyze, invisible, earth, holy', 0, 0, 'undead', 'muddyearthelemental.gif'),
(0, 'War Golem', 0, 2550, 4300, 30, 1, '"Azerus barada nikto!", "Klonk klonk klonk", "Engaging Enemy!", "Threat level processed.", "Charging weapon systems!", "Auto repair in progress.", "The battle is joined!", "Termination initialized!", "Rrrtttarrrttarrrtta"', 'invisible, paralyze', 0, 0, 'energy', 'wargolem.gif'),
(0, 'Worker Golem', 0, 1250, 1400, 25, 0, '"INTRUDER ALARM!", "klonk klonk klonk", "Rrrtttarrrttarrrtta", "Awaiting orders.", "Secret objective complete."', 'invisible, paralyze', 0, 0, 'energy', 'workergolem.gif'),
(0, 'Ghost', 100, 120, 150, 1, 0, '"Huh!", "Shhhhhh", "Buuuuuh"', 'lifedrain, paralyze', 0, 0, 'undead', 'ghost.gif'),
(0, 'Phantasm', 0, 3300, 3950, 30, 0, '"Oh my, you forgot to put your pants on!", "Weeheeheeheehee!", "Its nothing but a dream!", "Give in!"', 'paralyze, invisible', 0, 0, 'undead', 'phantasm.gif'),
(0, 'Pirate Ghost', 0, 250, 275, 5, 0, '"Yooh Ho Hooh Ho!", "Hell is waiting for You!", "It''s alive!", "The curse! Aww the curse!", "You will not get my treasure!"', 'paralyze', 0, 0, 'undead', 'pirateghost.gif'),
(0, 'Spectre', 0, 2100, 1350, 15, 0, '"Revenge ... is so ... sweet!", "Life...force! Feed me your... lifeforce!"', 'paralyze, invisible', 0, 0, 'undead', 'spectre.gif'),
(0, 'Wisp', 0, 0, 115, 1, 1, '"Crackle!", "Tsshh"', 'death, paralyze', 0, 0, 'undead', 'wisp.gif'),
(0, 'Behemoth', 0, 2500, 4000, 30, 1, '"You''re so little!", "Human flesh - delicious!", "Crush the intruders!"', 'paralyze, invisible', 0, 0, 'blood', 'behemoth.gif'),
(0, 'Cyclops', 490, 150, 260, 1, 0, '"Il lorstok human!", "Toks utat.", "Human, uh whil dyh!", "Youh ah trak!", "Let da mashing begin!"', '', 1, 1, 'blood', 'cyclops.gif'),
(0, 'Cyclops Drone', 525, 200, 325, 1, 0, '"Fee! Fie! Foe! Fum!", "Luttl pest!", "Me makking you pulp!", "Humy tasy! Hum hum!"', '', 0, 1, 'blood', 'cyclopsdrone.gif'),
(0, 'Cyclops Smith', 695, 255, 435, 1, 0, '"Outis emoi g'' onoma.", "Whack da humy!", "Ai humy phary ty kaynon"', '', 0, 1, 'blood', 'cyclopssmith.gif'),
(0, 'Frost Giant', 490, 150, 270, 1, 0, '"Hmm Humansoup", "Stand still ya tasy snack!", "Joh Thun!", "Brore Smode!", "Horre Sjan Flan!", "Forle Bramma!"', '', 0, 1, 'blood', 'frostgiant.gif'),
(0, 'Frost Giantess', 490, 150, 275, 1, 0, '"Ymirs Mjalle!", "No run so much, must stay fat!", "Horre, Sjan Flan!", "Damned fast food.", "Come kiss the cook!"', '', 0, 1, 'blood', 'frostgiantess.gif'),
(0, 'Yeti', 0, 460, 950, 25, 0, '"Yooodelaaahooohooo!", "Yooodelaaaheeeheee!"', 'invisible', 0, 0, 'blood', 'yeti.gif'),
(0, 'Goblin', 290, 25, 50, 1, 0, '"Me have him!", "Zig Zag! Gobo attack!", "Help! Goblinkiller!", "Bugga! Bugga!", "Me green, me mean!"', '', 1, 1, 'blood', 'goblin.gif'),
(0, 'Goblin Assassin', 360, 52, 75, 1, 0, '"Goblin Powahhh!"', '', 1, 1, 'blood', 'goblinassassin.gif'),
(0, 'Goblin Leader', 290, 50, 75, 1, 0, '"Go go, Gobo attack !!", "Me the greenest and the meanest!", "Me have power to crush you!", "Goblinkiller! Catch him !!"', '', 1, 1, 'blood', 'goblinleader.gif'),
(0, 'Goblin Scavenger', 310, 37, 60, 1, 0, '"Shiny, Shiny!", "You mean!", "All mine!", "Uhh!"', '', 1, 1, 'blood', 'goblinscavenger.gif'),
(0, 'Grynch Clan Goblin', 0, 4, 80, 325, 1, '"T''was not me hand in your pocket!", "Look! Cool stuff in house. Let''s get it!", "Uhh! Nobody home!", "Me just borrowed it!", "Me no steal! Me found it!", "Me had it for five minutes. It''s family heirloom now!", "Nice human won''t hurt little, good goblin?", "Gimmegimme!", "Invite me in you lovely house plx!", "Other Goblin stole it!", "All presents mine!", "Me got ugly ones purse", "Free itans plz!", "Not me! Not me!", "Guys, help me here! Guys? Guys???", "That only much dust in me pocket! Honest!", "Can me have your stuff?", "Halp, Big dumb one is after me!", "Uh, So many shiny things!", "Utani hur hur hur!", "Mee? Stealing? Never!!!", "Oh what fun it is to steal a one-horse open sleigh!", "Must have it! Must have it!", "Where me put me lockpick?", "Catch me if you can!"', 'fire, invisible', 0, 0, 'blood', 'grynchclangoblin.gif'),
(0, 'Ice Overlord', 0, 1950, 2800, 85, 0, '', 'ice, fire, lifedrain, paralyze, invisible, drown', 0, 0, 'undead', 'iceoverlord.gif'),
(0, 'Massive Water Elemental', 0, 1950, 2350, 85, 0, '', 'fire, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'undead', 'massivewaterelemental.gif'),
(0, 'Roaring Water Elemental', 0, 1300, 1750, 85, 0, '', 'fire, earth, ice, lifedrain, paralyze, invisible, drown', 0, 0, 'undead', 'roaringwaterelemental.gif'),
(0, 'Slick Water Elemental', 0, 450, 550, 30, 0, '"Blubb", "Splipsh Splash"', 'ice, drown', 0, 0, 'undead', 'slickwaterelemental.gif'),
(0, 'Water Elemental', 0, 450, 550, 30, 0, '', 'ice, fire, poison, paralyze, invisible', 0, 0, 'undead', 'waterelemental.gif'),
(0, 'Ancient Scarab', 0, 720, 1000, 55, 1, '', 'paralyze, invisible', 0, 0, 'venom', 'ancientscarab.gif'),
(0, 'Butterfly', 0, 0, 2, 40, 0, '', 'poison, paralyze, drunk', 0, 0, 'venom', 'butterfly.gif'),
(0, 'Bug', 250, 18, 29, 10, 0, '', '', 1, 1, 'venom', 'bug.gif'),
(0, 'Centipede', 335, 30, 70, 1, 0, '', '', 1, 1, 'venom', 'centipede.gif'),
(0, 'Cockroach', 0, 0, 1, 1, 0, '', '', 0, 0, 'venom', 'cockroach.gif'),
(0, 'Insect Swarm', 0, 40, 50, 1, 0, '', 'earth', 0, 127, 'venom', 'insectswarm.gif'),
(0, 'Lancer Beetle', 0, 250, 400, 1, 0, '"Crump!"', 'earth, invisible, lifedrain, paralyze', 0, 127, 'venom', 'lancerbeetle.gif'),
(0, 'Larva', 355, 40, 70, 1, 0, '', 'paralyze', 1, 1, 'venom', 'larva.gif'),
(0, 'Sandcrawler', 0, 20, 30, 1, 0, '"Chrk chrk!"', '', 1, 0, 'venom', 'sandcrawler.gif'),
(0, 'Scarab', 395, 120, 320, 1, 1, '', 'paralyze', 1, 1, 'venom', 'scarab.gif'),
(0, 'Terramite', 0, 160, 365, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'terramite.gif'),
(0, 'Wasp', 280, 25, 35, 120, 0, '"Bssssss"', '', 1, 1, 'venom', 'wasp.gif'),
(0, 'Battlemaster Zunzu', 0, 2500, 5000, 100, 0, '', 'earth, invisible', 0, 0, 'blood', 'battlemasterzunzu.gif'),
(0, 'Lizard Chosen', 0, 2200, 3050, 10, 0, '"Grzzzzzzz!"', 'earth, invisible', 0, 0, 'blood', 'lizardchosen.gif'),
(0, 'Lizard Dragon Priest', 0, 1200, 1450, 50, 0, '', 'earth, invisible', 0, 0, 'blood', 'lizarddragonpriest.gif'),
(0, 'Lizard High Guard', 0, 1450, 1800, 60, 0, '"Grzzzzzzz!"', 'earth, invisible', 0, 0, 'blood', 'lizardhighguard.gif'),
(0, 'Lizard Legionnaire', 0, 1100, 1400, 1, 0, '"Tssss!"', 'earth, invisible', 0, 0, 'blood', 'lizardlegionnaire.gif'),
(0, 'Lizard Sentinel', 0, 110, 265, 10, 0, '"Tssss!"', 'invisible', 0, 1, 'blood', 'lizardsentinel.gif'),
(0, 'Lizard Snakecharmer', 0, 210, 325, 1, 0, '"I ssssmell warm blood!", "Shhhhhhhh"', 'invisible', 0, 0, 'blood', 'lizardsnakecharmer.gif'),
(0, 'Lizard Templar', 0, 115, 410, 1, 0, '"Hissss!"', '', 0, 0, 'blood', 'lizardtemplar.gif'),
(0, 'Lizard Zaogun', 0, 1700, 2955, 100, 0, '', 'earth, invisible', 0, 0, 'blood', 'lizardzaogun.gif'),
(0, 'Wyvern', 0, 515, 795, 1, 0, '"Shriiiek"', 'drunk, invisible', 0, 0, 'blood', 'wyvern.gif'),
(0, 'Minotaur Archer', 390, 65, 100, 1, 0, '"Ruan Wihmpy!", "Kaplar!"', '', 1, 1, 'blood', 'minotaurarcher.gif'),
(0, 'Minotaur Guard', 550, 160, 185, 1, 0, '"Kirll Karrrl!", "Kaplar!"', '', 1, 1, 'blood', 'minotaurguard.gif'),
(0, 'Minotaur Mage', 0, 150, 155, 1, 0, '"Learrn tha secrret uf deathhh!", "Kaplar!"', 'invisible', 0, 0, 'blood', 'minotaurmage.gif'),
(0, 'Minotaur', 330, 50, 100, 1, 0, '"Kaplar!"', '', 1, 1, 'blood', 'minotaur.gif'),
(0, 'Badger', 200, 5, 20, 1, 0, '', '', 1, 1, 'blood', 'badger.gif'),
(0, 'Bat', 250, 10, 30, 1, 0, '', '', 1, 1, 'blood', 'bat.gif'),
(0, 'Deer', 260, 0, 25, 1, 0, '', '', 1, 1, 'blood', 'deer.gif'),
(0, 'Draken Spellweaver', 0, 2600, 5000, 10, 0, '', 'fire, invisible', 0, 0, 'blood', 'drakenspellweaver.gif'),
(0, 'Draken Warmaster', 0, 2400, 4150, 1, 0, '', 'fire, invisibility', 0, 0, 'blood', 'drakenwarmaster.gif'),
(0, 'Gnarlhound', 0, 60, 198, 1, 0, '"Gnarlll!", "Grrrrrr!"', '', 127, 0, 'blood', 'gnarlhound.gif'),
(0, 'The Halloween Hare', 0, 0, 2000, 1, 0, '', '', 0, 0, 'blood', 'thehalloweenhare.gif'),
(0, 'Hyaena', 275, 20, 60, 1, 0, '', '', 1, 1, 'blood', 'hyaena.gif'),
(0, 'Pig', 255, 0, 25, 1, 0, '', '', 1, 1, 'blood', 'pig.gif'),
(0, 'Rabbit', 220, 0, 15, 1, 0, '', '', 1, 1, 'blood', 'rabbit.gif'),
(0, 'Silver Rabbit', 220, 0, 15, 1, 0, '', '', 1, 1, 'blood', 'silverrabbit.gif'),
(0, 'Skunk', 200, 3, 20, 1, 0, '', '', 1, 1, 'blood', 'skunk.gif'),
(0, 'Squirrel', 220, 0, 20, 135, 0, '"Chchch"', '', 1, 1, 'blood', 'squirrel.gif'),
(0, 'Yalahari', 0, 5, 150, 1, 0, '"Welcome to Yalahar, outsider.", "Hail Yalahar.", "You can learn a lot from us.", "Our wisdom and knowledge are unequalled in this world.", "That knowledge would overburden your fragile mind.", "I wouldn''t expect you to understand.", "One day Yalahar will return to its former glory."', '', 0, 0, 'blood', 'yalahari.gif'),
(0, 'Azerus', 0, 6000, 7500, 50, 0, '"The ultimate will finally consume this unworthy existence!", "My masters and I will tear down barriers and join the ultimate in its realm!", "The power of the Yalahari will all be mine!", "He who has returned from beyond has taught me secrets you can''t even grasp!", "You can''t hope to penetrate my shields!", "Do you really think you could beat me?"', '', 0, 0, 'blood', 'azerus.gif'),
(0, 'Dark Monk', 0, 145, 190, 1, 1, '"You are no match to us!", "This is where your path will end!", "Your end has come!"', 'invisible', 0, 1, 'blood', 'darkmonk.gif'),
(0, 'Monk', 600, 200, 240, 1, 1, '"Repent Heretic!", "A prayer to the almighty one!", "I will punish the sinners!"', 'invisible', 1, 0, 'blood', 'monk.gif'),
(0, 'Training Monk', 600, 200, 10000, 1, 1, '"Repent Heretic!", "A prayer to the almighty one!", "I will punish the sinners!"', 'invisible', 1, 0, 'blood', 'trainingmonk.gif'),
(0, 'Mutated Bat', 0, 615, 900, 13, 0, '', 'death, earth, drown, invisible, drunk', 0, 0, 'blood', 'mutatedbat.gif'),
(0, 'Mutated Human', 0, 150, 240, 13, 0, '"Take that creature off my back!! I can fell it!", "HEEEEEEEELP!", "You will be the next infected one... GRAAAAAAAAARRR!", "Science... is a curse.", "Run as fast as you can.", "Oh by the gods! What is this... aaaaaargh!"', 'death, earth, paralyze, lifedrain, drunk, drown, invisible', 0, 0, 'blood', 'mutatedhuman.gif'),
(0, 'Mutated Rat', 0, 450, 550, 13, 0, '"Grrrrrrrrrrrrrr!", "Fcccccchhhhhh"', 'death, earth, paralyze, lifedrain, drunk, drown, invisible', 0, 0, 'blood', 'mutatedrat.gif'),
(0, 'Mutated Tiger', 0, 750, 1100, 13, 0, '"GRAAARRRRRR", "CHHHHHHHHHHH"', 'paralyze, drunk, invisible', 0, 0, 'blood', 'mutatedtiger.gif'),
(0, 'Necromancer', 0, 580, 580, 1, 0, '"Your corpse will be mine!", "Taste the sweetness of death!"', 'invisible', 0, 0, 'blood', 'necromancer.gif'),
(0, 'Priestess', 0, 420, 390, 1, 0, '"Your energy is mine.", "Now, your life has come to an end, hahahha!", "Throw the soul on the altar!"', 'invisible', 0, 0, 'blood', 'priestess.gif'),
(0, 'Baron Brute', 0, 3000, 5025, 35, 0, '"Mash''n!"', 'invisible', 0, 0, 'blood', 'baronbrute.gif'),
(0, 'Coldheart', 0, 3500, 7000, 1, 0, '', 'paralyze, invisible, ice, fire', 0, 0, 'undead', 'coldheart.gif'),
(0, 'Doomhowl', 0, 3750, 8500, 50, 1, '', 'paralyze, invisible', 0, 0, 'blood', 'doomhowl.gif'),
(0, 'Dreadwing', 0, 3750, 8500, 13, 0, '', 'death, earth', 0, 0, 'blood', 'dreadwing.gif'),
(0, 'Fatality', 0, 3250, 6000, 1, 0, '', 'earth', 0, 0, 'blood', 'fatality.gif'),
(0, 'Haunter', 0, 4000, 8500, 25, 1, '"Surrender and I''ll end it quick!"', 'invisible', 0, 0, 'blood', 'haunter.gif'),
(0, 'Incineron', 0, 3500, 7000, 20, 0, '', 'paralyze, invisible, fire, ice', 0, 0, 'fire', 'incineron.gif'),
(0, 'Menace', 0, 3250, 6000, 1, 0, '', 'earth', 0, 0, 'blood', 'menace.gif'),
(0, 'Rocko', 590, 3400, 10000, 1, 0, '', 'paralyze, earth, death', 0, 1, 'blood', 'rocko.gif'),
(0, 'The Dreadorian', 0, 4000, 9000, 15, 0, '', 'invisible, fire', 0, 0, 'blood', 'thedreadorian.gif'),
(0, 'Tirecz', 0, 6000, 25000, 1, 0, '"Hissss!"', '', 0, 0, 'blood', 'tirecz.gif'),
(0, 'Tremorak', 0, 1300, 10000, 35, 0, '"STOMP STOMP!"', 'earth', 0, 0, 'undead', 'tremorak.gif'),
(0, 'Orc Berserker', 590, 195, 210, 15, 1, '"KRAK ORRRRRRK!"', '', 1, 1, 'blood', 'orcberserker.gif'),
(0, 'Orc Leader', 640, 270, 450, 5, 0, '"Ulderek futgyr human!"', '', 1, 1, 'blood', 'orcleader.gif'),
(0, 'Orc Marauder', 0, 220, 235, 85, 1, '"Grrrrrr"', 'invisible', 0, 127, 'blood', 'orcmarauder.gif'),
(0, 'Orc Rider', 0, 110, 180, 60, 1, '"Grrrrrrr", "Orc arga Huummmak!"', '', 0, 1, 'blood', 'orcrider.gif'),
(0, 'Orc Shaman', 0, 110, 115, 1, 0, '"Huumans stinkk!"', 'invisible', 0, 0, 'blood', 'orcshaman.gif'),
(0, 'Orc Spearman', 310, 38, 105, 1, 0, '"Ugaar!"', '', 1, 1, 'blood', 'orcspearman.gif'),
(0, 'Orc Warlord', 0, 670, 950, 35, 0, '"Ranat Ulderek!", "Orc buta bana!", "Ikem rambo zambo!", "Futchi maruk buta!"', 'invisible', 0, 0, 'blood', 'orcwarlord.gif'),
(0, 'Orc Warrior', 360, 50, 125, 1, 0, '"Grow truk grrrr.", "Trak grrrr brik.", "Alk!"', '', 1, 1, 'blood', 'orcwarrior.gif'),
(0, 'Orc', 300, 25, 70, 1, 0, '"Grak brrretz!", "Grow truk grrrrr.", "Prek tars, dekklep zurk."', '', 1, 1, 'blood', 'orc.gif'),
(0, 'Assassin', 450, 105, 175, 2, 1, '"Die!", "Feel the hand of death!", "You are on my deathlist!"', 'invisible', 0, 1, 'blood', 'assassin.gif'),
(0, 'Bandit', 450, 65, 245, 1, 0, '"Your money or your life!", "Hand me your purse!"', '', 1, 1, 'blood', 'bandit.gif'),
(0, 'Black Knight', 0, 1600, 1800, 115, 0, '"MINE!", "No prisoners!", "NO MERCY!", "By Bolg''s Blood!", "You''re no match for me!"', 'paralyze, invisible', 0, 0, 'blood', 'blackknight.gif'),
(0, 'Crazed Beggar', 300, 35, 100, 1, 0, '"Hehehe!", "Raahhh!", "You are one of THEM! Die!", "Wanna buy roses??"', '', 1, 1, 'blood', 'crazedbeggar.gif'),
(0, 'Gang Member', 420, 70, 295, 1, 0, '"This is our territory!", "Help me guys!", "I don''t like the way you look!", "You''re wearing the wrong colours!"', '', 1, 1, 'blood', 'gangmember.gif'),
(0, 'Gladiator', 470, 90, 185, 1, 1, '"You are no match for me!", "Feel my prowess", "Fight!", "Take this!"', '', 0, 1, 'blood', 'gladiator.gif'),
(0, 'Hero', 0, 1200, 1400, 24, 0, '"Let''s have a fight!", "Welcome to my battleground.", "Have you seen princess Lumelia?", "I will sing a tune at your grave."', 'paralyze, invisible', 0, 0, 'blood', 'hero.gif'),
(0, 'Hunter', 0, 150, 150, 1, 0, '"Guess who we''re hunting, haha!", "Guess who we are hunting!", "Bullseye!", "You''ll make a nice trophy!"', '', 0, 1, 'blood', 'hunter.gif'),
(0, 'Nomad', 420, 60, 160, 1, 0, '"We are the true sons of the desert!", "I will leave your remains to the vultures!", "We are swift as the wind of the desert!"', '', 1, 1, 'blood', 'nomad.gif'),
(0, 'Smuggler', 390, 48, 130, 1, 0, '"I will silence you forever!", "You saw something you shouldn''t!"', '', 1, 1, 'blood', 'smuggler.gif'),
(0, 'Stalker', 0, 90, 150, 1, 0, '', 'invisible', 0, 0, 'blood', 'stalker.gif'),
(0, 'Poacher', 530, 70, 90, 1, 0, '"You will not live to tell anyone!", "You are my game today!", "Look what has stepped into my trap!"', '', 0, 1, 'blood', 'poacher.gif'),
(0, 'Wild Warrior', 420, 55, 120, 1, 1, '"An enemy!", "Gimme your money!"', '', 1, 1, 'blood', 'wildwarrior.gif'),
(0, 'Ashmunrah', 0, 3100, 5000, 50, 0, '"No mortal or undead will steal my secrets!", "Ahhhh all those long years."', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'ashmunrah.gif'),
(0, 'Dipthrah', 0, 2900, 4200, 50, 0, '"Come closer to learn the final lesson.", "You can''t escape death forever."', 'invisible', 0, 0, 'undead', 'dipthrah.gif'),
(0, 'Mahrdis', 0, 3050, 3900, 60, 0, '"Ashes to ashes!", "Fire, Fire!", "The eternal flame demands its due!", "This is why I''m hot.", "May my flames engulf you!"', 'invisible', 0, 0, 'undead', 'mahrdis.gif'),
(0, 'Morguthis', 0, 3000, 4800, 50, 1, '"Vengeance!", "You will make a fine trophy.", "Come and fight me, cowards!", "I am the supreme warrior!", "Let me hear the music of battle.", "Anotherone to bite the dust!"', 'paralyze, invisible', 0, 0, 'undead', 'morguthis.gif'),
(0, 'Omruc', 0, 2950, 4300, 75, 0, '"Now chhhou shhhee me ... Now chhhou don''t!!", "Chhhhou are marked ashhh my prey.", "Psssst, I am over chhhere."', 'paralyze, invisible', 0, 0, 'undead', 'omruc.gif'),
(0, 'Rahemos', 0, 3100, 3700, 50, 0, '"It''s a kind of magic.", "Abrah Kadabrah!", "Nothing hidden in my wrappings.", "It''s not a trick, it''s Rahemos.", "Meet my friend from hell.", "I will make you believe in magic."', 'paralyze, invisible', 0, 0, 'undead', 'rahemos.gif'),
(0, 'Thalas', 0, 2950, 4100, 50, 0, '"You will become a feast for my maggots."', 'invisible', 0, 0, 'undead', 'thalas.gif'),
(0, 'Vashresamun', 0, 2950, 4000, 60, 1, '"Come my maidens, we have visitors!", "Are you enjoying my music?", "If music is the food of death, drop dead."', 'invisible', 0, 0, 'undead', 'vashresamun.gif'),
(0, 'Pirate Buccaneer', 595, 250, 425, 5, 0, '"Give up!", "Hiyaa", "Plundeeeeer!"', 'invisible', 1, 0, 'blood', 'piratebuccaneer.gif'),
(0, 'Pirate Corsair', 775, 350, 675, 5, 0, '"Give up!", "Hiyaa!", "Plundeeeeer!"', 'invisible', 0, 1, 'blood', 'piratecorsair.gif'),
(0, 'Pirate Cutthroat', 495, 175, 325, 5, 0, '"Give up!", "Hiyaa!", "Plundeeeeer!"', 'invisible', 0, 1, 'blood', 'piratecutthroat.gif'),
(0, 'Pirate Marauder', 490, 125, 210, 5, 0, '"Plundeeeeer!", "Give up!", "Hiyaa!"', 'invisible', 0, 1, 'blood', 'piratemarauder.gif'),
(0, 'Blazing Fire Elemental', 0, 580, 580, 1, 0, '', 'fire, holy', 0, 0, 'fire', 'blazingfireelemental.gif'),
(0, 'Blistering Fire Elemental', 0, 1300, 1500, 5, 0, '', 'fire', 0, 0, 'fire', 'blisteringfireelemental.gif'),
(0, 'Fire Elemental', 690, 220, 280, 1, 0, '', 'paralyze, invisible', 1, 1, 'fire', 'fireelemental.gif'),
(0, 'Fire Overlord', 0, 2800, 4000, 40, 0, '', 'fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'fire', 'fireoverlord.gif'),
(0, 'Hellfire Fighter', 0, 3900, 3800, 20, 0, '', 'paralyze, invisible', 0, 0, 'fire', 'hellfirefighter.gif'),
(0, 'Massive Fire Elemental', 0, 950, 1800, 20, 0, '', 'fire, lifedrain, paralyze, invisible', 0, 0, 'fire', 'massivefireelemental.gif'),
(0, 'Quara Constrictor', 670, 250, 450, 150, 0, '"Gaaahhh!", "Gluh! Gluh!", "Tssss!", "Boohaa!"', 'lifedrain, paralyze, drown', 0, 1, 'blood', 'quaraconstrictor.gif'),
(0, 'Quara Constrictor Scout', 670, 250, 450, 35, 0, '', 'fire, ice', 0, 1, 'undead', 'quaraconstrictorscout.gif'),
(0, 'Quara Hydromancer', 0, 800, 1100, 150, 0, '"Qua hah tsh!", "Teech tsha tshul!", "Quara tsha Fach!", "Tssssha Quara!", "Blubber.", "Blup."', 'lifedrain, paralyze, invisible, drown', 0, 0, 'blood', 'quarahydromancer.gif'),
(0, 'Quara Hydromancer Scout', 0, 800, 1100, 30, 0, '"Qua hah tsh!"', 'ice, fire, lifedrain, paralyze, invisible', 0, 0, 'undead', 'quarahydromancerscout.gif'),
(0, 'Quara Mantassin', 480, 400, 800, 150, 0, '"Zuerk Pachak!", "Shrrrr"', 'lifedrain, drown', 0, 1, 'blood', 'quaramantassin.gif'),
(0, 'Quara Mantassin Scout', 480, 100, 220, 25, 0, '"Zuerk Pachak!", "Shrrrr"', 'ice, fire, lifedrain, paralyze, invisible', 0, 1, 'blood', 'quaramantassinscout.gif'),
(0, 'Quara Pincher', 0, 1200, 1800, 160, 0, '"Clank clank!", "Clap!", "Crrrk! Crrrk!"', 'lifedrain, invisible, drown', 0, 0, 'blood', 'quarapincher.gif'),
(0, 'Quara Pincher Scout', 0, 600, 775, 15, 0, '"Clank clank!", "Clap!"', 'ice, fire, poison, lifedrain, paralyze, outfit, drunk, invisible', 0, 0, 'blood', 'quarapincherscout.gif'),
(0, 'Quara Predator', 0, 1600, 2200, 150, 1, '"Rrrah!", "Rraaar!"', 'lifedrain, invisible, drown', 0, 0, 'blood', 'quarapredator.gif'),
(0, 'Quara Predator Scout', 0, 400, 890, 35, 0, '"Gnarrr!"', 'ice, fire, lifedrain, paralyze, invisible', 0, 0, 'blood', 'quarapredatorscout.gif'),
(0, 'Cave Rat', 250, 10, 30, 1, 0, '"Meeeeep!", "Meep!"', '', 1, 1, 'blood', 'caverat.gif'),
(0, 'Rat', 200, 5, 20, 1, 0, '"Meep!"', '', 1, 1, 'blood', 'rat.gif'),
(0, 'Crocodile', 350, 40, 105, 10, 0, '', '', 1, 1, 'blood', 'crocodile.gif'),
(0, 'Hydra', 0, 2100, 2350, 20, 0, '"FCHHHHH", "HISSSS"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'hydra.gif'),
(0, 'Killer Caiman', 350, 800, 1500, 10, 1, '', 'invisible', 0, 0, 'blood', 'killercaiman.gif'),
(0, 'Rift Worm', 0, 1195, 2800, 1, 0, '', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'riftworm.gif'),
(0, 'Rift Scythe', 0, 2000, 3600, 75, 0, '', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'riftscythe.gif'),
(0, 'Rift Brood', 0, 1600, 3000, 40, 0, '', 'ice, fire, energy, invisible', 0, 0, 'energy', 'riftbrood.gif'),
(0, 'Cobra', 275, 30, 65, 1, 0, '"Zzzzzz", "Fsssss"', 'drunk', 1, 1, 'blood', 'cobra.gif'),
(0, 'Sea Serpent', 390, 2300, 3200, 219, 0, '"CHHHRRRR", "HISSSS"', 'ice, paralyze, invisible, drown', 0, 0, 'blood', 'seaserpent.gif'),
(0, 'Serpent Spawn', 0, 2350, 3000, 10, 1, '"Sssssouls for the one", "HISSSS", "Tsssse one will risssse again", "I bring your deathhh, mortalssss"', 'paralyze, invisible', 0, 0, 'venom', 'serpentspawn.gif'),
(0, 'Snake', 205, 10, 15, 1, 0, '"Zzzzzzt"', '', 1, 1, 'blood', 'snake.gif'),
(0, 'Young Sea Serpent', 390, 1000, 1050, 65, 0, '"CHHHRRRR", "HISSSS"', 'ice, paralyze, invisible, drown', 0, 0, 'blood', 'youngseaserpent.gif'),
(0, 'Black Sheep', 250, 0, 20, 1, 0, '"Maeh"', '', 1, 1, 'blood', 'blacksheep.gif'),
(0, 'Sheep', 250, 0, 20, 1, 0, '"Maeh"', '', 1, 1, 'blood', 'sheep.gif'),
(0, 'Mimic', 0, 0, 30, 1, 0, '', '', 0, 0, 'blood', 'mimic.gif'),
(0, 'Betrayed Wraith', 0, 3500, 4200, 45, 1, '"Rrrah!", "Gnarr!", "Tcharrr!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'betrayedwraith.gif'),
(0, 'Bonebeast', 0, 580, 515, 15, 0, '"Cccchhhhhhhhh!", "Knooorrrrr!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'bonebeast.gif'),
(0, 'Demon Skeleton', 620, 240, 400, 5, 0, '', 'paralyze', 1, 1, 'undead', 'demonskeleton.gif'),
(0, 'Dreadbeast', 800, 250, 800, 15, 0, '', 'death, earth, lifedrain, paralyze, invisible', 0, 1, 'undead', 'dreadbeast.gif'),
(0, 'Lost Soul', 0, 4000, 5800, 15, 1, '"Forgive Meeeee!", "Mouuuurn meeee!"', 'paralyze, invisible', 0, 0, 'undead', 'lostsoul.gif'),
(0, 'Pirate Skeleton', 0, 85, 190, 5, 0, '', '', 0, 0, 'undead', 'pirateskeleton.gif'),
(0, 'Skeleton', 300, 35, 50, 1, 0, '', '', 1, 1, 'undead', 'skeleton.gif'),
(0, 'Skeleton Warrior', 350, 65, 45, 1, 0, '', 'death', 1, 1, 'undead', 'skeletonwarrior.gif'),
(0, 'Undead Dragon', 0, 7200, 8350, 40, 0, '"FEEEED MY ETERNAL HUNGER!", "I SENSE LIFE"', 'paralyze, invisible', 0, 0, 'undead', 'undeaddragon.gif'),
(0, 'Undead Gladiator', 0, 800, 1000, 25, 0, '"Let''s battle it out in a duel!", "Bring it!", "I''ll fight here in eternity and beyond.", "I will not give up!", "Another foolish adventurer who tries to beat me."', 'invisible', 0, 0, 'undead', 'undeadgladiator.gif'),
(0, 'Undead Mine Worker', 0, 45, 65, 1, 0, '', '', 0, 1, 'undead', 'undeadmineworker.gif'),
(0, 'Dark Apprentice', 0, 100, 225, 1, 0, '"Outch!", "Oops, I did it again.", "From the spirits that I called Sir, deliver me!", "I must dispose of my masters enemies!"', 'invisible', 0, 0, 'blood', 'darkapprentice.gif'),
(0, 'Dark Magician', 0, 185, 325, 1, 0, '"Feel the power of my runes!", "Killing you is getting expensive!", "My secrets are mine alone!"', 'invisible', 0, 0, 'blood', 'darkmagician.gif'),
(0, 'Ice Witch', 0, 580, 650, 1, 0, '"So you think you are cool?", "I hope it is not too cold for you! HeHeHe.", "Freeze!"', 'paralyze, invisible', 0, 0, 'blood', 'icewitch.gif');
INSERT INTO `z_monsters` (`hide_creature`, `name`, `mana`, `exp`, `health`, `speed_lvl`, `use_haste`, `voices`, `immunities`, `summonable`, `convinceable`, `race`, `gfx_name`) VALUES
(0, 'Infernalist', 0, 4000, 3650, 20, 0, '"Nothing will remain but your scorched bones!", "Some like it hot!", "It''s cooking time!", "Feel the heat of battle!"', 'energy, fire, paralyze, invisible', 0, 0, 'blood', 'infernalist.gif'),
(0, 'Mad Scientist', 0, 205, 325, 1, 0, '"Die in the name of Science!", "You will regret interrupting my studies!", "Let me test this!", "I will study your corpse!"', 'invisible', 0, 0, 'blood', 'madscientist.gif'),
(0, 'Medusa', 0, 4050, 4500, 10, 0, '"You will ssuch a fine ssstatue!", "There isss no chhhanccce of esscape", "Are you tired or why are you moving thhat sslow"', 'earth, paralyze, invisible', 0, 0, 'blood', 'medusa.gif'),
(0, 'Warlock', 0, 4000, 3500, 1, 0, '"Learn the secret of our magic! YOUR death!", "Even a rat is a better mage than you.", "We don''t like intruders!"', 'paralyze, invisible', 0, 0, 'blood', 'warlock.gif'),
(0, 'Witch', 0, 120, 300, 1, 0, '"Horax pokti! Hihihihi!", "Herba budinia ex!"', 'invisible', 0, 0, 'blood', 'witch.gif'),
(0, 'Thornback Tortoise', 490, 150, 300, 1, 0, '', '', 0, 1, 'blood', 'thornbacktortoise.gif'),
(0, 'Tortoise', 445, 90, 150, 1, 0, '', '', 0, 1, 'blood', 'tortoise.gif'),
(0, 'A Carved Stone Tile', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'acarvedstonetile.gif'),
(0, 'Deaththrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'deaththrower.gif'),
(0, 'Deathslicer', 0, 320, 2000, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'deathslicer.gif'),
(0, 'Eye Of The Seven', 0, 0, 1, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit', 0, 0, 'venom', 'eyeoftheseven.gif'),
(0, 'Flamethrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'flamethrower.gif'),
(0, 'Lavahole', 0, 0, 100, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'lavahole.gif'),
(0, 'Magicthrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'magicthrower.gif'),
(0, 'Plaguethrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'plaguethrower.gif'),
(0, 'Poisonthrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'poisonthrower.gif'),
(0, 'Shredderthrower', 0, 0, 9950, 1, 0, '', 'physical, energy, fire, poison, ice, holy, death, lifedrain, manadrain, paralyze, drunk, outfit, invisible', 0, 0, 'undead', 'shredderthrower.gif'),
(0, 'Frost Troll', 300, 23, 55, 1, 0, '"Brrrr", "Broar!"', '', 1, 1, 'blood', 'frosttroll.gif'),
(0, 'Island Troll', 290, 20, 50, 1, 0, '"Hmmm, turtles", "Hmmm, dogs", "Hmmm, wormds", "Groar", "Gruntz!"', '', 1, 0, 'blood', 'islandtroll.gif'),
(0, 'Swamp Troll', 320, 65, 55, 1, 0, '"Grrrr", "Groar!", "Me strong! Me ate spinach!"', '', 1, 1, 'venom', 'swamptroll.gif'),
(0, 'Troll', 290, 20, 50, 1, 0, '"Grrrr", "Groar", "Gruntz!", "Hmmm, bugs.", "Hmmm, dogs."', '', 1, 1, 'blood', 'troll.gif'),
(0, 'Troll Champion', 340, 30, 75, 1, 0, '"Meee maity!", "Grrrr", "Whaaaz up!?", "Gruntz!"', '', 1, 1, 'blood', 'trollchampion.gif'),
(0, 'Banshee', 0, 900, 1000, 1, 0, '"Are you ready to rock?", "That''s what I call easy listening!", "Let the music play!", "I will mourn your death!", "IIIIEEEeeeeeehhhHHHHH!", "Dance for me your dance of death!", "Feel my gentle kiss of death."', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'banshee.gif'),
(0, 'Blightwalker', 0, 3350, 8900, 10, 0, '"I can see you decaying!", "Let me taste your mortality!"', 'paralyze', 0, 0, 'undead', 'blightwalker.gif'),
(0, 'Crypt Shambler', 0, 195, 330, 1, 0, '"Uhhhhhhh!", "Aaaaahhhh!", "Hoooohhh!", "Chhhhhhh!"', 'lifedrain, paralyze', 0, 1, 'undead', 'cryptshambler.gif'),
(0, 'Ghoul', 450, 85, 100, 1, 0, '', 'lifedrain, paralyze, invisible', 1, 1, 'blood', 'ghoul.gif'),
(0, 'Grim Reaper', 0, 5500, 4100, 90, 0, '"Death!", "Come a little closer!", "The end is near!"', 'paralyze, invisible', 0, 0, 'undead', 'grimreaper.gif'),
(0, 'Lich', 0, 900, 880, 50, 0, '"Doomed be the living!", "You will endure agony beyond thy death!", "Death awaits all!", "Thy living flesh offends me!", "Death and Decay!"', 'paralyze, invisible', 0, 0, 'undead', 'lich.gif'),
(0, 'Mummy', 0, 150, 240, 1, 0, '"I will ssswallow your sssoul!", "Mort ulhegh dakh visss.", "Flesssh to dussst!", "I will tassste life again!", "Ahkahra exura belil mort!", "Yohag Sssetham!"', 'lifedrain, paralyze, invisible', 0, 0, 'undead', 'mummy.gif'),
(0, 'Undead Prospector', 0, 85, 100, 1, 0, '', 'lifedrain, paralyze, invisible', 0, 1, 'blood', 'undeadprospector.gif'),
(0, 'Vampire', 0, 305, 450, 1, 1, '"BLOOD!", "Let me kiss your neck.", "I smell warm blood.", "I call you, my bats! Come!"', 'lifedrain, paralyze, invisible', 0, 0, 'blood', 'vampire.gif'),
(0, 'Vampire Bride', 0, 1050, 1200, 1, 0, '"Kneel before your Mistress!", "Dead is the new alive.", "Come, let me kiss you, darling. Oh wait, I meant kill.", "Enjoy the pain - I know you love it."', 'death, invisible', 0, 0, 'blood', 'vampirebride.gif'),
(0, 'Zombie', 0, 280, 500, 1, 0, '"Mst.... klll....", "Whrrrr... ssss.... mmm.... grrrrl", "Dnnnt... cmmm... clsrrr....", "Httt.... hmnnsss..."', 'death, energy, ice, earth, lifedrain, paralyze', 0, 0, 'undead', 'zombie.gif'),
(0, 'Abomination Fury', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'abominationfury.gif'),
(0, 'Brimstone Bug', 0, 900, 1300, 55, 1, '', 'paralyze, invisible', 0, 0, 'venom', 'brimstonebug.gif'),
(0, 'Butterfly Demon', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'butterflydemon.gif'),
(0, 'Draken Abomination', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'drakenabomination.gif'),
(0, 'Draken Elite', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'drakenelite.gif'),
(0, 'Finger Killer', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'fingerkiller.gif'),
(0, 'Living Plant', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'livingplant.gif'),
(0, 'Lizard Abomination', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'lizardabomination.gif'),
(0, 'Phantom Lord', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'phantomlord.gif'),
(0, 'Purple Turtle', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'purpleturtle.gif'),
(0, 'Snake God Essence', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'snakegodessence.gif'),
(0, 'Souleater', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'souleater.gif'),
(0, 'Rebel', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'rebel.gif'),
(0, 'Chartan', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'chartan.gif'),
(0, 'Ezean', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'ezean.gif'),
(0, 'Zumtah', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'zumtah.gif'),
(0, 'Zizzle', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'zizzle.gif'),
(0, 'Izsh', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'fire', 'izsh.gif'),
(0, 'Zlak', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'zlak.gif'),
(0, 'Awareness Of The Emperor', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'awarenessoftheemperor.gif'),
(0, 'A Sleeping Dragon', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'asleepingdragon.gif'),
(0, 'Triple Medusa', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'triplemedusa.gif'),
(0, 'Eternal Guardian', 0, 900, 1300, 1, 0, '"Zrp zrp!"', 'invisible', 1, 0, 'venom', 'eternalguardian.gif');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_network_box`
--

CREATE TABLE IF NOT EXISTS `z_network_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `z_network_box`
--

INSERT INTO `z_network_box` (`id`, `network_name`, `network_link`) VALUES
(1, 'facebook', 'MegaTibia.TibiaMax');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_big`
--

CREATE TABLE IF NOT EXISTS `z_news_big` (
  `hide_news` tinyint(1) NOT NULL DEFAULT '0',
  `date` int(11) NOT NULL DEFAULT '0',
  `author` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `topic_df` varchar(255) NOT NULL,
  `text_df` text NOT NULL,
  `topic_ot` varchar(255) NOT NULL,
  `text_ot` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_news_big`
--

INSERT INTO `z_news_big` (`hide_news`, `date`, `author`, `author_id`, `image_id`, `topic_df`, `text_df`, `topic_ot`, `text_ot`) VALUES
(1, 1352212684, '[ADM]-Beckman', 2240600, 4, 'Start MegaTibia', '</br><img src="images/letters/E.gif" alt=""/>stamos de volta galera, a pedidos de muitos e tambÃ©m uma imensa vontade prÃ³pria de toda a equipe, decidimos e conseguimos retornar com o <b>TibiaMax</b> ou pra outros <b>MegaTibia</b>. Temos grandes perspectivas de da tudo certo dessa vez, e tenho certeza que ajuda de todos vocÃªs nÃ£o vai faltar. Sem duvidas vocÃªs Ã© a peÃ§a fundamental pra tudo da certo e quero contar com todos vocÃªs, os que jÃ¡ participaram do servidor passado e de todos os novos players, os que estÃ£o com a agente e os ainda iram chegar, peÃ§o que divulguem o Server, que nos ajude a encontra os erros, para assim podermos ajustÃ¡-los.</br></br>\r\n<img src="images/letters/F.gif" alt=""/>izemos algumas alteraÃ§Ãµes sobre items vip, diminuÃ­mos danos e certos poderes, sei que muitos nÃ£o gostam de item vip no Server, mais sei tambÃ©m que no dia que os que nÃ£o gostam passarem a ter item vip irÃ£o muda de opiniÃ£o. NÃ£o mudamos muito, no mapa mesmo nÃ£o mechemos em nada, nÃ£o fizemos nenhuma alteraÃ§Ã£o de quest e scripts, ficamos com a versÃ£o do tÃ­bia 8.60 porque pra nÃ³s da Equipe TibiaMax Ã© a melhor versÃ£o de tÃ­bia comparada com a mais recentes e creio que vocÃªs tambÃ©m tenham a mesma opiniÃ£o.</br></br>\r\n<img src="images/letters/A.gif" alt=""/>tualmente utilizamos uma mega estrutura interna de um sistema operacional e componentes  favorÃ¡veis a um Ã³timo desempenho para o jogo. Utilizamos o sistema operacional <i>CentOS 6.3-64, Hynix 36GB DDR3 x8 memÃ³ria RAM, Uplink speed 10000 Mbps Force Full Speed, Dual Intel Xeon-Westmere 5670-Hexcore [2.93GHz], Drive Controller Mainboard  Onboard  SATAII Controller Western Digital WD RE4 WD1003FBYX 1000GB</i> e todo esse processo de sucesso graÃ§as a ajuda fundamental de um cara top Linux Brasil o <i>Joffily</i> conhecido tambÃ©m na Ã¡rea de OTServ como <i>Kel Serific</i> dono do <b>AlcatrazWolrd</b>.</br></br>\r\n<img src="images/letters/G.gif" alt=""/>alera mais informaÃ§Ãµes sobre o Server procurem em Server info, caso tenha duvidas nos envie um e-mail para <b>confirmacao@tibiamax.com</b>, nÃ£o perca tempo faÃ§a sua doaÃ§Ã£o e explore toda a Ã¡rea vip cheia de monster e respawns fora do normal, seja o top, seja o melhor pvp, participe da melhor guild, traga toda sua galera, monte suas battles, resumindo ta tudo ai, sÃ³ aproveitar e vamos nos ajudar para mantermos nossa diversÃ£o por vÃ¡rios dias meses e anos. Mais detalhes procurem a equipe estaremos disponÃ­veis ajudar pelo e-mail, vamos estÃ¡ mais ativos no e-mail do que in-game, talvez in-game fica sÃ³ tutores e sÃªnior tutores, utilizem sempre o help. Bom jogo e muita felicidade a todos nÃ³s!\r\n</br></br><center><font size="5"><b>IP:</b> <i>venus.mega-tibia.net</i></font></center>', '.', '.'),
(0, 1388963764, '[ADM]-Beckman', 4867248, 0, 'MegaTibia ON-line', '</br><img src="images/letters/M.gif" alt=""/><b>egaTibia</b> <font color="#00CD00"><b>ON-line</b></font>,sejam bem vindos todos os players, nosso servidor tem uma grande estrutura, muita diversÃ£o, wars, quests, ups, grandes guilds.\r\nFaÃ§a agora mesmo sua conta, convide seus amigos, monte seu team, nos ajude a divulgar nosso IP.</br></br>\r\n<img src="layouts/tibiacom/images/content/bullet.gif">Fizemos algumas alteraÃ§Ãµes sobre items vip, diminuÃ­mos danos e certos poderes, sei que muitos nÃ£o gostam de item vip no Server, mais sei tambÃ©m que no dia que os que nÃ£o gostam passarem a ter item vip irÃ£o muda de opiniÃ£o. NÃ£o mudamos muito, no mapa mesmo nÃ£o mechemos em nada, nÃ£o fizemos nenhuma alteraÃ§Ã£o de quests e scripts, ficamos com a versÃ£o do tÃ­bia <b>8.60</b> porque pra nÃ³s da Equipe <b>MegaTibia</b> acreditamos ser a melhor versÃ£o de tÃ­bia comparada com a mais recentes e creio que vocÃªs tambÃ©m tenham a mesma opiniÃ£o.</br></br>\r\n<img src="layouts/tibiacom/images/content/bullet.gif">Galera mais informaÃ§Ãµes sobre o Server procurem em Server info, caso tenha duvidas nos envie um e-mail para <b>confirmacao@megatibia.net</b>, nÃ£o perca tempo faÃ§a sua doaÃ§Ã£o e explore toda a Ã¡rea vip cheia de monster e respawns fora do normal, seja o top, seja o melhor pvp, participe da melhor guild, traga toda sua galera, monte suas battles, resumindo ta tudo ai, sÃ³ aproveitar e vamos nos ajudar para mantermos nossa diversÃ£o por vÃ¡rios dias meses e anos. Mais detalhes procurem-nos atravÃ©s do <u>e-mail</u>, vamos estÃ¡ mais ativos no <u>e-mail</u> do que <b>in-game</b>, talvez <b>in-game</b> fica sÃ³ <u>tutores</u> e <u>sÃªnior tutores</u>, utilizem sempre o help. Bom jogo e muita felicidade a todos nÃ³s!</br></br><center><font size="5"><b>IP:</b> <i>venus.megatibia.net</i></font></center>', '.', '.'),
(0, 1391829766, '[ADM]-Beckman', 2101697, 0, 'Resetado!', '</br><img src="images/letters/R.gif" alt=""/>esetado, depois de alguns problemas, decepÃ§Ãµes, falhas e grandes ajustes, a Equipe decidiu resetar o servidor para renovar tudo e assim obter novamente o sucesso. </br>Nosso servidor mapa Global Ã© um dos melhores da Ã¡rea de OTserver, sem bugs, grandes hunts, raÃ§as equilibradas, uma imensa Ã¡rea de VIP com grandes respawns .</br> Agradecemos muito a todos que sempre nos ajudam divulgando o Server, a todos os players que jogam se divertem no nosso servidor, aqueles que sempre estÃ£o conosco como teams que sempre jogaram e jogam..</br>\r\nEsse Server Ã© pra valer, espero a colaboraÃ§Ã£o de todos que possam nos ajudar de todas as formas e mil desculpas pelas falhas passadas e mais uma vez agora Ã© pra valer. .</br>DÃªem suas sugestÃµes opiniÃµes e criticas estamos sempre ativos no e-mail, <b>confirmaÃ§Ã£o@megatibia.net</b>..</br>\r\nTodos os players que fizeram suas doaÃ§Ãµes terÃ£o seus pontos de volta e com a promoÃ§Ã£o, enviem-nos um e-mail para <b>confirmaÃ§Ã£o@megaitbia.net</b> e iremos confirmar seus dados para devolver seus pontos..</br></br>\r\n<i>Divirta-se!</i></br><center><font size="5"><b>IP:</b> <i>venus.megatibia.net</i></font></center>', '.', '.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE IF NOT EXISTS `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_news_tickers`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE IF NOT EXISTS `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14800 ;

--
-- Extraindo dados da tabela `z_ots_comunication`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_guildcomunication`
--

CREATE TABLE IF NOT EXISTS `z_ots_guildcomunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_ots_guildcomunication`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE IF NOT EXISTS `z_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_polls`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE IF NOT EXISTS `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_polls_answers`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_item`
--

CREATE TABLE IF NOT EXISTS `z_shopguild_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_shopguild_history_item`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_pacc`
--

CREATE TABLE IF NOT EXISTS `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_shopguild_history_pacc`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_offer`
--

CREATE TABLE IF NOT EXISTS `z_shopguild_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `looktype` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11299 ;

--
-- Extraindo dados da tabela `z_shopguild_offer`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `offer_desc` varchar(255) DEFAULT NULL,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_shop_history_item`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_pacc`
--

CREATE TABLE IF NOT EXISTS `z_shop_history_pacc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_shop_history_pacc`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE IF NOT EXISTS `z_shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `looktype` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_shop_offer`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_points_bought`
--

CREATE TABLE IF NOT EXISTS `z_shop_points_bought` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `amount` int(15) NOT NULL,
  `type` varchar(255) NOT NULL,
  `accountid` int(15) NOT NULL,
  `code` varchar(255) NOT NULL,
  `paypalmail` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_shop_points_bought`
--


-- --------------------------------------------------------

--
-- Estrutura da tabela `z_spells`
--

CREATE TABLE IF NOT EXISTS `z_spells` (
  `name` varchar(255) NOT NULL,
  `spell` varchar(255) NOT NULL,
  `spell_type` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT '0',
  `lvl` int(11) NOT NULL DEFAULT '0',
  `mlvl` int(11) NOT NULL DEFAULT '0',
  `soul` int(11) NOT NULL DEFAULT '0',
  `pacc` varchar(255) NOT NULL,
  `vocations` varchar(255) NOT NULL,
  `conj_count` int(11) NOT NULL DEFAULT '0',
  `hide_spell` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `z_spells`
--

INSERT INTO `z_spells` (`name`, `spell`, `spell_type`, `mana`, `lvl`, `mlvl`, `soul`, `pacc`, `vocations`, `conj_count`, `hide_spell`) VALUES
('Conjure Arrow', 'exevo con', 'conjure', 100, 13, 0, 1, 'no', '', 10, 0),
('Poisoned Arrow', 'exevo con pox', 'conjure', 130, 16, 0, 2, 'no', '', 7, 0),
('Conjure Bolt', 'exevo con mort', 'conjure', 140, 17, 0, 2, 'no', '', 5, 0),
('Conjure Sniper Arrow', 'exevo con hur', 'conjure', 160, 24, 0, 3, 'no', '', 5, 0),
('Explosive Arrow', 'exevo con flam', 'conjure', 290, 25, 0, 3, 'no', '', 8, 0),
('Conjure Piercing Bolt', 'exevo con grav', 'conjure', 180, 33, 0, 3, 'no', '', 5, 0),
('Enchant Staff', 'exeta vis', 'conjure', 80, 41, 0, 0, 'no', '', 0, 0),
('Enchant Spear', 'exeta con', 'conjure', 350, 45, 0, 3, 'no', '', 0, 0),
('Power Bolt', 'exevo con vis', 'conjure', 800, 59, 0, 4, 'no', '', 10, 0),
('Poison Field', 'adevo grav pox', 'conjure', 200, 14, 0, 1, 'no', '', 3, 0),
('Light Magic Missile', 'adori min vis', 'conjure', 120, 15, 0, 1, 'no', '', 10, 0),
('Fire Field', 'adevo grav flam', 'conjure', 240, 15, 0, 1, 'no', '', 3, 0),
('Fireball', 'adori flam', 'conjure', 460, 27, 0, 3, 'no', '', 5, 0),
('Energy Field', 'adevo grav vis', 'conjure', 320, 18, 0, 2, 'no', '', 3, 0),
('Stalagmite', 'adori tera', 'conjure', 400, 24, 0, 2, 'no', '', 10, 0),
('Great Fireball', 'adori mas flam', 'conjure', 530, 30, 0, 3, 'no', '', 4, 0),
('Heavy Magic Missile', 'adori vis', 'conjure', 350, 25, 0, 2, 'no', '', 10, 0),
('Poison Bomb', 'adevo mas pox', 'conjure', 520, 25, 0, 2, 'no', '', 2, 0),
('Firebomb', 'adevo mas flam', 'conjure', 600, 27, 0, 4, 'no', '', 2, 0),
('Soulfire', 'adevo res flam', 'conjure', 600, 27, 0, 3, 'no', '', 3, 0),
('Poison Wall', 'adevo mas grav pox', 'conjure', 640, 29, 0, 3, 'no', '', 4, 0),
('Explosion', 'adevo mas hur', 'conjure', 570, 31, 0, 4, 'no', '', 6, 0),
('Fire Wall', 'adevo mas grav flam', 'conjure', 780, 33, 0, 4, 'no', '', 4, 0),
('Energybomb', 'adevo mas vis', 'conjure', 880, 37, 0, 5, 'no', '', 2, 0),
('Energy Wall', 'adevo mas grav vis', 'conjure', 1000, 41, 0, 5, 'no', '', 4, 0),
('Sudden Death', 'adori gran mort', 'conjure', 985, 45, 0, 5, 'no', '', 4, 0),
('Antidote Rune', 'adana pox', 'conjure', 200, 15, 0, 1, 'no', '', 1, 0),
('Intense Healing Rune', 'adura gran', 'conjure', 240, 15, 0, 2, 'no', '', 3, 0),
('Ultimate Healing Rune', 'adura vita', 'conjure', 400, 24, 0, 3, 'no', '', 3, 0),
('Convince Creature', 'adeta sio', 'conjure', 200, 16, 0, 3, 'no', '', 1, 0),
('Animate Dead', 'adana mort', 'conjure', 600, 27, 0, 5, 'no', '', 1, 0),
('Chameleon', 'adevo ina', 'conjure', 600, 27, 0, 2, 'no', '', 1, 0),
('Destroy Field', 'adito grav', 'conjure', 120, 17, 0, 2, 'no', '', 3, 0),
('Desintegrate', 'adito tera', 'conjure', 200, 21, 0, 3, 'no', '', 3, 0),
('Magic Wall', 'adevo grav tera', 'conjure', 750, 32, 0, 5, 'no', '', 4, 0),
('Wild Growth', 'adevo grav vita', 'conjure', 600, 27, 0, 5, 'no', '', 2, 0),
('Paralyze', 'adana ani', 'conjure', 1400, 54, 0, 3, 'no', '', 2, 0),
('Icicle', 'adori frigo', 'conjure', 460, 28, 0, 3, 'no', '', 5, 0),
('Avalanche', 'adori mas frigo', 'conjure', 530, 30, 0, 3, 'no', '', 4, 0),
('Stone Shower', 'adori mas tera', 'conjure', 430, 28, 0, 3, 'no', '', 4, 0),
('Thunderstorm', 'adori mas vis', 'conjure', 430, 28, 0, 3, 'no', '', 4, 0),
('Holy Missile', 'adori san', 'conjure', 350, 27, 0, 3, 'no', '', 5, 0),
('Death Strike', 'exori mort', 'instant', 20, 16, 0, 0, 'no', '', 0, 0),
('Flame Strike', 'exori flam', 'instant', 20, 12, 0, 0, 'no', '', 0, 0),
('Energy Strike', 'exori vis', 'instant', 20, 12, 0, 0, 'no', '', 0, 0),
('Whirlwind Throw', 'exori hur', 'instant', 40, 15, 0, 0, 'no', '', 0, 0),
('Fire Wave', 'exevo flam hur', 'instant', 25, 18, 0, 0, 'no', '', 0, 0),
('Ethereal Spear', 'exori con', 'instant', 25, 23, 0, 0, 'no', '', 0, 0),
('Energy Beam', 'exevo vis lux', 'instant', 40, 23, 0, 0, 'no', '', 0, 0),
('Great Energy Beam', 'exevo gran vis lux', 'instant', 110, 29, 0, 0, 'no', '', 0, 0),
('Groundshaker', 'exori mas', 'instant', 160, 33, 0, 0, 'no', '', 0, 0),
('Berserk', 'exori', 'instant', 115, 35, 0, 0, 'no', '', 0, 0),
('Energy Wave', 'exevo vis hur', 'instant', 170, 38, 0, 0, 'no', '', 0, 0),
('Rage of the Skies', 'exevo gran mas vis', 'instant', 650, 55, 0, 0, 'no', '', 0, 0),
('Fierce Berserk', 'exori gran', 'instant', 340, 70, 0, 0, 'no', '', 0, 0),
('Hells Core', 'exevo gran mas flam', 'instant', 1200, 60, 0, 0, 'no', '', 0, 0),
('Divine Missile', 'exori san', 'instant', 20, 40, 0, 0, 'no', '', 0, 0),
('Divine Caldera', 'exevo mas san', 'instant', 160, 50, 0, 0, 'no', '', 0, 0),
('Eternal Winter', 'exevo gran mas frigo', 'instant', 1200, 60, 0, 0, 'no', '', 0, 0),
('Ice Strike', 'exori frigo', 'instant', 20, 15, 0, 0, 'no', '', 0, 0),
('Ice Wave', 'exevo frigo hur', 'instant', 25, 18, 0, 0, 'no', '', 0, 0),
('Terra Strike', 'exori tera', 'instant', 20, 13, 0, 0, 'no', '', 0, 0),
('Terra Wave', 'exevo tera hur', 'instant', 210, 38, 0, 0, 'no', '', 0, 0),
('Wrath of Nature', 'exevo gran mas tera', 'instant', 770, 55, 0, 0, 'no', '', 0, 0),
('Light Healing', 'exura', 'instant', 20, 9, 0, 0, 'no', '', 0, 0),
('Antidote', 'exana pox', 'instant', 30, 10, 0, 0, 'no', '', 0, 0),
('Intense Healing', 'exura gran', 'instant', 70, 11, 0, 0, 'no', '', 0, 0),
('Heal Friend', 'exura sio', 'instant', 140, 18, 0, 0, 'no', '', 0, 0),
('Ultimate Healing', 'exura vita', 'instant', 160, 20, 0, 0, 'no', '', 0, 0),
('Mass Healing', 'exura gran mas res', 'instant', 150, 36, 0, 0, 'no', '', 0, 0),
('Divine Healing', 'exura san', 'instant', 210, 35, 0, 0, 'no', '', 0, 0),
('Wound Cleansing', 'exana mort', 'instant', 65, 30, 0, 0, 'no', '', 0, 0),
('Light', 'utevo lux', 'instant', 20, 8, 0, 0, 'no', '', 0, 0),
('Find Person', 'exiva', 'instant', 20, 8, 0, 0, 'no', '', 0, 0),
('Magic Rope', 'exani tera', 'instant', 20, 9, 0, 0, 'no', '', 0, 0),
('Levitate', 'exani hur', 'instant', 50, 12, 0, 0, 'no', '', 0, 0),
('Great Light', 'utevo gran lux', 'instant', 60, 13, 0, 0, 'no', '', 0, 0),
('Magic Shield', 'utamo vita', 'instant', 50, 14, 0, 0, 'no', '', 0, 0),
('Haste', 'utani hur', 'instant', 60, 14, 0, 0, 'no', '', 0, 0),
('Charge', 'utani tempo hur', 'instant', 100, 25, 0, 0, 'no', '', 0, 0),
('Swift Foot', 'utamo tempo san', 'instant', 400, 55, 0, 0, 'no', '', 0, 0),
('Challenge', 'exeta res', 'instant', 30, 20, 0, 0, 'no', '', 0, 0),
('Strong Haste', 'utani gran hur', 'instant', 100, 20, 0, 0, 'no', '', 0, 0),
('Creature Illusion', 'utevo res ina', 'instant', 100, 23, 0, 0, 'no', '', 0, 0),
('Ultimate Light', 'utevo vis lux', 'instant', 140, 26, 0, 0, 'no', '', 0, 0),
('Cancel Invisibility', 'exana ina', 'instant', 200, 26, 0, 0, 'no', '', 0, 0),
('Invisibility', 'utana vid', 'instant', 440, 35, 0, 0, 'no', '', 0, 0),
('Sharpshooter', 'utito tempo san', 'instant', 450, 60, 0, 0, 'no', '', 0, 0),
('Protector', 'utamo tempo', 'instant', 200, 55, 0, 0, 'no', '', 0, 0),
('Blood Rage', 'utito tempo', 'instant', 290, 60, 0, 0, 'no', '', 0, 0),
('Train Party', 'utito mas sio', 'instant', 60, 32, 0, 0, 'no', '', 0, 0),
('Protect Party', 'utamo mas sio', 'instant', 90, 32, 0, 0, 'no', '', 0, 0),
('Heal Party', 'utura mas sio', 'instant', 120, 32, 0, 0, 'no', '', 0, 0),
('Enchant Party', 'utori mas sio', 'instant', 120, 32, 0, 0, 'no', '', 0, 0),
('Summon Creature', 'utevo res', 'instant', 0, 25, 0, 0, 'no', '', 0, 0),
('Undead Legion', 'exana mas mort', 'instant', 500, 30, 0, 0, 'no', '', 0, 0),
('Food', 'exevo pan', 'instant', 120, 14, 0, 0, 'no', '', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_tracker`
--

CREATE TABLE IF NOT EXISTS `z_tracker` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `typetracker` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Extraindo dados da tabela `z_tracker`
--


--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_kills`
--
ALTER TABLE `guild_kills`
  ADD CONSTRAINT `guild_kills_ibfk_1` FOREIGN KEY (`war_id`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_2` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_kills_ibfk_3` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD CONSTRAINT `guild_wars_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_wars_ibfk_2` FOREIGN KEY (`enemy_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `login_history`
--
ALTER TABLE `login_history`
  ADD CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Restrições para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_statements`
--
ALTER TABLE `player_statements`
  ADD CONSTRAINT `player_statements_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `polls`
--
ALTER TABLE `polls`
  ADD CONSTRAINT `polls_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD CONSTRAINT `poll_votes_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

--
-- Restrições para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
