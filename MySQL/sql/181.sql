/*
Navicat MySQL Data Transfer

Source Server         : DayZ-Localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : hivemind

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2014-05-29 22:51:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `character_data`
-- ----------------------------
DROP TABLE IF EXISTS `character_data`;
CREATE TABLE `character_data` (
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL DEFAULT '1000',
  `PlayerUID` varchar(45) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT '0',
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext,
  `Backpack` longtext,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(200) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) NOT NULL DEFAULT '1',
  `Generation` int(11) NOT NULL DEFAULT '1',
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) NOT NULL DEFAULT '0',
  `HeadshotsZ` int(11) NOT NULL DEFAULT '0',
  `distanceFoot` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `currentState` varchar(1000) NOT NULL DEFAULT '[[],[]]',
  `KillsH` int(11) NOT NULL DEFAULT '0',
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) NOT NULL DEFAULT '0',
  `Humanity` int(11) NOT NULL DEFAULT '2500',
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `Alive_PlayerID` (`Alive`,`LastLogin`,`PlayerID`),
  KEY `PlayerUID` (`PlayerUID`),
  KEY `Alive_PlayerUID` (`Alive`,`LastLogin`,`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of character_data
-- ----------------------------

-- ----------------------------
-- Table structure for `character_dead`
-- ----------------------------
DROP TABLE IF EXISTS `character_dead`;
CREATE TABLE `character_dead` (
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL DEFAULT '0',
  `PlayerUID` varchar(45) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT '0',
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext,
  `Backpack` longtext,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(200) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) NOT NULL DEFAULT '1',
  `Generation` int(11) NOT NULL DEFAULT '1',
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) NOT NULL DEFAULT '0',
  `HeadshotsZ` int(11) NOT NULL DEFAULT '0',
  `distanceFoot` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `currentState` varchar(1000) NOT NULL DEFAULT '[[],[]]',
  `KillsH` int(11) NOT NULL DEFAULT '0',
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) NOT NULL DEFAULT '0',
  `Humanity` int(11) NOT NULL DEFAULT '2500',
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `Alive_PlayerID` (`Alive`,`LastLogin`,`PlayerID`),
  KEY `PlayerUID` (`PlayerUID`),
  KEY `Alive_PlayerUID` (`Alive`,`LastLogin`,`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of character_dead
-- ----------------------------

-- ----------------------------
-- Table structure for `object_classes`
-- ----------------------------
DROP TABLE IF EXISTS `object_classes`;
CREATE TABLE `object_classes` (
  `Classname` varchar(32) NOT NULL DEFAULT '',
  `Chance` varchar(4) NOT NULL DEFAULT '0',
  `MaxNum` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Damage` varchar(20) NOT NULL DEFAULT '0',
  `Type` text NOT NULL,
  PRIMARY KEY (`Classname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of object_classes
-- ----------------------------
INSERT INTO `object_classes` VALUES ('ATV_CZ_EP1', '0.70', '6', '0.05000', 'atv');
INSERT INTO `object_classes` VALUES ('car_hatchback', '0.73', '3', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('datsun1_civil_3_open', '0.75', '3', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('Fishing_Boat', '0.61', '1', '0.05000', 'largeboat');
INSERT INTO `object_classes` VALUES ('S1203_TK_CIV_EP1', '0.69', '1', '0.05000', 'bus');
INSERT INTO `object_classes` VALUES ('tractor', '0.7', '1', '0.05000', 'farmvehicle');
INSERT INTO `object_classes` VALUES ('BAF_Offroad_D', '0.54', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('UAZ_Unarmed_TK_EP1', '0.7', '2', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('UH1H_DZ', '0.59', '2', '0.05000', 'helicopter');
INSERT INTO `object_classes` VALUES ('UralCivil2', '0.67', '1', '0.05000', 'truck');
INSERT INTO `object_classes` VALUES ('V3S_Civ', '0.66', '1', '0.05000', 'truck');
INSERT INTO `object_classes` VALUES ('Volha_2_TK_CIV_EP1', '0.71', '2', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('Ikarus', '0.59', '1', '0.05000', 'bus');
INSERT INTO `object_classes` VALUES ('ATV_US_EP1', '0.70', '5', '0.05000', 'atv');
INSERT INTO `object_classes` VALUES ('BAF_Offroad_W', '0.54', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('car_sedan', '0.59', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('hilux1_civil_1_open', '0.59', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('hilux1_civil_2_covered', '0.59', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('hilux1_civil_3_open', '0.59', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('Ikarus_TK_CIV_EP1', '0.59', '1', '0.05000', 'bus');
INSERT INTO `object_classes` VALUES ('LandRover_TK_CIV_EP1', '0.59', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('MH6J_EP1', '0.32', '1', '0.05000', 'helicopter');
INSERT INTO `object_classes` VALUES ('Old_bike_TK_CIV_EP1', '0.64', '4', '0.05000', 'bike');
INSERT INTO `object_classes` VALUES ('Old_bike_TK_INS_EP1', '0.64', '4', '0.05000', 'bike');
INSERT INTO `object_classes` VALUES ('PBX', '0.59', '1', '0.05000', 'smallboat');
INSERT INTO `object_classes` VALUES ('Skoda', '0.68', '4', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('SkodaBlue', '0.68', '2', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('SkodaGreen', '0.68', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('Smallboat_1', '0.59', '2', '0.05000', 'mediumboat');
INSERT INTO `object_classes` VALUES ('Smallboat_2', '0.59', '2', '0.05000', 'mediumboat');
INSERT INTO `object_classes` VALUES ('SUV_DZ', '0.59', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('TentStorage', '0.59', '0', '0.05000', 'tent');
INSERT INTO `object_classes` VALUES ('TT650_Ins', '0.72', '1', '0.05000', 'motorcycle');
INSERT INTO `object_classes` VALUES ('TT650_TK_CIV_EP1', '0.72', '1', '0.05000', 'motorcycle');
INSERT INTO `object_classes` VALUES ('TT650_TK_EP1', '0.72', '1', '0.05000', 'motorcycle');
INSERT INTO `object_classes` VALUES ('UAZ_INS', '0.59', '2', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('UAZ_RU', '0.59', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('UAZ_Unarmed_TK_CIV_EP1', '0.59', '3', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('UAZ_Unarmed_UN_EP1', '0.59', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('UralCivil', '0.59', '1', '0.05000', 'truck');
INSERT INTO `object_classes` VALUES ('Mi17_DZ', '0.49', '2', '0.05000', 'helicopter');
INSERT INTO `object_classes` VALUES ('AN2_DZ', '1', '1', '0.05000', 'plane');
INSERT INTO `object_classes` VALUES ('Hedgehog_DZ', '0', '0', '0', 'Hedgehog');
INSERT INTO `object_classes` VALUES ('Wire_cat1', '0', '0', '0', 'wire');
INSERT INTO `object_classes` VALUES ('Sandbag1_DZ', '0', '0', '0', 'Sandbag');
INSERT INTO `object_classes` VALUES ('AH6X_DZ', '0.48', '1', '0.05000', 'helicopter');
INSERT INTO `object_classes` VALUES ('datsun1_civil_1_open', '0.59', '2', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('Lada1_TK_CIV_EP1', '0.59', '3', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('M1030', '0.58', '2', '0.05000', 'motorcycle');
INSERT INTO `object_classes` VALUES ('SUV_TK_EP1', '0.39', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('VolhaLimo_TK_CIV_EP1', '0.49', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('Lada2', '0.59', '2', '0', 'car');
INSERT INTO `object_classes` VALUES ('hilux1_civil_3_open_EP1', '0.59', '3', '0', 'car');
INSERT INTO `object_classes` VALUES ('LandRover_CZ_EP1', '0.59', '3', '0', 'car');
INSERT INTO `object_classes` VALUES ('HMMWV', '0.21', '2', '0', 'car');
INSERT INTO `object_classes` VALUES ('MH6J_DZ', '0.48', '1', '0.05000', 'helicopter');
INSERT INTO `object_classes` VALUES ('StashSmall', '0', '0', '0', 'StashSmall');
INSERT INTO `object_classes` VALUES ('StashMedium', '0', '0', '0', 'StashMedium');
INSERT INTO `object_classes` VALUES ('Pickup_PK_INS', '0.10', '1', '0.05000', 'car');
INSERT INTO `object_classes` VALUES ('Offroad_DSHKM_INS', '0.20', '1', '0.05000', 'car');

-- ----------------------------
-- Table structure for `object_data`
-- ----------------------------
DROP TABLE IF EXISTS `object_data`;
CREATE TABLE `object_data` (
  `ObjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Instance` int(11) NOT NULL,
  `Classname` varchar(50) DEFAULT NULL,
  `Datestamp` datetime NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Inventory` longtext,
  `Hitpoints` varchar(500) NOT NULL DEFAULT '[]',
  `Fuel` double(13,5) NOT NULL DEFAULT '1.00000',
  `Damage` double(13,5) NOT NULL DEFAULT '0.00000',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ObjectID`),
  UNIQUE KEY `CheckUID` (`ObjectUID`,`Instance`),
  KEY `ObjectUID` (`ObjectUID`),
  KEY `Instance` (`Damage`,`Instance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of object_data
-- ----------------------------

-- ----------------------------
-- Table structure for `object_spawns`
-- ----------------------------
DROP TABLE IF EXISTS `object_spawns`;
CREATE TABLE `object_spawns` (
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Classname` varchar(32) DEFAULT NULL,
  `Worldspace` varchar(64) DEFAULT NULL,
  `Inventory` longtext,
  `Hitpoints` varchar(999) NOT NULL DEFAULT '[]',
  `MapID` varchar(255) NOT NULL DEFAULT '',
  `Last_changed` int(10) DEFAULT NULL,
  PRIMARY KEY (`ObjectUID`,`MapID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of object_spawns
-- ----------------------------
INSERT INTO `object_spawns` VALUES ('30728533', 'UAZ_Unarmed_TK_EP1', '[0,[12140.168, 12622.802,0]]', '[[[], []], [[\"20Rnd_762x51_DMR\"], [5]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('26883451', 'UAZ_Unarmed_TK_CIV_EP1', '[0,[6279.4966, 7810.3691,0]]', '[[[], []], [[\"10Rnd_127x99_m107\"], [5]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('42231659', 'UAZ_Unarmed_UN_EP1', '[45,[6865.2432,2481.6943,0]]', '[[[], []], [[\"30Rnd_556x45_StanagSD\"], [5]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('30507947', 'UAZ_RU', '[157,[3693.0386, 5969.1489,0]]', '[[[], []], [[\"HandGrenade_west\"], [2]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('25844760', 'UAZ_Unarmed_TK_CIV_EP1', '[20,[13264.081,12167.432,0]]', '[[[], []], [[\"10Rnd_127x99_m107\"], [5]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('37699964', 'UAZ_Unarmed_TK_CIV_EP1', '[223,[4817.6572, 2556.5034,0]]', '[[[], []], [[\"10Rnd_127x99_m107\"], [5]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('10965544', 'UAZ_Unarmed_TK_EP1', '[337,[8120.3057,9305.4912,0]]', '[[[], []], [[\"20Rnd_762x51_DMR\"], [5]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('41727833', 'ATV_US_EP1', '[337,[3312.2793,11270.755,0]]', '[[[], []], [[\"ItemTent\", \"ItemMatchbox\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('75742533', 'ATV_US_EP1', '[50,[3684.0366, 5999.0117,0]]', '[[[], []], [[\"ItemTent\", \"ItemMatchbox\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('53529173', 'ATV_CZ_EP1', '[202,[11464.035, 11381.071,0]]', '[[[], []], [[\"Skin_Camo1_DZ\", \"ItemCompass\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('40418266', 'ATV_US_EP1', '[253,[11459.299,11386.546,0]]', '[[[], []], [[\"ItemTent\", \"ItemMatchbox\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('41503818', 'ATV_CZ_EP1', '[335,[8856.8359,2893.7903,0]]', '[[[], []], [[\"Skin_Camo1_DZ\", \"ItemCompass\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('86264294', 'SkodaBlue', '[353,[12869.565,4450.4077,0]]', '[[[], []], [[\"ItemWatch\", \"ItemKnife\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('6810018', 'Skoda', '[223,[6288.416, 7834.3521,0]]', '[[[\"Binocular\"], [1]], [[], []], [[\"CZ_VestPouch_EP1\"], [1]]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('75257214', 'SkodaGreen', '[306,[8125.7075,3166.3708,0]]', '[[[], []], [[\"ItemMatchbox\", \"ItemMap\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('55856021', 'ATV_US_EP1', '[284,[8854.9082,2891.5762,0]]', '[[[], []], [[\"ItemTent\", \"ItemMatchbox\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('53508464', 'TT650_Ins', '[291,[11945.78,9099.3633,0]]', '[[[], []], [[\"ItemJerrycan\"], [1]], [[], []]]', '[[\"motor\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('99974261', 'TT650_TK_EP1', '[151,[6592.686,2906.8245,0]]', '[[[], []], [[\"PartGeneric\"], [1]], [[], []]]', '[[\"motor\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('39345918', 'TT650_TK_CIV_EP1', '[372,[8762.8516, 11727.877,0]]', '[[[], []], [[\"PartWheel\"], [1]], [[], []]]', '[[\"motor\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('96806808', 'TT650_TK_CIV_EP1', '[52,[8713.4893, 7103.0518,0]]', '[[[], []], [[\"PartWheel\"], [1]], [[], []]]', '[[\"motor\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('65996290', 'Old_bike_TK_CIV_EP1', '[50,[8040.6777, 7086.5356,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('39561031', 'Old_bike_TK_CIV_EP1', '[316,[7943.5068,6988.1763,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('99816288', 'Old_bike_TK_INS_EP1', '[201,[8070.6958, 3358.7793,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('80398351', 'Old_bike_TK_INS_EP1', '[179,[3474.3989, 2562.4915,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('2542893', 'Old_bike_TK_INS_EP1', '[236,[1773.9318,2351.6221,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('71519415', 'Old_bike_TK_CIV_EP1', '[236,[3699.9189,2474.2119,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('49968400', 'Old_bike_TK_CIV_EP1', '[73,[8350.0947, 2480.542,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('35283758', 'Old_bike_TK_INS_EP1', '[35,[8345.7227, 2482.6855,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('26513596', 'Old_bike_TK_CIV_EP1', '[23,[3203.0916, 3988.6379,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('26716708', 'Old_bike_TK_INS_EP1', '[191,[2782.7134,5285.5342,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('54042757', 'Old_bike_TK_INS_EP1', '[155,[8680.75,2445.5315,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('90063662', 'Old_bike_TK_CIV_EP1', '[155,[12158.999,3468.7563,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('88190045', 'Old_bike_TK_INS_EP1', '[250,[11984.01,3835.9231,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('70759242', 'Old_bike_TK_CIV_EP1', '[255,[10153.068,2219.3547,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('89226080', 'UH1H_DZ2', '[60,[11279.154,4296.0205,0]]', '[[[], []], [[\"ItemSodaMtngreen\",\"ItemSodaMtngreenEmpty\"], [1, 2]], [[], []]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('33852678', 'UH1H_DZ', '[133,[4211.8789,10735.168,0]]', '[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('1585150', 'UH1H_DZ', '[52,[6874.0503,11432.864,0]]', '[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('6367723', 'UH1H_DZ', '[58,[10571.7,2220.3101,0.0015564]]', '[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('27083167', 'UH1H_DZ', '[359,[6377.8799,2757.8899,-0.048767101]]', '[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('16312671', 'hilux1_civil_3_open', '[344,[2045.3989,7267.4165,0]]', '[[[], []], [[\"PartFueltank\", \"PartWheel\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('313856', 'hilux1_civil_3_open', '[133,[8310.9902, 3348.3579,0]]', '[[[], []], [[\"PartFueltank\", \"PartWheel\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('52631272', 'hilux1_civil_3_open', '[124,[11309.963, 6646.3989,0]]', '[[[], []], [[\"PartFueltank\", \"PartWheel\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('62214795', 'hilux1_civil_3_open', '[6,[11240.744, 5370.6128,0]]', '[[[], []], [[\"PartFueltank\", \"PartWheel\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('53180164', 'Ikarus_TK_CIV_EP1', '[230,[3762.5764,8736.1709,0]]', '[[[], []], [[\"ItemWatch\", \"ItemSodaPepsi\"], [1, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('79256439', 'Ikarus', '[279,[10628.433,8037.8188,0]]', '[[[], []], [[\"PartWheel\", \"ItemSodaCoke\"], [1, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('36741707', 'Ikarus', '[245,[4580.3203,4515.9282,0]]', '[[[], []], [[\"PartWheel\", \"ItemSodaCoke\"], [1, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('45939219', 'Ikarus_TK_CIV_EP1', '[333,[6040.0923,7806.5439,0]]', '[[[], []], [[\"ItemWatch\", \"ItemSodaPepsi\"], [1, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('19470979', 'Ikarus', '[76,[10314.745, 2147.5374,0]]', '[[[], []], [[\"PartWheel\", \"ItemSodaCoke\"], [1, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('59537240', 'Ikarus_TK_CIV_EP1', '[59,[6705.8887, 2991.9358,0]]', '[[[], []], [[\"ItemWatch\", \"ItemSodaPepsi\"], [1, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('39273268', 'Tractor', '[195,[9681.8213,8947.2354,0]]', '[[[], []], [[\"ItemWire\", \"ItemJerrycan\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('17754622', 'Tractor', '[262,[3825.1318,8941.4873,0]]', '[[[], []], [[\"ItemWire\", \"ItemJerrycan\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('70953310', 'Tractor', '[19,[11246.52, 7534.7954,0]]', '[[[], []], [[\"ItemWire\", \"ItemJerrycan\"], [1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('1502689', 'S1203_TK_CIV_EP1', '[19,[11066.828,7915.2275,0]]', '[[[\"Makarov\"], [1]], [[\"FoodCanBakedBeans\"], [3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('94653519', 'S1203_TK_CIV_EP1', '[352,[12058.555,3577.8667,0]]', '[[[\"Makarov\"], [1]], [[\"FoodCanBakedBeans\"], [3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('68759530', 'S1203_TK_CIV_EP1', '[218,[11940.854, 8872.8389,0]]', '[[[\"Makarov\"], [1]], [[\"FoodCanBakedBeans\"], [3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('59837095', 'S1203_TK_CIV_EP1', '[346,[13386.471,6604.0098,0]]', '[[[\"Makarov\"], [1]], [[\"FoodCanBakedBeans\"], [3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('92906892', 'V3S_Civ', '[178,[13276.482, 6098.4463,0]]', '[[[\"MR43\"], [1]], [[\"PartEngine\"], [1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('85023176', 'UralCivil', '[338,[1890.9952,12417.333,0]]', '[[[], []], [[\"PartWheel\", \"ItemToolbox\", \"ItemTankTrap\"], [1, 1, 1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('46395206', 'car_hatchback', '[226,[1975.1283, 9150.0195,0]]', '[[[\"LeeEnfield\"], [1]], [[\"5x_22_LR_17_HMR\"], [3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('76906508', 'car_hatchback', '[315,[7429.4849,5157.8682,0]]', '[[[\"LeeEnfield\"], [1]], [[\"5x_22_LR_17_HMR\"], [3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('45346927', 'Fishing_Boat', '[315,[8317.2676,2348.6055,0]]', '[]', '[[\"motor\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('96015113', 'Fishing_Boat', '[315,[13222.181,10015.431,0]]', '[]', '[[\"motor\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('44034787', 'PBX', '[55,[13454.882, 13731.796,0]]', '[[[], []], [[\"ItemFlashlightRed\"], [1]], [[\"DZ_Backpack_EP1\"], [1]]]', '[[\"motor\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('32128600', 'Smallboat_1', '[245,[14417.589,12886.104,0]]', '[]', '[[\"motor\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('28538641', 'Smallboat_1', '[268,[13098.13, 8250.8828,0]]', '[]', '[[\"motor\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('46307410', 'Volha_2_TK_CIV_EP1', '[205,[9731.1514,8937.7998,0]]', '[[[], []], [[\"ItemSodaPepsi\", \"FoodCanFrankBeans\"], [3, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('45921132', 'Volha_1_TK_CIV_EP1', '[337,[9715.0352,6522.8286,0]]', '[[[], []], [[\"ItemSodaCoke\", \"FoodCanBakedBeans\"], [3, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('90683431', 'Volha_1_TK_CIV_EP1', '[241,[2614.0862,5079.6357,0]]', '[[[], []], [[\"ItemSodaCoke\", \"FoodCanBakedBeans\"], [3, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('15653764', 'Volha_2_TK_CIV_EP1', '[18,[10827.634, 2701.5688,0]]', '[[[], []], [[\"ItemSodaPepsi\", \"FoodCanFrankBeans\"], [3, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('6218531', 'Volha_1_TK_CIV_EP1', '[222,[5165.7231,2375.7642,0]]', '[[[], []], [[\"ItemSodaCoke\", \"FoodCanBakedBeans\"], [3, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('84131366', 'Volha_2_TK_CIV_EP1', '[207,[1740.8503,3622.6938,0]]', '[[[], []], [[\"ItemSodaPepsi\", \"FoodCanFrankBeans\"], [3, 3]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('2001240', 'SUV_DZ', '[266,[9157.8408, 11019.819,0]]', '[[[], []], [[\"Pipebomb\"], [1]], [[], []]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('57612106', 'car_sedan', '[222,[12360.468, 10817.882,0]]', '[[[], []], [[\"ItemFlashlight\", \"ItemMap\"], [1, 1]], [[\"DZ_ALICE_Pack_EP1\"], [1]]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('82056815', 'UH1H_DZ', '[310,[6365.7402,7795.3501,-0.048767101]]', '[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('37447759', 'UH1H_DZ', '[14,[13308.511,3227.0215,0]]', '[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('41068355', 'UH1H_DZ', '[265,[7695.0356,3991.2056,0]]', '[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('92998502', 'UH1H_DZ', '[22,[12009.904,12636.732,0]]', '[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('41787450', 'AH6X_DZ', '[2,[12010.7,12637.2,0]]', '[[[\"Binocular\"],[1]],[[\"TrashJackDaniels\",\"FoodCanFrankBeans\"],[1,1]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]', '', null);
INSERT INTO `object_spawns` VALUES ('29941745', 'AH6X_DZ', '[113,[6880.2007,11454.291,0]]', '[[[\"Binocular\"],[1]],[[\"TrashJackDaniels\",\"FoodCanFrankBeans\"],[1,1]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]', '', null);
INSERT INTO `object_spawns` VALUES ('24346379', 'Mi17_DZ', '[156,[7660.271,3982.0063,0]]', '[[[],[]],[[\"ItemSodaMdew\"],[2]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]', '', null);
INSERT INTO `object_spawns` VALUES ('31906663', 'Mi17_DZ', '[-188,[7220.6538,9116.3428,0]]', '[[[],[]],[[\"ItemSodaMdew\"],[2]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]', '', null);
INSERT INTO `object_spawns` VALUES ('86494184', 'Mi17_DZ', '[4,[13584.044,3199.9648,0]]', '[[[],[]],[[\"ItemSodaMdew\"],[2]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]', '', null);
INSERT INTO `object_spawns` VALUES ('36750931', 'AN2_DZ', '[252,[4530.52,10785.1,0]]', '[]', '[]', '', null);
INSERT INTO `object_spawns` VALUES ('24272110', 'BAF_Offroad_D', '[162,[3702.04,6044.3101,0]]', '[[[],[]],[[\"HandGrenade_West\",\"SmokeShell\",\"SmokeShellRed\",\"SmokeShellYellow\",\"SmokeShellGreen\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\",\"20Rnd_762x51_DMR\",\"ItemTent\"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"karoserie\",1],[\"wheel_1_4_steering\",1],[\"wheel_2_4_steering\",1],[\"wheel_1_3_steering\",1],[\"wheel_2_3_steering\",1],[\"glass4\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('11107760', 'BAF_Offroad_D', '[141,[11953.279,9107.3896,0]]', '[[[],[]],[[\"HandGrenade_West\",\"SmokeShell\",\"SmokeShellRed\",\"SmokeShellYellow\",\"SmokeShellGreen\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\",\"20Rnd_762x51_DMR\",\"ItemTent\"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"karoserie\",1],[\"wheel_1_4_steering\",1],[\"wheel_2_4_steering\",1],[\"wheel_1_3_steering\",1],[\"wheel_2_3_steering\",1],[\"glass4\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('82722474', 'BAF_Offroad_W', '[71,[3708.5,5999.4199,0]]', '[[[],[]],[[\"HandGrenade_West\",\"SmokeShell\",\"SmokeShellRed\",\"SmokeShellYellow\",\"SmokeShellGreen\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\",\"20Rnd_762x51_DMR\",\"ItemTent\"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"karoserie\",1],[\"wheel_1_4_steering\",1],[\"wheel_2_4_steering\",1],[\"wheel_1_3_steering\",1],[\"wheel_2_3_steering\",1],[\"glass4\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('80289092', 'BAF_Offroad_W', '[322,[7201.5181,3034.3232,0]]', '[[[],[]],[[\"HandGrenade_West\",\"SmokeShell\",\"SmokeShellRed\",\"SmokeShellYellow\",\"SmokeShellGreen\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\",\"20Rnd_762x51_DMR\",\"ItemTent\"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"karoserie\",1],[\"wheel_1_4_steering\",1],[\"wheel_2_4_steering\",1],[\"wheel_1_3_steering\",1],[\"wheel_2_3_steering\",1],[\"glass4\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('53278043', 'MH6J_DZ', '[122,[10137.868,12049.376,-6.1035156e-005]]', '[[[],[]],[[\"1Rnd_Smoke_M203\", \"7Rnd_45ACP_1911\", \"30Rnd_556x45_StanagSD\", \"200Rnd_556x45_M249\", \"FoodCanPasta\", \"15Rnd_W1866_Slug\", \"5x_22_LR_17_HMR\", \"15Rnd_9x19_M9SD\", \"17Rnd_9x19_glock17\", \"100Rnd_762x51_M240\", \"6Rnd_45ACP\", \"8Rnd_9x18_Makarov\"],[2,1,1,1,1,1,1,1,1,1,1,1]],[[\"DZ_Backpack_EP1\"],[1]]]', '[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('25522943', 'HMMWV_DZ', '[0,[13441.056,12003.912,4.5776367e-005]]', '[[[\"AK_47_M\"],[1]],[[\"PartWoodPile\", \"ItemBandage\", \"HandGrenade_west\", \"6Rnd_45ACP\", \"ItemEpinephrine\", \"8Rnd_B_Beneli_74Slug\", \"HandChemBlue\", \"8Rnd_B_Beneli_Pellets\", \"PartEngine\", \"17Rnd_9x19_glock17\", \"ItemTent\"],[1,2,1,1,1,1,1,1,1,1,1]],[[\"DZ_CivilBackpack_EP1\"],[1]]]', '[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('466210436', 'Pickup_PK_INS', '[12,[4662.13,10436,-3]]', '[[[],[]],[[\"HandGrenade_West\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\"],[5,1,6]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"karoserie\",1],[\"glass4\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('70067717', 'Pickup_PK_INS', '[-24,[7006.14,7717.57,-6]]', '[[[],[]],[[\"HandGrenade_West\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\"],[5,1,6]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"karoserie\",1],[\"glass4\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('53378656', 'Offroad_DSHKM_INS', '[363,[5337.62,8656.55,0]]', '[[[],[]],[[],[]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"karoserie\",1],[\"glass4\",1]]', '', null);
INSERT INTO `object_spawns` VALUES ('46259675', 'Offroad_DSHKM_INS', '[-169,[4625.61,9675.62,0]]', '[[[],[]],[[],[]],[[],[]]]', '[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"karoserie\",1],[\"glass4\",1]]', '', null);

-- ----------------------------
-- Table structure for `player_data`
-- ----------------------------
DROP TABLE IF EXISTS `player_data`;
CREATE TABLE `player_data` (
  `playerID` int(11) NOT NULL DEFAULT '0',
  `playerUID` varchar(45) NOT NULL DEFAULT '0',
  `playerName` varchar(50) NOT NULL DEFAULT 'Null',
  `playerMorality` int(11) NOT NULL DEFAULT '0',
  `playerSex` int(11) NOT NULL DEFAULT '0',
  KEY `playerID` (`playerID`),
  KEY `playerUID` (`playerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_data
-- ----------------------------

-- ----------------------------
-- Table structure for `player_login`
-- ----------------------------
DROP TABLE IF EXISTS `player_login`;
CREATE TABLE `player_login` (
  `LoginID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(45) NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `datestamp` datetime NOT NULL,
  `Action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LoginID`)
) ENGINE=InnoDB AUTO_INCREMENT=2621 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_login
-- ----------------------------

-- ----------------------------
-- Procedure structure for `pCleanup`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pCleanup`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanup`()
BEGIN 
#starts outofbounds cleanup
        CALL pCleanupOOB();
 
#move dead players to character_dead
        Insert
                INTO character_dead
                SELECT *
                FROM character_data
                        WHERE Alive=0;
 
#remove unused vehicles older then 14 days
        DELETE
                FROM object_data
                WHERE DATE(last_updated) < CURDATE() - INTERVAL 14 DAY
                        AND Classname != 'dummy'
                        AND Classname != 'Hedgehog_DZ'
                        AND Classname != 'Wire_cat1'
                        AND Classname != 'Sandbag1_DZ'
                        AND Classname != 'TrapBear'
                        AND Classname != 'StashSmall'
                        AND Classname != 'StashMedium';
                       
#Remove camonets whose owner has been dead for 1 day
DELETE
        FROM object_data
        USING object_data, character_dead
        WHERE (object_data.Classname = 'CamoNet_DZ')
                AND object_data.CharacterID = character_dead.CharacterID
                AND character_dead.Alive = 0
                AND DATE(character_dead.last_updated) < CURDATE() - INTERVAL 1 Day;                    
 
#remove tents/stashs whose owner has been dead for four days
        DELETE
                FROM object_data
                USING object_data, character_dead
                WHERE (object_data.Classname = 'TentStorage' or object_data.Classname = 'StashSmall' or object_data.Classname = 'StashMedium')
                        AND object_data.CharacterID = character_dead.CharacterID
                        AND character_dead.Alive = 0
                        AND DATE(character_dead.last_updated) < CURDATE() - INTERVAL 4 DAY;
 
#remove empty tents older than seven days
        DELETE
                FROM object_data
                WHERE (Classname = 'TentStorage' or Classname = 'StashSmall' or Classname = 'StashMedium')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
                        AND Inventory = '[[[],[]],[[],[]],[[],[]]]';
       
        DELETE
                FROM object_data
                WHERE (Classname = 'TentStorage' or Classname = 'StashSmall' or Classname = 'StashMedium')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
                        AND Inventory = '[]';          
 
#remove barbed wire older than two days
        DELETE
                FROM object_data
                WHERE Classname = 'Wire_cat1'
                        AND DATE(last_updated) < CURDATE() - INTERVAL 2 DAY;
                       
#remove Tank Traps older than fifteen days
        DELETE
                FROM object_data
                WHERE Classname = 'Hedgehog_DZ'
                        AND DATE(last_updated) < CURDATE() - INTERVAL 15 DAY;
 
#remove Sandbags older than twenty days
        DELETE
                FROM object_data
                WHERE Classname = 'Sandbag1_DZ'
                        AND DATE(last_updated) < CURDATE() - INTERVAL 20 DAY;
 
#remove Bear Traps older than five days
        DELETE
                FROM object_data
                WHERE Classname = 'BearTrap_DZ'
                        AND DATE(last_updated) < CURDATE() - INTERVAL 5 DAY;   
                       
#remove dead players from data table
        DELETE
                FROM character_data
                WHERE Alive=0;                                         
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pCleanupOOB`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pCleanupOOB`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanupOOB`()
BEGIN

	DECLARE intLineCount	INT DEFAULT 0;
	DECLARE intDummyCount	INT DEFAULT 0;
	DECLARE intDoLine			INT DEFAULT 0;
	DECLARE intWest				INT DEFAULT 0;
	DECLARE intNorth			INT DEFAULT 0;

	SELECT COUNT(*)
		INTO intLineCount
		FROM Object_DATA;

	SELECT COUNT(*)
		INTO intDummyCount
		FROM Object_DATA
		WHERE Classname = 'dummy';

	WHILE (intLineCount > intDummyCount) DO
	
		SET intDoLine = intLineCount - 1;

		SELECT ObjectUID, Worldspace
			INTO @rsObjectUID, @rsWorldspace
			FROM Object_DATA
			LIMIT intDoLine, 1;

		SELECT REPLACE(@rsWorldspace, '[', '') INTO @rsWorldspace;
		SELECT REPLACE(@rsWorldspace, ']', '') INTO @rsWorldspace;
		SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(@rsWorldspace, ',', 2), LENGTH(SUBSTRING_INDEX(@rsWorldspace, ',', 2 -1)) + 1), ',', '') INTO @West;
		SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(@rsWorldspace, ',', 3), LENGTH(SUBSTRING_INDEX(@rsWorldspace, ',', 3 -1)) + 1), ',', '') INTO @North;

		SELECT INSTR(@West, '-') INTO intWest;
		SELECT INSTR(@North, '-') INTO intNorth;

		IF (intNorth = 0) THEN
			SELECT CONVERT(@North, DECIMAL(16,8)) INTO intNorth;
		END IF;

		IF (intWest > 0 OR intNorth > 15360) THEN
			DELETE FROM Object_DATA
				WHERE ObjectUID = @rsObjectUID;
		END IF;
			
		SET intLineCount = intLineCount - 1;

	END WHILE;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pMain`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pMain`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pMain`(IN `i` INT)
    MODIFIES SQL DATA
BEGIN

# maximum number of INSTANCE id's USED.
#-----------------------------------------------
	DECLARE sInstance VARCHAR(8) DEFAULT i;
#-----------------------------------------------
#maximum number of vehicles allowed !!! theoretical max. amount
#-----------------------------------------------
	DECLARE iVehSpawnMax INT DEFAULT 85;
#-----------------------------------------------	

# DECLARE iVehSpawnMin				INT DEFAULT 0;		#ToDo !!!
	DECLARE iTimeoutMax 				INT DEFAULT 250;	#number of loops before timeout
	DECLARE iTimeout 						INT DEFAULT 0;		#internal counter for loops done; used to prevent infinite loops - DO NOT CHANGE
	DECLARE iNumVehExisting 		INT DEFAULT 0;		#internal counter for already existing vehicles - DO NOT CHANGE
	DECLARE iNumClassExisting 	INT DEFAULT 0;		#internal counter for already existing class types - DO NOT CHANGE
	DECLARE i INT DEFAULT 1; #internal counter for vehicles spawns - DO NOT CHANGE

#Starts Cleanup
	CALL pCleanup();
	
		SELECT COUNT(*) 				#retrieve the amount of already spawned vehicles...
			INTO iNumVehExisting
			FROM Object_DATA 
			WHERE Instance = sInstance
			AND Classname != '-'			#exclude dummys
			AND Classname != 'Hedgehog_DZ'		#exclude hedgehog
			AND Classname != 'Wire_cat1'		#exclude wirecat
			AND Classname != 'Sandbag1_DZ'		#exclude Sanbag
			AND Classname != 'BearTrap_DZ'		#exclude BearTrap_DZ
			AND Classname != 'TrapBearTrapFlare'	#exclude TrapBearTrapFlare
			AND Classname != 'TrapBearTrapSmoke'	#exclude TrapBearTrapSmoke
			AND Classname != 'Trap_Cans'		#exclude Trap_Cans
			AND Classname != 'TrapTripwireGrenade'	#exclude TrapTripwireGrenade
			AND Classname != 'TrapTripwireFlare'	#exclude TrapTripwireFlare
			AND Classname != 'TrapTripwireSmoke'	#exclude TrapTripwireSmoke
			AND Classname != 'CamoNet_DZ'		#exclude CamoNet_DZ
			AND Classname != 'StashSmall'		#exclude StashSmall
			AND Classname != 'StashMedium'		#exclude StashMedium
			AND Classname != 'DomeTentStorage'	#exclude DomeTentStorage
			AND Classname != 'TentStorage';		#exclude TentStorage

		WHILE (iNumVehExisting < iVehSpawnMax) DO		#loop until maximum amount of vehicles is reached

			#select a random vehicle class
			SELECT Classname, Chance, MaxNum, Damage
				INTO @rsClassname, @rsChance, @rsMaxNum, @rsDamage
				FROM object_classes ORDER BY RAND() LIMIT 1;

			#count number of same class already spawned
			SELECT COUNT(*) 
				INTO iNumClassExisting 
				FROM Object_DATA 
				WHERE Instance = sInstance
				AND Classname = @rsClassname;

			IF (iNumClassExisting < @rsMaxNum) THEN

				IF (rndspawn(@rschance) = 1) THEN
				
					INSERT INTO Object_DATA (ObjectUID, Instance, Classname, Damage, CharacterID, Worldspace, Inventory, Hitpoints, Fuel, Datestamp)
						SELECT ObjectUID, sInstance, Classname, RAND(@rsDamage), '0', Worldspace, Inventory, Hitpoints, RAND(1), SYSDATE() 
							FROM object_spawns 
							WHERE Classname = @rsClassname 
								AND NOT ObjectUID IN (select objectuid from Object_DATA where instance = sInstance)
							ORDER BY RAND()
							LIMIT 0, 1;
							
					SELECT COUNT(*) 
						INTO iNumVehExisting 
						FROM Object_DATA 
						WHERE Instance = sInstance
						AND Classname != '-'			#exclude dummys
						AND Classname != 'Hedgehog_DZ'		#exclude hedgehog
						AND Classname != 'Wire_cat1'		#exclude wirecat
						AND Classname != 'Sandbag1_DZ'		#exclude Sanbag
						AND Classname != 'BearTrap_DZ'		#exclude BearTrap_DZ
						AND Classname != 'TrapBearTrapFlare'	#exclude TrapBearTrapFlare
						AND Classname != 'TrapBearTrapSmoke'	#exclude TrapBearTrapSmoke
						AND Classname != 'Trap_Cans'		#exclude Trap_Cans
						AND Classname != 'TrapTripwireGrenade'	#exclude TrapTripwireGrenade
						AND Classname != 'TrapTripwireFlare'	#exclude TrapTripwireFlare
						AND Classname != 'TrapTripwireSmoke'	#exclude TrapTripwireSmoke
						AND Classname != 'CamoNet_DZ'		#exclude CamoNet_DZ
						AND Classname != 'StashSmall'		#exclude StashSmall
						AND Classname != 'StashMedium'		#exclude StashMedium
						AND Classname != 'DomeTentStorage'	#exclude DomeTentStorage
						AND Classname != 'TentStorage';		#exclude TentStorage		
					#update number of same class already spawned
					SELECT COUNT(*) 
						INTO iNumClassExisting 
						FROM Object_DATA 
						WHERE Instance = sInstance
						AND Classname = @rsClassname;
				
				END IF;
			END IF;	
			
			SET iTimeout = iTimeout + 1; #raise timeout counter
			IF (iTimeout >= iTimeoutMax) THEN
				SET iNumVehExisting = iVehSpawnMax;
			END IF;
		END WHILE;
	SET i = i + 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `rndspawn`
-- ----------------------------
DROP FUNCTION IF EXISTS `rndspawn`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` FUNCTION `rndspawn`(`chance` double) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

	DECLARE bspawn tinyint(1) DEFAULT 0;

	IF (RAND() <= chance) THEN
		SET bspawn = 1;
	END IF;

	RETURN bspawn;

END
;;
DELIMITER ;
