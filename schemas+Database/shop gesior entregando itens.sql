CREATE TABLE IF NOT EXISTS `z_ots_comunication` (
  `id` int(11) NOT NULL auto_increment,
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
  `delete_it` int(2) NOT NULL default '1',
  PRIMARY KEY  (`id`)
);
CREATE TABLE IF NOT EXISTS `z_shop_offer` (
  `id` int(11) NOT NULL auto_increment,
  `points` int(11) NOT NULL default '0',
  `itemid1` int(11) NOT NULL default '0',
  `count1` int(11) NOT NULL default '0',
  `itemid2` int(11) NOT NULL default '0',
  `count2` int(11) NOT NULL default '0',
  `offer_type` varchar(255) default NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
);
CREATE TABLE IF NOT EXISTS `z_shop_history_item` (
  `id` int(11) NOT NULL auto_increment,
  `to_name` varchar(255) NOT NULL default '0',
  `to_account` int(11) NOT NULL default '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL default '0',
  `price` int(11) NOT NULL default '0',
  `offer_id` int(11) NOT NULL default '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL default '0',
  `trans_real` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
);
CREATE TABLE IF NOT EXISTS `z_shop_history_pacc` (
  `id` int(11) NOT NULL auto_increment,
  `to_name` varchar(255) NOT NULL default '0',
  `to_account` int(11) NOT NULL default '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL default '0',
  `price` int(11) NOT NULL default '0',
  `pacc_days` int(11) NOT NULL default '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL default '0',
  `trans_real` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
);