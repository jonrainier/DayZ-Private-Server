/*
Navicat MySQL Data Transfer

Source Server         : DayZ Localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : hivemind

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-10-14 18:24:01
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
  `currentState` varchar(100) NOT NULL DEFAULT '[]',
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
) ENGINE=InnoDB AUTO_INCREMENT=907 DEFAULT CHARSET=latin1;

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
  `currentState` varchar(100) NOT NULL DEFAULT '[]',
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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=latin1;

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
INSERT INTO `player_login` VALUES ('1', '47728262', '1', '2013-04-22 10:38:22', '0');
INSERT INTO `player_login` VALUES ('2', '3766534', '2', '2013-04-22 10:56:44', '0');
INSERT INTO `player_login` VALUES ('3', '47728262', '1', '2013-04-22 10:57:29', '0');
INSERT INTO `player_login` VALUES ('4', '3766534', '2', '2013-04-22 11:06:45', '2');
INSERT INTO `player_login` VALUES ('5', '3766534', '3', '2013-04-22 11:07:56', '0');
INSERT INTO `player_login` VALUES ('6', '47728262', '1', '2013-04-22 11:38:40', '2');
INSERT INTO `player_login` VALUES ('7', '47728262', '1', '2013-04-22 11:40:21', '0');
INSERT INTO `player_login` VALUES ('8', '3766534', '3', '2013-04-22 12:42:00', '2');
INSERT INTO `player_login` VALUES ('9', '3766534', '3', '2013-04-22 12:54:49', '0');
INSERT INTO `player_login` VALUES ('10', '3766534', '3', '2013-04-22 13:16:01', '2');
INSERT INTO `player_login` VALUES ('11', '3766534', '4', '2013-04-22 13:16:36', '0');
INSERT INTO `player_login` VALUES ('12', '3766534', '4', '2013-04-22 13:21:00', '2');
INSERT INTO `player_login` VALUES ('13', '3766534', '5', '2013-04-22 13:21:34', '0');
INSERT INTO `player_login` VALUES ('14', '47728262', '1', '2013-04-22 13:22:10', '2');
INSERT INTO `player_login` VALUES ('15', '3766534', '5', '2013-04-22 13:52:45', '2');
INSERT INTO `player_login` VALUES ('16', '3766534', '5', '2013-04-22 15:17:51', '0');
INSERT INTO `player_login` VALUES ('17', '3766534', '5', '2013-04-22 15:28:33', '2');
INSERT INTO `player_login` VALUES ('18', '3766534', '5', '2013-04-22 17:22:19', '0');
INSERT INTO `player_login` VALUES ('19', '3766534', '5', '2013-04-22 17:22:42', '2');
INSERT INTO `player_login` VALUES ('20', '3766534', '5', '2013-04-22 17:23:24', '0');
INSERT INTO `player_login` VALUES ('21', '3766534', '5', '2013-04-22 17:23:43', '2');
INSERT INTO `player_login` VALUES ('22', '3766534', '5', '2013-04-22 17:24:05', '0');
INSERT INTO `player_login` VALUES ('23', '3766534', '5', '2013-04-22 17:24:42', '2');
INSERT INTO `player_login` VALUES ('24', '3766534', '5', '2013-04-22 17:31:58', '0');
INSERT INTO `player_login` VALUES ('25', '3766534', '5', '2013-04-22 18:07:57', '2');
INSERT INTO `player_login` VALUES ('26', '3766534', '5', '2013-04-22 18:08:44', '0');
INSERT INTO `player_login` VALUES ('27', '3766534', '5', '2013-04-22 19:03:15', '2');
INSERT INTO `player_login` VALUES ('28', '3766534', '6', '2013-04-22 19:03:50', '0');
INSERT INTO `player_login` VALUES ('29', '3766534', '6', '2013-04-22 19:25:32', '2');
INSERT INTO `player_login` VALUES ('30', '3766534', '6', '2013-04-23 03:08:10', '0');
INSERT INTO `player_login` VALUES ('31', '11470854', '8', '2013-05-27 11:20:00', '0');
INSERT INTO `player_login` VALUES ('32', '11470854', '8', '2013-05-27 11:57:26', '2');
INSERT INTO `player_login` VALUES ('33', '11470854', '8', '2013-05-27 19:02:35', '0');
INSERT INTO `player_login` VALUES ('34', '11470854', '8', '2013-05-27 19:10:42', '2');
INSERT INTO `player_login` VALUES ('35', '3766534', '7', '2013-05-29 11:32:06', '0');
INSERT INTO `player_login` VALUES ('36', '68679430', '9', '2013-05-29 11:40:31', '0');
INSERT INTO `player_login` VALUES ('37', '3766534', '7', '2013-05-29 11:43:07', '2');
INSERT INTO `player_login` VALUES ('38', '3766534', '10', '2013-05-29 11:43:33', '0');
INSERT INTO `player_login` VALUES ('39', '3766534', '10', '2013-05-29 12:00:05', '2');
INSERT INTO `player_login` VALUES ('40', '3766534', '10', '2013-05-29 12:04:06', '0');
INSERT INTO `player_login` VALUES ('41', '68679430', '9', '2013-05-29 12:04:19', '0');
INSERT INTO `player_login` VALUES ('42', '3766534', '10', '2013-05-29 13:16:02', '2');
INSERT INTO `player_login` VALUES ('43', '3766534', '11', '2013-05-29 13:16:36', '0');
INSERT INTO `player_login` VALUES ('44', '3766534', '11', '2013-05-29 13:24:23', '2');
INSERT INTO `player_login` VALUES ('45', '68679430', '9', '2013-05-29 13:57:56', '2');
INSERT INTO `player_login` VALUES ('46', '11470854', '8', '2013-05-29 16:37:39', '0');
INSERT INTO `player_login` VALUES ('47', '11470854', '8', '2013-05-29 17:10:19', '2');
INSERT INTO `player_login` VALUES ('48', '68679430', '9', '2013-05-30 19:33:38', '0');
INSERT INTO `player_login` VALUES ('49', '121715654', '12', '2013-05-30 19:42:56', '0');
INSERT INTO `player_login` VALUES ('50', '121715654', '12', '2013-05-30 19:49:45', '2');
INSERT INTO `player_login` VALUES ('51', '121715654', '13', '2013-05-30 19:49:58', '0');
INSERT INTO `player_login` VALUES ('52', '11470854', '0', '2013-05-30 20:03:12', '2');
INSERT INTO `player_login` VALUES ('53', '11470854', '14', '2013-05-30 20:03:25', '0');
INSERT INTO `player_login` VALUES ('54', '121715654', '13', '2013-05-30 20:16:43', '2');
INSERT INTO `player_login` VALUES ('55', '121715654', '13', '2013-05-30 20:17:07', '0');
INSERT INTO `player_login` VALUES ('56', '121715654', '13', '2013-05-30 20:19:55', '2');
INSERT INTO `player_login` VALUES ('57', '68679430', '9', '2013-05-30 20:32:36', '2');
INSERT INTO `player_login` VALUES ('58', '68679430', '0', '2013-05-30 20:32:55', '2');
INSERT INTO `player_login` VALUES ('59', '68679430', '15', '2013-06-01 04:01:13', '0');
INSERT INTO `player_login` VALUES ('60', '68679430', '15', '2013-06-01 05:03:19', '2');
INSERT INTO `player_login` VALUES ('61', '68679430', '16', '2013-06-01 05:04:01', '0');
INSERT INTO `player_login` VALUES ('62', '68679430', '16', '2013-06-01 05:59:54', '2');
INSERT INTO `player_login` VALUES ('63', '68679430', '16', '2013-06-01 06:17:14', '0');
INSERT INTO `player_login` VALUES ('64', '68679430', '16', '2013-06-01 07:16:04', '2');
INSERT INTO `player_login` VALUES ('65', '68679430', '16', '2013-06-01 07:45:52', '0');
INSERT INTO `player_login` VALUES ('66', '68679430', '16', '2013-06-01 08:15:05', '2');
INSERT INTO `player_login` VALUES ('67', '119295750', '17', '2013-06-07 14:36:10', '0');
INSERT INTO `player_login` VALUES ('68', '68679430', '16', '2013-06-07 14:36:23', '0');
INSERT INTO `player_login` VALUES ('69', '119295750', '17', '2013-06-07 14:36:58', '2');
INSERT INTO `player_login` VALUES ('70', '119295750', '17', '2013-06-07 14:38:30', '0');
INSERT INTO `player_login` VALUES ('71', '68679430', '16', '2013-06-07 14:42:42', '2');
INSERT INTO `player_login` VALUES ('72', '68679430', '18', '2013-06-07 14:43:26', '0');
INSERT INTO `player_login` VALUES ('73', '68679430', '18', '2013-06-07 14:48:16', '2');
INSERT INTO `player_login` VALUES ('74', '68679430', '19', '2013-06-07 14:49:01', '0');
INSERT INTO `player_login` VALUES ('75', '68679430', '19', '2013-06-07 14:59:22', '2');
INSERT INTO `player_login` VALUES ('76', '11470854', '20', '2013-06-07 15:03:00', '0');
INSERT INTO `player_login` VALUES ('77', '68679430', '19', '2013-06-07 15:07:15', '0');
INSERT INTO `player_login` VALUES ('78', '119295750', '17', '2013-06-07 15:25:14', '2');
INSERT INTO `player_login` VALUES ('79', '119295750', '17', '2013-06-07 15:26:59', '0');
INSERT INTO `player_login` VALUES ('80', '119295750', '17', '2013-06-07 15:55:48', '2');
INSERT INTO `player_login` VALUES ('81', '119295750', '21', '2013-06-07 15:56:44', '0');
INSERT INTO `player_login` VALUES ('82', '11470854', '20', '2013-06-07 16:10:55', '2');
INSERT INTO `player_login` VALUES ('83', '68679430', '19', '2013-06-07 16:19:22', '2');
INSERT INTO `player_login` VALUES ('84', '119295750', '21', '2013-06-07 16:29:22', '2');
INSERT INTO `player_login` VALUES ('85', '119295750', '21', '2013-06-07 16:33:42', '0');
INSERT INTO `player_login` VALUES ('86', '68679430', '19', '2013-06-07 16:39:40', '0');
INSERT INTO `player_login` VALUES ('87', '68679430', '0', '2013-06-07 16:53:07', '2');
INSERT INTO `player_login` VALUES ('88', '68679430', '19', '2013-06-07 16:56:18', '0');
INSERT INTO `player_login` VALUES ('89', '68679430', '19', '2013-06-07 17:39:56', '2');
INSERT INTO `player_login` VALUES ('90', '68679430', '19', '2013-06-07 17:43:34', '0');
INSERT INTO `player_login` VALUES ('91', '68679430', '19', '2013-06-07 18:04:07', '0');
INSERT INTO `player_login` VALUES ('92', '119295750', '21', '2013-06-07 18:04:17', '0');
INSERT INTO `player_login` VALUES ('93', '68679430', '19', '2013-06-07 18:20:55', '2');
INSERT INTO `player_login` VALUES ('94', '119295750', '21', '2013-06-07 18:36:51', '2');
INSERT INTO `player_login` VALUES ('95', '68679430', '19', '2013-06-08 23:33:03', '0');
INSERT INTO `player_login` VALUES ('96', '68679430', '19', '2013-06-08 23:36:07', '2');
INSERT INTO `player_login` VALUES ('97', '68679430', '22', '2013-06-08 23:36:20', '0');
INSERT INTO `player_login` VALUES ('98', '68679430', '22', '2013-06-08 23:38:11', '2');
INSERT INTO `player_login` VALUES ('99', '3766534', '11', '2013-06-08 23:48:00', '0');
INSERT INTO `player_login` VALUES ('100', '3766534', '11', '2013-06-08 23:48:43', '2');
INSERT INTO `player_login` VALUES ('101', '3766534', '11', '2013-06-08 23:50:09', '0');
INSERT INTO `player_login` VALUES ('102', '3766534', '11', '2013-06-09 00:02:42', '2');
INSERT INTO `player_login` VALUES ('103', '68679430', '22', '2013-06-10 14:06:45', '0');
INSERT INTO `player_login` VALUES ('104', '68679430', '23', '2013-06-10 14:09:55', '0');
INSERT INTO `player_login` VALUES ('105', '119295750', '21', '2013-06-10 14:11:50', '0');
INSERT INTO `player_login` VALUES ('106', '68679430', '23', '2013-06-10 14:14:56', '2');
INSERT INTO `player_login` VALUES ('107', '68679430', '24', '2013-06-10 14:15:10', '0');
INSERT INTO `player_login` VALUES ('108', '119295750', '21', '2013-06-10 14:30:06', '2');
INSERT INTO `player_login` VALUES ('109', '119295750', '25', '2013-06-10 14:31:21', '0');
INSERT INTO `player_login` VALUES ('110', '119295750', '25', '2013-06-10 14:34:30', '2');
INSERT INTO `player_login` VALUES ('111', '68679430', '24', '2013-06-10 14:49:56', '2');
INSERT INTO `player_login` VALUES ('112', '68679430', '26', '2013-06-10 14:50:19', '0');
INSERT INTO `player_login` VALUES ('113', '68679430', '26', '2013-06-10 14:56:03', '2');
INSERT INTO `player_login` VALUES ('114', '68679430', '27', '2013-06-10 14:56:47', '0');
INSERT INTO `player_login` VALUES ('115', '68679430', '27', '2013-06-10 15:06:08', '2');
INSERT INTO `player_login` VALUES ('116', '68679430', '28', '2013-06-10 15:06:26', '0');
INSERT INTO `player_login` VALUES ('117', '68679430', '28', '2013-06-10 15:13:25', '2');
INSERT INTO `player_login` VALUES ('118', '68679430', '29', '2013-06-10 15:13:44', '0');
INSERT INTO `player_login` VALUES ('119', '68679430', '30', '2013-06-10 15:25:11', '0');
INSERT INTO `player_login` VALUES ('120', '68679430', '30', '2013-06-10 15:35:26', '2');
INSERT INTO `player_login` VALUES ('121', '68679430', '31', '2013-06-10 15:35:43', '0');
INSERT INTO `player_login` VALUES ('122', '68679430', '31', '2013-06-10 15:52:22', '2');
INSERT INTO `player_login` VALUES ('123', '68679430', '32', '2013-06-10 15:52:37', '0');
INSERT INTO `player_login` VALUES ('124', '68679430', '32', '2013-06-10 15:56:14', '2');
INSERT INTO `player_login` VALUES ('125', '68679430', '32', '2013-06-10 16:25:50', '0');
INSERT INTO `player_login` VALUES ('126', '68679430', '32', '2013-06-10 16:34:03', '2');
INSERT INTO `player_login` VALUES ('127', '68679430', '33', '2013-06-10 16:34:19', '0');
INSERT INTO `player_login` VALUES ('128', '68679430', '33', '2013-06-10 16:35:17', '2');
INSERT INTO `player_login` VALUES ('129', '68679430', '33', '2013-06-10 16:38:12', '0');
INSERT INTO `player_login` VALUES ('130', '68679430', '33', '2013-06-10 17:15:26', '2');
INSERT INTO `player_login` VALUES ('131', '119295750', '25', '2013-06-10 17:20:54', '0');
INSERT INTO `player_login` VALUES ('132', '68679430', '34', '2013-06-10 17:49:44', '0');
INSERT INTO `player_login` VALUES ('133', '119295750', '25', '2013-06-10 17:52:06', '0');
INSERT INTO `player_login` VALUES ('134', '68679430', '34', '2013-06-10 17:54:14', '2');
INSERT INTO `player_login` VALUES ('135', '119295750', '0', '2013-06-10 18:04:31', '2');
INSERT INTO `player_login` VALUES ('136', '119295750', '25', '2013-06-10 18:05:34', '0');
INSERT INTO `player_login` VALUES ('137', '119295750', '25', '2013-06-10 18:22:28', '2');
INSERT INTO `player_login` VALUES ('138', '119295750', '35', '2013-06-10 18:22:43', '0');
INSERT INTO `player_login` VALUES ('139', '119295750', '35', '2013-06-10 19:12:27', '2');
INSERT INTO `player_login` VALUES ('140', '3766534', '11', '2013-06-11 02:01:43', '0');
INSERT INTO `player_login` VALUES ('141', '3766534', '11', '2013-06-11 02:02:40', '2');
INSERT INTO `player_login` VALUES ('142', '20265542', '36', '2013-06-11 02:43:43', '0');
INSERT INTO `player_login` VALUES ('143', '58593478', '37', '2013-06-11 02:52:20', '0');
INSERT INTO `player_login` VALUES ('144', '48228422', '38', '2013-06-11 02:54:31', '0');
INSERT INTO `player_login` VALUES ('145', '58593478', '37', '2013-06-11 02:54:44', '2');
INSERT INTO `player_login` VALUES ('146', '58593478', '37', '2013-06-11 02:54:52', '0');
INSERT INTO `player_login` VALUES ('147', '130203462', '39', '2013-06-11 02:56:19', '0');
INSERT INTO `player_login` VALUES ('148', '130203462', '39', '2013-06-11 02:57:30', '2');
INSERT INTO `player_login` VALUES ('149', '48228422', '38', '2013-06-11 03:01:18', '2');
INSERT INTO `player_login` VALUES ('150', '48228422', '40', '2013-06-11 03:01:32', '0');
INSERT INTO `player_login` VALUES ('151', '16595462', '41', '2013-06-11 03:04:04', '0');
INSERT INTO `player_login` VALUES ('152', '95682630', '42', '2013-06-11 03:05:08', '0');
INSERT INTO `player_login` VALUES ('153', '95682630', '42', '2013-06-11 03:05:29', '2');
INSERT INTO `player_login` VALUES ('154', '124059398', '43', '2013-06-11 03:11:06', '0');
INSERT INTO `player_login` VALUES ('155', '49213446', '44', '2013-06-11 03:11:08', '0');
INSERT INTO `player_login` VALUES ('156', '49213446', '44', '2013-06-11 03:11:55', '2');
INSERT INTO `player_login` VALUES ('157', '16595462', '41', '2013-06-11 03:14:45', '2');
INSERT INTO `player_login` VALUES ('158', '42461446', '45', '2013-06-11 03:20:43', '0');
INSERT INTO `player_login` VALUES ('159', '42461446', '45', '2013-06-11 03:23:17', '2');
INSERT INTO `player_login` VALUES ('160', '58593478', '37', '2013-06-11 03:40:24', '2');
INSERT INTO `player_login` VALUES ('161', '58593478', '46', '2013-06-11 03:40:41', '0');
INSERT INTO `player_login` VALUES ('162', '48228422', '40', '2013-06-11 03:42:40', '2');
INSERT INTO `player_login` VALUES ('163', '20265542', '36', '2013-06-11 03:42:51', '2');
INSERT INTO `player_login` VALUES ('164', '48228422', '47', '2013-06-11 03:42:53', '0');
INSERT INTO `player_login` VALUES ('165', '20265542', '48', '2013-06-11 03:43:07', '0');
INSERT INTO `player_login` VALUES ('166', '2855366', '49', '2013-06-11 03:43:48', '0');
INSERT INTO `player_login` VALUES ('167', '48228422', '47', '2013-06-11 03:45:18', '2');
INSERT INTO `player_login` VALUES ('168', '48228422', '50', '2013-06-11 03:45:32', '0');
INSERT INTO `player_login` VALUES ('169', '48228422', '50', '2013-06-11 03:47:46', '2');
INSERT INTO `player_login` VALUES ('170', '48228422', '51', '2013-06-11 03:47:56', '0');
INSERT INTO `player_login` VALUES ('171', '122107782', '52', '2013-06-11 03:54:54', '0');
INSERT INTO `player_login` VALUES ('172', '122107782', '52', '2013-06-11 03:55:08', '2');
INSERT INTO `player_login` VALUES ('173', '3766534', '11', '2013-06-11 03:57:15', '0');
INSERT INTO `player_login` VALUES ('174', '3766534', '11', '2013-06-11 04:03:11', '2');
INSERT INTO `player_login` VALUES ('175', '68679430', '34', '2013-06-11 04:03:30', '0');
INSERT INTO `player_login` VALUES ('176', '3766534', '11', '2013-06-11 04:05:38', '0');
INSERT INTO `player_login` VALUES ('177', '3766534', '11', '2013-06-11 04:13:29', '2');
INSERT INTO `player_login` VALUES ('178', '68679430', '34', '2013-06-11 04:17:55', '2');
INSERT INTO `player_login` VALUES ('179', '70182790', '53', '2013-06-11 04:19:45', '0');
INSERT INTO `player_login` VALUES ('180', '68679430', '34', '2013-06-11 04:20:32', '0');
INSERT INTO `player_login` VALUES ('181', '70182790', '53', '2013-06-11 04:25:35', '2');
INSERT INTO `player_login` VALUES ('182', '70182790', '54', '2013-06-11 04:26:13', '0');
INSERT INTO `player_login` VALUES ('183', '17225862', '55', '2013-06-11 04:29:44', '0');
INSERT INTO `player_login` VALUES ('184', '17225862', '55', '2013-06-11 04:30:17', '2');
INSERT INTO `player_login` VALUES ('185', '70182790', '54', '2013-06-11 04:36:41', '2');
INSERT INTO `player_login` VALUES ('186', '70182790', '56', '2013-06-11 04:37:01', '0');
INSERT INTO `player_login` VALUES ('187', '58593478', '46', '2013-06-11 04:37:02', '2');
INSERT INTO `player_login` VALUES ('188', '58593478', '57', '2013-06-11 04:37:26', '0');
INSERT INTO `player_login` VALUES ('189', '2855366', '49', '2013-06-11 04:39:30', '2');
INSERT INTO `player_login` VALUES ('190', '2855366', '58', '2013-06-11 04:40:00', '0');
INSERT INTO `player_login` VALUES ('191', '58593478', '57', '2013-06-11 04:41:00', '2');
INSERT INTO `player_login` VALUES ('192', '48228422', '51', '2013-06-11 04:42:05', '2');
INSERT INTO `player_login` VALUES ('193', '17225862', '55', '2013-06-11 04:49:56', '0');
INSERT INTO `player_login` VALUES ('194', '17225862', '55', '2013-06-11 04:50:13', '2');
INSERT INTO `player_login` VALUES ('195', '70182790', '56', '2013-06-11 04:51:46', '2');
INSERT INTO `player_login` VALUES ('196', '68679430', '34', '2013-06-11 05:00:03', '2');
INSERT INTO `player_login` VALUES ('197', '9517446', '59', '2013-06-11 05:02:37', '0');
INSERT INTO `player_login` VALUES ('198', '125130502', '60', '2013-06-11 05:03:35', '0');
INSERT INTO `player_login` VALUES ('199', '20265542', '48', '2013-06-11 05:07:14', '2');
INSERT INTO `player_login` VALUES ('200', '20265542', '48', '2013-06-11 05:07:43', '0');
INSERT INTO `player_login` VALUES ('201', '20265542', '48', '2013-06-11 05:08:12', '2');
INSERT INTO `player_login` VALUES ('202', '9517446', '59', '2013-06-11 05:08:58', '2');
INSERT INTO `player_login` VALUES ('203', '9517446', '59', '2013-06-11 05:09:36', '0');
INSERT INTO `player_login` VALUES ('204', '9517446', '61', '2013-06-11 05:13:19', '0');
INSERT INTO `player_login` VALUES ('205', '9517446', '62', '2013-06-11 05:15:24', '0');
INSERT INTO `player_login` VALUES ('206', '9517446', '63', '2013-06-11 05:28:45', '0');
INSERT INTO `player_login` VALUES ('207', '9517446', '64', '2013-06-11 05:44:12', '0');
INSERT INTO `player_login` VALUES ('208', '125130502', '60', '2013-06-11 05:46:27', '2');
INSERT INTO `player_login` VALUES ('209', '125130502', '65', '2013-06-11 05:46:45', '0');
INSERT INTO `player_login` VALUES ('210', '9517446', '66', '2013-06-11 05:47:15', '0');
INSERT INTO `player_login` VALUES ('211', '125130502', '65', '2013-06-11 05:49:35', '2');
INSERT INTO `player_login` VALUES ('212', '125130502', '67', '2013-06-11 05:49:49', '0');
INSERT INTO `player_login` VALUES ('213', '125130502', '67', '2013-06-11 05:50:05', '2');
INSERT INTO `player_login` VALUES ('214', '9517446', '66', '2013-06-11 06:00:04', '2');
INSERT INTO `player_login` VALUES ('215', '30921542', '68', '2013-06-11 09:02:39', '0');
INSERT INTO `player_login` VALUES ('216', '30921542', '68', '2013-06-11 09:02:45', '2');
INSERT INTO `player_login` VALUES ('217', '3766534', '11', '2013-06-11 09:05:07', '0');
INSERT INTO `player_login` VALUES ('218', '70182790', '56', '2013-06-11 09:18:51', '0');
INSERT INTO `player_login` VALUES ('219', '63515398', '69', '2013-06-11 09:32:22', '0');
INSERT INTO `player_login` VALUES ('220', '29850246', '70', '2013-06-11 09:41:57', '0');
INSERT INTO `player_login` VALUES ('221', '70182790', '56', '2013-06-11 09:50:13', '2');
INSERT INTO `player_login` VALUES ('222', '70182790', '71', '2013-06-11 09:50:35', '0');
INSERT INTO `player_login` VALUES ('223', '29850246', '70', '2013-06-11 09:51:34', '2');
INSERT INTO `player_login` VALUES ('224', '29850246', '72', '2013-06-11 09:51:45', '0');
INSERT INTO `player_login` VALUES ('225', '70182790', '71', '2013-06-11 09:52:14', '2');
INSERT INTO `player_login` VALUES ('226', '70182790', '73', '2013-06-11 09:52:30', '0');
INSERT INTO `player_login` VALUES ('227', '29850246', '74', '2013-06-11 09:53:28', '0');
INSERT INTO `player_login` VALUES ('228', '29850246', '75', '2013-06-11 09:54:55', '0');
INSERT INTO `player_login` VALUES ('229', '29850246', '76', '2013-06-11 09:56:33', '0');
INSERT INTO `player_login` VALUES ('230', '29850246', '77', '2013-06-11 09:57:21', '0');
INSERT INTO `player_login` VALUES ('231', '29850246', '78', '2013-06-11 09:59:28', '0');
INSERT INTO `player_login` VALUES ('232', '29850246', '79', '2013-06-11 10:00:12', '0');
INSERT INTO `player_login` VALUES ('233', '29850246', '80', '2013-06-11 10:02:00', '0');
INSERT INTO `player_login` VALUES ('234', '29850246', '81', '2013-06-11 10:02:42', '0');
INSERT INTO `player_login` VALUES ('235', '29850246', '82', '2013-06-11 10:04:57', '0');
INSERT INTO `player_login` VALUES ('236', '130431942', '83', '2013-06-11 10:06:28', '0');
INSERT INTO `player_login` VALUES ('237', '130431942', '83', '2013-06-11 10:11:16', '2');
INSERT INTO `player_login` VALUES ('238', '130431942', '84', '2013-06-11 10:11:31', '0');
INSERT INTO `player_login` VALUES ('239', '130431942', '84', '2013-06-11 10:14:33', '2');
INSERT INTO `player_login` VALUES ('240', '130431942', '85', '2013-06-11 10:14:45', '0');
INSERT INTO `player_login` VALUES ('241', '130431942', '85', '2013-06-11 10:17:27', '2');
INSERT INTO `player_login` VALUES ('242', '130431942', '86', '2013-06-11 10:17:37', '0');
INSERT INTO `player_login` VALUES ('243', '70182790', '73', '2013-06-11 10:19:14', '2');
INSERT INTO `player_login` VALUES ('244', '70182790', '87', '2013-06-11 10:19:30', '0');
INSERT INTO `player_login` VALUES ('245', '130431942', '86', '2013-06-11 10:19:58', '2');
INSERT INTO `player_login` VALUES ('246', '63515398', '69', '2013-06-11 10:20:10', '2');
INSERT INTO `player_login` VALUES ('247', '130431942', '88', '2013-06-11 10:20:10', '0');
INSERT INTO `player_login` VALUES ('248', '63515398', '89', '2013-06-11 10:20:21', '0');
INSERT INTO `player_login` VALUES ('249', '63515398', '89', '2013-06-11 10:21:05', '2');
INSERT INTO `player_login` VALUES ('250', '63515398', '90', '2013-06-11 10:21:15', '0');
INSERT INTO `player_login` VALUES ('251', '78875014', '91', '2013-06-11 10:24:02', '0');
INSERT INTO `player_login` VALUES ('252', '130431942', '88', '2013-06-11 10:24:13', '2');
INSERT INTO `player_login` VALUES ('253', '130431942', '92', '2013-06-11 10:24:25', '0');
INSERT INTO `player_login` VALUES ('254', '130431942', '92', '2013-06-11 10:26:25', '2');
INSERT INTO `player_login` VALUES ('255', '130431942', '93', '2013-06-11 10:26:40', '0');
INSERT INTO `player_login` VALUES ('256', '62227526', '94', '2013-06-11 10:29:18', '0');
INSERT INTO `player_login` VALUES ('257', '70182790', '87', '2013-06-11 10:29:20', '2');
INSERT INTO `player_login` VALUES ('258', '70182790', '95', '2013-06-11 10:29:37', '0');
INSERT INTO `player_login` VALUES ('259', '130431942', '93', '2013-06-11 10:33:37', '2');
INSERT INTO `player_login` VALUES ('260', '130431942', '96', '2013-06-11 10:34:01', '0');
INSERT INTO `player_login` VALUES ('261', '29850246', '82', '2013-06-11 10:34:18', '2');
INSERT INTO `player_login` VALUES ('262', '63515398', '90', '2013-06-11 10:37:56', '2');
INSERT INTO `player_login` VALUES ('263', '70182790', '95', '2013-06-11 10:38:59', '2');
INSERT INTO `player_login` VALUES ('264', '62227526', '94', '2013-06-11 10:39:03', '2');
INSERT INTO `player_login` VALUES ('265', '130431942', '96', '2013-06-11 10:46:06', '2');
INSERT INTO `player_login` VALUES ('266', '130431942', '97', '2013-06-11 10:48:29', '0');
INSERT INTO `player_login` VALUES ('267', '130431942', '97', '2013-06-11 10:52:21', '2');
INSERT INTO `player_login` VALUES ('268', '28199494', '98', '2013-06-11 11:14:39', '0');
INSERT INTO `player_login` VALUES ('269', '106865350', '99', '2013-06-11 11:23:44', '0');
INSERT INTO `player_login` VALUES ('270', '106865350', '99', '2013-06-11 11:26:17', '2');
INSERT INTO `player_login` VALUES ('271', '106865350', '99', '2013-06-11 11:26:30', '0');
INSERT INTO `player_login` VALUES ('272', '106865350', '99', '2013-06-11 11:26:37', '2');
INSERT INTO `player_login` VALUES ('273', '28199494', '98', '2013-06-11 11:37:11', '2');
INSERT INTO `player_login` VALUES ('274', '59872582', '0', '2013-06-11 11:43:09', '2');
INSERT INTO `player_login` VALUES ('275', '78875014', '91', '2013-06-11 11:56:33', '2');
INSERT INTO `player_login` VALUES ('276', '3766534', '11', '2013-06-11 11:59:25', '2');
INSERT INTO `player_login` VALUES ('277', '110383494', '101', '2013-06-11 12:06:18', '0');
INSERT INTO `player_login` VALUES ('278', '110383494', '101', '2013-06-11 12:11:00', '2');
INSERT INTO `player_login` VALUES ('279', '30629958', '102', '2013-06-11 12:14:42', '0');
INSERT INTO `player_login` VALUES ('280', '116036742', '103', '2013-06-11 12:14:43', '0');
INSERT INTO `player_login` VALUES ('281', '73731078', '104', '2013-06-11 12:15:59', '0');
INSERT INTO `player_login` VALUES ('282', '103941830', '105', '2013-06-11 12:16:18', '0');
INSERT INTO `player_login` VALUES ('283', '116036742', '103', '2013-06-11 12:16:50', '2');
INSERT INTO `player_login` VALUES ('284', '60813830', '106', '2013-06-11 12:16:51', '0');
INSERT INTO `player_login` VALUES ('285', '116036742', '103', '2013-06-11 12:17:52', '0');
INSERT INTO `player_login` VALUES ('286', '116036742', '103', '2013-06-11 12:17:56', '2');
INSERT INTO `player_login` VALUES ('287', '3766534', '11', '2013-06-11 12:19:12', '0');
INSERT INTO `player_login` VALUES ('288', '73731078', '104', '2013-06-11 12:20:23', '2');
INSERT INTO `player_login` VALUES ('289', '73731078', '107', '2013-06-11 12:20:35', '0');
INSERT INTO `player_login` VALUES ('290', '73731078', '107', '2013-06-11 12:24:52', '2');
INSERT INTO `player_login` VALUES ('291', '73731078', '108', '2013-06-11 12:25:06', '0');
INSERT INTO `player_login` VALUES ('292', '384962AX', '109', '2013-06-11 12:26:17', '0');
INSERT INTO `player_login` VALUES ('293', '130594950', '110', '2013-06-11 12:28:14', '0');
INSERT INTO `player_login` VALUES ('294', '78875014', '91', '2013-06-11 12:30:11', '0');
INSERT INTO `player_login` VALUES ('295', '77543814', '111', '2013-06-11 12:30:55', '0');
INSERT INTO `player_login` VALUES ('296', '71661254', '112', '2013-06-11 12:30:56', '0');
INSERT INTO `player_login` VALUES ('297', '21558662', '113', '2013-06-11 12:33:20', '0');
INSERT INTO `player_login` VALUES ('298', '24827846', '114', '2013-06-11 12:33:20', '0');
INSERT INTO `player_login` VALUES ('299', '73731078', '108', '2013-06-11 12:33:31', '2');
INSERT INTO `player_login` VALUES ('300', '38292998', '115', '2013-06-11 12:33:38', '0');
INSERT INTO `player_login` VALUES ('301', '125509382', '116', '2013-06-11 12:34:25', '0');
INSERT INTO `player_login` VALUES ('302', '119295750', '35', '2013-06-11 12:35:17', '0');
INSERT INTO `player_login` VALUES ('303', '30629958', '102', '2013-06-11 12:35:46', '2');
INSERT INTO `player_login` VALUES ('304', '120906054', '117', '2013-06-11 12:36:46', '0');
INSERT INTO `player_login` VALUES ('305', '30629958', '102', '2013-06-11 12:36:56', '0');
INSERT INTO `player_login` VALUES ('306', '45256902', '118', '2013-06-11 12:37:03', '0');
INSERT INTO `player_login` VALUES ('307', '103941830', '105', '2013-06-11 12:37:21', '2');
INSERT INTO `player_login` VALUES ('308', '24827846', '114', '2013-06-11 12:38:02', '2');
INSERT INTO `player_login` VALUES ('309', '2330886', '119', '2013-06-11 12:38:10', '0');
INSERT INTO `player_login` VALUES ('310', '24827846', '120', '2013-06-11 12:38:15', '0');
INSERT INTO `player_login` VALUES ('311', '34180358', '121', '2013-06-11 12:38:48', '0');
INSERT INTO `player_login` VALUES ('312', '129335110', '122', '2013-06-11 12:40:08', '0');
INSERT INTO `player_login` VALUES ('313', '34180358', '121', '2013-06-11 12:41:11', '2');
INSERT INTO `player_login` VALUES ('314', '24826118', '123', '2013-06-11 12:41:11', '0');
INSERT INTO `player_login` VALUES ('315', '34180358', '124', '2013-06-11 12:41:29', '0');
INSERT INTO `player_login` VALUES ('316', '42248390', '125', '2013-06-11 12:42:47', '0');
INSERT INTO `player_login` VALUES ('317', '42248390', '125', '2013-06-11 12:42:56', '2');
INSERT INTO `player_login` VALUES ('318', '27224710', '126', '2013-06-11 12:43:06', '0');
INSERT INTO `player_login` VALUES ('319', '129335110', '122', '2013-06-11 12:43:07', '2');
INSERT INTO `player_login` VALUES ('320', '42248390', '125', '2013-06-11 12:43:10', '0');
INSERT INTO `player_login` VALUES ('321', '88417990', '127', '2013-06-11 12:43:28', '0');
INSERT INTO `player_login` VALUES ('322', '78875014', '91', '2013-06-11 12:44:34', '0');
INSERT INTO `player_login` VALUES ('323', '125509382', '116', '2013-06-11 12:44:41', '2');
INSERT INTO `player_login` VALUES ('324', '24826118', '123', '2013-06-11 12:44:53', '2');
INSERT INTO `player_login` VALUES ('325', '125509382', '128', '2013-06-11 12:45:00', '0');
INSERT INTO `player_login` VALUES ('326', '119295750', '35', '2013-06-11 12:45:01', '2');
INSERT INTO `player_login` VALUES ('327', '24826118', '129', '2013-06-11 12:45:08', '0');
INSERT INTO `player_login` VALUES ('328', '27224710', '126', '2013-06-11 12:45:08', '2');
INSERT INTO `player_login` VALUES ('329', '119295750', '130', '2013-06-11 12:45:24', '0');
INSERT INTO `player_login` VALUES ('330', '42248390', '131', '2013-06-11 12:45:25', '0');
INSERT INTO `player_login` VALUES ('331', '24153798', '132', '2013-06-11 12:45:40', '0');
INSERT INTO `player_login` VALUES ('332', '27224710', '133', '2013-06-11 12:45:46', '0');
INSERT INTO `player_login` VALUES ('333', '27224710', '133', '2013-06-11 12:46:09', '2');
INSERT INTO `player_login` VALUES ('334', '119295750', '130', '2013-06-11 12:53:10', '0');
INSERT INTO `player_login` VALUES ('335', '49919238', '136', '2013-06-11 12:53:10', '0');
INSERT INTO `player_login` VALUES ('336', '21558662', '113', '2013-06-11 12:53:12', '0');
INSERT INTO `player_login` VALUES ('337', '10000518', '135', '2013-06-11 12:53:12', '0');
INSERT INTO `player_login` VALUES ('338', '125509382', '128', '2013-06-11 12:53:14', '0');
INSERT INTO `player_login` VALUES ('339', '78875014', '91', '2013-06-11 12:53:19', '0');
INSERT INTO `player_login` VALUES ('340', '88417990', '134', '2013-06-11 12:53:34', '0');
INSERT INTO `player_login` VALUES ('341', '3766534', '11', '2013-06-11 12:53:51', '0');
INSERT INTO `player_login` VALUES ('342', '120906054', '117', '2013-06-11 12:54:10', '0');
INSERT INTO `player_login` VALUES ('343', '89105350', '137', '2013-06-11 12:55:19', '0');
INSERT INTO `player_login` VALUES ('344', '81792070', '0', '2013-06-11 12:55:57', '2');
INSERT INTO `player_login` VALUES ('345', '71661254', '112', '2013-06-11 12:56:07', '0');
INSERT INTO `player_login` VALUES ('346', '811841', '138', '2013-06-11 12:56:22', '0');
INSERT INTO `player_login` VALUES ('347', '42248390', '131', '2013-06-11 12:57:44', '0');
INSERT INTO `player_login` VALUES ('348', '120906054', '139', '2013-06-11 12:59:38', '0');
INSERT INTO `player_login` VALUES ('349', '49919238', '136', '2013-06-11 12:59:50', '2');
INSERT INTO `player_login` VALUES ('350', '49919238', '140', '2013-06-11 13:00:05', '0');
INSERT INTO `player_login` VALUES ('351', '125509382', '128', '2013-06-11 13:00:55', '2');
INSERT INTO `player_login` VALUES ('352', '89105350', '137', '2013-06-11 13:01:03', '2');
INSERT INTO `player_login` VALUES ('353', '125509382', '141', '2013-06-11 13:01:15', '0');
INSERT INTO `player_login` VALUES ('354', '71661254', '112', '2013-06-11 13:01:52', '2');
INSERT INTO `player_login` VALUES ('355', '56271494', '142', '2013-06-11 13:01:55', '0');
INSERT INTO `player_login` VALUES ('356', '71661254', '143', '2013-06-11 13:02:07', '0');
INSERT INTO `player_login` VALUES ('357', '78875014', '144', '2013-06-11 13:02:28', '0');
INSERT INTO `player_login` VALUES ('358', '101050310', '145', '2013-06-11 13:02:43', '0');
INSERT INTO `player_login` VALUES ('359', '101050310', '145', '2013-06-11 13:02:50', '2');
INSERT INTO `player_login` VALUES ('360', '10008774', '146', '2013-06-11 13:06:10', '0');
INSERT INTO `player_login` VALUES ('361', '42248390', '131', '2013-06-11 13:06:22', '2');
INSERT INTO `player_login` VALUES ('362', '42248390', '147', '2013-06-11 13:06:35', '0');
INSERT INTO `player_login` VALUES ('363', '109113734', '148', '2013-06-11 13:08:51', '0');
INSERT INTO `player_login` VALUES ('364', '37924166', '150', '2013-06-11 13:08:53', '0');
INSERT INTO `player_login` VALUES ('365', '37933318', '149', '2013-06-11 13:08:56', '0');
INSERT INTO `player_login` VALUES ('366', '80158086', '151', '2013-06-11 13:09:47', '0');
INSERT INTO `player_login` VALUES ('367', '111515718', '152', '2013-06-11 13:09:53', '0');
INSERT INTO `player_login` VALUES ('368', '5661894', '153', '2013-06-11 13:10:41', '0');
INSERT INTO `player_login` VALUES ('369', '16230278', '155', '2013-06-11 13:11:08', '0');
INSERT INTO `player_login` VALUES ('370', '5661830', '156', '2013-06-11 13:11:22', '0');
INSERT INTO `player_login` VALUES ('371', '80158086', '151', '2013-06-11 13:11:25', '2');
INSERT INTO `player_login` VALUES ('372', '120906054', '139', '2013-06-11 13:13:31', '2');
INSERT INTO `player_login` VALUES ('373', '120906054', '157', '2013-06-11 13:13:52', '0');
INSERT INTO `player_login` VALUES ('374', '14444358', '158', '2013-06-11 13:14:42', '0');
INSERT INTO `player_login` VALUES ('375', '42248390', '159', '2013-06-11 13:15:11', '0');
INSERT INTO `player_login` VALUES ('376', '125749254', '160', '2013-06-11 13:15:17', '0');
INSERT INTO `player_login` VALUES ('377', '97721670', '161', '2013-06-11 13:15:57', '0');
INSERT INTO `player_login` VALUES ('378', '56271494', '142', '2013-06-11 13:15:58', '2');
INSERT INTO `player_login` VALUES ('379', '56271494', '162', '2013-06-11 13:16:16', '0');
INSERT INTO `player_login` VALUES ('380', '10000518', '135', '2013-06-11 13:16:25', '2');
INSERT INTO `player_login` VALUES ('381', '5661894', '153', '2013-06-11 13:16:29', '2');
INSERT INTO `player_login` VALUES ('382', '5661894', '163', '2013-06-11 13:16:49', '0');
INSERT INTO `player_login` VALUES ('383', '111515718', '152', '2013-06-11 13:16:58', '2');
INSERT INTO `player_login` VALUES ('384', '111515718', '164', '2013-06-11 13:17:15', '0');
INSERT INTO `player_login` VALUES ('385', '49018502', '165', '2013-06-11 13:17:53', '0');
INSERT INTO `player_login` VALUES ('386', '37924166', '166', '2013-06-11 13:18:13', '0');
INSERT INTO `player_login` VALUES ('387', '14444358', '158', '2013-06-11 13:18:17', '2');
INSERT INTO `player_login` VALUES ('388', '14444358', '167', '2013-06-11 13:18:31', '0');
INSERT INTO `player_login` VALUES ('389', '37933318', '149', '2013-06-11 13:18:46', '2');
INSERT INTO `player_login` VALUES ('390', '37933318', '149', '2013-06-11 13:19:05', '0');
INSERT INTO `player_login` VALUES ('391', '49919238', '140', '2013-06-11 13:19:20', '2');
INSERT INTO `player_login` VALUES ('392', '49919238', '168', '2013-06-11 13:19:37', '0');
INSERT INTO `player_login` VALUES ('393', '81792070', '154', '2013-06-11 13:20:11', '0');
INSERT INTO `player_login` VALUES ('394', '16230278', '155', '2013-06-11 13:20:21', '2');
INSERT INTO `player_login` VALUES ('395', '16230278', '169', '2013-06-11 13:20:40', '0');
INSERT INTO `player_login` VALUES ('396', '49018502', '165', '2013-06-11 13:21:55', '2');
INSERT INTO `player_login` VALUES ('397', '81792070', '154', '2013-06-11 13:22:19', '2');
INSERT INTO `player_login` VALUES ('398', '81792070', '170', '2013-06-11 13:22:41', '0');
INSERT INTO `player_login` VALUES ('399', '3766534', '11', '2013-06-11 13:22:47', '2');
INSERT INTO `player_login` VALUES ('400', '123905AX', '171', '2013-06-11 13:22:53', '0');
INSERT INTO `player_login` VALUES ('401', '111217222', '172', '2013-06-11 13:23:30', '0');
INSERT INTO `player_login` VALUES ('402', '78875014', '144', '2013-06-11 13:23:30', '2');
INSERT INTO `player_login` VALUES ('403', '78875014', '173', '2013-06-11 13:23:48', '0');
INSERT INTO `player_login` VALUES ('404', '81792070', '174', '2013-06-11 13:24:00', '0');
INSERT INTO `player_login` VALUES ('405', '14444358', '167', '2013-06-11 13:24:08', '2');
INSERT INTO `player_login` VALUES ('406', '37933318', '149', '2013-06-11 13:24:21', '2');
INSERT INTO `player_login` VALUES ('407', '10000518', '135', '2013-06-11 13:24:32', '0');
INSERT INTO `player_login` VALUES ('408', '37924166', '166', '2013-06-11 13:24:34', '2');
INSERT INTO `player_login` VALUES ('409', '37933318', '175', '2013-06-11 13:24:42', '0');
INSERT INTO `player_login` VALUES ('410', '37924166', '166', '2013-06-11 13:24:48', '0');
INSERT INTO `player_login` VALUES ('411', '130145542', '176', '2013-06-11 13:24:50', '0');
INSERT INTO `player_login` VALUES ('412', '3766534', '11', '2013-06-11 13:25:09', '0');
INSERT INTO `player_login` VALUES ('413', '78875014', '173', '2013-06-11 13:25:19', '2');
INSERT INTO `player_login` VALUES ('414', '109113734', '148', '2013-06-11 13:26:24', '2');
INSERT INTO `player_login` VALUES ('415', '56271494', '162', '2013-06-11 13:27:19', '2');
INSERT INTO `player_login` VALUES ('416', '111515718', '164', '2013-06-11 13:27:29', '2');
INSERT INTO `player_login` VALUES ('417', '130636742', '178', '2013-06-11 13:27:49', '0');
INSERT INTO `player_login` VALUES ('418', '37933318', '175', '2013-06-11 13:28:03', '2');
INSERT INTO `player_login` VALUES ('419', '5661830', '156', '2013-06-11 13:28:05', '2');
INSERT INTO `player_login` VALUES ('420', '109552646', '0', '2013-06-11 13:28:08', '2');
INSERT INTO `player_login` VALUES ('421', '37933318', '179', '2013-06-11 13:28:28', '0');
INSERT INTO `player_login` VALUES ('422', '123905AX', '171', '2013-06-11 13:29:16', '2');
INSERT INTO `player_login` VALUES ('423', '8739716', '181', '2013-06-11 13:29:40', '0');
INSERT INTO `player_login` VALUES ('424', '130793926', '180', '2013-06-11 13:29:41', '0');
INSERT INTO `player_login` VALUES ('425', '109113734', '177', '2013-06-11 13:29:51', '0');
INSERT INTO `player_login` VALUES ('426', '5661830', '156', '2013-06-11 13:30:27', '0');
INSERT INTO `player_login` VALUES ('427', '37924166', '166', '2013-06-11 13:31:14', '2');
INSERT INTO `player_login` VALUES ('428', '37924166', '182', '2013-06-11 13:31:33', '0');
INSERT INTO `player_login` VALUES ('429', '10000518', '135', '2013-06-11 13:31:47', '2');
INSERT INTO `player_login` VALUES ('430', '123905AX', '171', '2013-06-11 13:31:58', '0');
INSERT INTO `player_login` VALUES ('431', '16230278', '169', '2013-06-11 13:32:10', '2');
INSERT INTO `player_login` VALUES ('432', '21558662', '113', '2013-06-11 13:32:11', '2');
INSERT INTO `player_login` VALUES ('433', '21558662', '113', '2013-06-11 13:33:07', '0');
INSERT INTO `player_login` VALUES ('434', '109113734', '177', '2013-06-11 13:33:36', '2');
INSERT INTO `player_login` VALUES ('435', '9476996', '183', '2013-06-11 13:33:54', '0');
INSERT INTO `player_login` VALUES ('436', '109113734', '184', '2013-06-11 13:33:57', '0');
INSERT INTO `player_login` VALUES ('437', '16230278', '169', '2013-06-11 13:36:21', '0');
INSERT INTO `player_login` VALUES ('438', '81792070', '174', '2013-06-11 13:36:34', '2');
INSERT INTO `player_login` VALUES ('439', '55805702', '185', '2013-06-11 13:37:07', '0');
INSERT INTO `player_login` VALUES ('440', '12547398', '186', '2013-06-11 13:38:26', '0');
INSERT INTO `player_login` VALUES ('441', '75013702', '187', '2013-06-11 13:38:32', '0');
INSERT INTO `player_login` VALUES ('442', '120906054', '157', '2013-06-11 13:38:43', '2');
INSERT INTO `player_login` VALUES ('443', '120906054', '157', '2013-06-11 13:39:10', '0');
INSERT INTO `player_login` VALUES ('444', '78875014', '173', '2013-06-11 13:40:02', '0');
INSERT INTO `player_login` VALUES ('445', '55805702', '185', '2013-06-11 13:41:14', '2');
INSERT INTO `player_login` VALUES ('446', '130636742', '178', '2013-06-11 13:43:06', '2');
INSERT INTO `player_login` VALUES ('447', '119295750', '130', '2013-06-11 13:43:29', '2');
INSERT INTO `player_login` VALUES ('448', '130636742', '188', '2013-06-11 13:43:33', '0');
INSERT INTO `player_login` VALUES ('449', '123905AX', '171', '2013-06-11 13:44:06', '2');
INSERT INTO `player_login` VALUES ('450', '119295750', '189', '2013-06-11 13:44:10', '0');
INSERT INTO `player_login` VALUES ('451', '111217222', '172', '2013-06-11 13:44:55', '2');
INSERT INTO `player_login` VALUES ('452', '119295750', '189', '2013-06-11 13:45:17', '2');
INSERT INTO `player_login` VALUES ('453', '111217222', '190', '2013-06-11 13:45:19', '0');
INSERT INTO `player_login` VALUES ('454', '119295750', '189', '2013-06-11 13:46:07', '0');
INSERT INTO `player_login` VALUES ('455', '111217222', '190', '2013-06-11 13:46:08', '2');
INSERT INTO `player_login` VALUES ('456', '123905AX', '171', '2013-06-11 13:46:24', '0');
INSERT INTO `player_login` VALUES ('457', '120906054', '157', '2013-06-11 13:46:33', '2');
INSERT INTO `player_login` VALUES ('458', '125509382', '141', '2013-06-11 13:46:45', '2');
INSERT INTO `player_login` VALUES ('459', '9476996', '183', '2013-06-11 13:47:48', '2');
INSERT INTO `player_login` VALUES ('460', '75013702', '191', '2013-06-11 13:47:51', '0');
INSERT INTO `player_login` VALUES ('461', '16290694', '192', '2013-06-11 13:48:13', '0');
INSERT INTO `player_login` VALUES ('462', '43310086', '193', '2013-06-11 13:48:20', '0');
INSERT INTO `player_login` VALUES ('463', '75013702', '191', '2013-06-11 13:48:43', '2');
INSERT INTO `player_login` VALUES ('464', '21558662', '113', '2013-06-11 13:49:00', '2');
INSERT INTO `player_login` VALUES ('465', '88417990', '134', '2013-06-11 13:50:19', '2');
INSERT INTO `player_login` VALUES ('466', '16290694', '192', '2013-06-11 13:51:05', '2');
INSERT INTO `player_login` VALUES ('467', '16290694', '194', '2013-06-11 13:51:28', '0');
INSERT INTO `player_login` VALUES ('468', '123905AX', '171', '2013-06-11 13:53:08', '2');
INSERT INTO `player_login` VALUES ('469', '123905AX', '195', '2013-06-11 13:53:31', '0');
INSERT INTO `player_login` VALUES ('470', '43310086', '193', '2013-06-11 13:54:37', '2');
INSERT INTO `player_login` VALUES ('471', '43310086', '196', '2013-06-11 13:55:06', '0');
INSERT INTO `player_login` VALUES ('472', '93107334', '197', '2013-06-11 13:55:47', '0');
INSERT INTO `player_login` VALUES ('473', '120983750', '0', '2013-06-11 13:56:49', '2');
INSERT INTO `player_login` VALUES ('474', '39565702', '198', '2013-06-11 13:56:58', '0');
INSERT INTO `player_login` VALUES ('475', '90014086', '199', '2013-06-11 13:58:17', '0');
INSERT INTO `player_login` VALUES ('476', '5661894', '163', '2013-06-11 13:58:30', '2');
INSERT INTO `player_login` VALUES ('477', '93107334', '197', '2013-06-11 13:59:37', '2');
INSERT INTO `player_login` VALUES ('478', '70884870', '201', '2013-06-11 13:59:53', '0');
INSERT INTO `player_login` VALUES ('479', '123905AX', '195', '2013-06-11 14:01:13', '2');
INSERT INTO `player_login` VALUES ('480', '123905AX', '202', '2013-06-11 14:02:54', '0');
INSERT INTO `player_login` VALUES ('481', '8739716', '181', '2013-06-11 14:03:25', '2');
INSERT INTO `player_login` VALUES ('482', '43310086', '196', '2013-06-11 14:03:49', '2');
INSERT INTO `player_login` VALUES ('483', '8739716', '203', '2013-06-11 14:03:57', '0');
INSERT INTO `player_login` VALUES ('484', '109113734', '204', '2013-06-11 14:04:34', '0');
INSERT INTO `player_login` VALUES ('485', '109882886', '205', '2013-06-11 14:05:01', '0');
INSERT INTO `player_login` VALUES ('486', '70884870', '201', '2013-06-11 14:05:12', '2');
INSERT INTO `player_login` VALUES ('487', '97721670', '161', '2013-06-11 14:05:20', '2');
INSERT INTO `player_login` VALUES ('488', '71661254', '143', '2013-06-11 14:05:25', '2');
INSERT INTO `player_login` VALUES ('489', '129796998', '206', '2013-06-11 14:05:26', '0');
INSERT INTO `player_login` VALUES ('490', '130793926', '180', '2013-06-11 14:05:38', '2');
INSERT INTO `player_login` VALUES ('491', '43070790', '200', '2013-06-11 14:05:46', '0');
INSERT INTO `player_login` VALUES ('492', '101390918', '207', '2013-06-11 14:05:47', '0');
INSERT INTO `player_login` VALUES ('493', '97721670', '208', '2013-06-11 14:05:47', '0');
INSERT INTO `player_login` VALUES ('494', '114478086', '209', '2013-06-11 14:05:58', '0');
INSERT INTO `player_login` VALUES ('495', '71661254', '210', '2013-06-11 14:06:00', '0');
INSERT INTO `player_login` VALUES ('496', '130793926', '211', '2013-06-11 14:06:16', '0');
INSERT INTO `player_login` VALUES ('497', '71661254', '210', '2013-06-11 14:06:58', '2');
INSERT INTO `player_login` VALUES ('498', '30460422', '212', '2013-06-11 14:07:09', '0');
INSERT INTO `player_login` VALUES ('499', '123905AX', '202', '2013-06-11 14:07:22', '2');
INSERT INTO `player_login` VALUES ('500', '37951750', '213', '2013-06-11 14:07:34', '0');
INSERT INTO `player_login` VALUES ('501', '123905AX', '214', '2013-06-11 14:07:42', '0');
INSERT INTO `player_login` VALUES ('502', '129796998', '206', '2013-06-11 14:09:11', '2');
INSERT INTO `player_login` VALUES ('503', '129796998', '215', '2013-06-11 14:09:43', '0');
INSERT INTO `player_login` VALUES ('504', '5661830', '156', '2013-06-11 14:09:43', '2');
INSERT INTO `player_login` VALUES ('505', '39565702', '198', '2013-06-11 14:10:15', '2');
INSERT INTO `player_login` VALUES ('506', '43070790', '200', '2013-06-11 14:10:28', '2');
INSERT INTO `player_login` VALUES ('507', '39565702', '216', '2013-06-11 14:10:35', '0');
INSERT INTO `player_login` VALUES ('508', '70884870', '217', '2013-06-11 14:10:54', '0');
INSERT INTO `player_login` VALUES ('509', '37924166', '182', '2013-06-11 14:11:36', '2');
INSERT INTO `player_login` VALUES ('510', '37924166', '219', '2013-06-11 14:12:05', '0');
INSERT INTO `player_login` VALUES ('511', '130636742', '188', '2013-06-11 14:12:46', '2');
INSERT INTO `player_login` VALUES ('512', '97372742', '221', '2013-06-11 14:13:17', '0');
INSERT INTO `player_login` VALUES ('513', '43070790', '218', '2013-06-11 14:13:20', '0');
INSERT INTO `player_login` VALUES ('514', '130636742', '220', '2013-06-11 14:13:20', '0');
INSERT INTO `player_login` VALUES ('515', '109113734', '222', '2013-06-11 14:13:56', '0');
INSERT INTO `player_login` VALUES ('516', '129796998', '223', '2013-06-11 14:14:06', '0');
INSERT INTO `player_login` VALUES ('517', '37951750', '213', '2013-06-11 14:14:38', '2');
INSERT INTO `player_login` VALUES ('518', '43070790', '218', '2013-06-11 14:15:30', '2');
INSERT INTO `player_login` VALUES ('519', '8739716', '203', '2013-06-11 14:15:48', '2');
INSERT INTO `player_login` VALUES ('520', '109113734', '222', '2013-06-11 14:16:08', '2');
INSERT INTO `player_login` VALUES ('521', '33433478', '224', '2013-06-11 14:16:09', '0');
INSERT INTO `player_login` VALUES ('522', '109113734', '225', '2013-06-11 14:16:27', '0');
INSERT INTO `player_login` VALUES ('523', '90014086', '199', '2013-06-11 14:16:46', '2');
INSERT INTO `player_login` VALUES ('524', '90014086', '226', '2013-06-11 14:17:19', '0');
INSERT INTO `player_login` VALUES ('525', '39517766', '227', '2013-06-11 14:17:22', '0');
INSERT INTO `player_login` VALUES ('526', '129796998', '228', '2013-06-11 14:17:33', '0');
INSERT INTO `player_login` VALUES ('527', '109113734', '229', '2013-06-11 14:18:26', '0');
INSERT INTO `player_login` VALUES ('528', '114478086', '209', '2013-06-11 14:18:36', '2');
INSERT INTO `player_login` VALUES ('529', '114702790', '230', '2013-06-11 14:18:39', '0');
INSERT INTO `player_login` VALUES ('530', '114478086', '231', '2013-06-11 14:19:07', '0');
INSERT INTO `player_login` VALUES ('531', '79964294', '232', '2013-06-11 14:21:05', '0');
INSERT INTO `player_login` VALUES ('532', '109113734', '233', '2013-06-11 14:21:44', '0');
INSERT INTO `player_login` VALUES ('533', '33433478', '224', '2013-06-11 14:22:04', '2');
INSERT INTO `player_login` VALUES ('534', '125749254', '160', '2013-06-11 14:23:27', '2');
INSERT INTO `player_login` VALUES ('535', '33433478', '234', '2013-06-11 14:23:32', '0');
INSERT INTO `player_login` VALUES ('536', '16230278', '169', '2013-06-11 14:23:34', '2');
INSERT INTO `player_login` VALUES ('537', '129796998', '228', '2013-06-11 14:23:52', '2');
INSERT INTO `player_login` VALUES ('538', '125749254', '160', '2013-06-11 14:24:28', '0');
INSERT INTO `player_login` VALUES ('539', '49919238', '168', '2013-06-11 14:25:43', '2');
INSERT INTO `player_login` VALUES ('540', '16230278', '169', '2013-06-11 14:26:02', '0');
INSERT INTO `player_login` VALUES ('541', '16290694', '194', '2013-06-11 14:26:05', '2');
INSERT INTO `player_login` VALUES ('542', '33433478', '234', '2013-06-11 14:26:08', '2');
INSERT INTO `player_login` VALUES ('543', '49919238', '235', '2013-06-11 14:26:17', '0');
INSERT INTO `player_login` VALUES ('544', '33433478', '237', '2013-06-11 14:26:30', '0');
INSERT INTO `player_login` VALUES ('545', '123905AX', '214', '2013-06-11 14:26:32', '2');
INSERT INTO `player_login` VALUES ('546', '16290694', '236', '2013-06-11 14:26:32', '0');
INSERT INTO `player_login` VALUES ('547', '109113734', '233', '2013-06-11 14:26:51', '2');
INSERT INTO `player_login` VALUES ('548', '97372742', '221', '2013-06-11 14:27:07', '2');
INSERT INTO `player_login` VALUES ('549', '97372742', '238', '2013-06-11 14:27:31', '0');
INSERT INTO `player_login` VALUES ('550', '129796998', '228', '2013-06-11 14:27:47', '0');
INSERT INTO `player_login` VALUES ('551', '123905AX', '214', '2013-06-11 14:27:59', '0');
INSERT INTO `player_login` VALUES ('552', '123905AX', '214', '2013-06-11 14:28:47', '2');
INSERT INTO `player_login` VALUES ('553', '68679430', '34', '2013-06-11 14:28:49', '0');
INSERT INTO `player_login` VALUES ('554', '123905AX', '240', '2013-06-11 14:29:12', '0');
INSERT INTO `player_login` VALUES ('555', '114702790', '230', '2013-06-11 14:29:51', '2');
INSERT INTO `player_login` VALUES ('556', '119295750', '189', '2013-06-11 14:29:52', '2');
INSERT INTO `player_login` VALUES ('557', '114702790', '241', '2013-06-11 14:30:12', '0');
INSERT INTO `player_login` VALUES ('558', '39565702', '216', '2013-06-11 14:30:21', '2');
INSERT INTO `player_login` VALUES ('559', '39565702', '242', '2013-06-11 14:30:54', '0');
INSERT INTO `player_login` VALUES ('560', '70884870', '217', '2013-06-11 14:31:18', '2');
INSERT INTO `player_login` VALUES ('561', '75255942', '239', '2013-06-11 14:31:53', '0');
INSERT INTO `player_login` VALUES ('562', '130636742', '220', '2013-06-11 14:32:02', '2');
INSERT INTO `player_login` VALUES ('563', '125749254', '160', '2013-06-11 14:32:10', '2');
INSERT INTO `player_login` VALUES ('564', '16230278', '169', '2013-06-11 14:32:15', '2');
INSERT INTO `player_login` VALUES ('565', '129796998', '243', '2013-06-11 14:32:31', '0');
INSERT INTO `player_login` VALUES ('566', '27822790', '244', '2013-06-11 14:32:51', '0');
INSERT INTO `player_login` VALUES ('567', '97372742', '238', '2013-06-11 14:33:56', '2');
INSERT INTO `player_login` VALUES ('568', '130793926', '211', '2013-06-11 14:34:16', '2');
INSERT INTO `player_login` VALUES ('569', '39565702', '242', '2013-06-11 14:34:20', '2');
INSERT INTO `player_login` VALUES ('570', '130145542', '176', '2013-06-11 14:34:33', '2');
INSERT INTO `player_login` VALUES ('571', '39565702', '245', '2013-06-11 14:34:41', '0');
INSERT INTO `player_login` VALUES ('572', '123905AX', '240', '2013-06-11 14:34:41', '2');
INSERT INTO `player_login` VALUES ('573', '94850182', '246', '2013-06-11 14:34:55', '0');
INSERT INTO `player_login` VALUES ('574', '4126532', '247', '2013-06-11 14:38:06', '0');
INSERT INTO `player_login` VALUES ('575', '9567044', '248', '2013-06-11 14:38:08', '0');
INSERT INTO `player_login` VALUES ('576', '11759558', '249', '2013-06-11 14:39:34', '0');
INSERT INTO `player_login` VALUES ('577', '27822790', '244', '2013-06-11 14:40:00', '2');
INSERT INTO `player_login` VALUES ('578', '66128262', '250', '2013-06-11 14:40:23', '0');
INSERT INTO `player_login` VALUES ('579', '87880902', '251', '2013-06-11 14:43:43', '0');
INSERT INTO `player_login` VALUES ('580', '13690886', '252', '2013-06-11 14:43:51', '0');
INSERT INTO `player_login` VALUES ('581', '75255942', '239', '2013-06-11 14:44:18', '2');
INSERT INTO `player_login` VALUES ('582', '56077190', '253', '2013-06-11 14:44:43', '0');
INSERT INTO `player_login` VALUES ('583', '79964294', '232', '2013-06-11 14:44:53', '2');
INSERT INTO `player_login` VALUES ('584', '114478086', '231', '2013-06-11 14:44:56', '2');
INSERT INTO `player_login` VALUES ('585', '49919238', '235', '2013-06-11 14:45:12', '2');
INSERT INTO `player_login` VALUES ('586', '79964294', '254', '2013-06-11 14:45:34', '0');
INSERT INTO `player_login` VALUES ('587', '11759558', '249', '2013-06-11 14:47:10', '2');
INSERT INTO `player_login` VALUES ('588', '15027014', '256', '2013-06-11 14:47:50', '0');
INSERT INTO `player_login` VALUES ('589', '71661254', '210', '2013-06-11 14:48:01', '0');
INSERT INTO `player_login` VALUES ('590', '11759558', '255', '2013-06-11 14:48:32', '0');
INSERT INTO `player_login` VALUES ('591', '56077190', '253', '2013-06-11 14:51:00', '2');
INSERT INTO `player_login` VALUES ('592', '94850182', '246', '2013-06-11 14:51:54', '2');
INSERT INTO `player_login` VALUES ('593', '98202182', '257', '2013-06-11 14:52:38', '0');
INSERT INTO `player_login` VALUES ('594', '87793606', '258', '2013-06-11 14:52:57', '0');
INSERT INTO `player_login` VALUES ('595', '33433478', '259', '2013-06-11 14:54:08', '0');
INSERT INTO `player_login` VALUES ('596', '87061510', '260', '2013-06-11 14:54:19', '0');
INSERT INTO `player_login` VALUES ('597', '68679430', '34', '2013-06-11 14:54:30', '2');
INSERT INTO `player_login` VALUES ('598', '68679430', '261', '2013-06-11 14:54:59', '0');
INSERT INTO `player_login` VALUES ('599', '129796998', '243', '2013-06-11 14:55:05', '2');
INSERT INTO `player_login` VALUES ('600', '21165766', '262', '2013-06-11 14:55:36', '0');
INSERT INTO `player_login` VALUES ('601', '87061510', '264', '2013-06-11 14:55:38', '0');
INSERT INTO `player_login` VALUES ('602', '129796998', '263', '2013-06-11 14:55:45', '0');
INSERT INTO `player_login` VALUES ('603', '13690886', '252', '2013-06-11 14:57:40', '2');
INSERT INTO `player_login` VALUES ('604', '129796998', '265', '2013-06-11 14:59:00', '0');
INSERT INTO `player_login` VALUES ('605', '11759558', '255', '2013-06-11 14:59:47', '2');
INSERT INTO `player_login` VALUES ('606', '11759558', '255', '2013-06-11 15:01:44', '0');
INSERT INTO `player_login` VALUES ('607', '39517766', '227', '2013-06-11 15:02:28', '2');
INSERT INTO `player_login` VALUES ('608', '39517766', '266', '2013-06-11 15:02:52', '0');
INSERT INTO `player_login` VALUES ('609', '39517766', '266', '2013-06-11 15:02:57', '2');
INSERT INTO `player_login` VALUES ('610', '15027014', '256', '2013-06-11 15:04:07', '2');
INSERT INTO `player_login` VALUES ('611', '33433478', '259', '2013-06-11 15:05:26', '2');
INSERT INTO `player_login` VALUES ('612', '22328902', '267', '2013-06-11 15:09:33', '0');
INSERT INTO `player_login` VALUES ('613', '98202182', '257', '2013-06-11 15:09:57', '2');
INSERT INTO `player_login` VALUES ('614', '98202182', '268', '2013-06-11 15:10:34', '0');
INSERT INTO `player_login` VALUES ('615', '87793606', '258', '2013-06-11 15:11:25', '2');
INSERT INTO `player_login` VALUES ('616', '87061510', '264', '2013-06-11 15:11:35', '2');
INSERT INTO `player_login` VALUES ('617', '87793606', '269', '2013-06-11 15:11:52', '0');
INSERT INTO `player_login` VALUES ('618', '87061510', '270', '2013-06-11 15:12:00', '0');
INSERT INTO `player_login` VALUES ('619', '63552390', '271', '2013-06-11 15:12:42', '0');
INSERT INTO `player_login` VALUES ('620', '60238214', '272', '2013-06-11 15:13:36', '0');
INSERT INTO `player_login` VALUES ('621', '68679430', '261', '2013-06-11 15:14:18', '2');
INSERT INTO `player_login` VALUES ('622', '87061510', '273', '2013-06-11 15:14:22', '0');
INSERT INTO `player_login` VALUES ('623', '22328902', '275', '2013-06-11 15:14:40', '0');
INSERT INTO `player_login` VALUES ('624', '68679430', '276', '2013-06-11 15:14:59', '0');
INSERT INTO `player_login` VALUES ('625', '49966790', '274', '2013-06-11 15:15:16', '0');
INSERT INTO `player_login` VALUES ('626', '79964294', '254', '2013-06-11 15:16:04', '2');
INSERT INTO `player_login` VALUES ('627', '30460422', '212', '2013-06-11 15:18:09', '2');
INSERT INTO `player_login` VALUES ('628', '87061510', '273', '2013-06-11 15:20:00', '2');
INSERT INTO `player_login` VALUES ('629', '12547398', '186', '2013-06-11 15:20:01', '2');
INSERT INTO `player_login` VALUES ('630', '15027014', '256', '2013-06-11 15:20:23', '0');
INSERT INTO `player_login` VALUES ('631', '90014086', '226', '2013-06-11 15:21:22', '2');
INSERT INTO `player_login` VALUES ('632', '4126532', '247', '2013-06-11 15:22:24', '2');
INSERT INTO `player_login` VALUES ('633', '98202182', '268', '2013-06-11 15:22:29', '2');
INSERT INTO `player_login` VALUES ('634', '98202182', '277', '2013-06-11 15:23:00', '0');
INSERT INTO `player_login` VALUES ('635', '4126532', '247', '2013-06-11 15:23:04', '0');
INSERT INTO `player_login` VALUES ('636', '63552390', '271', '2013-06-11 15:23:31', '2');
INSERT INTO `player_login` VALUES ('637', '11759558', '255', '2013-06-11 15:25:15', '2');
INSERT INTO `player_login` VALUES ('638', '39693254', '278', '2013-06-11 15:25:41', '0');
INSERT INTO `player_login` VALUES ('639', '11759558', '279', '2013-06-11 15:25:54', '0');
INSERT INTO `player_login` VALUES ('640', '10008774', '146', '2013-06-11 15:25:58', '2');
INSERT INTO `player_login` VALUES ('641', '63552390', '280', '2013-06-11 15:26:03', '0');
INSERT INTO `player_login` VALUES ('642', '60373638', '281', '2013-06-11 15:27:33', '0');
INSERT INTO `player_login` VALUES ('643', '87793606', '282', '2013-06-11 15:28:57', '0');
INSERT INTO `player_login` VALUES ('644', '41867462', '283', '2013-06-11 15:29:31', '0');
INSERT INTO `player_login` VALUES ('645', '60238214', '272', '2013-06-11 15:29:33', '2');
INSERT INTO `player_login` VALUES ('646', '16290694', '236', '2013-06-11 15:30:01', '2');
INSERT INTO `player_login` VALUES ('647', '63552390', '280', '2013-06-11 15:30:36', '2');
INSERT INTO `player_login` VALUES ('648', '16290694', '236', '2013-06-11 15:30:49', '0');
INSERT INTO `player_login` VALUES ('649', '103810182', '284', '2013-06-11 15:31:37', '0');
INSERT INTO `player_login` VALUES ('650', '11759558', '279', '2013-06-11 15:32:25', '2');
INSERT INTO `player_login` VALUES ('651', '11759558', '285', '2013-06-11 15:34:05', '0');
INSERT INTO `player_login` VALUES ('652', '15027014', '256', '2013-06-11 15:35:13', '2');
INSERT INTO `player_login` VALUES ('653', '98202182', '277', '2013-06-11 15:35:25', '2');
INSERT INTO `player_login` VALUES ('654', '72433030', '286', '2013-06-11 15:36:30', '0');
INSERT INTO `player_login` VALUES ('655', '21165766', '262', '2013-06-11 15:36:48', '2');
INSERT INTO `player_login` VALUES ('656', '41867462', '283', '2013-06-11 15:38:38', '2');
INSERT INTO `player_login` VALUES ('657', '60373638', '281', '2013-06-11 15:38:40', '2');
INSERT INTO `player_login` VALUES ('658', '41867462', '287', '2013-06-11 15:38:59', '0');
INSERT INTO `player_login` VALUES ('659', '60373638', '288', '2013-06-11 15:39:19', '0');
INSERT INTO `player_login` VALUES ('660', '75255942', '289', '2013-06-11 15:41:09', '0');
INSERT INTO `player_login` VALUES ('661', '19019846', '290', '2013-06-11 15:41:25', '0');
INSERT INTO `player_login` VALUES ('662', '19019846', '290', '2013-06-11 15:42:09', '2');
INSERT INTO `player_login` VALUES ('663', '72433030', '286', '2013-06-11 15:43:13', '2');
INSERT INTO `player_login` VALUES ('664', '66675974', '291', '2013-06-11 15:43:14', '0');
INSERT INTO `player_login` VALUES ('665', '102341382', '292', '2013-06-11 15:44:05', '0');
INSERT INTO `player_login` VALUES ('666', '15027014', '256', '2013-06-11 15:44:14', '0');
INSERT INTO `player_login` VALUES ('667', '68679430', '276', '2013-06-11 15:44:20', '2');
INSERT INTO `player_login` VALUES ('668', '49966790', '274', '2013-06-11 15:45:02', '2');
INSERT INTO `player_login` VALUES ('669', '98202182', '277', '2013-06-11 15:45:27', '0');
INSERT INTO `player_login` VALUES ('670', '39565702', '245', '2013-06-11 15:45:32', '2');
INSERT INTO `player_login` VALUES ('671', '66128262', '250', '2013-06-11 15:45:35', '2');
INSERT INTO `player_login` VALUES ('672', '87793606', '282', '2013-06-11 15:45:45', '2');
INSERT INTO `player_login` VALUES ('673', '107586694', '293', '2013-06-11 15:48:37', '0');
INSERT INTO `player_login` VALUES ('674', '41867462', '287', '2013-06-11 15:49:01', '2');
INSERT INTO `player_login` VALUES ('675', '121817158', '294', '2013-06-11 15:50:38', '0');
INSERT INTO `player_login` VALUES ('676', '130518406', '295', '2013-06-11 15:50:43', '0');
INSERT INTO `player_login` VALUES ('677', '90048454', '0', '2013-06-11 15:50:46', '2');
INSERT INTO `player_login` VALUES ('678', '15027014', '256', '2013-06-11 15:51:10', '2');
INSERT INTO `player_login` VALUES ('679', '130716678', '297', '2013-06-11 15:51:18', '0');
INSERT INTO `player_login` VALUES ('680', '114702790', '241', '2013-06-11 15:51:31', '2');
INSERT INTO `player_login` VALUES ('681', '78875014', '173', '2013-06-11 15:52:31', '2');
INSERT INTO `player_login` VALUES ('682', '15027014', '256', '2013-06-11 15:52:42', '0');
INSERT INTO `player_login` VALUES ('683', '65725190', '298', '2013-06-11 15:53:45', '0');
INSERT INTO `player_login` VALUES ('684', '119830662', '299', '2013-06-11 15:54:26', '0');
INSERT INTO `player_login` VALUES ('685', '65725190', '298', '2013-06-11 15:56:24', '2');
INSERT INTO `player_login` VALUES ('686', '65725190', '300', '2013-06-11 15:56:43', '0');
INSERT INTO `player_login` VALUES ('687', '68679430', '276', '2013-06-11 15:57:06', '0');
INSERT INTO `player_login` VALUES ('688', '65725190', '300', '2013-06-11 15:57:17', '2');
INSERT INTO `player_login` VALUES ('689', '65725190', '300', '2013-06-11 15:57:34', '0');
INSERT INTO `player_login` VALUES ('690', '35429446', '301', '2013-06-11 15:58:53', '0');
INSERT INTO `player_login` VALUES ('691', '10715776', '302', '2013-06-11 15:59:15', '0');
INSERT INTO `player_login` VALUES ('692', '65725190', '300', '2013-06-11 15:59:36', '2');
INSERT INTO `player_login` VALUES ('693', '130518406', '295', '2013-06-11 15:59:38', '2');
INSERT INTO `player_login` VALUES ('694', '6868166', '303', '2013-06-11 15:59:50', '0');
INSERT INTO `player_login` VALUES ('695', '65725190', '304', '2013-06-11 15:59:59', '0');
INSERT INTO `player_login` VALUES ('696', '121817158', '294', '2013-06-11 16:00:16', '2');
INSERT INTO `player_login` VALUES ('697', '102341382', '292', '2013-06-11 16:00:38', '2');
INSERT INTO `player_login` VALUES ('698', '121817158', '305', '2013-06-11 16:00:41', '0');
INSERT INTO `player_login` VALUES ('699', '60373638', '288', '2013-06-11 16:00:43', '2');
INSERT INTO `player_login` VALUES ('700', '9567044', '248', '2013-06-11 16:00:53', '2');
INSERT INTO `player_login` VALUES ('701', '87793606', '282', '2013-06-11 16:01:31', '0');
INSERT INTO `player_login` VALUES ('702', '9567044', '248', '2013-06-11 16:01:36', '0');
INSERT INTO `player_login` VALUES ('703', '130518406', '295', '2013-06-11 16:02:18', '0');
INSERT INTO `player_login` VALUES ('704', '71661254', '0', '2013-06-11 16:02:46', '2');
INSERT INTO `player_login` VALUES ('705', '35429446', '301', '2013-06-11 16:03:51', '2');
INSERT INTO `player_login` VALUES ('706', '66675974', '291', '2013-06-11 16:04:17', '2');
INSERT INTO `player_login` VALUES ('707', '130518406', '295', '2013-06-11 16:04:25', '2');
INSERT INTO `player_login` VALUES ('708', '66675974', '306', '2013-06-11 16:04:46', '0');
INSERT INTO `player_login` VALUES ('709', '71661254', '210', '2013-06-11 16:04:58', '0');
INSERT INTO `player_login` VALUES ('710', '80026566', '307', '2013-06-11 16:05:46', '0');
INSERT INTO `player_login` VALUES ('711', '130518406', '295', '2013-06-11 16:06:57', '0');
INSERT INTO `player_login` VALUES ('712', '6868166', '303', '2013-06-11 16:07:45', '2');
INSERT INTO `player_login` VALUES ('713', '98202182', '277', '2013-06-11 16:08:06', '2');
INSERT INTO `player_login` VALUES ('714', '6868166', '308', '2013-06-11 16:08:19', '0');
INSERT INTO `player_login` VALUES ('715', '3575046', '309', '2013-06-11 16:08:25', '0');
INSERT INTO `player_login` VALUES ('716', '15027014', '256', '2013-06-11 16:08:40', '2');
INSERT INTO `player_login` VALUES ('717', '3575046', '309', '2013-06-11 16:09:03', '2');
INSERT INTO `player_login` VALUES ('718', '3575046', '309', '2013-06-11 16:09:18', '0');
INSERT INTO `player_login` VALUES ('719', '35429446', '310', '2013-06-11 16:10:19', '0');
INSERT INTO `player_login` VALUES ('720', '35429446', '310', '2013-06-11 16:10:30', '2');
INSERT INTO `player_login` VALUES ('721', '114702790', '241', '2013-06-11 16:10:47', '0');
INSERT INTO `player_login` VALUES ('722', '107586694', '293', '2013-06-11 16:10:59', '2');
INSERT INTO `player_login` VALUES ('723', '10715776', '302', '2013-06-11 16:12:49', '2');
INSERT INTO `player_login` VALUES ('724', '103810182', '284', '2013-06-11 16:15:43', '2');
INSERT INTO `player_login` VALUES ('725', '715778AX', '311', '2013-06-11 16:15:52', '0');
INSERT INTO `player_login` VALUES ('726', '103810182', '312', '2013-06-11 16:16:14', '0');
INSERT INTO `player_login` VALUES ('727', '130518406', '295', '2013-06-11 16:16:52', '2');
INSERT INTO `player_login` VALUES ('728', '70884870', '217', '2013-06-11 16:18:26', '0');
INSERT INTO `player_login` VALUES ('729', '3575046', '309', '2013-06-11 16:18:38', '2');
INSERT INTO `player_login` VALUES ('730', '60373638', '288', '2013-06-11 16:18:47', '0');
INSERT INTO `player_login` VALUES ('731', '811841', '138', '2013-06-11 16:18:51', '2');
INSERT INTO `player_login` VALUES ('732', '3575046', '313', '2013-06-11 16:18:59', '0');
INSERT INTO `player_login` VALUES ('733', '92636294', '314', '2013-06-11 16:19:07', '0');
INSERT INTO `player_login` VALUES ('734', '92636294', '314', '2013-06-11 16:19:20', '2');
INSERT INTO `player_login` VALUES ('735', '130518406', '295', '2013-06-11 16:19:26', '0');
INSERT INTO `player_login` VALUES ('736', '107586694', '315', '2013-06-11 16:19:27', '0');
INSERT INTO `player_login` VALUES ('737', '70884870', '217', '2013-06-11 16:19:32', '2');
INSERT INTO `player_login` VALUES ('738', '92636294', '314', '2013-06-11 16:19:37', '0');
INSERT INTO `player_login` VALUES ('739', '11470854', '20', '2013-06-11 16:19:57', '0');
INSERT INTO `player_login` VALUES ('740', '130518406', '295', '2013-06-11 16:20:11', '2');
INSERT INTO `player_login` VALUES ('741', '87793606', '282', '2013-06-11 16:20:18', '2');
INSERT INTO `player_login` VALUES ('742', '87793606', '316', '2013-06-11 16:20:45', '0');
INSERT INTO `player_login` VALUES ('743', '811841', '138', '2013-06-11 16:21:08', '0');
INSERT INTO `player_login` VALUES ('744', '119830662', '299', '2013-06-11 16:21:13', '2');
INSERT INTO `player_login` VALUES ('745', '121817158', '305', '2013-06-11 16:21:49', '2');
INSERT INTO `player_login` VALUES ('746', '120057734', '317', '2013-06-11 16:23:19', '0');
INSERT INTO `player_login` VALUES ('747', '130518406', '295', '2013-06-11 16:24:20', '0');
INSERT INTO `player_login` VALUES ('748', '92636294', '314', '2013-06-11 16:24:22', '2');
INSERT INTO `player_login` VALUES ('749', '114702790', '241', '2013-06-11 16:24:35', '2');
INSERT INTO `player_login` VALUES ('750', '92636294', '319', '2013-06-11 16:24:41', '0');
INSERT INTO `player_login` VALUES ('751', '121817158', '318', '2013-06-11 16:24:42', '0');
INSERT INTO `player_login` VALUES ('752', '114702790', '320', '2013-06-11 16:25:03', '0');
INSERT INTO `player_login` VALUES ('753', '121817158', '318', '2013-06-11 16:25:51', '2');
INSERT INTO `player_login` VALUES ('754', '130518406', '295', '2013-06-11 16:25:56', '2');
INSERT INTO `player_login` VALUES ('755', '103810182', '312', '2013-06-11 16:27:16', '2');
INSERT INTO `player_login` VALUES ('756', '92636294', '319', '2013-06-11 16:28:59', '2');
INSERT INTO `player_login` VALUES ('757', '92636294', '321', '2013-06-11 16:29:19', '0');
INSERT INTO `player_login` VALUES ('758', '92636294', '321', '2013-06-11 16:29:39', '2');
INSERT INTO `player_login` VALUES ('759', '92636294', '321', '2013-06-11 16:29:55', '0');
INSERT INTO `player_login` VALUES ('760', '97198470', '322', '2013-06-11 16:30:04', '0');
INSERT INTO `player_login` VALUES ('761', '75633734', '323', '2013-06-11 16:30:57', '0');
INSERT INTO `player_login` VALUES ('762', '60373638', '288', '2013-06-11 16:31:09', '2');
INSERT INTO `player_login` VALUES ('763', '91511366', '324', '2013-06-11 16:31:30', '0');
INSERT INTO `player_login` VALUES ('764', '91511366', '324', '2013-06-11 16:31:36', '2');
INSERT INTO `player_login` VALUES ('765', '5515014', '326', '2013-06-11 16:32:45', '0');
INSERT INTO `player_login` VALUES ('766', '40979846', '325', '2013-06-11 16:32:46', '0');
INSERT INTO `player_login` VALUES ('767', '97198470', '322', '2013-06-11 16:33:08', '2');
INSERT INTO `player_login` VALUES ('768', '92636294', '321', '2013-06-11 16:33:42', '2');
INSERT INTO `player_login` VALUES ('769', '92636294', '327', '2013-06-11 16:34:01', '0');
INSERT INTO `player_login` VALUES ('770', '60373638', '288', '2013-06-11 16:34:33', '0');
INSERT INTO `player_login` VALUES ('771', '715778AX', '311', '2013-06-11 16:35:25', '2');
INSERT INTO `player_login` VALUES ('772', '120057734', '317', '2013-06-11 16:35:33', '2');
INSERT INTO `player_login` VALUES ('773', '76004806', '328', '2013-06-11 16:35:49', '0');
INSERT INTO `player_login` VALUES ('774', '715778AX', '329', '2013-06-11 16:36:00', '0');
INSERT INTO `player_login` VALUES ('775', '40979846', '330', '2013-06-11 16:36:32', '0');
INSERT INTO `player_login` VALUES ('776', '3766534', '11', '2013-06-11 16:36:45', '2');
INSERT INTO `player_login` VALUES ('777', '64439174', '331', '2013-06-11 16:37:41', '0');
INSERT INTO `player_login` VALUES ('778', '80026566', '307', '2013-06-11 16:39:08', '2');
INSERT INTO `player_login` VALUES ('779', '80026566', '332', '2013-06-11 16:39:45', '0');
INSERT INTO `player_login` VALUES ('780', '92636294', '327', '2013-06-11 16:40:20', '2');
INSERT INTO `player_login` VALUES ('781', '92636294', '333', '2013-06-11 16:40:40', '0');
INSERT INTO `player_login` VALUES ('782', '37924166', '219', '2013-06-11 16:40:43', '2');
INSERT INTO `player_login` VALUES ('783', '37924166', '219', '2013-06-11 16:41:17', '0');
INSERT INTO `player_login` VALUES ('784', '3766534', '11', '2013-06-11 16:41:39', '0');
INSERT INTO `player_login` VALUES ('785', '9567044', '248', '2013-06-11 16:41:43', '2');
INSERT INTO `player_login` VALUES ('786', '4126532', '247', '2013-06-11 16:41:46', '2');
INSERT INTO `player_login` VALUES ('787', '80026566', '332', '2013-06-11 16:41:55', '2');
INSERT INTO `player_login` VALUES ('788', '80026566', '334', '2013-06-11 16:42:25', '0');
INSERT INTO `player_login` VALUES ('789', '9567044', '336', '2013-06-11 16:42:34', '0');
INSERT INTO `player_login` VALUES ('790', '4126532', '335', '2013-06-11 16:43:14', '0');
INSERT INTO `player_login` VALUES ('791', '40979846', '330', '2013-06-11 16:43:20', '2');
INSERT INTO `player_login` VALUES ('792', '64439174', '331', '2013-06-11 16:43:23', '2');
INSERT INTO `player_login` VALUES ('793', '107333126', '337', '2013-06-11 16:43:43', '0');
INSERT INTO `player_login` VALUES ('794', '64439174', '338', '2013-06-11 16:43:51', '0');
INSERT INTO `player_login` VALUES ('795', '60373638', '288', '2013-06-11 16:43:54', '2');
INSERT INTO `player_login` VALUES ('796', '92636294', '339', '2013-06-11 16:44:40', '0');
INSERT INTO `player_login` VALUES ('797', '92636294', '339', '2013-06-11 16:44:56', '2');
INSERT INTO `player_login` VALUES ('798', '75255942', '289', '2013-06-11 16:45:35', '2');
INSERT INTO `player_login` VALUES ('799', '78606598', '340', '2013-06-11 16:45:45', '0');
INSERT INTO `player_login` VALUES ('800', '3575046', '313', '2013-06-11 16:47:07', '2');
INSERT INTO `player_login` VALUES ('801', '39693254', '278', '2013-06-11 16:51:28', '2');
INSERT INTO `player_login` VALUES ('802', '76004806', '328', '2013-06-11 16:51:44', '2');
INSERT INTO `player_login` VALUES ('803', '39693254', '341', '2013-06-11 16:52:01', '0');
INSERT INTO `player_login` VALUES ('804', '129796998', '265', '2013-06-11 16:52:13', '2');
INSERT INTO `player_login` VALUES ('805', '71661254', '210', '2013-06-11 16:52:20', '2');
INSERT INTO `player_login` VALUES ('806', '71661254', '342', '2013-06-11 16:53:00', '0');
INSERT INTO `player_login` VALUES ('807', '6868166', '308', '2013-06-11 16:53:37', '2');
INSERT INTO `player_login` VALUES ('808', '21465350', '343', '2013-06-11 16:53:48', '0');
INSERT INTO `player_login` VALUES ('809', '72232582', '344', '2013-06-11 16:54:25', '0');
INSERT INTO `player_login` VALUES ('810', '37933318', '179', '2013-06-11 16:55:13', '2');
INSERT INTO `player_login` VALUES ('811', '37933318', '179', '2013-06-11 16:55:47', '0');
INSERT INTO `player_login` VALUES ('812', '124880902', '0', '2013-06-11 16:56:07', '2');
INSERT INTO `player_login` VALUES ('813', '58849286', '345', '2013-06-11 16:56:29', '0');
INSERT INTO `player_login` VALUES ('814', '16290694', '236', '2013-06-11 16:56:32', '2');
INSERT INTO `player_login` VALUES ('815', '58849286', '345', '2013-06-11 16:57:53', '2');
INSERT INTO `player_login` VALUES ('816', '58849286', '346', '2013-06-11 16:58:09', '0');
INSERT INTO `player_login` VALUES ('817', '60373638', '288', '2013-06-11 16:58:26', '0');
INSERT INTO `player_login` VALUES ('818', '78606598', '340', '2013-06-11 16:59:06', '2');
INSERT INTO `player_login` VALUES ('819', '20637254', '0', '2013-06-11 16:59:06', '2');
INSERT INTO `player_login` VALUES ('820', '63211974', '347', '2013-06-11 16:59:29', '0');
INSERT INTO `player_login` VALUES ('821', '78606598', '348', '2013-06-11 16:59:36', '0');
INSERT INTO `player_login` VALUES ('822', '811841', '138', '2013-06-11 17:00:23', '2');
INSERT INTO `player_login` VALUES ('823', '58849286', '346', '2013-06-11 17:00:24', '2');
INSERT INTO `player_login` VALUES ('824', '58849286', '349', '2013-06-11 17:00:37', '0');
INSERT INTO `player_login` VALUES ('825', '64439174', '338', '2013-06-11 17:01:26', '2');
INSERT INTO `player_login` VALUES ('826', '5515014', '326', '2013-06-11 17:01:33', '2');
INSERT INTO `player_login` VALUES ('827', '58849286', '349', '2013-06-11 17:01:50', '2');
INSERT INTO `player_login` VALUES ('828', '58849286', '350', '2013-06-11 17:02:04', '0');
INSERT INTO `player_login` VALUES ('829', '21465350', '343', '2013-06-11 17:02:24', '2');
INSERT INTO `player_login` VALUES ('830', '66675974', '306', '2013-06-11 17:03:57', '2');
INSERT INTO `player_login` VALUES ('831', '3214400', '351', '2013-06-11 17:04:01', '0');
INSERT INTO `player_login` VALUES ('832', '68679430', '276', '2013-06-11 17:06:19', '2');
INSERT INTO `player_login` VALUES ('833', '58849286', '350', '2013-06-11 17:07:03', '2');
INSERT INTO `player_login` VALUES ('834', '58849286', '352', '2013-06-11 17:07:17', '0');
INSERT INTO `player_login` VALUES ('835', '91511366', '324', '2013-06-11 17:07:44', '0');
INSERT INTO `player_login` VALUES ('836', '68679430', '276', '2013-06-11 17:09:13', '0');
INSERT INTO `player_login` VALUES ('837', '3214400', '351', '2013-06-11 17:09:19', '2');
INSERT INTO `player_login` VALUES ('838', '3214400', '353', '2013-06-11 17:09:42', '0');
INSERT INTO `player_login` VALUES ('839', '80026566', '334', '2013-06-11 17:10:57', '2');
INSERT INTO `player_login` VALUES ('840', '20637254', '0', '2013-06-11 17:13:34', '2');
INSERT INTO `player_login` VALUES ('841', '54452614', '355', '2013-06-11 17:14:12', '0');
INSERT INTO `player_login` VALUES ('842', '73697414', '354', '2013-06-11 17:15:06', '0');
INSERT INTO `player_login` VALUES ('843', '63211974', '347', '2013-06-11 17:15:26', '2');
INSERT INTO `player_login` VALUES ('844', '42248390', '356', '2013-06-11 17:15:43', '0');
INSERT INTO `player_login` VALUES ('845', '88417990', '134', '2013-06-11 17:16:14', '0');
INSERT INTO `player_login` VALUES ('846', '71661254', '342', '2013-06-11 17:17:31', '2');
INSERT INTO `player_login` VALUES ('847', '65725190', '304', '2013-06-11 17:18:00', '2');
INSERT INTO `player_login` VALUES ('848', '39693254', '341', '2013-06-11 17:18:13', '2');
INSERT INTO `player_login` VALUES ('849', '65725190', '357', '2013-06-11 17:18:34', '0');
INSERT INTO `player_login` VALUES ('850', '126364870', '358', '2013-06-11 17:18:54', '0');
INSERT INTO `player_login` VALUES ('851', '715778AX', '329', '2013-06-11 17:19:14', '2');
INSERT INTO `player_login` VALUES ('852', '65725190', '357', '2013-06-11 17:20:02', '2');
INSERT INTO `player_login` VALUES ('853', '65725190', '359', '2013-06-11 17:20:22', '0');
INSERT INTO `player_login` VALUES ('854', '10831686', '360', '2013-06-11 17:23:09', '0');
INSERT INTO `player_login` VALUES ('855', '126364870', '358', '2013-06-11 17:23:31', '2');
INSERT INTO `player_login` VALUES ('856', '21465350', '343', '2013-06-11 17:24:03', '0');
INSERT INTO `player_login` VALUES ('857', '126364870', '361', '2013-06-11 17:24:08', '0');
INSERT INTO `player_login` VALUES ('858', '107333126', '337', '2013-06-11 17:24:35', '2');
INSERT INTO `player_login` VALUES ('859', '55428102', '362', '2013-06-11 17:24:43', '0');
INSERT INTO `player_login` VALUES ('860', '29242630', '363', '2013-06-11 17:25:16', '0');
INSERT INTO `player_login` VALUES ('861', '26858118', '364', '2013-06-11 17:25:27', '0');
INSERT INTO `player_login` VALUES ('862', '114702790', '320', '2013-06-11 17:26:28', '2');
INSERT INTO `player_login` VALUES ('863', '715778AX', '365', '2013-06-11 17:26:34', '0');
INSERT INTO `player_login` VALUES ('864', '55428102', '362', '2013-06-11 17:26:37', '2');
INSERT INTO `player_login` VALUES ('865', '55428102', '366', '2013-06-11 17:26:55', '0');
INSERT INTO `player_login` VALUES ('866', '9567044', '336', '2013-06-11 17:27:05', '2');
INSERT INTO `player_login` VALUES ('867', '4126532', '335', '2013-06-11 17:27:09', '2');
INSERT INTO `player_login` VALUES ('868', '60373638', '288', '2013-06-11 17:28:06', '2');
INSERT INTO `player_login` VALUES ('869', '55428102', '366', '2013-06-11 17:28:32', '2');
INSERT INTO `player_login` VALUES ('870', '60373638', '367', '2013-06-11 17:28:39', '0');
INSERT INTO `player_login` VALUES ('871', '55428102', '368', '2013-06-11 17:28:48', '0');
INSERT INTO `player_login` VALUES ('872', '10831686', '360', '2013-06-11 17:29:20', '2');
INSERT INTO `player_login` VALUES ('873', '21465350', '343', '2013-06-11 17:29:29', '2');
INSERT INTO `player_login` VALUES ('874', '10831686', '369', '2013-06-11 17:29:46', '0');
INSERT INTO `player_login` VALUES ('875', '21465350', '370', '2013-06-11 17:29:46', '0');
INSERT INTO `player_login` VALUES ('876', '3214400', '353', '2013-06-11 17:31:27', '2');
INSERT INTO `player_login` VALUES ('877', '21465350', '371', '2013-06-11 17:31:31', '0');
INSERT INTO `player_login` VALUES ('878', '3214400', '372', '2013-06-11 17:31:52', '0');
INSERT INTO `player_login` VALUES ('879', '55428102', '373', '2013-06-11 17:32:17', '0');
INSERT INTO `player_login` VALUES ('880', '72232582', '344', '2013-06-11 17:32:28', '2');
INSERT INTO `player_login` VALUES ('881', '10831686', '369', '2013-06-11 17:32:29', '2');
INSERT INTO `player_login` VALUES ('882', '72232582', '374', '2013-06-11 17:33:11', '0');
INSERT INTO `player_login` VALUES ('883', '10831686', '369', '2013-06-11 17:34:10', '0');
INSERT INTO `player_login` VALUES ('884', '92604550', '0', '2013-06-11 17:34:20', '2');
INSERT INTO `player_login` VALUES ('885', '33507462', '375', '2013-06-11 17:35:22', '0');
INSERT INTO `player_login` VALUES ('886', '55428102', '377', '2013-06-11 17:35:25', '0');
INSERT INTO `player_login` VALUES ('887', '57587782', '376', '2013-06-11 17:35:29', '0');
INSERT INTO `player_login` VALUES ('888', '21465350', '371', '2013-06-11 17:35:41', '2');
INSERT INTO `player_login` VALUES ('889', '91511366', '324', '2013-06-11 17:35:43', '2');
INSERT INTO `player_login` VALUES ('890', '126364870', '361', '2013-06-11 17:35:44', '2');
INSERT INTO `player_login` VALUES ('891', '58849286', '378', '2013-06-11 17:35:54', '0');
INSERT INTO `player_login` VALUES ('892', '21465350', '379', '2013-06-11 17:35:57', '0');
INSERT INTO `player_login` VALUES ('893', '26858118', '364', '2013-06-11 17:35:59', '2');
INSERT INTO `player_login` VALUES ('894', '107586694', '315', '2013-06-11 17:36:04', '2');
INSERT INTO `player_login` VALUES ('895', '88417990', '134', '2013-06-11 17:36:16', '2');
INSERT INTO `player_login` VALUES ('896', '126364870', '380', '2013-06-11 17:36:18', '0');
INSERT INTO `player_login` VALUES ('897', '26858118', '381', '2013-06-11 17:36:20', '0');
INSERT INTO `player_login` VALUES ('898', '88417990', '382', '2013-06-11 17:37:10', '0');
INSERT INTO `player_login` VALUES ('899', '3214400', '372', '2013-06-11 17:37:26', '2');
INSERT INTO `player_login` VALUES ('900', '37933318', '179', '2013-06-11 17:37:27', '2');
INSERT INTO `player_login` VALUES ('901', '87980230', '383', '2013-06-11 17:37:44', '0');
INSERT INTO `player_login` VALUES ('902', '3214400', '384', '2013-06-11 17:37:45', '0');
INSERT INTO `player_login` VALUES ('903', '55428102', '377', '2013-06-11 17:37:58', '2');
INSERT INTO `player_login` VALUES ('904', '21465350', '386', '2013-06-11 17:38:08', '0');
INSERT INTO `player_login` VALUES ('905', '37933318', '385', '2013-06-11 17:38:13', '0');
INSERT INTO `player_login` VALUES ('906', '55428102', '387', '2013-06-11 17:38:18', '0');
INSERT INTO `player_login` VALUES ('907', '92604550', '0', '2013-06-11 17:38:58', '2');
INSERT INTO `player_login` VALUES ('908', '21465350', '386', '2013-06-11 17:39:05', '2');
INSERT INTO `player_login` VALUES ('909', '70569542', '388', '2013-06-11 17:39:10', '0');
INSERT INTO `player_login` VALUES ('910', '21465350', '389', '2013-06-11 17:39:27', '0');
INSERT INTO `player_login` VALUES ('911', '126364870', '380', '2013-06-11 17:40:05', '2');
INSERT INTO `player_login` VALUES ('912', '126364870', '390', '2013-06-11 17:40:30', '0');
INSERT INTO `player_login` VALUES ('913', '3766534', '11', '2013-06-11 17:40:42', '2');
INSERT INTO `player_login` VALUES ('914', '87980230', '383', '2013-06-11 17:40:50', '2');
INSERT INTO `player_login` VALUES ('915', '29242630', '363', '2013-06-11 17:41:30', '2');
INSERT INTO `player_login` VALUES ('916', '70112518', '391', '2013-06-11 17:42:44', '0');
INSERT INTO `player_login` VALUES ('917', '37933318', '392', '2013-06-11 17:42:48', '0');
INSERT INTO `player_login` VALUES ('918', '58849286', '378', '2013-06-11 17:42:52', '2');
INSERT INTO `player_login` VALUES ('919', '21465350', '389', '2013-06-11 17:43:00', '2');
INSERT INTO `player_login` VALUES ('920', '57587782', '376', '2013-06-11 17:43:07', '2');
INSERT INTO `player_login` VALUES ('921', '58849286', '393', '2013-06-11 17:43:10', '0');
INSERT INTO `player_login` VALUES ('922', '21465350', '394', '2013-06-11 17:43:15', '0');
INSERT INTO `player_login` VALUES ('923', '58849286', '393', '2013-06-11 17:43:21', '2');
INSERT INTO `player_login` VALUES ('924', '21465350', '394', '2013-06-11 17:43:23', '2');
INSERT INTO `player_login` VALUES ('925', '3766534', '11', '2013-06-11 17:43:43', '0');
INSERT INTO `player_login` VALUES ('926', '37933318', '392', '2013-06-11 17:43:46', '2');
INSERT INTO `player_login` VALUES ('927', '10715776', '395', '2013-06-11 17:43:58', '0');
INSERT INTO `player_login` VALUES ('928', '87980230', '0', '2013-06-11 17:44:02', '2');
INSERT INTO `player_login` VALUES ('929', '37933318', '396', '2013-06-11 17:44:08', '0');
INSERT INTO `player_login` VALUES ('930', '33507462', '375', '2013-06-11 17:45:51', '2');
INSERT INTO `player_login` VALUES ('931', '87980230', '398', '2013-06-11 17:46:15', '0');
INSERT INTO `player_login` VALUES ('932', '10831686', '369', '2013-06-11 17:46:20', '2');
INSERT INTO `player_login` VALUES ('933', '12928006', '397', '2013-06-11 17:46:35', '0');
INSERT INTO `player_login` VALUES ('934', '72232582', '374', '2013-06-11 17:47:59', '2');
INSERT INTO `player_login` VALUES ('935', '129969990', '399', '2013-06-11 17:48:03', '0');
INSERT INTO `player_login` VALUES ('936', '37933318', '400', '2013-06-11 17:48:11', '0');
INSERT INTO `player_login` VALUES ('937', '29242630', '402', '2013-06-11 17:48:47', '0');
INSERT INTO `player_login` VALUES ('938', '72232582', '401', '2013-06-11 17:48:47', '0');
INSERT INTO `player_login` VALUES ('939', '10715776', '403', '2013-06-11 17:49:11', '0');
INSERT INTO `player_login` VALUES ('940', '126488902', '404', '2013-06-11 17:49:39', '0');
INSERT INTO `player_login` VALUES ('941', '127819142', '405', '2013-06-11 17:50:45', '0');
INSERT INTO `player_login` VALUES ('942', '73697414', '354', '2013-06-11 17:51:03', '2');
INSERT INTO `player_login` VALUES ('943', '87980230', '398', '2013-06-11 17:51:47', '2');
INSERT INTO `player_login` VALUES ('944', '65725190', '359', '2013-06-11 17:52:32', '2');
INSERT INTO `player_login` VALUES ('945', '42248390', '356', '2013-06-11 17:53:02', '2');
INSERT INTO `player_login` VALUES ('946', '114702790', '320', '2013-06-11 17:53:04', '0');
INSERT INTO `player_login` VALUES ('947', '68679430', '276', '2013-06-11 17:53:05', '2');
INSERT INTO `player_login` VALUES ('948', '92604550', '407', '2013-06-11 17:53:06', '0');
INSERT INTO `player_login` VALUES ('949', '37933318', '400', '2013-06-11 17:53:35', '2');
INSERT INTO `player_login` VALUES ('950', '37933318', '408', '2013-06-11 17:53:54', '0');
INSERT INTO `player_login` VALUES ('951', '70569542', '388', '2013-06-11 17:54:09', '2');
INSERT INTO `player_login` VALUES ('952', '72232582', '401', '2013-06-11 17:54:13', '2');
INSERT INTO `player_login` VALUES ('953', '70569542', '409', '2013-06-11 17:54:32', '0');
INSERT INTO `player_login` VALUES ('954', '72232582', '410', '2013-06-11 17:54:46', '0');
INSERT INTO `player_login` VALUES ('955', '37933318', '411', '2013-06-11 17:55:03', '0');
INSERT INTO `player_login` VALUES ('956', '126488902', '404', '2013-06-11 17:55:05', '2');
INSERT INTO `player_login` VALUES ('957', '70112518', '391', '2013-06-11 17:55:21', '2');
INSERT INTO `player_login` VALUES ('958', '114702790', '320', '2013-06-11 17:56:13', '2');
INSERT INTO `player_login` VALUES ('959', '26858118', '381', '2013-06-11 17:58:04', '2');
INSERT INTO `player_login` VALUES ('960', '29242630', '402', '2013-06-11 17:58:20', '2');
INSERT INTO `player_login` VALUES ('961', '55428102', '387', '2013-06-11 17:58:47', '2');
INSERT INTO `player_login` VALUES ('962', '127819142', '405', '2013-06-11 17:58:48', '2');
INSERT INTO `player_login` VALUES ('963', '73697414', '406', '2013-06-11 17:58:50', '0');
INSERT INTO `player_login` VALUES ('964', '73697414', '406', '2013-06-11 17:59:26', '2');
INSERT INTO `player_login` VALUES ('965', '78606598', '348', '2013-06-11 17:59:26', '2');
INSERT INTO `player_login` VALUES ('966', '11470854', '20', '2013-06-11 17:59:30', '2');
INSERT INTO `player_login` VALUES ('967', '37933318', '412', '2013-06-11 17:59:54', '0');
INSERT INTO `player_login` VALUES ('968', '129969990', '399', '2013-06-11 17:59:54', '2');
INSERT INTO `player_login` VALUES ('969', '60373638', '367', '2013-06-11 18:00:04', '2');
INSERT INTO `player_login` VALUES ('970', '37933318', '412', '2013-06-11 18:00:07', '2');
INSERT INTO `player_login` VALUES ('971', '3214400', '384', '2013-06-11 18:00:08', '2');
INSERT INTO `player_login` VALUES ('972', '70569542', '409', '2013-06-11 18:00:17', '2');
INSERT INTO `player_login` VALUES ('973', '10715776', '403', '2013-06-11 18:00:28', '2');
INSERT INTO `player_login` VALUES ('974', '92604550', '407', '2013-06-11 18:00:43', '2');
INSERT INTO `player_login` VALUES ('975', '12928006', '397', '2013-06-11 18:00:49', '2');
INSERT INTO `player_login` VALUES ('976', '72232582', '410', '2013-06-11 18:00:54', '2');
INSERT INTO `player_login` VALUES ('977', '37924166', '219', '2013-06-11 18:04:30', '0');
INSERT INTO `player_login` VALUES ('978', '37933318', '412', '2013-06-11 18:04:31', '0');
INSERT INTO `player_login` VALUES ('979', '73697414', '406', '2013-06-11 18:04:35', '0');
INSERT INTO `player_login` VALUES ('980', '92762950', '413', '2013-06-11 18:04:38', '0');
INSERT INTO `player_login` VALUES ('981', '68679430', '276', '2013-06-11 18:04:45', '0');
INSERT INTO `player_login` VALUES ('982', '72232582', '410', '2013-06-11 18:04:46', '0');
INSERT INTO `player_login` VALUES ('983', '55428102', '387', '2013-06-11 18:04:48', '0');
INSERT INTO `player_login` VALUES ('984', '78606598', '348', '2013-06-11 18:04:49', '0');
INSERT INTO `player_login` VALUES ('985', '54452614', '355', '2013-06-11 18:04:49', '0');
INSERT INTO `player_login` VALUES ('986', '29242630', '414', '2013-06-11 18:05:00', '0');
INSERT INTO `player_login` VALUES ('987', '126364870', '390', '2013-06-11 18:05:54', '0');
INSERT INTO `player_login` VALUES ('988', '60373638', '367', '2013-06-11 18:06:13', '0');
INSERT INTO `player_login` VALUES ('989', '70112518', '415', '2013-06-11 18:06:14', '0');
INSERT INTO `player_login` VALUES ('990', '92604550', '407', '2013-06-11 18:06:22', '0');
INSERT INTO `player_login` VALUES ('991', '87793606', '316', '2013-06-11 18:06:28', '0');
INSERT INTO `player_login` VALUES ('992', '60373638', '367', '2013-06-11 18:07:08', '2');
INSERT INTO `player_login` VALUES ('993', '715778AX', '365', '2013-06-11 18:08:13', '0');
INSERT INTO `player_login` VALUES ('994', '114702790', '320', '2013-06-11 18:08:27', '0');
INSERT INTO `player_login` VALUES ('995', '101316934', '416', '2013-06-11 18:08:47', '0');
INSERT INTO `player_login` VALUES ('996', '97048966', '417', '2013-06-11 18:08:57', '0');
INSERT INTO `player_login` VALUES ('997', '126364870', '390', '2013-06-11 18:09:19', '2');
INSERT INTO `player_login` VALUES ('998', '126364870', '418', '2013-06-11 18:09:35', '0');
INSERT INTO `player_login` VALUES ('999', '55428102', '387', '2013-06-11 18:10:11', '2');
INSERT INTO `player_login` VALUES ('1000', '126364870', '418', '2013-06-11 18:12:50', '2');
INSERT INTO `player_login` VALUES ('1001', '126364870', '419', '2013-06-11 18:13:06', '0');
INSERT INTO `player_login` VALUES ('1002', '55428102', '387', '2013-06-11 18:14:35', '0');
INSERT INTO `player_login` VALUES ('1003', '60373638', '367', '2013-06-11 18:14:53', '0');
INSERT INTO `player_login` VALUES ('1004', '72232582', '410', '2013-06-11 18:15:33', '2');
INSERT INTO `player_login` VALUES ('1005', '130182406', '420', '2013-06-11 18:15:38', '0');
INSERT INTO `player_login` VALUES ('1006', '101316934', '416', '2013-06-11 18:15:49', '2');
INSERT INTO `player_login` VALUES ('1007', '72232582', '421', '2013-06-11 18:15:58', '0');
INSERT INTO `player_login` VALUES ('1008', '37933318', '412', '2013-06-11 18:16:32', '2');
INSERT INTO `player_login` VALUES ('1009', '70112518', '415', '2013-06-11 18:16:35', '2');
INSERT INTO `player_login` VALUES ('1010', '37933318', '423', '2013-06-11 18:16:57', '0');
INSERT INTO `player_login` VALUES ('1011', '89603590', '422', '2013-06-11 18:17:08', '0');
INSERT INTO `player_login` VALUES ('1012', '59126598', '424', '2013-06-11 18:18:16', '0');
INSERT INTO `player_login` VALUES ('1013', '26858118', '381', '2013-06-11 18:19:29', '0');
INSERT INTO `player_login` VALUES ('1014', '101770374', '425', '2013-06-11 18:19:40', '0');
INSERT INTO `player_login` VALUES ('1015', '126364870', '427', '2013-06-11 18:19:42', '0');
INSERT INTO `player_login` VALUES ('1016', '70112518', '426', '2013-06-11 18:19:48', '0');
INSERT INTO `player_login` VALUES ('1017', '126364870', '427', '2013-06-11 18:19:54', '2');
INSERT INTO `player_login` VALUES ('1018', '96212550', '428', '2013-06-11 18:20:41', '0');
INSERT INTO `player_login` VALUES ('1019', '97048966', '429', '2013-06-11 18:21:16', '0');
INSERT INTO `player_login` VALUES ('1020', '715778AX', '365', '2013-06-11 18:21:47', '2');
INSERT INTO `player_login` VALUES ('1021', '715778AX', '430', '2013-06-11 18:22:04', '0');
INSERT INTO `player_login` VALUES ('1022', '715778AX', '430', '2013-06-11 18:23:40', '2');
INSERT INTO `player_login` VALUES ('1023', '49526150', '431', '2013-06-11 18:24:06', '0');
INSERT INTO `player_login` VALUES ('1024', '59126598', '424', '2013-06-11 18:24:18', '2');
INSERT INTO `player_login` VALUES ('1025', '26858118', '381', '2013-06-11 18:24:43', '2');
INSERT INTO `player_login` VALUES ('1026', '59126598', '433', '2013-06-11 18:24:49', '0');
INSERT INTO `player_login` VALUES ('1027', '94101638', '432', '2013-06-11 18:24:50', '0');
INSERT INTO `player_login` VALUES ('1028', '26858118', '434', '2013-06-11 18:24:59', '0');
INSERT INTO `player_login` VALUES ('1029', '59126598', '433', '2013-06-11 18:25:03', '2');
INSERT INTO `player_login` VALUES ('1030', '59126598', '433', '2013-06-11 18:25:15', '0');
INSERT INTO `player_login` VALUES ('1031', '82023942', '435', '2013-06-11 18:26:41', '0');
INSERT INTO `player_login` VALUES ('1032', '92604550', '407', '2013-06-11 18:28:07', '2');
INSERT INTO `player_login` VALUES ('1033', '101770374', '425', '2013-06-11 18:29:33', '2');
INSERT INTO `player_login` VALUES ('1034', '60373638', '367', '2013-06-11 18:30:33', '2');
INSERT INTO `player_login` VALUES ('1035', '92604550', '407', '2013-06-11 18:30:34', '0');
INSERT INTO `player_login` VALUES ('1036', '129418182', '436', '2013-06-11 18:31:17', '0');
INSERT INTO `player_login` VALUES ('1037', '129561542', '437', '2013-06-11 18:31:38', '0');
INSERT INTO `player_login` VALUES ('1038', '71661254', '438', '2013-06-11 18:32:07', '0');
INSERT INTO `player_login` VALUES ('1039', '101770374', '425', '2013-06-11 18:32:07', '0');
INSERT INTO `player_login` VALUES ('1040', '87793606', '316', '2013-06-11 18:33:10', '2');
INSERT INTO `player_login` VALUES ('1041', '94101638', '432', '2013-06-11 18:33:20', '2');
INSERT INTO `player_login` VALUES ('1042', '87793606', '316', '2013-06-11 18:33:28', '0');
INSERT INTO `player_login` VALUES ('1043', '94101638', '440', '2013-06-11 18:33:42', '0');
INSERT INTO `player_login` VALUES ('1044', '93802822', '441', '2013-06-11 18:34:19', '0');
INSERT INTO `player_login` VALUES ('1045', '48427590', '443', '2013-06-11 18:34:22', '0');
INSERT INTO `player_login` VALUES ('1046', '51291526', '442', '2013-06-11 18:34:22', '0');
INSERT INTO `player_login` VALUES ('1047', '73697414', '439', '2013-06-11 18:35:06', '0');
INSERT INTO `player_login` VALUES ('1048', '59126598', '433', '2013-06-11 18:35:22', '2');
INSERT INTO `player_login` VALUES ('1049', '59126598', '444', '2013-06-11 18:35:48', '0');
INSERT INTO `player_login` VALUES ('1050', '94101638', '440', '2013-06-11 18:37:03', '2');
INSERT INTO `player_login` VALUES ('1051', '94101638', '446', '2013-06-11 18:37:20', '0');
INSERT INTO `player_login` VALUES ('1052', '129561542', '445', '2013-06-11 18:37:26', '0');
INSERT INTO `player_login` VALUES ('1053', '92604550', '407', '2013-06-11 18:38:03', '2');
INSERT INTO `player_login` VALUES ('1054', '94101638', '446', '2013-06-11 18:38:20', '2');
INSERT INTO `player_login` VALUES ('1055', '92604550', '447', '2013-06-11 18:38:23', '0');
INSERT INTO `player_login` VALUES ('1056', '72232582', '421', '2013-06-11 18:38:24', '2');
INSERT INTO `player_login` VALUES ('1057', '92762950', '413', '2013-06-11 18:38:26', '2');
INSERT INTO `player_login` VALUES ('1058', '130182406', '420', '2013-06-11 18:39:14', '2');
INSERT INTO `player_login` VALUES ('1059', '65725190', '359', '2013-06-11 18:39:25', '0');
INSERT INTO `player_login` VALUES ('1060', '48427590', '443', '2013-06-11 18:39:38', '2');
INSERT INTO `player_login` VALUES ('1061', '130182406', '448', '2013-06-11 18:39:48', '0');
INSERT INTO `player_login` VALUES ('1062', '51291526', '442', '2013-06-11 18:40:10', '2');
INSERT INTO `player_login` VALUES ('1063', '38392390', '449', '2013-06-11 18:44:16', '0');
INSERT INTO `player_login` VALUES ('1064', '96212550', '428', '2013-06-11 18:44:27', '2');
INSERT INTO `player_login` VALUES ('1065', '37924166', '219', '2013-06-11 18:48:54', '2');
INSERT INTO `player_login` VALUES ('1066', '73697414', '439', '2013-06-11 18:49:22', '2');
INSERT INTO `player_login` VALUES ('1067', '37933318', '423', '2013-06-11 18:50:16', '2');
INSERT INTO `player_login` VALUES ('1068', '42713158', '450', '2013-06-11 18:51:09', '0');
INSERT INTO `player_login` VALUES ('1069', '86434182', '451', '2013-06-11 18:53:10', '0');
INSERT INTO `player_login` VALUES ('1070', '73697414', '452', '2013-06-11 18:53:55', '0');
INSERT INTO `player_login` VALUES ('1071', '82023942', '435', '2013-06-11 18:54:56', '2');
INSERT INTO `player_login` VALUES ('1072', '70112518', '426', '2013-06-11 18:55:09', '2');
INSERT INTO `player_login` VALUES ('1073', '82023942', '453', '2013-06-11 18:55:21', '0');
INSERT INTO `player_login` VALUES ('1074', '89603590', '422', '2013-06-11 18:55:32', '2');
INSERT INTO `player_login` VALUES ('1075', '10831686', '369', '2013-06-11 18:55:43', '0');
INSERT INTO `player_login` VALUES ('1076', '70112518', '454', '2013-06-11 18:55:50', '0');
INSERT INTO `player_login` VALUES ('1077', '129418182', '436', '2013-06-11 18:56:07', '2');
INSERT INTO `player_login` VALUES ('1078', '129418182', '455', '2013-06-11 18:56:28', '0');
INSERT INTO `player_login` VALUES ('1079', '47850374', '456', '2013-06-11 18:56:43', '0');
INSERT INTO `player_login` VALUES ('1080', '101770374', '425', '2013-06-11 18:57:18', '2');
INSERT INTO `player_login` VALUES ('1081', '130182406', '448', '2013-06-11 18:59:18', '2');
INSERT INTO `player_login` VALUES ('1082', '130182406', '457', '2013-06-11 18:59:56', '0');
INSERT INTO `player_login` VALUES ('1083', '73697414', '452', '2013-06-11 18:59:57', '2');
INSERT INTO `player_login` VALUES ('1084', '102666694', '459', '2013-06-11 19:00:50', '0');
INSERT INTO `player_login` VALUES ('1085', '70112518', '454', '2013-06-11 19:01:54', '2');
INSERT INTO `player_login` VALUES ('1086', '73697414', '458', '2013-06-11 19:01:55', '0');
INSERT INTO `player_login` VALUES ('1087', '129561542', '460', '2013-06-11 19:02:11', '0');
INSERT INTO `player_login` VALUES ('1088', '70112518', '461', '2013-06-11 19:02:24', '0');
INSERT INTO `player_login` VALUES ('1089', '93802822', '441', '2013-06-11 19:03:38', '2');
INSERT INTO `player_login` VALUES ('1090', '11470854', '20', '2013-06-11 19:03:54', '0');
INSERT INTO `player_login` VALUES ('1091', '38392390', '449', '2013-06-11 19:04:53', '2');
INSERT INTO `player_login` VALUES ('1092', '38494662', '462', '2013-06-11 19:05:04', '0');
INSERT INTO `player_login` VALUES ('1093', '38392390', '463', '2013-06-11 19:05:22', '0');
INSERT INTO `player_login` VALUES ('1094', '129418182', '455', '2013-06-11 19:05:57', '2');
INSERT INTO `player_login` VALUES ('1095', '129418182', '464', '2013-06-11 19:06:21', '0');
INSERT INTO `player_login` VALUES ('1096', '30132614', '465', '2013-06-11 19:06:49', '0');
INSERT INTO `player_login` VALUES ('1097', '38392390', '463', '2013-06-11 19:09:41', '2');
INSERT INTO `player_login` VALUES ('1098', '38392390', '466', '2013-06-11 19:09:59', '0');
INSERT INTO `player_login` VALUES ('1099', '112818630', '467', '2013-06-11 19:10:37', '0');
INSERT INTO `player_login` VALUES ('1100', '112818630', '467', '2013-06-11 19:10:53', '2');
INSERT INTO `player_login` VALUES ('1101', '78606598', '348', '2013-06-11 19:10:54', '2');
INSERT INTO `player_login` VALUES ('1102', '129418182', '464', '2013-06-11 19:12:31', '2');
INSERT INTO `player_login` VALUES ('1103', '54452614', '355', '2013-06-11 19:12:39', '2');
INSERT INTO `player_login` VALUES ('1104', '129418182', '468', '2013-06-11 19:12:50', '0');
INSERT INTO `player_login` VALUES ('1105', '54452614', '469', '2013-06-11 19:12:58', '0');
INSERT INTO `player_login` VALUES ('1106', '54452614', '469', '2013-06-11 19:13:39', '2');
INSERT INTO `player_login` VALUES ('1107', '59126598', '444', '2013-06-11 19:13:47', '2');
INSERT INTO `player_login` VALUES ('1108', '54452614', '470', '2013-06-11 19:13:59', '0');
INSERT INTO `player_login` VALUES ('1109', '59126598', '471', '2013-06-11 19:14:12', '0');
INSERT INTO `player_login` VALUES ('1110', '70112518', '461', '2013-06-11 19:14:40', '2');
INSERT INTO `player_login` VALUES ('1111', '30132614', '465', '2013-06-11 19:14:56', '2');
INSERT INTO `player_login` VALUES ('1112', '54452614', '470', '2013-06-11 19:15:06', '2');
INSERT INTO `player_login` VALUES ('1113', '59126598', '471', '2013-06-11 19:15:08', '2');
INSERT INTO `player_login` VALUES ('1114', '54452614', '472', '2013-06-11 19:15:18', '0');
INSERT INTO `player_login` VALUES ('1115', '129418182', '468', '2013-06-11 19:15:38', '2');
INSERT INTO `player_login` VALUES ('1116', '129418182', '474', '2013-06-11 19:15:54', '0');
INSERT INTO `player_login` VALUES ('1117', '121339078', '473', '2013-06-11 19:16:04', '0');
INSERT INTO `player_login` VALUES ('1118', '129822534', '475', '2013-06-11 19:17:01', '0');
INSERT INTO `player_login` VALUES ('1119', '70112518', '0', '2013-06-11 19:17:11', '2');
INSERT INTO `player_login` VALUES ('1120', '54452614', '472', '2013-06-11 19:17:15', '2');
INSERT INTO `player_login` VALUES ('1121', '54452614', '476', '2013-06-11 19:17:29', '0');
INSERT INTO `player_login` VALUES ('1122', '129418182', '474', '2013-06-11 19:18:17', '2');
INSERT INTO `player_login` VALUES ('1123', '45013318', '0', '2013-06-11 19:19:01', '2');
INSERT INTO `player_login` VALUES ('1124', '54452614', '476', '2013-06-11 19:19:03', '2');
INSERT INTO `player_login` VALUES ('1125', '54452614', '478', '2013-06-11 19:19:16', '0');
INSERT INTO `player_login` VALUES ('1126', '70112518', '479', '2013-06-11 19:19:39', '0');
INSERT INTO `player_login` VALUES ('1127', '19403718', '480', '2013-06-11 19:19:44', '0');
INSERT INTO `player_login` VALUES ('1128', '129822534', '475', '2013-06-11 19:20:27', '2');
INSERT INTO `player_login` VALUES ('1129', '37703494', '481', '2013-06-11 19:20:41', '0');
INSERT INTO `player_login` VALUES ('1130', '129822534', '482', '2013-06-11 19:20:51', '0');
INSERT INTO `player_login` VALUES ('1131', '54452614', '478', '2013-06-11 19:23:14', '2');
INSERT INTO `player_login` VALUES ('1132', '70112518', '479', '2013-06-11 19:23:15', '2');
INSERT INTO `player_login` VALUES ('1133', '23384582', '483', '2013-06-11 19:23:22', '0');
INSERT INTO `player_login` VALUES ('1134', '54452614', '484', '2013-06-11 19:23:28', '0');
INSERT INTO `player_login` VALUES ('1135', '23384582', '483', '2013-06-11 19:24:04', '2');
INSERT INTO `player_login` VALUES ('1136', '66009862', '485', '2013-06-11 19:24:40', '0');
INSERT INTO `player_login` VALUES ('1137', '30132614', '465', '2013-06-11 19:24:43', '0');
INSERT INTO `player_login` VALUES ('1138', '20026630', '486', '2013-06-11 19:24:58', '0');
INSERT INTO `player_login` VALUES ('1139', '30132614', '465', '2013-06-11 19:25:14', '2');
INSERT INTO `player_login` VALUES ('1140', '70112518', '487', '2013-06-11 19:26:57', '0');
INSERT INTO `player_login` VALUES ('1141', '20026630', '486', '2013-06-11 19:27:13', '2');
INSERT INTO `player_login` VALUES ('1142', '65725190', '359', '2013-06-11 19:27:26', '2');
INSERT INTO `player_login` VALUES ('1143', '20026630', '488', '2013-06-11 19:27:30', '0');
INSERT INTO `player_login` VALUES ('1144', '65725190', '359', '2013-06-11 19:27:47', '0');
INSERT INTO `player_login` VALUES ('1145', '25839238', '489', '2013-06-11 19:28:33', '0');
INSERT INTO `player_login` VALUES ('1146', '129822534', '482', '2013-06-11 19:29:50', '2');
INSERT INTO `player_login` VALUES ('1147', '129822534', '490', '2013-06-11 19:30:16', '0');
INSERT INTO `player_login` VALUES ('1148', '70112518', '487', '2013-06-11 19:30:49', '2');
INSERT INTO `player_login` VALUES ('1149', '24555782', '491', '2013-06-11 19:31:28', '0');
INSERT INTO `player_login` VALUES ('1150', '4253254', '492', '2013-06-11 19:32:35', '0');
INSERT INTO `player_login` VALUES ('1151', '4253254', '492', '2013-06-11 19:32:44', '2');
INSERT INTO `player_login` VALUES ('1152', '25839238', '489', '2013-06-11 19:32:51', '2');
INSERT INTO `player_login` VALUES ('1153', '59729414', '493', '2013-06-11 19:33:04', '0');
INSERT INTO `player_login` VALUES ('1154', '38494662', '462', '2013-06-11 19:33:08', '2');
INSERT INTO `player_login` VALUES ('1155', '38494662', '494', '2013-06-11 19:33:33', '0');
INSERT INTO `player_login` VALUES ('1156', '70112518', '496', '2013-06-11 19:36:19', '0');
INSERT INTO `player_login` VALUES ('1157', '16576262', '495', '2013-06-11 19:36:20', '0');
INSERT INTO `player_login` VALUES ('1158', '19403718', '480', '2013-06-11 19:38:37', '2');
INSERT INTO `player_login` VALUES ('1159', '24555782', '491', '2013-06-11 19:40:55', '2');
INSERT INTO `player_login` VALUES ('1160', '38392390', '466', '2013-06-11 19:41:03', '2');
INSERT INTO `player_login` VALUES ('1161', '87793606', '316', '2013-06-11 19:41:22', '2');
INSERT INTO `player_login` VALUES ('1162', '70112518', '496', '2013-06-11 19:42:58', '2');
INSERT INTO `player_login` VALUES ('1163', '68679430', '276', '2013-06-11 19:44:34', '2');
INSERT INTO `player_login` VALUES ('1164', '51056582', '497', '2013-06-11 19:44:37', '0');
INSERT INTO `player_login` VALUES ('1165', '87793606', '316', '2013-06-11 19:45:25', '0');
INSERT INTO `player_login` VALUES ('1166', '70112518', '498', '2013-06-11 19:45:52', '0');
INSERT INTO `player_login` VALUES ('1167', '65725190', '359', '2013-06-11 19:46:30', '2');
INSERT INTO `player_login` VALUES ('1168', '16576262', '495', '2013-06-11 19:46:32', '2');
INSERT INTO `player_login` VALUES ('1169', '16576262', '499', '2013-06-11 19:47:05', '0');
INSERT INTO `player_login` VALUES ('1170', '65725190', '359', '2013-06-11 19:47:44', '0');
INSERT INTO `player_login` VALUES ('1171', '119295750', '500', '2013-06-11 19:48:19', '0');
INSERT INTO `player_login` VALUES ('1172', '119295750', '500', '2013-06-11 19:49:40', '2');
INSERT INTO `player_login` VALUES ('1173', '16576262', '499', '2013-06-11 19:50:04', '2');
INSERT INTO `player_login` VALUES ('1174', '51056582', '497', '2013-06-11 19:50:22', '2');
INSERT INTO `player_login` VALUES ('1175', '130182406', '457', '2013-06-11 19:50:34', '2');
INSERT INTO `player_login` VALUES ('1176', '51056582', '501', '2013-06-11 19:50:47', '0');
INSERT INTO `player_login` VALUES ('1177', '71661254', '438', '2013-06-11 19:52:14', '2');
INSERT INTO `player_login` VALUES ('1178', '10831686', '502', '2013-06-11 19:52:14', '0');
INSERT INTO `player_login` VALUES ('1179', '38392390', '466', '2013-06-11 19:56:19', '0');
INSERT INTO `player_login` VALUES ('1180', '70112518', '498', '2013-06-11 19:59:23', '2');
INSERT INTO `player_login` VALUES ('1181', '28935366', '503', '2013-06-11 19:59:53', '0');
INSERT INTO `player_login` VALUES ('1182', '70112518', '504', '2013-06-11 20:00:02', '0');
INSERT INTO `player_login` VALUES ('1183', '11470854', '20', '2013-06-11 20:00:48', '2');
INSERT INTO `player_login` VALUES ('1184', '73697414', '458', '2013-06-11 20:01:13', '2');
INSERT INTO `player_login` VALUES ('1185', '66009862', '0', '2013-06-11 20:01:24', '2');
INSERT INTO `player_login` VALUES ('1186', '73697414', '505', '2013-06-11 20:01:39', '0');
INSERT INTO `player_login` VALUES ('1187', '10831686', '502', '2013-06-11 20:03:27', '2');
INSERT INTO `player_login` VALUES ('1188', '66009862', '485', '2013-06-11 20:03:30', '0');
INSERT INTO `player_login` VALUES ('1189', '38494662', '494', '2013-06-11 20:03:35', '2');
INSERT INTO `player_login` VALUES ('1190', '30924678', '506', '2013-06-11 20:03:36', '0');
INSERT INTO `player_login` VALUES ('1191', '10831686', '507', '2013-06-11 20:03:47', '0');
INSERT INTO `player_login` VALUES ('1192', '38494662', '508', '2013-06-11 20:04:02', '0');
INSERT INTO `player_login` VALUES ('1193', '73697414', '505', '2013-06-11 20:04:43', '2');
INSERT INTO `player_login` VALUES ('1194', '121339078', '473', '2013-06-11 20:04:52', '2');
INSERT INTO `player_login` VALUES ('1195', '121339078', '473', '2013-06-11 20:05:47', '0');
INSERT INTO `player_login` VALUES ('1196', '38392390', '466', '2013-06-11 20:07:07', '2');
INSERT INTO `player_login` VALUES ('1197', '56704518', '509', '2013-06-11 20:07:09', '2');
INSERT INTO `player_login` VALUES ('1198', '20026630', '488', '2013-06-11 20:07:12', '2');
INSERT INTO `player_login` VALUES ('1199', '87793606', '316', '2013-06-11 20:07:14', '2');
INSERT INTO `player_login` VALUES ('1200', '65725190', '359', '2013-06-11 20:07:29', '2');
INSERT INTO `player_login` VALUES ('1201', '118762630', '510', '2013-06-11 20:07:47', '0');
INSERT INTO `player_login` VALUES ('1202', '118762630', '510', '2013-06-11 20:08:00', '2');
INSERT INTO `player_login` VALUES ('1203', '114702790', '320', '2013-06-11 20:08:15', '2');
INSERT INTO `player_login` VALUES ('1204', '86434182', '451', '2013-06-11 20:09:35', '2');
INSERT INTO `player_login` VALUES ('1205', '54452614', '484', '2013-06-11 20:09:38', '2');
INSERT INTO `player_login` VALUES ('1206', '86434182', '511', '2013-06-11 20:09:58', '0');
INSERT INTO `player_login` VALUES ('1207', '56704518', '509', '2013-06-11 20:10:04', '0');
INSERT INTO `player_login` VALUES ('1208', '56704518', '509', '2013-06-11 20:10:37', '2');
INSERT INTO `player_login` VALUES ('1209', '4668736', '512', '2013-06-11 20:12:45', '0');
INSERT INTO `player_login` VALUES ('1210', '59729414', '493', '2013-06-11 20:13:00', '2');
INSERT INTO `player_login` VALUES ('1211', '4668736', '512', '2013-06-11 20:13:04', '2');
INSERT INTO `player_login` VALUES ('1212', '115325126', '513', '2013-06-11 20:13:41', '0');
INSERT INTO `player_login` VALUES ('1213', '51056582', '501', '2013-06-11 20:13:52', '2');
INSERT INTO `player_login` VALUES ('1214', '72232582', '421', '2013-06-11 20:14:36', '0');
INSERT INTO `player_login` VALUES ('1215', '86434182', '511', '2013-06-11 20:14:51', '2');
INSERT INTO `player_login` VALUES ('1216', '5785408', '514', '2013-06-11 20:15:00', '0');
INSERT INTO `player_login` VALUES ('1217', '86434182', '515', '2013-06-11 20:15:12', '0');
INSERT INTO `player_login` VALUES ('1218', '28935366', '503', '2013-06-11 20:16:15', '2');
INSERT INTO `player_login` VALUES ('1219', '26858118', '434', '2013-06-11 20:16:19', '2');
INSERT INTO `player_login` VALUES ('1220', '55428102', '387', '2013-06-11 20:16:21', '2');
INSERT INTO `player_login` VALUES ('1221', '29242630', '414', '2013-06-11 20:16:31', '2');
INSERT INTO `player_login` VALUES ('1222', '70112518', '504', '2013-06-11 20:17:15', '2');
INSERT INTO `player_login` VALUES ('1223', '10977472', '516', '2013-06-11 20:17:33', '0');
INSERT INTO `player_login` VALUES ('1224', '10977472', '516', '2013-06-11 20:17:45', '2');
INSERT INTO `player_login` VALUES ('1225', '115325126', '513', '2013-06-11 20:19:09', '2');
INSERT INTO `player_login` VALUES ('1226', '115325126', '518', '2013-06-11 20:19:58', '0');
INSERT INTO `player_login` VALUES ('1227', '125681414', '0', '2013-06-11 20:20:49', '2');
INSERT INTO `player_login` VALUES ('1228', '101316934', '416', '2013-06-11 20:22:15', '0');
INSERT INTO `player_login` VALUES ('1229', '94642118', '0', '2013-06-11 20:22:55', '2');
INSERT INTO `player_login` VALUES ('1230', '10831686', '507', '2013-06-11 20:22:57', '2');
INSERT INTO `player_login` VALUES ('1231', '115325126', '518', '2013-06-11 20:25:01', '2');
INSERT INTO `player_login` VALUES ('1232', '38494662', '508', '2013-06-11 20:27:10', '2');
INSERT INTO `player_login` VALUES ('1233', '38494662', '520', '2013-06-11 20:28:03', '0');
INSERT INTO `player_login` VALUES ('1234', '38392390', '466', '2013-06-11 20:28:10', '0');
INSERT INTO `player_login` VALUES ('1235', '130477254', '521', '2013-06-11 20:28:25', '0');
INSERT INTO `player_login` VALUES ('1236', '37703494', '481', '2013-06-11 20:28:59', '2');
INSERT INTO `player_login` VALUES ('1237', '33609542', '522', '2013-06-11 20:29:14', '0');
INSERT INTO `player_login` VALUES ('1238', '38392390', '466', '2013-06-11 20:30:02', '2');
INSERT INTO `player_login` VALUES ('1239', '33609542', '522', '2013-06-11 20:31:22', '2');
INSERT INTO `player_login` VALUES ('1240', '37703494', '481', '2013-06-11 20:32:18', '0');
INSERT INTO `player_login` VALUES ('1241', '38494662', '520', '2013-06-11 20:33:36', '2');
INSERT INTO `player_login` VALUES ('1242', '128086086', '0', '2013-06-11 20:33:46', '2');
INSERT INTO `player_login` VALUES ('1243', '130477254', '521', '2013-06-11 20:34:25', '2');
INSERT INTO `player_login` VALUES ('1244', '30924678', '506', '2013-06-11 20:34:34', '2');
INSERT INTO `player_login` VALUES ('1245', '30924678', '524', '2013-06-11 20:35:12', '0');
INSERT INTO `player_login` VALUES ('1246', '30924678', '524', '2013-06-11 20:35:37', '2');
INSERT INTO `player_login` VALUES ('1247', '30924678', '524', '2013-06-11 20:35:51', '0');
INSERT INTO `player_login` VALUES ('1248', '30924678', '524', '2013-06-11 20:36:04', '2');
INSERT INTO `player_login` VALUES ('1249', '113012870', '525', '2013-06-11 20:37:13', '0');
INSERT INTO `player_login` VALUES ('1250', '113012870', '525', '2013-06-11 20:37:32', '2');
INSERT INTO `player_login` VALUES ('1251', '15189318', '527', '2013-06-11 20:37:53', '0');
INSERT INTO `player_login` VALUES ('1252', '130716614', '526', '2013-06-11 20:37:54', '0');
INSERT INTO `player_login` VALUES ('1253', '40316806', '528', '2013-06-11 20:38:35', '0');
INSERT INTO `player_login` VALUES ('1254', '42713158', '450', '2013-06-11 20:38:42', '2');
INSERT INTO `player_login` VALUES ('1255', '40316806', '528', '2013-06-11 20:40:18', '2');
INSERT INTO `player_login` VALUES ('1256', '19470086', '529', '2013-06-11 20:40:42', '0');
INSERT INTO `player_login` VALUES ('1257', '19470086', '529', '2013-06-11 20:40:59', '2');
INSERT INTO `player_login` VALUES ('1258', '6485766', '531', '2013-06-11 20:41:30', '0');
INSERT INTO `player_login` VALUES ('1259', '55568646', '530', '2013-06-11 20:41:39', '0');
INSERT INTO `player_login` VALUES ('1260', '6485766', '531', '2013-06-11 20:41:43', '2');
INSERT INTO `player_login` VALUES ('1261', '63251974', '533', '2013-06-11 20:42:03', '0');
INSERT INTO `player_login` VALUES ('1262', '70756614', '532', '2013-06-11 20:42:07', '0');
INSERT INTO `player_login` VALUES ('1263', '70756614', '532', '2013-06-11 20:42:22', '2');
INSERT INTO `player_login` VALUES ('1264', '70756614', '532', '2013-06-11 20:42:36', '0');
INSERT INTO `player_login` VALUES ('1265', '70756614', '532', '2013-06-11 20:42:54', '2');
INSERT INTO `player_login` VALUES ('1266', '37704070', '534', '2013-06-11 20:43:49', '0');
INSERT INTO `player_login` VALUES ('1267', '62601350', '535', '2013-06-11 20:44:36', '0');
INSERT INTO `player_login` VALUES ('1268', '63251974', '533', '2013-06-11 20:45:44', '2');
INSERT INTO `player_login` VALUES ('1269', '55568646', '530', '2013-06-11 20:45:50', '2');
INSERT INTO `player_login` VALUES ('1270', '63251974', '533', '2013-06-11 20:46:02', '0');
INSERT INTO `player_login` VALUES ('1271', '62601350', '535', '2013-06-11 20:46:02', '2');
INSERT INTO `player_login` VALUES ('1272', '62601350', '535', '2013-06-11 20:46:20', '0');
INSERT INTO `player_login` VALUES ('1273', '72232582', '421', '2013-06-11 20:47:27', '2');
INSERT INTO `player_login` VALUES ('1274', '5785408', '514', '2013-06-11 20:47:28', '2');
INSERT INTO `player_login` VALUES ('1275', '55568646', '530', '2013-06-11 20:47:47', '0');
INSERT INTO `player_login` VALUES ('1276', '55568646', '530', '2013-06-11 20:48:14', '2');
INSERT INTO `player_login` VALUES ('1277', '121924038', '536', '2013-06-11 20:48:53', '0');
INSERT INTO `player_login` VALUES ('1278', '37704070', '534', '2013-06-11 20:49:00', '2');
INSERT INTO `player_login` VALUES ('1279', '13415430', '537', '2013-06-11 20:50:31', '0');
INSERT INTO `player_login` VALUES ('1280', '101316934', '416', '2013-06-11 20:50:37', '2');
INSERT INTO `player_login` VALUES ('1281', '66009862', '485', '2013-06-11 20:51:17', '2');
INSERT INTO `player_login` VALUES ('1282', '63251974', '533', '2013-06-11 20:51:54', '2');
INSERT INTO `player_login` VALUES ('1283', '63251974', '538', '2013-06-11 20:52:14', '0');
INSERT INTO `player_login` VALUES ('1284', '63251974', '538', '2013-06-11 20:52:21', '2');
INSERT INTO `player_login` VALUES ('1285', '63251974', '538', '2013-06-11 20:52:33', '0');
INSERT INTO `player_login` VALUES ('1286', '121924038', '536', '2013-06-11 20:52:38', '2');
INSERT INTO `player_login` VALUES ('1287', '130716614', '526', '2013-06-11 20:52:46', '2');
INSERT INTO `player_login` VALUES ('1288', '13415430', '537', '2013-06-11 20:52:47', '2');
INSERT INTO `player_login` VALUES ('1289', '15189318', '527', '2013-06-11 20:52:56', '2');
INSERT INTO `player_login` VALUES ('1290', '130712262', '539', '2013-06-11 20:53:40', '0');
INSERT INTO `player_login` VALUES ('1291', '15189318', '527', '2013-06-11 20:53:40', '0');
INSERT INTO `player_login` VALUES ('1292', '121339078', '473', '2013-06-11 20:53:49', '2');
INSERT INTO `player_login` VALUES ('1293', '102666694', '459', '2013-06-11 20:53:57', '2');
INSERT INTO `player_login` VALUES ('1294', '27143366', '540', '2013-06-11 20:56:00', '0');
INSERT INTO `player_login` VALUES ('1295', '130712262', '539', '2013-06-11 20:56:01', '2');
INSERT INTO `player_login` VALUES ('1296', '27143366', '540', '2013-06-11 20:58:02', '2');
INSERT INTO `player_login` VALUES ('1297', '15189318', '527', '2013-06-11 20:58:35', '2');
INSERT INTO `player_login` VALUES ('1298', '86434182', '515', '2013-06-11 21:04:36', '2');
INSERT INTO `player_login` VALUES ('1299', '37703494', '481', '2013-06-11 21:06:39', '2');
INSERT INTO `player_login` VALUES ('1300', '62601350', '535', '2013-06-11 21:07:59', '2');
INSERT INTO `player_login` VALUES ('1301', '63251974', '538', '2013-06-11 21:08:36', '2');
INSERT INTO `player_login` VALUES ('1302', '47850374', '456', '2013-06-11 21:09:59', '2');
INSERT INTO `player_login` VALUES ('1303', '101390918', '207', '2013-06-11 21:18:36', '0');
INSERT INTO `player_login` VALUES ('1304', '86434182', '515', '2013-06-11 21:19:51', '0');
INSERT INTO `player_login` VALUES ('1305', '47850374', '456', '2013-06-11 21:20:34', '0');
INSERT INTO `player_login` VALUES ('1306', '112529158', '541', '2013-06-11 21:21:28', '0');
INSERT INTO `player_login` VALUES ('1307', '112529158', '541', '2013-06-11 21:21:52', '2');
INSERT INTO `player_login` VALUES ('1308', '66675974', '306', '2013-06-11 21:23:47', '0');
INSERT INTO `player_login` VALUES ('1309', '66675974', '306', '2013-06-11 21:23:52', '2');
INSERT INTO `player_login` VALUES ('1310', '66675974', '306', '2013-06-11 21:24:06', '0');
INSERT INTO `player_login` VALUES ('1311', '6964100', '0', '2013-06-11 21:29:32', '2');
INSERT INTO `player_login` VALUES ('1312', '71661254', '542', '2013-06-11 21:30:23', '0');
INSERT INTO `player_login` VALUES ('1313', '71661254', '542', '2013-06-11 21:31:27', '2');
INSERT INTO `player_login` VALUES ('1314', '71661254', '542', '2013-06-11 21:31:42', '0');
INSERT INTO `player_login` VALUES ('1315', '117430406', '543', '2013-06-11 21:32:18', '0');
INSERT INTO `player_login` VALUES ('1316', '117430406', '543', '2013-06-11 21:32:28', '2');
INSERT INTO `player_login` VALUES ('1317', '122497094', '544', '2013-06-11 21:38:47', '0');
INSERT INTO `player_login` VALUES ('1318', '71661254', '542', '2013-06-11 21:38:51', '2');
INSERT INTO `player_login` VALUES ('1319', '71661254', '545', '2013-06-11 21:39:04', '0');
INSERT INTO `player_login` VALUES ('1320', '71661254', '545', '2013-06-11 21:39:10', '2');
INSERT INTO `player_login` VALUES ('1321', '71661254', '545', '2013-06-11 21:39:21', '0');
INSERT INTO `player_login` VALUES ('1322', '122497094', '544', '2013-06-11 21:41:17', '2');
INSERT INTO `player_login` VALUES ('1323', '17902278', '546', '2013-06-11 21:43:16', '0');
INSERT INTO `player_login` VALUES ('1324', '91511366', '324', '2013-06-11 21:43:36', '0');
INSERT INTO `player_login` VALUES ('1325', '17902278', '546', '2013-06-11 21:43:48', '2');
INSERT INTO `player_login` VALUES ('1326', '70884870', '217', '2013-06-11 21:45:47', '0');
INSERT INTO `player_login` VALUES ('1327', '91511366', '324', '2013-06-11 21:46:08', '2');
INSERT INTO `player_login` VALUES ('1328', '71661254', '545', '2013-06-11 21:52:01', '2');
INSERT INTO `player_login` VALUES ('1329', '71661254', '547', '2013-06-11 21:52:23', '0');
INSERT INTO `player_login` VALUES ('1330', '71661254', '547', '2013-06-11 21:52:30', '2');
INSERT INTO `player_login` VALUES ('1331', '71661254', '547', '2013-06-11 21:52:41', '0');
INSERT INTO `player_login` VALUES ('1332', '71661254', '547', '2013-06-11 22:04:15', '2');
INSERT INTO `player_login` VALUES ('1333', '71661254', '547', '2013-06-11 22:04:29', '0');
INSERT INTO `player_login` VALUES ('1334', '70884870', '217', '2013-06-11 22:07:59', '2');
INSERT INTO `player_login` VALUES ('1335', '70884870', '548', '2013-06-11 22:08:34', '0');
INSERT INTO `player_login` VALUES ('1336', '70884870', '548', '2013-06-11 22:09:41', '2');
INSERT INTO `player_login` VALUES ('1337', '70884870', '548', '2013-06-11 22:09:59', '0');
INSERT INTO `player_login` VALUES ('1338', '70884870', '548', '2013-06-11 22:10:04', '2');
INSERT INTO `player_login` VALUES ('1339', '70884870', '548', '2013-06-11 22:10:19', '0');
INSERT INTO `player_login` VALUES ('1340', '70884870', '548', '2013-06-11 22:15:10', '2');
INSERT INTO `player_login` VALUES ('1341', '70884870', '548', '2013-06-11 22:15:27', '0');
INSERT INTO `player_login` VALUES ('1342', '70884870', '548', '2013-06-11 22:20:38', '2');
INSERT INTO `player_login` VALUES ('1343', '66675974', '306', '2013-06-11 22:20:58', '2');
INSERT INTO `player_login` VALUES ('1344', '20265542', '48', '2013-06-11 22:30:02', '0');
INSERT INTO `player_login` VALUES ('1345', '20265542', '48', '2013-06-11 22:34:17', '2');
INSERT INTO `player_login` VALUES ('1346', '20292742', '549', '2013-06-11 22:34:28', '0');
INSERT INTO `player_login` VALUES ('1347', '20265542', '48', '2013-06-11 22:34:36', '0');
INSERT INTO `player_login` VALUES ('1348', '20265542', '48', '2013-06-11 22:34:49', '2');
INSERT INTO `player_login` VALUES ('1349', '20292742', '549', '2013-06-11 22:34:57', '2');
INSERT INTO `player_login` VALUES ('1350', '20265542', '48', '2013-06-11 22:35:03', '0');
INSERT INTO `player_login` VALUES ('1351', '20292742', '549', '2013-06-11 22:35:17', '0');
INSERT INTO `player_login` VALUES ('1352', '20292742', '549', '2013-06-11 22:35:48', '2');
INSERT INTO `player_login` VALUES ('1353', '20292742', '549', '2013-06-11 22:36:14', '0');
INSERT INTO `player_login` VALUES ('1354', '20292742', '549', '2013-06-11 22:36:46', '2');
INSERT INTO `player_login` VALUES ('1355', '20265542', '48', '2013-06-11 22:37:20', '2');
INSERT INTO `player_login` VALUES ('1356', '82023942', '453', '2013-06-11 22:37:35', '2');
INSERT INTO `player_login` VALUES ('1357', '20265542', '550', '2013-06-11 22:37:43', '0');
INSERT INTO `player_login` VALUES ('1358', '20265542', '550', '2013-06-11 22:37:51', '2');
INSERT INTO `player_login` VALUES ('1359', '20265542', '550', '2013-06-11 22:38:08', '0');
INSERT INTO `player_login` VALUES ('1360', '82023942', '551', '2013-06-11 22:38:13', '0');
INSERT INTO `player_login` VALUES ('1361', '20292742', '549', '2013-06-11 22:38:32', '0');
INSERT INTO `player_login` VALUES ('1362', '20265542', '550', '2013-06-11 22:39:10', '2');
INSERT INTO `player_login` VALUES ('1363', '82023942', '551', '2013-06-11 22:39:13', '2');
INSERT INTO `player_login` VALUES ('1364', '20265542', '550', '2013-06-11 22:39:24', '0');
INSERT INTO `player_login` VALUES ('1365', '82023942', '551', '2013-06-11 22:39:35', '0');
INSERT INTO `player_login` VALUES ('1366', '26858118', '434', '2013-06-11 22:46:28', '0');
INSERT INTO `player_login` VALUES ('1367', '26858118', '434', '2013-06-11 22:53:16', '2');
INSERT INTO `player_login` VALUES ('1368', '26858118', '552', '2013-06-11 22:53:37', '0');
INSERT INTO `player_login` VALUES ('1369', '26858118', '552', '2013-06-11 22:55:29', '2');
INSERT INTO `player_login` VALUES ('1370', '26858118', '552', '2013-06-11 22:55:43', '0');
INSERT INTO `player_login` VALUES ('1371', '26858118', '553', '2013-06-11 22:59:08', '0');
INSERT INTO `player_login` VALUES ('1372', '26858118', '553', '2013-06-11 22:59:15', '2');
INSERT INTO `player_login` VALUES ('1373', '26858118', '553', '2013-06-11 22:59:29', '0');
INSERT INTO `player_login` VALUES ('1374', '26858118', '553', '2013-06-11 22:59:44', '2');
INSERT INTO `player_login` VALUES ('1375', '26858118', '553', '2013-06-11 23:00:04', '0');
INSERT INTO `player_login` VALUES ('1376', '26858118', '553', '2013-06-11 23:01:27', '2');
INSERT INTO `player_login` VALUES ('1377', '26858118', '553', '2013-06-11 23:01:41', '0');
INSERT INTO `player_login` VALUES ('1378', '26858118', '553', '2013-06-11 23:04:30', '2');
INSERT INTO `player_login` VALUES ('1379', '26858118', '553', '2013-06-11 23:04:42', '0');
INSERT INTO `player_login` VALUES ('1380', '15189318', '527', '2013-06-11 23:04:56', '0');
INSERT INTO `player_login` VALUES ('1381', '26858118', '553', '2013-06-11 23:09:28', '2');
INSERT INTO `player_login` VALUES ('1382', '26858118', '554', '2013-06-11 23:09:44', '0');
INSERT INTO `player_login` VALUES ('1383', '26858118', '554', '2013-06-11 23:10:30', '2');
INSERT INTO `player_login` VALUES ('1384', '20265542', '550', '2013-06-11 23:10:42', '2');
INSERT INTO `player_login` VALUES ('1385', '26858118', '554', '2013-06-11 23:10:46', '0');
INSERT INTO `player_login` VALUES ('1386', '26858118', '554', '2013-06-11 23:10:49', '2');
INSERT INTO `player_login` VALUES ('1387', '26858118', '554', '2013-06-11 23:11:04', '0');
INSERT INTO `player_login` VALUES ('1388', '20292742', '549', '2013-06-11 23:13:07', '2');
INSERT INTO `player_login` VALUES ('1389', '15189318', '527', '2013-06-11 23:31:07', '2');
INSERT INTO `player_login` VALUES ('1390', '82023942', '551', '2013-06-11 23:33:27', '2');
INSERT INTO `player_login` VALUES ('1391', '78293446', '0', '2013-06-11 23:37:32', '2');
INSERT INTO `player_login` VALUES ('1392', '86434182', '515', '2013-06-11 23:57:23', '2');
INSERT INTO `player_login` VALUES ('1393', '47850374', '456', '2013-06-11 23:57:25', '2');
INSERT INTO `player_login` VALUES ('1394', '26858118', '554', '2013-06-11 23:59:22', '2');
INSERT INTO `player_login` VALUES ('1395', '47850374', '456', '2013-06-12 00:05:21', '0');
INSERT INTO `player_login` VALUES ('1396', '86434182', '515', '2013-06-12 00:05:24', '0');
INSERT INTO `player_login` VALUES ('1397', '82023942', '551', '2013-06-12 00:09:14', '0');
INSERT INTO `player_login` VALUES ('1398', '71661254', '547', '2013-06-12 00:11:23', '0');
INSERT INTO `player_login` VALUES ('1399', '71661254', '547', '2013-06-12 00:21:51', '2');
INSERT INTO `player_login` VALUES ('1400', '71661254', '555', '2013-06-12 00:22:08', '0');
INSERT INTO `player_login` VALUES ('1401', '65551878', '556', '2013-06-12 00:28:26', '0');
INSERT INTO `player_login` VALUES ('1402', '65551878', '556', '2013-06-12 00:28:35', '2');
INSERT INTO `player_login` VALUES ('1403', '4753862', '557', '2013-06-12 00:32:03', '0');
INSERT INTO `player_login` VALUES ('1404', '4753862', '557', '2013-06-12 00:32:28', '2');
INSERT INTO `player_login` VALUES ('1405', '26858118', '554', '2013-06-12 01:00:12', '0');
INSERT INTO `player_login` VALUES ('1406', '97729670', '558', '2013-06-12 01:12:28', '0');
INSERT INTO `player_login` VALUES ('1407', '97729670', '558', '2013-06-12 01:12:56', '2');
INSERT INTO `player_login` VALUES ('1408', '10971136', '559', '2013-06-12 01:14:09', '0');
INSERT INTO `player_login` VALUES ('1409', '10971136', '559', '2013-06-12 01:14:28', '2');
INSERT INTO `player_login` VALUES ('1410', '42533446', '560', '2013-06-12 01:28:44', '0');
INSERT INTO `player_login` VALUES ('1411', '39529094', '561', '2013-06-12 01:31:57', '0');
INSERT INTO `player_login` VALUES ('1412', '39529094', '561', '2013-06-12 01:32:53', '2');
INSERT INTO `player_login` VALUES ('1413', '26858118', '554', '2013-06-12 01:39:35', '2');
INSERT INTO `player_login` VALUES ('1414', '79725062', '562', '2013-06-12 01:41:53', '0');
INSERT INTO `player_login` VALUES ('1415', '47850374', '456', '2013-06-12 01:43:02', '2');
INSERT INTO `player_login` VALUES ('1416', '47850374', '456', '2013-06-12 01:43:17', '0');
INSERT INTO `player_login` VALUES ('1417', '79725062', '562', '2013-06-12 01:46:18', '2');
INSERT INTO `player_login` VALUES ('1418', '79725062', '562', '2013-06-12 01:46:28', '0');
INSERT INTO `player_login` VALUES ('1419', '42533446', '560', '2013-06-12 01:46:43', '2');
INSERT INTO `player_login` VALUES ('1420', '47850374', '456', '2013-06-12 02:00:33', '2');
INSERT INTO `player_login` VALUES ('1421', '130750086', '563', '2013-06-12 02:03:14', '0');
INSERT INTO `player_login` VALUES ('1422', '130750086', '563', '2013-06-12 02:03:28', '2');
INSERT INTO `player_login` VALUES ('1423', '130750086', '563', '2013-06-12 02:03:40', '0');
INSERT INTO `player_login` VALUES ('1424', '130750086', '563', '2013-06-12 02:04:02', '2');
INSERT INTO `player_login` VALUES ('1425', '3766534', '11', '2013-06-12 02:10:28', '0');
INSERT INTO `player_login` VALUES ('1426', '82023942', '551', '2013-06-12 02:14:35', '2');
INSERT INTO `player_login` VALUES ('1427', '82023942', '551', '2013-06-12 02:15:04', '0');
INSERT INTO `player_login` VALUES ('1428', '82023942', '551', '2013-06-12 02:20:50', '2');
INSERT INTO `player_login` VALUES ('1429', '71661254', '555', '2013-06-12 02:25:10', '2');
INSERT INTO `player_login` VALUES ('1430', '20265542', '0', '2013-06-12 02:35:35', '2');
INSERT INTO `player_login` VALUES ('1431', '20265542', '0', '2013-06-12 02:39:43', '2');
INSERT INTO `player_login` VALUES ('1432', '91857222', '564', '2013-06-12 02:50:52', '0');
INSERT INTO `player_login` VALUES ('1433', '51253254', '565', '2013-06-12 02:51:54', '2');
INSERT INTO `player_login` VALUES ('1434', '75255942', '566', '2013-06-12 02:55:55', '0');
INSERT INTO `player_login` VALUES ('1435', '75255942', '566', '2013-06-12 02:57:22', '2');
INSERT INTO `player_login` VALUES ('1436', '79725062', '562', '2013-06-12 02:58:24', '2');
INSERT INTO `player_login` VALUES ('1437', '91857222', '564', '2013-06-12 02:59:13', '2');
INSERT INTO `player_login` VALUES ('1438', '3766534', '11', '2013-06-12 03:03:57', '0');
INSERT INTO `player_login` VALUES ('1439', '75255942', '566', '2013-06-12 03:04:02', '0');
INSERT INTO `player_login` VALUES ('1440', '22038470', '567', '2013-06-12 03:08:22', '0');
INSERT INTO `player_login` VALUES ('1441', '22038470', '567', '2013-06-12 03:08:28', '2');
INSERT INTO `player_login` VALUES ('1442', '75255942', '566', '2013-06-12 03:17:55', '2');
INSERT INTO `player_login` VALUES ('1443', '91857222', '564', '2013-06-12 03:36:26', '0');
INSERT INTO `player_login` VALUES ('1444', '130668550', '568', '2013-06-12 03:41:20', '0');
INSERT INTO `player_login` VALUES ('1445', '130668550', '568', '2013-06-12 03:49:01', '2');
INSERT INTO `player_login` VALUES ('1446', '5661894', '163', '2013-06-12 04:00:27', '0');
INSERT INTO `player_login` VALUES ('1447', '91857222', '564', '2013-06-12 04:03:04', '2');
INSERT INTO `player_login` VALUES ('1448', '5661894', '163', '2013-06-12 04:29:21', '2');
INSERT INTO `player_login` VALUES ('1449', '5661894', '569', '2013-06-12 04:29:42', '0');
INSERT INTO `player_login` VALUES ('1450', '122528198', '570', '2013-06-12 04:43:35', '0');
INSERT INTO `player_login` VALUES ('1451', '5661894', '569', '2013-06-12 04:51:00', '2');
INSERT INTO `player_login` VALUES ('1452', '122528198', '570', '2013-06-12 05:05:33', '2');
INSERT INTO `player_login` VALUES ('1453', '122528198', '570', '2013-06-12 05:06:00', '0');
INSERT INTO `player_login` VALUES ('1454', '122528198', '570', '2013-06-12 05:08:54', '2');
INSERT INTO `player_login` VALUES ('1455', '122528198', '571', '2013-06-12 05:09:26', '0');
INSERT INTO `player_login` VALUES ('1456', '122528198', '571', '2013-06-12 05:25:08', '2');
INSERT INTO `player_login` VALUES ('1457', '122528198', '572', '2013-06-12 05:25:30', '0');
INSERT INTO `player_login` VALUES ('1458', '122528198', '572', '2013-06-12 05:40:51', '2');
INSERT INTO `player_login` VALUES ('1459', '57596166', '573', '2013-06-12 06:15:00', '0');
INSERT INTO `player_login` VALUES ('1460', '57596166', '573', '2013-06-12 06:15:05', '2');
INSERT INTO `player_login` VALUES ('1461', '130666630', '574', '2013-06-12 06:29:12', '0');
INSERT INTO `player_login` VALUES ('1462', '130666630', '574', '2013-06-12 06:29:36', '2');
INSERT INTO `player_login` VALUES ('1463', '30629958', '102', '2013-06-12 07:02:30', '0');
INSERT INTO `player_login` VALUES ('1464', '58547974', '575', '2013-06-12 07:08:54', '0');
INSERT INTO `player_login` VALUES ('1465', '30629958', '102', '2013-06-12 07:14:24', '2');
INSERT INTO `player_login` VALUES ('1466', '130654470', '576', '2013-06-12 07:22:38', '0');
INSERT INTO `player_login` VALUES ('1467', '58547974', '575', '2013-06-12 07:40:10', '2');
INSERT INTO `player_login` VALUES ('1468', '130654470', '576', '2013-06-12 07:48:09', '2');
INSERT INTO `player_login` VALUES ('1469', '27144710', '577', '2013-06-12 07:55:44', '0');
INSERT INTO `player_login` VALUES ('1470', '3766534', '11', '2013-06-12 07:59:51', '0');
INSERT INTO `player_login` VALUES ('1471', '127675334', '578', '2013-06-12 08:04:48', '0');
INSERT INTO `player_login` VALUES ('1472', '114585670', '579', '2013-06-12 08:08:14', '0');
INSERT INTO `player_login` VALUES ('1473', '27144710', '577', '2013-06-12 08:08:24', '2');
INSERT INTO `player_login` VALUES ('1474', '99293446', '580', '2013-06-12 08:08:46', '0');
INSERT INTO `player_login` VALUES ('1475', '23095878', '581', '2013-06-12 08:08:57', '0');
INSERT INTO `player_login` VALUES ('1476', '30629958', '102', '2013-06-12 08:09:23', '0');
INSERT INTO `player_login` VALUES ('1477', '99293446', '580', '2013-06-12 08:15:01', '2');
INSERT INTO `player_login` VALUES ('1478', '23095878', '581', '2013-06-12 08:15:17', '2');
INSERT INTO `player_login` VALUES ('1479', '99293446', '582', '2013-06-12 08:15:17', '0');
INSERT INTO `player_login` VALUES ('1480', '23095878', '581', '2013-06-12 08:15:30', '0');
INSERT INTO `player_login` VALUES ('1481', '23095878', '581', '2013-06-12 08:15:42', '2');
INSERT INTO `player_login` VALUES ('1482', '127150022', '583', '2013-06-12 08:16:58', '0');
INSERT INTO `player_login` VALUES ('1483', '130654470', '584', '2013-06-12 08:22:51', '0');
INSERT INTO `player_login` VALUES ('1484', '114585670', '579', '2013-06-12 08:24:06', '2');
INSERT INTO `player_login` VALUES ('1485', '19885702', '585', '2013-06-12 08:26:51', '0');
INSERT INTO `player_login` VALUES ('1486', '127675334', '578', '2013-06-12 08:27:57', '2');
INSERT INTO `player_login` VALUES ('1487', '58931270', '0', '2013-06-12 08:28:27', '2');
INSERT INTO `player_login` VALUES ('1488', '30629958', '102', '2013-06-12 08:29:34', '2');
INSERT INTO `player_login` VALUES ('1489', '30629958', '102', '2013-06-12 08:30:11', '0');
INSERT INTO `player_login` VALUES ('1490', '130654470', '584', '2013-06-12 08:36:38', '2');
INSERT INTO `player_login` VALUES ('1491', '130654470', '587', '2013-06-12 08:36:58', '0');
INSERT INTO `player_login` VALUES ('1492', '19885702', '585', '2013-06-12 08:38:12', '2');
INSERT INTO `player_login` VALUES ('1493', '19885702', '588', '2013-06-12 08:38:24', '0');
INSERT INTO `player_login` VALUES ('1494', '127150022', '583', '2013-06-12 08:43:44', '2');
INSERT INTO `player_login` VALUES ('1495', '19885702', '0', '2013-06-12 08:44:58', '2');
INSERT INTO `player_login` VALUES ('1496', '130766342', '589', '2013-06-12 08:45:20', '0');
INSERT INTO `player_login` VALUES ('1497', '19885702', '588', '2013-06-12 08:47:00', '0');
INSERT INTO `player_login` VALUES ('1498', '46330822', '590', '2013-06-12 08:47:51', '0');
INSERT INTO `player_login` VALUES ('1499', '46330822', '590', '2013-06-12 08:48:02', '2');
INSERT INTO `player_login` VALUES ('1500', '130766342', '589', '2013-06-12 08:48:59', '2');
INSERT INTO `player_login` VALUES ('1501', '19885702', '588', '2013-06-12 08:55:07', '2');
INSERT INTO `player_login` VALUES ('1502', '30629958', '102', '2013-06-12 09:00:00', '2');
INSERT INTO `player_login` VALUES ('1503', '126092870', '591', '2013-06-12 09:04:03', '0');
INSERT INTO `player_login` VALUES ('1504', '30629958', '102', '2013-06-12 09:04:05', '0');
INSERT INTO `player_login` VALUES ('1505', '126092870', '591', '2013-06-12 09:04:20', '2');
INSERT INTO `player_login` VALUES ('1506', '99293446', '592', '2013-06-12 09:05:51', '0');
INSERT INTO `player_login` VALUES ('1507', '99293446', '592', '2013-06-12 09:08:27', '2');
INSERT INTO `player_login` VALUES ('1508', '58318534', '593', '2013-06-12 09:11:00', '0');
INSERT INTO `player_login` VALUES ('1509', '30629958', '102', '2013-06-12 09:16:41', '2');
INSERT INTO `player_login` VALUES ('1510', '30629958', '102', '2013-06-12 09:17:11', '0');
INSERT INTO `player_login` VALUES ('1511', '30629958', '102', '2013-06-12 09:25:42', '2');
INSERT INTO `player_login` VALUES ('1512', '30629958', '102', '2013-06-12 09:26:16', '0');
INSERT INTO `player_login` VALUES ('1513', '58318534', '593', '2013-06-12 09:31:40', '2');
INSERT INTO `player_login` VALUES ('1514', '3766534', '11', '2013-06-12 09:33:12', '0');
INSERT INTO `player_login` VALUES ('1515', '30629958', '102', '2013-06-12 09:39:53', '2');
INSERT INTO `player_login` VALUES ('1516', '30629958', '102', '2013-06-12 09:41:44', '0');
INSERT INTO `player_login` VALUES ('1517', '30629958', '102', '2013-06-12 09:53:01', '2');
INSERT INTO `player_login` VALUES ('1518', '75255942', '566', '2013-06-12 09:54:00', '0');
INSERT INTO `player_login` VALUES ('1519', '121339078', '473', '2013-06-12 09:58:37', '0');
INSERT INTO `player_login` VALUES ('1520', '35715846', '594', '2013-06-12 10:01:02', '0');
INSERT INTO `player_login` VALUES ('1521', '75255942', '566', '2013-06-12 10:06:30', '2');
INSERT INTO `player_login` VALUES ('1522', '15027014', '256', '2013-06-12 10:06:47', '0');
INSERT INTO `player_login` VALUES ('1523', '21289606', '595', '2013-06-12 10:06:53', '0');
INSERT INTO `player_login` VALUES ('1524', '49675462', '596', '2013-06-12 10:07:05', '0');
INSERT INTO `player_login` VALUES ('1525', '741443', '597', '2013-06-12 10:07:38', '0');
INSERT INTO `player_login` VALUES ('1526', '129778566', '598', '2013-06-12 10:07:58', '0');
INSERT INTO `player_login` VALUES ('1527', '3095428', '0', '2013-06-12 10:09:03', '2');
INSERT INTO `player_login` VALUES ('1528', '75255942', '566', '2013-06-12 10:09:21', '0');
INSERT INTO `player_login` VALUES ('1529', '120906054', '157', '2013-06-12 10:11:07', '0');
INSERT INTO `player_login` VALUES ('1530', '127551622', '600', '2013-06-12 10:12:30', '0');
INSERT INTO `player_login` VALUES ('1531', '3095428', '0', '2013-06-12 10:14:14', '2');
INSERT INTO `player_login` VALUES ('1532', '15027014', '256', '2013-06-12 10:14:18', '2');
INSERT INTO `player_login` VALUES ('1533', '125614918', '601', '2013-06-12 10:14:22', '0');
INSERT INTO `player_login` VALUES ('1534', '129778566', '598', '2013-06-12 10:17:34', '2');
INSERT INTO `player_login` VALUES ('1535', '129778566', '602', '2013-06-12 10:17:54', '0');
INSERT INTO `player_login` VALUES ('1536', '125614918', '601', '2013-06-12 10:17:59', '2');
INSERT INTO `player_login` VALUES ('1537', '78875014', '173', '2013-06-12 10:18:21', '0');
INSERT INTO `player_login` VALUES ('1538', '75255942', '566', '2013-06-12 10:21:01', '2');
INSERT INTO `player_login` VALUES ('1539', '75255942', '603', '2013-06-12 10:21:21', '0');
INSERT INTO `player_login` VALUES ('1540', '130835398', '604', '2013-06-12 10:22:52', '0');
INSERT INTO `player_login` VALUES ('1541', '78875014', '173', '2013-06-12 10:24:28', '2');
INSERT INTO `player_login` VALUES ('1542', '130835398', '604', '2013-06-12 10:26:17', '2');
INSERT INTO `player_login` VALUES ('1543', '130835398', '605', '2013-06-12 10:27:11', '0');
INSERT INTO `player_login` VALUES ('1544', '119295750', '500', '2013-06-12 10:30:51', '0');
INSERT INTO `player_login` VALUES ('1545', '90571910', '606', '2013-06-12 10:36:43', '0');
INSERT INTO `player_login` VALUES ('1546', '741443', '597', '2013-06-12 10:37:29', '2');
INSERT INTO `player_login` VALUES ('1547', '130431942', '607', '2013-06-12 10:37:54', '0');
INSERT INTO `player_login` VALUES ('1548', '120906054', '157', '2013-06-12 10:39:51', '2');
INSERT INTO `player_login` VALUES ('1549', '741443', '597', '2013-06-12 10:41:05', '0');
INSERT INTO `player_login` VALUES ('1550', '129778566', '602', '2013-06-12 10:41:47', '2');
INSERT INTO `player_login` VALUES ('1551', '75255942', '603', '2013-06-12 10:42:22', '2');
INSERT INTO `player_login` VALUES ('1552', '75255942', '608', '2013-06-12 10:42:48', '0');
INSERT INTO `player_login` VALUES ('1553', '130431942', '607', '2013-06-12 10:43:09', '2');
INSERT INTO `player_login` VALUES ('1554', '119295750', '500', '2013-06-12 10:48:04', '2');
INSERT INTO `player_login` VALUES ('1555', '119295750', '500', '2013-06-12 10:48:56', '0');
INSERT INTO `player_login` VALUES ('1556', '130801606', '609', '2013-06-12 10:49:01', '0');
INSERT INTO `player_login` VALUES ('1557', '130784902', '610', '2013-06-12 10:49:47', '0');
INSERT INTO `player_login` VALUES ('1558', '130654470', '587', '2013-06-12 10:51:21', '0');
INSERT INTO `player_login` VALUES ('1559', '119295750', '500', '2013-06-12 10:51:38', '2');
INSERT INTO `player_login` VALUES ('1560', '741443', '597', '2013-06-12 10:51:42', '2');
INSERT INTO `player_login` VALUES ('1561', '3766534', '11', '2013-06-12 10:51:54', '2');
INSERT INTO `player_login` VALUES ('1562', '119295750', '500', '2013-06-12 10:52:10', '0');
INSERT INTO `player_login` VALUES ('1563', '3766534', '11', '2013-06-12 10:53:03', '0');
INSERT INTO `player_login` VALUES ('1564', '3766534', '11', '2013-06-12 10:53:19', '2');
INSERT INTO `player_login` VALUES ('1565', '3766534', '11', '2013-06-12 10:54:10', '0');
INSERT INTO `player_login` VALUES ('1566', '130784902', '610', '2013-06-12 10:54:26', '2');
INSERT INTO `player_login` VALUES ('1567', '31758854', '611', '2013-06-12 10:58:11', '0');
INSERT INTO `player_login` VALUES ('1568', '130801606', '609', '2013-06-12 10:58:32', '2');
INSERT INTO `player_login` VALUES ('1569', '31758854', '611', '2013-06-12 10:58:32', '2');
INSERT INTO `player_login` VALUES ('1570', '130801606', '612', '2013-06-12 10:58:50', '0');
INSERT INTO `player_login` VALUES ('1571', '119982662', '613', '2013-06-12 10:58:59', '0');
INSERT INTO `player_login` VALUES ('1572', '35715846', '594', '2013-06-12 11:00:04', '2');
INSERT INTO `player_login` VALUES ('1573', '130654470', '587', '2013-06-12 11:00:24', '2');
INSERT INTO `player_login` VALUES ('1574', '715778AX', '430', '2013-06-12 11:02:23', '0');
INSERT INTO `player_login` VALUES ('1575', '90631174', '614', '2013-06-12 11:03:46', '0');
INSERT INTO `player_login` VALUES ('1576', '90571910', '606', '2013-06-12 11:04:08', '2');
INSERT INTO `player_login` VALUES ('1577', '3766534', '11', '2013-06-12 11:04:59', '2');
INSERT INTO `player_login` VALUES ('1578', '130654470', '615', '2013-06-12 11:05:16', '0');
INSERT INTO `player_login` VALUES ('1579', '102666694', '459', '2013-06-12 11:06:04', '0');
INSERT INTO `player_login` VALUES ('1580', '121339078', '473', '2013-06-12 11:08:08', '0');
INSERT INTO `player_login` VALUES ('1581', '21289606', '595', '2013-06-12 11:11:04', '2');
INSERT INTO `player_login` VALUES ('1582', '38392390', '466', '2013-06-12 11:11:32', '0');
INSERT INTO `player_login` VALUES ('1583', '21289606', '595', '2013-06-12 11:11:34', '0');
INSERT INTO `player_login` VALUES ('1584', '715778AX', '430', '2013-06-12 11:12:52', '2');
INSERT INTO `player_login` VALUES ('1585', '130801606', '612', '2013-06-12 11:14:24', '2');
INSERT INTO `player_login` VALUES ('1586', '130801606', '616', '2013-06-12 11:15:10', '0');
INSERT INTO `player_login` VALUES ('1587', '119295750', '500', '2013-06-12 11:16:19', '2');
INSERT INTO `player_login` VALUES ('1588', '715778AX', '430', '2013-06-12 11:18:13', '0');
INSERT INTO `player_login` VALUES ('1589', '119295750', '617', '2013-06-12 11:18:21', '0');
INSERT INTO `player_login` VALUES ('1590', '119982662', '613', '2013-06-12 11:18:40', '2');
INSERT INTO `player_login` VALUES ('1591', '102666694', '459', '2013-06-12 11:19:35', '2');
INSERT INTO `player_login` VALUES ('1592', '102666694', '459', '2013-06-12 11:19:54', '0');
INSERT INTO `player_login` VALUES ('1593', '130654470', '615', '2013-06-12 11:20:06', '2');
INSERT INTO `player_login` VALUES ('1594', '21289606', '595', '2013-06-12 11:26:36', '2');
INSERT INTO `player_login` VALUES ('1595', '21289606', '618', '2013-06-12 11:26:58', '0');
INSERT INTO `player_login` VALUES ('1596', '130801606', '616', '2013-06-12 11:27:42', '2');
INSERT INTO `player_login` VALUES ('1597', '130801606', '619', '2013-06-12 11:28:06', '0');
INSERT INTO `player_login` VALUES ('1598', '90631174', '614', '2013-06-12 11:29:49', '2');
INSERT INTO `player_login` VALUES ('1599', '130801606', '619', '2013-06-12 11:35:03', '2');
INSERT INTO `player_login` VALUES ('1600', '130801606', '620', '2013-06-12 11:35:23', '0');
INSERT INTO `player_login` VALUES ('1601', '75255942', '608', '2013-06-12 11:36:17', '2');
INSERT INTO `player_login` VALUES ('1602', '81571078', '621', '2013-06-12 11:45:00', '0');
INSERT INTO `player_login` VALUES ('1603', '101316934', '622', '2013-06-12 11:46:26', '0');
INSERT INTO `player_login` VALUES ('1604', '101390918', '623', '2013-06-12 11:47:38', '0');
INSERT INTO `player_login` VALUES ('1605', '130801606', '620', '2013-06-12 11:47:48', '2');
INSERT INTO `player_login` VALUES ('1606', '21938310', '624', '2013-06-12 11:47:58', '0');
INSERT INTO `player_login` VALUES ('1607', '130801606', '625', '2013-06-12 11:48:20', '0');
INSERT INTO `player_login` VALUES ('1608', '81571078', '621', '2013-06-12 11:49:17', '2');
INSERT INTO `player_login` VALUES ('1609', '119295750', '617', '2013-06-12 11:50:20', '2');
INSERT INTO `player_login` VALUES ('1610', '38392390', '466', '2013-06-12 11:51:39', '2');
INSERT INTO `player_login` VALUES ('1611', '119295750', '626', '2013-06-12 11:51:46', '0');
INSERT INTO `player_login` VALUES ('1612', '37924166', '219', '2013-06-12 11:53:39', '0');
INSERT INTO `player_login` VALUES ('1613', '37933318', '423', '2013-06-12 11:53:58', '0');
INSERT INTO `player_login` VALUES ('1614', '21289606', '618', '2013-06-12 11:57:04', '2');
INSERT INTO `player_login` VALUES ('1615', '37924166', '219', '2013-06-12 11:57:18', '2');
INSERT INTO `player_login` VALUES ('1616', '49675462', '596', '2013-06-12 11:57:34', '2');
INSERT INTO `player_login` VALUES ('1617', '127551622', '600', '2013-06-12 11:57:53', '2');
INSERT INTO `player_login` VALUES ('1618', '121339078', '473', '2013-06-12 11:59:07', '2');
INSERT INTO `player_login` VALUES ('1619', '102666694', '459', '2013-06-12 11:59:13', '2');
INSERT INTO `player_login` VALUES ('1620', '37933318', '423', '2013-06-12 11:59:18', '2');
INSERT INTO `player_login` VALUES ('1621', '119295750', '626', '2013-06-12 11:59:43', '2');
INSERT INTO `player_login` VALUES ('1622', '715778AX', '430', '2013-06-12 12:00:02', '2');
INSERT INTO `player_login` VALUES ('1623', '130801606', '625', '2013-06-12 12:00:47', '2');
INSERT INTO `player_login` VALUES ('1624', '37924166', '219', '2013-06-12 12:04:36', '0');
INSERT INTO `player_login` VALUES ('1625', '101390918', '623', '2013-06-12 12:04:36', '0');
INSERT INTO `player_login` VALUES ('1626', '102666694', '459', '2013-06-12 12:04:48', '0');
INSERT INTO `player_login` VALUES ('1627', '119295750', '626', '2013-06-12 12:04:48', '0');
INSERT INTO `player_login` VALUES ('1628', '75255942', '608', '2013-06-12 12:04:49', '0');
INSERT INTO `player_login` VALUES ('1629', '21938310', '624', '2013-06-12 12:04:56', '0');
INSERT INTO `player_login` VALUES ('1630', '715778AX', '430', '2013-06-12 12:05:00', '0');
INSERT INTO `player_login` VALUES ('1631', '101316934', '622', '2013-06-12 12:05:06', '0');
INSERT INTO `player_login` VALUES ('1632', '37933318', '423', '2013-06-12 12:05:39', '0');
INSERT INTO `player_login` VALUES ('1633', '127551622', '600', '2013-06-12 12:06:38', '0');
INSERT INTO `player_login` VALUES ('1634', '75255942', '608', '2013-06-12 12:07:01', '2');
INSERT INTO `player_login` VALUES ('1635', '75255942', '627', '2013-06-12 12:07:15', '0');
INSERT INTO `player_login` VALUES ('1636', '49675462', '596', '2013-06-12 12:07:43', '0');
INSERT INTO `player_login` VALUES ('1637', '715778AX', '430', '2013-06-12 12:08:55', '2');
INSERT INTO `player_login` VALUES ('1638', '38392390', '466', '2013-06-12 12:11:11', '0');
INSERT INTO `player_login` VALUES ('1639', '101390918', '623', '2013-06-12 12:16:15', '2');
INSERT INTO `player_login` VALUES ('1640', '21938310', '624', '2013-06-12 12:16:27', '2');
INSERT INTO `player_login` VALUES ('1641', '21938310', '628', '2013-06-12 12:16:44', '0');
INSERT INTO `player_login` VALUES ('1642', '101390918', '623', '2013-06-12 12:17:10', '0');
INSERT INTO `player_login` VALUES ('1643', '130654470', '615', '2013-06-12 12:17:33', '0');
INSERT INTO `player_login` VALUES ('1644', '105106950', '629', '2013-06-12 12:18:48', '0');
INSERT INTO `player_login` VALUES ('1645', '21289606', '618', '2013-06-12 12:19:59', '0');
INSERT INTO `player_login` VALUES ('1646', '715778AX', '630', '2013-06-12 12:20:48', '0');
INSERT INTO `player_login` VALUES ('1647', '21938310', '628', '2013-06-12 12:25:09', '2');
INSERT INTO `player_login` VALUES ('1648', '21938310', '631', '2013-06-12 12:25:21', '0');
INSERT INTO `player_login` VALUES ('1649', '105106950', '629', '2013-06-12 12:31:33', '2');
INSERT INTO `player_login` VALUES ('1650', '97089606', '632', '2013-06-12 12:32:20', '0');
INSERT INTO `player_login` VALUES ('1651', '92816262', '633', '2013-06-12 12:32:43', '0');
INSERT INTO `player_login` VALUES ('1652', '97089606', '632', '2013-06-12 12:33:04', '2');
INSERT INTO `player_login` VALUES ('1653', '97089606', '632', '2013-06-12 12:33:17', '0');
INSERT INTO `player_login` VALUES ('1654', '21938310', '631', '2013-06-12 12:33:46', '2');
INSERT INTO `player_login` VALUES ('1655', '21938310', '634', '2013-06-12 12:34:04', '0');
INSERT INTO `player_login` VALUES ('1656', '105106950', '635', '2013-06-12 12:34:33', '0');
INSERT INTO `player_login` VALUES ('1657', '38392390', '466', '2013-06-12 12:34:52', '2');
INSERT INTO `player_login` VALUES ('1658', '92816262', '636', '2013-06-12 12:35:44', '0');
INSERT INTO `player_login` VALUES ('1659', '92816262', '636', '2013-06-12 12:36:49', '2');
INSERT INTO `player_login` VALUES ('1660', '92816262', '637', '2013-06-12 12:37:08', '0');
INSERT INTO `player_login` VALUES ('1661', '97089606', '632', '2013-06-12 12:39:40', '2');
INSERT INTO `player_login` VALUES ('1662', '97089606', '638', '2013-06-12 12:39:57', '0');
INSERT INTO `player_login` VALUES ('1663', '21938310', '634', '2013-06-12 12:40:14', '2');
INSERT INTO `player_login` VALUES ('1664', '715778AX', '630', '2013-06-12 12:40:33', '2');
INSERT INTO `player_login` VALUES ('1665', '715778AX', '639', '2013-06-12 12:43:39', '0');
INSERT INTO `player_login` VALUES ('1666', '71661254', '555', '2013-06-12 12:44:54', '0');
INSERT INTO `player_login` VALUES ('1667', '5844226', '640', '2013-06-12 12:45:17', '0');
INSERT INTO `player_login` VALUES ('1668', '92816262', '637', '2013-06-12 12:45:52', '2');
INSERT INTO `player_login` VALUES ('1669', '97089606', '638', '2013-06-12 12:46:19', '2');
INSERT INTO `player_login` VALUES ('1670', '101390918', '623', '2013-06-12 12:47:37', '2');
INSERT INTO `player_login` VALUES ('1671', '105106950', '635', '2013-06-12 12:48:23', '2');
INSERT INTO `player_login` VALUES ('1672', '130654470', '615', '2013-06-12 12:49:01', '2');
INSERT INTO `player_login` VALUES ('1673', '101316934', '622', '2013-06-12 12:50:58', '2');
INSERT INTO `player_login` VALUES ('1674', '37924166', '219', '2013-06-12 12:51:35', '2');
INSERT INTO `player_login` VALUES ('1675', '37924166', '219', '2013-06-12 12:51:52', '0');
INSERT INTO `player_login` VALUES ('1676', '21289606', '618', '2013-06-12 12:56:09', '2');
INSERT INTO `player_login` VALUES ('1677', '21289606', '641', '2013-06-12 12:56:27', '0');
INSERT INTO `player_login` VALUES ('1678', '21289606', '641', '2013-06-12 12:58:25', '2');
INSERT INTO `player_login` VALUES ('1679', '21289606', '642', '2013-06-12 12:58:39', '0');
INSERT INTO `player_login` VALUES ('1680', '49675462', '596', '2013-06-12 13:09:15', '2');
INSERT INTO `player_login` VALUES ('1681', '102666694', '459', '2013-06-12 13:10:21', '2');
INSERT INTO `player_login` VALUES ('1682', '119295750', '626', '2013-06-12 13:13:36', '0');
INSERT INTO `player_login` VALUES ('1683', '49675462', '596', '2013-06-12 13:14:12', '0');
INSERT INTO `player_login` VALUES ('1684', '21289606', '642', '2013-06-12 13:14:40', '2');
INSERT INTO `player_login` VALUES ('1685', '127551622', '600', '2013-06-12 13:16:38', '2');
INSERT INTO `player_login` VALUES ('1686', '106689286', '643', '2013-06-12 13:17:10', '0');
INSERT INTO `player_login` VALUES ('1687', '21289606', '642', '2013-06-12 13:17:41', '0');
INSERT INTO `player_login` VALUES ('1688', '38392390', '466', '2013-06-12 13:19:19', '0');
INSERT INTO `player_login` VALUES ('1689', '119295750', '626', '2013-06-12 13:19:25', '2');
INSERT INTO `player_login` VALUES ('1690', '127551622', '600', '2013-06-12 13:19:28', '0');
INSERT INTO `player_login` VALUES ('1691', '119295750', '644', '2013-06-12 13:19:52', '0');
INSERT INTO `player_login` VALUES ('1692', '71661254', '555', '2013-06-12 13:20:15', '2');
INSERT INTO `player_login` VALUES ('1693', '49675462', '596', '2013-06-12 13:21:19', '0');
INSERT INTO `player_login` VALUES ('1694', '38392390', '466', '2013-06-12 13:24:12', '2');
INSERT INTO `player_login` VALUES ('1695', '106689286', '643', '2013-06-12 13:26:45', '2');
INSERT INTO `player_login` VALUES ('1696', '106689286', '645', '2013-06-12 13:27:55', '0');
INSERT INTO `player_login` VALUES ('1697', '5844226', '640', '2013-06-12 13:30:33', '2');
INSERT INTO `player_login` VALUES ('1698', '5844226', '647', '2013-06-12 13:30:54', '0');
INSERT INTO `player_login` VALUES ('1699', '5523586', '646', '2013-06-12 13:30:57', '0');
INSERT INTO `player_login` VALUES ('1700', '24791302', '648', '2013-06-12 13:32:04', '0');
INSERT INTO `player_login` VALUES ('1701', '5785408', '514', '2013-06-12 13:32:18', '0');
INSERT INTO `player_login` VALUES ('1702', '72232582', '421', '2013-06-12 13:32:22', '0');
INSERT INTO `player_login` VALUES ('1703', '38392390', '466', '2013-06-12 13:32:39', '0');
INSERT INTO `player_login` VALUES ('1704', '38392390', '466', '2013-06-12 13:34:20', '2');
INSERT INTO `player_login` VALUES ('1705', '38392390', '649', '2013-06-12 13:34:31', '0');
INSERT INTO `player_login` VALUES ('1706', '5844226', '647', '2013-06-12 13:40:04', '2');
INSERT INTO `player_login` VALUES ('1707', '5844226', '650', '2013-06-12 13:40:26', '0');
INSERT INTO `player_login` VALUES ('1708', '715778AX', '639', '2013-06-12 13:41:46', '2');
INSERT INTO `player_login` VALUES ('1709', '715778AX', '651', '2013-06-12 13:42:06', '0');
INSERT INTO `player_login` VALUES ('1710', '811841', '138', '2013-06-12 13:43:57', '0');
INSERT INTO `player_login` VALUES ('1711', '72232582', '421', '2013-06-12 13:44:15', '2');
INSERT INTO `player_login` VALUES ('1712', '72232582', '652', '2013-06-12 13:44:46', '2');
INSERT INTO `player_login` VALUES ('1713', '72232582', '652', '2013-06-12 13:45:00', '0');
INSERT INTO `player_login` VALUES ('1714', '119295750', '644', '2013-06-12 13:46:05', '2');
INSERT INTO `player_login` VALUES ('1715', '106689286', '645', '2013-06-12 13:47:26', '2');
INSERT INTO `player_login` VALUES ('1716', '106689286', '645', '2013-06-12 13:47:49', '0');
INSERT INTO `player_login` VALUES ('1717', '57988550', '0', '2013-06-12 13:49:26', '2');
INSERT INTO `player_login` VALUES ('1718', '49675462', '596', '2013-06-12 13:50:32', '2');
INSERT INTO `player_login` VALUES ('1719', '14232838', '653', '2013-06-12 13:50:54', '0');
INSERT INTO `player_login` VALUES ('1720', '49675462', '654', '2013-06-12 13:51:00', '0');
INSERT INTO `player_login` VALUES ('1721', '72232582', '652', '2013-06-12 13:51:17', '2');
INSERT INTO `player_login` VALUES ('1722', '72232582', '655', '2013-06-12 13:51:31', '0');
INSERT INTO `player_login` VALUES ('1723', '121977350', '656', '2013-06-12 13:54:01', '0');
INSERT INTO `player_login` VALUES ('1724', '127551622', '600', '2013-06-12 13:54:44', '2');
INSERT INTO `player_login` VALUES ('1725', '127551622', '657', '2013-06-12 13:55:21', '0');
INSERT INTO `player_login` VALUES ('1726', '49675462', '654', '2013-06-12 13:55:46', '2');
INSERT INTO `player_login` VALUES ('1727', '49675462', '658', '2013-06-12 13:56:10', '0');
INSERT INTO `player_login` VALUES ('1728', '121977350', '656', '2013-06-12 13:56:15', '2');
INSERT INTO `player_login` VALUES ('1729', '5844226', '650', '2013-06-12 13:57:14', '2');
INSERT INTO `player_login` VALUES ('1730', '75255942', '627', '2013-06-12 13:57:25', '2');
INSERT INTO `player_login` VALUES ('1731', '5785408', '514', '2013-06-12 13:58:05', '2');
INSERT INTO `player_login` VALUES ('1732', '5785408', '659', '2013-06-12 13:58:39', '0');
INSERT INTO `player_login` VALUES ('1733', '127551622', '657', '2013-06-12 13:59:01', '2');
INSERT INTO `player_login` VALUES ('1734', '5844226', '660', '2013-06-12 13:59:18', '0');
INSERT INTO `player_login` VALUES ('1735', '127551622', '661', '2013-06-12 13:59:40', '0');
INSERT INTO `player_login` VALUES ('1736', '5785408', '659', '2013-06-12 14:01:46', '2');
INSERT INTO `player_login` VALUES ('1737', '5785408', '662', '2013-06-12 14:02:06', '0');
INSERT INTO `player_login` VALUES ('1738', '49675462', '658', '2013-06-12 14:02:29', '2');
INSERT INTO `player_login` VALUES ('1739', '72232582', '655', '2013-06-12 14:02:43', '2');
INSERT INTO `player_login` VALUES ('1740', '49675462', '663', '2013-06-12 14:02:50', '0');
INSERT INTO `player_login` VALUES ('1741', '108743430', '664', '2013-06-12 14:03:08', '0');
INSERT INTO `player_login` VALUES ('1742', '72232582', '665', '2013-06-12 14:03:15', '2');
INSERT INTO `player_login` VALUES ('1743', '108743430', '664', '2013-06-12 14:03:27', '2');
INSERT INTO `player_login` VALUES ('1744', '72232582', '665', '2013-06-12 14:03:28', '0');
INSERT INTO `player_login` VALUES ('1745', '72232582', '665', '2013-06-12 14:04:58', '2');
INSERT INTO `player_login` VALUES ('1746', '5844226', '660', '2013-06-12 14:05:02', '2');
INSERT INTO `player_login` VALUES ('1747', '5785408', '662', '2013-06-12 14:05:02', '2');
INSERT INTO `player_login` VALUES ('1748', '5844226', '660', '2013-06-12 14:05:15', '0');
INSERT INTO `player_login` VALUES ('1749', '14232838', '666', '2013-06-12 14:05:28', '0');
INSERT INTO `player_login` VALUES ('1750', '24791302', '648', '2013-06-12 14:06:09', '2');
INSERT INTO `player_login` VALUES ('1751', '24791302', '667', '2013-06-12 14:06:45', '0');
INSERT INTO `player_login` VALUES ('1752', '24791302', '667', '2013-06-12 14:09:28', '2');
INSERT INTO `player_login` VALUES ('1753', '24791302', '668', '2013-06-12 14:09:50', '0');
INSERT INTO `player_login` VALUES ('1754', '24791302', '668', '2013-06-12 14:11:50', '2');
INSERT INTO `player_login` VALUES ('1755', '715778AX', '651', '2013-06-12 14:13:46', '2');
INSERT INTO `player_login` VALUES ('1756', '715778AX', '669', '2013-06-12 14:14:18', '0');
INSERT INTO `player_login` VALUES ('1757', '37933318', '423', '2013-06-12 14:14:53', '2');
INSERT INTO `player_login` VALUES ('1758', '5523586', '646', '2013-06-12 14:17:34', '2');
INSERT INTO `player_login` VALUES ('1759', '5523586', '670', '2013-06-12 14:18:03', '0');
INSERT INTO `player_login` VALUES ('1760', '5168002', '671', '2013-06-12 14:19:58', '0');
INSERT INTO `player_login` VALUES ('1761', '37933318', '423', '2013-06-12 14:20:05', '0');
INSERT INTO `player_login` VALUES ('1762', '14232838', '666', '2013-06-12 14:23:15', '2');
INSERT INTO `player_login` VALUES ('1763', '14232838', '666', '2013-06-12 14:23:40', '0');
INSERT INTO `player_login` VALUES ('1764', '14232838', '666', '2013-06-12 14:24:36', '2');
INSERT INTO `player_login` VALUES ('1765', '715778AX', '669', '2013-06-12 14:31:03', '2');
INSERT INTO `player_login` VALUES ('1766', '715778AX', '672', '2013-06-12 14:31:34', '0');
INSERT INTO `player_login` VALUES ('1767', '49966790', '274', '2013-06-12 14:33:04', '0');
INSERT INTO `player_login` VALUES ('1768', '101390918', '623', '2013-06-12 14:34:09', '0');
INSERT INTO `player_login` VALUES ('1769', '5844226', '660', '2013-06-12 14:35:31', '2');
INSERT INTO `player_login` VALUES ('1770', '5844226', '660', '2013-06-12 14:41:09', '0');
INSERT INTO `player_login` VALUES ('1771', '715778AX', '672', '2013-06-12 14:43:41', '2');
INSERT INTO `player_login` VALUES ('1772', '5844226', '660', '2013-06-12 14:49:45', '2');
INSERT INTO `player_login` VALUES ('1773', '5844226', '660', '2013-06-12 14:50:08', '0');
INSERT INTO `player_login` VALUES ('1774', '715778AX', '672', '2013-06-12 14:52:32', '0');
INSERT INTO `player_login` VALUES ('1775', '106689286', '645', '2013-06-12 14:54:01', '2');
INSERT INTO `player_login` VALUES ('1776', '99943622', '673', '2013-06-12 14:55:38', '0');
INSERT INTO `player_login` VALUES ('1777', '5523586', '670', '2013-06-12 14:58:20', '2');
INSERT INTO `player_login` VALUES ('1778', '106689286', '645', '2013-06-12 14:58:57', '0');
INSERT INTO `player_login` VALUES ('1779', '39615494', '674', '2013-06-12 14:59:11', '0');
INSERT INTO `player_login` VALUES ('1780', '2445318', '675', '2013-06-12 15:00:31', '0');
INSERT INTO `player_login` VALUES ('1781', '2445318', '675', '2013-06-12 15:01:55', '2');
INSERT INTO `player_login` VALUES ('1782', '57640070', '676', '2013-06-12 15:02:30', '0');
INSERT INTO `player_login` VALUES ('1783', '59126598', '471', '2013-06-12 15:02:56', '0');
INSERT INTO `player_login` VALUES ('1784', '99943622', '673', '2013-06-12 15:06:18', '2');
INSERT INTO `player_login` VALUES ('1785', '130443462', '677', '2013-06-12 15:06:32', '0');
INSERT INTO `player_login` VALUES ('1786', '99943622', '678', '2013-06-12 15:06:39', '0');
INSERT INTO `player_login` VALUES ('1787', '57640070', '676', '2013-06-12 15:07:08', '2');
INSERT INTO `player_login` VALUES ('1788', '87338054', '679', '2013-06-12 15:08:39', '0');
INSERT INTO `player_login` VALUES ('1789', '129870086', '680', '2013-06-12 15:09:38', '0');
INSERT INTO `player_login` VALUES ('1790', '57640070', '676', '2013-06-12 15:10:06', '0');
INSERT INTO `player_login` VALUES ('1791', '57640070', '676', '2013-06-12 15:11:26', '2');
INSERT INTO `player_login` VALUES ('1792', '57640070', '681', '2013-06-12 15:11:45', '0');
INSERT INTO `player_login` VALUES ('1793', '87338054', '679', '2013-06-12 15:16:13', '2');
INSERT INTO `player_login` VALUES ('1794', '87338054', '679', '2013-06-12 15:16:34', '0');
INSERT INTO `player_login` VALUES ('1795', '58849286', '393', '2013-06-12 15:17:12', '0');
INSERT INTO `player_login` VALUES ('1796', '66491846', '682', '2013-06-12 15:19:07', '0');
INSERT INTO `player_login` VALUES ('1797', '37924166', '219', '2013-06-12 15:20:17', '2');
INSERT INTO `player_login` VALUES ('1798', '37933318', '423', '2013-06-12 15:20:22', '2');
INSERT INTO `player_login` VALUES ('1799', '58849286', '393', '2013-06-12 15:20:30', '2');
INSERT INTO `player_login` VALUES ('1800', '87338054', '679', '2013-06-12 15:20:34', '2');
INSERT INTO `player_login` VALUES ('1801', '58849286', '683', '2013-06-12 15:20:49', '0');
INSERT INTO `player_login` VALUES ('1802', '87338054', '684', '2013-06-12 15:20:55', '0');
INSERT INTO `player_login` VALUES ('1803', '59126598', '471', '2013-06-12 15:21:41', '2');
INSERT INTO `player_login` VALUES ('1804', '59126598', '685', '2013-06-12 15:22:11', '0');
INSERT INTO `player_login` VALUES ('1805', '59126598', '685', '2013-06-12 15:22:27', '2');
INSERT INTO `player_login` VALUES ('1806', '124028870', '686', '2013-06-12 15:22:29', '0');
INSERT INTO `player_login` VALUES ('1807', '59126598', '685', '2013-06-12 15:22:41', '0');
INSERT INTO `player_login` VALUES ('1808', '58849286', '683', '2013-06-12 15:23:27', '2');
INSERT INTO `player_login` VALUES ('1809', '58849286', '687', '2013-06-12 15:23:41', '0');
INSERT INTO `player_login` VALUES ('1810', '119118854', '689', '2013-06-12 15:23:55', '0');
INSERT INTO `player_login` VALUES ('1811', '26817094', '688', '2013-06-12 15:24:01', '0');
INSERT INTO `player_login` VALUES ('1812', '19745478', '690', '2013-06-12 15:25:21', '0');
INSERT INTO `player_login` VALUES ('1813', '58849286', '687', '2013-06-12 15:25:24', '2');
INSERT INTO `player_login` VALUES ('1814', '58849286', '691', '2013-06-12 15:25:36', '0');
INSERT INTO `player_login` VALUES ('1815', '5844226', '660', '2013-06-12 15:26:51', '2');
INSERT INTO `player_login` VALUES ('1816', '99943622', '678', '2013-06-12 15:26:54', '2');
INSERT INTO `player_login` VALUES ('1817', '5844226', '692', '2013-06-12 15:27:17', '0');
INSERT INTO `player_login` VALUES ('1818', '99943622', '693', '2013-06-12 15:27:23', '0');
INSERT INTO `player_login` VALUES ('1819', '58849286', '691', '2013-06-12 15:29:10', '2');
INSERT INTO `player_login` VALUES ('1820', '119118854', '689', '2013-06-12 15:29:16', '2');
INSERT INTO `player_login` VALUES ('1821', '58849286', '694', '2013-06-12 15:29:29', '0');
INSERT INTO `player_login` VALUES ('1822', '26817094', '688', '2013-06-12 15:29:33', '2');
INSERT INTO `player_login` VALUES ('1823', '26817094', '696', '2013-06-12 15:29:53', '0');
INSERT INTO `player_login` VALUES ('1824', '119118854', '695', '2013-06-12 15:29:56', '0');
INSERT INTO `player_login` VALUES ('1825', '99943622', '693', '2013-06-12 15:30:54', '2');
INSERT INTO `player_login` VALUES ('1826', '99943622', '697', '2013-06-12 15:31:14', '0');
INSERT INTO `player_login` VALUES ('1827', '26817094', '0', '2013-06-12 15:31:19', '2');
INSERT INTO `player_login` VALUES ('1828', '5844226', '698', '2013-06-12 15:31:25', '0');
INSERT INTO `player_login` VALUES ('1829', '5844226', '698', '2013-06-12 15:33:32', '2');
INSERT INTO `player_login` VALUES ('1830', '5844226', '699', '2013-06-12 15:33:47', '0');
INSERT INTO `player_login` VALUES ('1831', '26817094', '696', '2013-06-12 15:33:48', '0');
INSERT INTO `player_login` VALUES ('1832', '124028870', '686', '2013-06-12 15:33:51', '2');
INSERT INTO `player_login` VALUES ('1833', '49966790', '274', '2013-06-12 15:33:54', '2');
INSERT INTO `player_login` VALUES ('1834', '124028870', '700', '2013-06-12 15:34:16', '0');
INSERT INTO `player_login` VALUES ('1835', '130729222', '701', '2013-06-12 15:35:41', '0');
INSERT INTO `player_login` VALUES ('1836', '59126598', '685', '2013-06-12 15:36:45', '2');
INSERT INTO `player_login` VALUES ('1837', '99943622', '697', '2013-06-12 15:37:01', '2');
INSERT INTO `player_login` VALUES ('1838', '99943622', '702', '2013-06-12 15:37:18', '0');
INSERT INTO `player_login` VALUES ('1839', '66491846', '682', '2013-06-12 15:42:27', '2');
INSERT INTO `player_login` VALUES ('1840', '129870086', '680', '2013-06-12 15:42:39', '2');
INSERT INTO `player_login` VALUES ('1841', '124028870', '700', '2013-06-12 15:42:42', '2');
INSERT INTO `player_login` VALUES ('1842', '66491846', '703', '2013-06-12 15:43:00', '0');
INSERT INTO `player_login` VALUES ('1843', '129870086', '705', '2013-06-12 15:43:02', '0');
INSERT INTO `player_login` VALUES ('1844', '124028870', '704', '2013-06-12 15:43:03', '0');
INSERT INTO `player_login` VALUES ('1845', '99943622', '702', '2013-06-12 15:43:59', '2');
INSERT INTO `player_login` VALUES ('1846', '99943622', '706', '2013-06-12 15:44:19', '0');
INSERT INTO `player_login` VALUES ('1847', '26817094', '696', '2013-06-12 15:44:43', '2');
INSERT INTO `player_login` VALUES ('1848', '19745478', '690', '2013-06-12 15:44:56', '2');
INSERT INTO `player_login` VALUES ('1849', '19745478', '707', '2013-06-12 15:45:23', '0');
INSERT INTO `player_login` VALUES ('1850', '87338054', '684', '2013-06-12 15:46:00', '2');
INSERT INTO `player_login` VALUES ('1851', '41907398', '708', '2013-06-12 15:46:31', '0');
INSERT INTO `player_login` VALUES ('1852', '57640070', '681', '2013-06-12 15:46:53', '2');
INSERT INTO `player_login` VALUES ('1853', '66491846', '703', '2013-06-12 15:47:04', '2');
INSERT INTO `player_login` VALUES ('1854', '57640070', '709', '2013-06-12 15:47:21', '0');
INSERT INTO `player_login` VALUES ('1855', '811841', '138', '2013-06-12 15:47:53', '2');
INSERT INTO `player_login` VALUES ('1856', '38392390', '649', '2013-06-12 15:48:07', '2');
INSERT INTO `player_login` VALUES ('1857', '106689286', '645', '2013-06-12 15:48:45', '2');
INSERT INTO `player_login` VALUES ('1858', '130443462', '677', '2013-06-12 15:49:05', '2');
INSERT INTO `player_login` VALUES ('1859', '119118854', '695', '2013-06-12 15:49:15', '2');
INSERT INTO `player_login` VALUES ('1860', '119118854', '710', '2013-06-12 15:50:01', '0');
INSERT INTO `player_login` VALUES ('1861', '39615494', '674', '2013-06-12 15:50:07', '2');
INSERT INTO `player_login` VALUES ('1862', '119118854', '710', '2013-06-12 15:50:19', '2');
INSERT INTO `player_login` VALUES ('1863', '57640070', '709', '2013-06-12 15:50:26', '2');
INSERT INTO `player_login` VALUES ('1864', '41907398', '708', '2013-06-12 15:51:35', '2');
INSERT INTO `player_login` VALUES ('1865', '41907398', '711', '2013-06-12 15:51:58', '0');
INSERT INTO `player_login` VALUES ('1866', '130729222', '0', '2013-06-12 15:52:35', '2');
INSERT INTO `player_login` VALUES ('1867', '58849286', '694', '2013-06-12 15:54:21', '2');
INSERT INTO `player_login` VALUES ('1868', '129870086', '705', '2013-06-12 15:55:28', '2');
INSERT INTO `player_login` VALUES ('1869', '129870086', '712', '2013-06-12 15:55:57', '0');
INSERT INTO `player_login` VALUES ('1870', '49675462', '663', '2013-06-12 15:56:25', '2');
INSERT INTO `player_login` VALUES ('1871', '21289606', '642', '2013-06-12 15:56:29', '2');
INSERT INTO `player_login` VALUES ('1872', '127551622', '661', '2013-06-12 15:56:36', '2');
INSERT INTO `player_login` VALUES ('1873', '101390918', '623', '2013-06-12 15:58:25', '2');
INSERT INTO `player_login` VALUES ('1874', '128493766', '0', '2013-06-12 16:01:40', '2');
INSERT INTO `player_login` VALUES ('1875', '41907398', '711', '2013-06-12 16:01:46', '2');
INSERT INTO `player_login` VALUES ('1876', '19745478', '707', '2013-06-12 16:05:07', '2');
INSERT INTO `player_login` VALUES ('1877', '5168002', '671', '2013-06-12 16:06:06', '2');
INSERT INTO `player_login` VALUES ('1878', '715778AX', '672', '2013-06-12 16:06:07', '2');
INSERT INTO `player_login` VALUES ('1879', '5844226', '699', '2013-06-12 16:06:13', '2');
INSERT INTO `player_login` VALUES ('1880', '129870086', '712', '2013-06-12 16:07:00', '2');
INSERT INTO `player_login` VALUES ('1881', '21289606', '642', '2013-06-12 16:13:21', '0');
INSERT INTO `player_login` VALUES ('1882', '127551622', '661', '2013-06-12 16:14:45', '0');
INSERT INTO `player_login` VALUES ('1883', '45013318', '477', '2013-06-12 16:19:07', '0');
INSERT INTO `player_login` VALUES ('1884', '49675462', '663', '2013-06-12 16:19:19', '0');
INSERT INTO `player_login` VALUES ('1885', '21289606', '642', '2013-06-12 16:24:37', '2');
INSERT INTO `player_login` VALUES ('1886', '79725062', '562', '2013-06-12 16:28:22', '0');
INSERT INTO `player_login` VALUES ('1887', '130479686', '713', '2013-06-12 16:31:24', '0');
INSERT INTO `player_login` VALUES ('1888', '45013318', '477', '2013-06-12 16:31:47', '2');
INSERT INTO `player_login` VALUES ('1889', '21289606', '642', '2013-06-12 16:33:16', '0');
INSERT INTO `player_login` VALUES ('1890', '130479686', '713', '2013-06-12 16:36:50', '2');
INSERT INTO `player_login` VALUES ('1891', '130479686', '714', '2013-06-12 16:37:07', '0');
INSERT INTO `player_login` VALUES ('1892', '130479686', '714', '2013-06-12 16:38:14', '2');
INSERT INTO `player_login` VALUES ('1893', '41256582', '715', '2013-06-12 16:45:17', '0');
INSERT INTO `player_login` VALUES ('1894', '41256582', '715', '2013-06-12 16:45:32', '2');
INSERT INTO `player_login` VALUES ('1895', '79725062', '562', '2013-06-12 17:05:49', '2');
INSERT INTO `player_login` VALUES ('1896', '127551622', '661', '2013-06-12 17:06:00', '2');
INSERT INTO `player_login` VALUES ('1897', '127551622', '661', '2013-06-12 17:07:40', '0');
INSERT INTO `player_login` VALUES ('1898', '107586694', '315', '2013-06-12 17:09:32', '0');
INSERT INTO `player_login` VALUES ('1899', '107586694', '315', '2013-06-12 17:18:59', '2');
INSERT INTO `player_login` VALUES ('1900', '79725062', '562', '2013-06-12 17:20:08', '0');
INSERT INTO `player_login` VALUES ('1901', '17742854', '716', '2013-06-12 17:22:02', '0');
INSERT INTO `player_login` VALUES ('1902', '101050310', '145', '2013-06-12 17:23:18', '0');
INSERT INTO `player_login` VALUES ('1903', '101050310', '717', '2013-06-12 17:26:05', '0');
INSERT INTO `player_login` VALUES ('1904', '104035590', '718', '2013-06-12 17:27:16', '0');
INSERT INTO `player_login` VALUES ('1905', '101050310', '717', '2013-06-12 17:35:51', '2');
INSERT INTO `player_login` VALUES ('1906', '79725062', '562', '2013-06-12 17:43:10', '2');
INSERT INTO `player_login` VALUES ('1907', '49919238', '235', '2013-06-12 17:44:47', '0');
INSERT INTO `player_login` VALUES ('1908', '17742854', '716', '2013-06-12 17:46:34', '2');
INSERT INTO `player_login` VALUES ('1909', '20929094', '719', '2013-06-12 17:49:52', '0');
INSERT INTO `player_login` VALUES ('1910', '87880902', '720', '2013-06-12 17:53:35', '0');
INSERT INTO `player_login` VALUES ('1911', '49919238', '235', '2013-06-12 17:54:13', '2');
INSERT INTO `player_login` VALUES ('1912', '20929094', '719', '2013-06-12 17:55:17', '2');
INSERT INTO `player_login` VALUES ('1913', '49675462', '663', '2013-06-12 17:56:40', '2');
INSERT INTO `player_login` VALUES ('1914', '21289606', '642', '2013-06-12 17:57:46', '2');
INSERT INTO `player_login` VALUES ('1915', '127551622', '661', '2013-06-12 17:58:01', '2');
INSERT INTO `player_login` VALUES ('1916', '104035590', '718', '2013-06-12 17:59:32', '2');
INSERT INTO `player_login` VALUES ('1917', '21289606', '642', '2013-06-12 18:04:29', '0');
INSERT INTO `player_login` VALUES ('1918', '87880902', '0', '2013-06-12 18:05:05', '2');
INSERT INTO `player_login` VALUES ('1919', '49675462', '663', '2013-06-12 18:06:21', '0');
INSERT INTO `player_login` VALUES ('1920', '127551622', '661', '2013-06-12 18:06:36', '0');
INSERT INTO `player_login` VALUES ('1921', '87880902', '720', '2013-06-12 18:15:27', '0');
INSERT INTO `player_login` VALUES ('1922', '86434182', '515', '2013-06-12 18:19:43', '0');
INSERT INTO `player_login` VALUES ('1923', '86434182', '515', '2013-06-12 18:30:50', '0');
INSERT INTO `player_login` VALUES ('1924', '21289606', '642', '2013-06-12 18:32:44', '2');
INSERT INTO `player_login` VALUES ('1925', '21289606', '721', '2013-06-12 18:33:02', '0');
INSERT INTO `player_login` VALUES ('1926', '104035590', '718', '2013-06-12 18:34:08', '0');
INSERT INTO `player_login` VALUES ('1927', '127551622', '661', '2013-06-12 18:34:55', '2');
INSERT INTO `player_login` VALUES ('1928', '127551622', '661', '2013-06-12 18:44:04', '0');
INSERT INTO `player_login` VALUES ('1929', '21289606', '721', '2013-06-12 18:44:52', '2');
INSERT INTO `player_login` VALUES ('1930', '21289606', '722', '2013-06-12 18:45:13', '0');
INSERT INTO `player_login` VALUES ('1931', '21289606', '722', '2013-06-12 18:47:28', '2');
INSERT INTO `player_login` VALUES ('1932', '21289606', '723', '2013-06-12 18:47:42', '0');
INSERT INTO `player_login` VALUES ('1933', '21289606', '723', '2013-06-12 18:50:37', '2');
INSERT INTO `player_login` VALUES ('1934', '79725062', '724', '2013-06-12 18:50:52', '0');
INSERT INTO `player_login` VALUES ('1935', '21289606', '725', '2013-06-12 18:50:58', '0');
INSERT INTO `player_login` VALUES ('1936', '21289606', '725', '2013-06-12 18:52:29', '2');
INSERT INTO `player_login` VALUES ('1937', '21289606', '726', '2013-06-12 18:52:44', '0');
INSERT INTO `player_login` VALUES ('1938', '38392390', '727', '2013-06-12 18:54:46', '0');
INSERT INTO `player_login` VALUES ('1939', '21289606', '726', '2013-06-12 18:56:10', '2');
INSERT INTO `player_login` VALUES ('1940', '21289606', '728', '2013-06-12 18:56:29', '0');
INSERT INTO `player_login` VALUES ('1941', '104035590', '718', '2013-06-12 18:59:54', '2');
INSERT INTO `player_login` VALUES ('1942', '104035590', '718', '2013-06-12 19:00:33', '0');
INSERT INTO `player_login` VALUES ('1943', '104035590', '718', '2013-06-12 19:01:06', '2');
INSERT INTO `player_login` VALUES ('1944', '104035590', '729', '2013-06-12 19:01:21', '0');
INSERT INTO `player_login` VALUES ('1945', '79725062', '724', '2013-06-12 19:06:36', '2');
INSERT INTO `player_login` VALUES ('1946', '79725062', '724', '2013-06-12 19:06:54', '0');
INSERT INTO `player_login` VALUES ('1947', '20838214', '730', '2013-06-12 19:08:00', '0');
INSERT INTO `player_login` VALUES ('1948', '20838214', '730', '2013-06-12 19:08:27', '2');
INSERT INTO `player_login` VALUES ('1949', '20789062', '731', '2013-06-12 19:08:30', '0');
INSERT INTO `player_login` VALUES ('1950', '104035590', '729', '2013-06-12 19:08:35', '2');
INSERT INTO `player_login` VALUES ('1951', '104035590', '732', '2013-06-12 19:08:49', '0');
INSERT INTO `player_login` VALUES ('1952', '20789062', '731', '2013-06-12 19:10:58', '2');
INSERT INTO `player_login` VALUES ('1953', '104035590', '732', '2013-06-12 19:13:04', '2');
INSERT INTO `player_login` VALUES ('1954', '88417990', '382', '2013-06-12 19:13:05', '0');
INSERT INTO `player_login` VALUES ('1955', '79725062', '724', '2013-06-12 19:13:11', '2');
INSERT INTO `player_login` VALUES ('1956', '125207238', '733', '2013-06-12 19:13:23', '0');
INSERT INTO `player_login` VALUES ('1957', '79725062', '724', '2013-06-12 19:13:27', '0');
INSERT INTO `player_login` VALUES ('1958', '42248390', '356', '2013-06-12 19:14:06', '0');
INSERT INTO `player_login` VALUES ('1959', '125207238', '733', '2013-06-12 19:15:52', '2');
INSERT INTO `player_login` VALUES ('1960', '27356358', '734', '2013-06-12 19:19:11', '0');
INSERT INTO `player_login` VALUES ('1961', '38392390', '727', '2013-06-12 19:20:49', '2');
INSERT INTO `player_login` VALUES ('1962', '27356358', '734', '2013-06-12 19:21:17', '2');
INSERT INTO `player_login` VALUES ('1963', '127551622', '661', '2013-06-12 19:21:37', '2');
INSERT INTO `player_login` VALUES ('1964', '127551622', '735', '2013-06-12 19:22:17', '0');
INSERT INTO `player_login` VALUES ('1965', '38392390', '727', '2013-06-12 19:25:44', '0');
INSERT INTO `player_login` VALUES ('1966', '79725062', '724', '2013-06-12 19:28:44', '2');
INSERT INTO `player_login` VALUES ('1967', '79725062', '724', '2013-06-12 19:29:09', '0');
INSERT INTO `player_login` VALUES ('1968', '101316934', '622', '2013-06-12 19:30:00', '0');
INSERT INTO `player_login` VALUES ('1969', '101316934', '622', '2013-06-12 19:34:39', '2');
INSERT INTO `player_login` VALUES ('1970', '87880902', '720', '2013-06-12 19:39:24', '2');
INSERT INTO `player_login` VALUES ('1971', '88417990', '382', '2013-06-12 19:43:05', '2');
INSERT INTO `player_login` VALUES ('1972', '42248390', '356', '2013-06-12 19:43:20', '2');
INSERT INTO `player_login` VALUES ('1973', '56077190', '253', '2013-06-12 19:44:28', '0');
INSERT INTO `player_login` VALUES ('1974', '56077190', '253', '2013-06-12 19:44:48', '2');
INSERT INTO `player_login` VALUES ('1975', '38392390', '727', '2013-06-12 19:49:42', '2');
INSERT INTO `player_login` VALUES ('1976', '79725062', '724', '2013-06-12 20:01:32', '2');
INSERT INTO `player_login` VALUES ('1977', '101390918', '623', '2013-06-12 20:25:50', '0');
INSERT INTO `player_login` VALUES ('1978', '101390918', '623', '2013-06-12 20:29:29', '2');
INSERT INTO `player_login` VALUES ('1979', '82609926', '736', '2013-06-12 20:36:34', '0');
INSERT INTO `player_login` VALUES ('1980', '82609926', '736', '2013-06-12 20:36:57', '2');
INSERT INTO `player_login` VALUES ('1981', '127551622', '735', '2013-06-12 20:46:45', '2');
INSERT INTO `player_login` VALUES ('1982', '127551622', '735', '2013-06-12 20:47:22', '0');
INSERT INTO `player_login` VALUES ('1983', '49675462', '663', '2013-06-12 20:47:49', '2');
INSERT INTO `player_login` VALUES ('1984', '21289606', '728', '2013-06-12 20:50:56', '2');
INSERT INTO `player_login` VALUES ('1985', '86434182', '515', '2013-06-12 20:54:31', '0');
INSERT INTO `player_login` VALUES ('1986', '127551622', '735', '2013-06-12 20:56:51', '2');
INSERT INTO `player_login` VALUES ('1987', '86434182', '515', '2013-06-12 21:08:24', '2');
INSERT INTO `player_login` VALUES ('1988', '79725062', '724', '2013-06-12 21:20:23', '0');
INSERT INTO `player_login` VALUES ('1989', '79725062', '724', '2013-06-12 21:21:25', '2');
INSERT INTO `player_login` VALUES ('1990', '92569094', '737', '2013-06-12 21:23:49', '0');
INSERT INTO `player_login` VALUES ('1991', '92569094', '737', '2013-06-12 21:23:57', '2');
INSERT INTO `player_login` VALUES ('1992', '70820422', '738', '2013-06-12 21:52:44', '0');
INSERT INTO `player_login` VALUES ('1993', '70820422', '738', '2013-06-12 21:54:09', '2');
INSERT INTO `player_login` VALUES ('1994', '36824838', '739', '2013-06-12 22:21:56', '0');
INSERT INTO `player_login` VALUES ('1995', '36824838', '739', '2013-06-12 22:29:39', '2');
INSERT INTO `player_login` VALUES ('1996', '99124038', '740', '2013-06-12 22:30:54', '0');
INSERT INTO `player_login` VALUES ('1997', '99124038', '740', '2013-06-12 22:42:46', '2');
INSERT INTO `player_login` VALUES ('1998', '99124038', '741', '2013-06-12 22:43:14', '0');
INSERT INTO `player_login` VALUES ('1999', '79725062', '724', '2013-06-12 22:45:47', '0');
INSERT INTO `player_login` VALUES ('2000', '21558662', '113', '2013-06-12 22:49:28', '0');
INSERT INTO `player_login` VALUES ('2001', '79429958', '742', '2013-06-12 22:51:26', '0');
INSERT INTO `player_login` VALUES ('2002', '99124038', '741', '2013-06-12 22:53:24', '2');
INSERT INTO `player_login` VALUES ('2003', '99124038', '743', '2013-06-12 22:53:59', '0');
INSERT INTO `player_login` VALUES ('2004', '79429958', '742', '2013-06-12 22:54:41', '2');
INSERT INTO `player_login` VALUES ('2005', '79429958', '742', '2013-06-12 23:01:17', '0');
INSERT INTO `player_login` VALUES ('2006', '79725062', '724', '2013-06-12 23:02:53', '2');
INSERT INTO `player_login` VALUES ('2007', '79725062', '744', '2013-06-12 23:03:48', '0');
INSERT INTO `player_login` VALUES ('2008', '79725062', '744', '2013-06-12 23:13:24', '2');
INSERT INTO `player_login` VALUES ('2009', '21558662', '113', '2013-06-12 23:13:42', '2');
INSERT INTO `player_login` VALUES ('2010', '79725062', '745', '2013-06-12 23:13:45', '0');
INSERT INTO `player_login` VALUES ('2011', '36824838', '746', '2013-06-12 23:37:56', '0');
INSERT INTO `player_login` VALUES ('2012', '79725062', '745', '2013-06-12 23:50:45', '2');
INSERT INTO `player_login` VALUES ('2013', '79725062', '747', '2013-06-12 23:51:13', '0');
INSERT INTO `player_login` VALUES ('2014', '36824838', '746', '2013-06-12 23:56:53', '2');
INSERT INTO `player_login` VALUES ('2015', '79725062', '747', '2013-06-12 23:57:08', '2');
INSERT INTO `player_login` VALUES ('2016', '79725062', '748', '2013-06-12 23:57:22', '0');
INSERT INTO `player_login` VALUES ('2017', '79429958', '742', '2013-06-13 00:00:00', '2');
INSERT INTO `player_login` VALUES ('2018', '79725062', '748', '2013-06-13 00:00:05', '2');
INSERT INTO `player_login` VALUES ('2019', '99124038', '743', '2013-06-13 00:00:08', '2');
INSERT INTO `player_login` VALUES ('2020', '99124038', '743', '2013-06-13 00:04:59', '0');
INSERT INTO `player_login` VALUES ('2021', '55064134', '749', '2013-06-13 00:10:43', '0');
INSERT INTO `player_login` VALUES ('2022', '55064134', '749', '2013-06-13 00:28:57', '2');
INSERT INTO `player_login` VALUES ('2023', '99124038', '743', '2013-06-13 01:36:06', '2');
INSERT INTO `player_login` VALUES ('2024', '99124038', '750', '2013-06-13 01:36:39', '0');
INSERT INTO `player_login` VALUES ('2025', '99124038', '750', '2013-06-13 02:07:08', '2');
INSERT INTO `player_login` VALUES ('2026', '100350726', '751', '2013-06-13 02:21:40', '0');
INSERT INTO `player_login` VALUES ('2027', '100350726', '751', '2013-06-13 02:22:14', '2');
INSERT INTO `player_login` VALUES ('2028', '87880902', '720', '2013-06-13 03:41:42', '0');
INSERT INTO `player_login` VALUES ('2029', '86434182', '515', '2013-06-13 03:55:55', '0');
INSERT INTO `player_login` VALUES ('2030', '3766534', '11', '2013-06-13 04:22:11', '0');
INSERT INTO `player_login` VALUES ('2031', '3766534', '11', '2013-06-13 04:22:29', '2');
INSERT INTO `player_login` VALUES ('2032', '87880902', '752', '2013-06-13 04:28:57', '0');
INSERT INTO `player_login` VALUES ('2033', '87880902', '752', '2013-06-13 05:16:25', '2');
INSERT INTO `player_login` VALUES ('2034', '128518982', '753', '2013-06-13 07:03:06', '0');
INSERT INTO `player_login` VALUES ('2035', '128518982', '753', '2013-06-13 07:03:22', '2');
INSERT INTO `player_login` VALUES ('2036', '517633AX', '0', '2013-06-13 07:07:35', '2');
INSERT INTO `player_login` VALUES ('2037', '127551622', '735', '2013-06-13 07:08:07', '0');
INSERT INTO `player_login` VALUES ('2038', '127551622', '735', '2013-06-13 07:12:37', '2');
INSERT INTO `player_login` VALUES ('2039', '4858498', '755', '2013-06-13 07:19:03', '0');
INSERT INTO `player_login` VALUES ('2040', '4858498', '755', '2013-06-13 07:19:55', '2');
INSERT INTO `player_login` VALUES ('2041', '128518982', '753', '2013-06-13 07:26:19', '0');
INSERT INTO `player_login` VALUES ('2042', '128518982', '753', '2013-06-13 07:26:28', '2');
INSERT INTO `player_login` VALUES ('2043', '42248390', '356', '2013-06-13 07:37:23', '0');
INSERT INTO `player_login` VALUES ('2044', '38392390', '727', '2013-06-13 07:39:09', '0');
INSERT INTO `player_login` VALUES ('2045', '38392390', '727', '2013-06-13 08:06:36', '2');
INSERT INTO `player_login` VALUES ('2046', '38392390', '727', '2013-06-13 08:09:40', '0');
INSERT INTO `player_login` VALUES ('2047', '42248390', '356', '2013-06-13 08:13:46', '2');
INSERT INTO `player_login` VALUES ('2048', '130654470', '615', '2013-06-13 08:14:45', '0');
INSERT INTO `player_login` VALUES ('2049', '38392390', '727', '2013-06-13 08:20:46', '2');
INSERT INTO `player_login` VALUES ('2050', '38392390', '756', '2013-06-13 08:21:07', '0');
INSERT INTO `player_login` VALUES ('2051', '49675462', '663', '2013-06-13 08:27:14', '0');
INSERT INTO `player_login` VALUES ('2052', '21289606', '728', '2013-06-13 08:27:14', '0');
INSERT INTO `player_login` VALUES ('2053', '127551622', '735', '2013-06-13 08:27:37', '0');
INSERT INTO `player_login` VALUES ('2054', '97089606', '638', '2013-06-13 08:29:59', '0');
INSERT INTO `player_login` VALUES ('2055', '49675462', '663', '2013-06-13 08:35:05', '2');
INSERT INTO `player_login` VALUES ('2056', '49675462', '757', '2013-06-13 08:35:23', '0');
INSERT INTO `player_login` VALUES ('2057', '97089606', '638', '2013-06-13 08:43:06', '2');
INSERT INTO `player_login` VALUES ('2058', '97089606', '758', '2013-06-13 08:43:22', '0');
INSERT INTO `player_login` VALUES ('2059', '127551622', '735', '2013-06-13 08:54:21', '2');
INSERT INTO `player_login` VALUES ('2060', '21289606', '728', '2013-06-13 08:55:19', '2');
INSERT INTO `player_login` VALUES ('2061', '38392390', '756', '2013-06-13 08:57:23', '2');
INSERT INTO `player_login` VALUES ('2062', '97089606', '758', '2013-06-13 08:59:18', '2');
INSERT INTO `player_login` VALUES ('2063', '38392390', '756', '2013-06-13 09:00:49', '0');
INSERT INTO `player_login` VALUES ('2064', '38392390', '756', '2013-06-13 09:05:19', '0');
INSERT INTO `player_login` VALUES ('2065', '38392390', '756', '2013-06-13 09:06:48', '2');
INSERT INTO `player_login` VALUES ('2066', '38392390', '759', '2013-06-13 09:07:05', '0');
INSERT INTO `player_login` VALUES ('2067', '21289606', '728', '2013-06-13 09:08:11', '0');
INSERT INTO `player_login` VALUES ('2068', '49675462', '757', '2013-06-13 09:08:13', '0');
INSERT INTO `player_login` VALUES ('2069', '127551622', '735', '2013-06-13 09:11:31', '0');
INSERT INTO `player_login` VALUES ('2070', '127551622', '735', '2013-06-13 09:19:16', '2');
INSERT INTO `player_login` VALUES ('2071', '127551622', '735', '2013-06-13 09:20:22', '0');
INSERT INTO `player_login` VALUES ('2072', '11361472', '760', '2013-06-13 09:29:48', '0');
INSERT INTO `player_login` VALUES ('2073', '11361472', '760', '2013-06-13 09:38:16', '2');
INSERT INTO `player_login` VALUES ('2074', '11361472', '761', '2013-06-13 09:39:40', '0');
INSERT INTO `player_login` VALUES ('2075', '21289606', '728', '2013-06-13 09:48:55', '2');
INSERT INTO `player_login` VALUES ('2076', '127551622', '735', '2013-06-13 09:48:55', '2');
INSERT INTO `player_login` VALUES ('2077', '127551622', '735', '2013-06-13 09:49:31', '0');
INSERT INTO `player_login` VALUES ('2078', '21289606', '728', '2013-06-13 09:51:20', '0');
INSERT INTO `player_login` VALUES ('2079', '5523586', '670', '2013-06-13 09:57:46', '0');
INSERT INTO `player_login` VALUES ('2080', '11361472', '761', '2013-06-13 09:58:36', '2');
INSERT INTO `player_login` VALUES ('2081', '21289606', '728', '2013-06-13 09:59:12', '2');
INSERT INTO `player_login` VALUES ('2082', '49675462', '757', '2013-06-13 09:59:17', '2');
INSERT INTO `player_login` VALUES ('2083', '127551622', '735', '2013-06-13 09:59:17', '2');
INSERT INTO `player_login` VALUES ('2084', '5523586', '670', '2013-06-13 09:59:31', '2');
INSERT INTO `player_login` VALUES ('2085', '38392390', '759', '2013-06-13 10:00:15', '2');
INSERT INTO `player_login` VALUES ('2086', '21289606', '728', '2013-06-13 10:11:21', '0');
INSERT INTO `player_login` VALUES ('2087', '49675462', '757', '2013-06-13 10:11:38', '0');
INSERT INTO `player_login` VALUES ('2088', '127551622', '735', '2013-06-13 10:12:31', '0');
INSERT INTO `player_login` VALUES ('2089', '75255942', '762', '2013-06-13 10:18:59', '0');
INSERT INTO `player_login` VALUES ('2090', '101390918', '623', '2013-06-13 10:20:28', '0');
INSERT INTO `player_login` VALUES ('2091', '75255942', '762', '2013-06-13 10:22:42', '2');
INSERT INTO `player_login` VALUES ('2092', '75255942', '763', '2013-06-13 10:22:58', '0');
INSERT INTO `player_login` VALUES ('2093', '101390918', '623', '2013-06-13 10:35:12', '2');
INSERT INTO `player_login` VALUES ('2094', '75255942', '763', '2013-06-13 10:41:31', '2');
INSERT INTO `player_login` VALUES ('2095', '75255942', '764', '2013-06-13 10:41:56', '0');
INSERT INTO `player_login` VALUES ('2096', '127551622', '735', '2013-06-13 10:47:36', '2');
INSERT INTO `player_login` VALUES ('2097', '21289606', '728', '2013-06-13 10:51:38', '2');
INSERT INTO `player_login` VALUES ('2098', '109552646', '765', '2013-06-13 11:02:15', '0');
INSERT INTO `player_login` VALUES ('2099', '111749446', '766', '2013-06-13 11:02:17', '0');
INSERT INTO `player_login` VALUES ('2100', '109552646', '765', '2013-06-13 11:02:48', '2');
INSERT INTO `player_login` VALUES ('2101', '111749446', '766', '2013-06-13 11:03:15', '2');
INSERT INTO `player_login` VALUES ('2102', '111749446', '766', '2013-06-13 11:03:30', '0');
INSERT INTO `player_login` VALUES ('2103', '111749446', '766', '2013-06-13 11:03:47', '2');
INSERT INTO `player_login` VALUES ('2104', '76924422', '767', '2013-06-13 11:20:21', '0');
INSERT INTO `player_login` VALUES ('2105', '76924422', '767', '2013-06-13 11:20:34', '2');
INSERT INTO `player_login` VALUES ('2106', '75255942', '764', '2013-06-13 11:28:00', '2');
INSERT INTO `player_login` VALUES ('2107', '117060678', '768', '2013-06-13 11:28:21', '0');
INSERT INTO `player_login` VALUES ('2108', '117060678', '768', '2013-06-13 11:28:24', '2');
INSERT INTO `player_login` VALUES ('2109', '21938310', '634', '2013-06-13 11:28:44', '0');
INSERT INTO `player_login` VALUES ('2110', '75255942', '769', '2013-06-13 11:28:49', '0');
INSERT INTO `player_login` VALUES ('2111', '21938310', '634', '2013-06-13 11:30:18', '2');
INSERT INTO `player_login` VALUES ('2112', '21938310', '634', '2013-06-13 11:30:31', '0');
INSERT INTO `player_login` VALUES ('2113', '102666694', '459', '2013-06-13 11:32:34', '0');
INSERT INTO `player_login` VALUES ('2114', '121339078', '473', '2013-06-13 11:37:01', '0');
INSERT INTO `player_login` VALUES ('2115', '21938310', '634', '2013-06-13 11:38:47', '2');
INSERT INTO `player_login` VALUES ('2116', '21938310', '770', '2013-06-13 11:39:03', '0');
INSERT INTO `player_login` VALUES ('2117', '121339078', '473', '2013-06-13 11:44:19', '2');
INSERT INTO `player_login` VALUES ('2118', '102666694', '459', '2013-06-13 11:44:41', '2');
INSERT INTO `player_login` VALUES ('2119', '121339078', '473', '2013-06-13 11:48:19', '0');
INSERT INTO `player_login` VALUES ('2120', '21938310', '770', '2013-06-13 11:59:01', '2');
INSERT INTO `player_login` VALUES ('2121', '75255942', '769', '2013-06-13 11:59:40', '2');
INSERT INTO `player_login` VALUES ('2122', '121339078', '473', '2013-06-13 12:00:07', '2');
INSERT INTO `player_login` VALUES ('2123', '102666694', '459', '2013-06-13 12:04:25', '0');
INSERT INTO `player_login` VALUES ('2124', '121339078', '473', '2013-06-13 12:04:41', '0');
INSERT INTO `player_login` VALUES ('2125', '5844226', '699', '2013-06-13 12:06:14', '0');
INSERT INTO `player_login` VALUES ('2126', '21938310', '770', '2013-06-13 12:06:37', '0');
INSERT INTO `player_login` VALUES ('2127', '130636742', '771', '2013-06-13 12:09:49', '0');
INSERT INTO `player_login` VALUES ('2128', '75255942', '769', '2013-06-13 12:11:30', '0');
INSERT INTO `player_login` VALUES ('2129', '21938310', '770', '2013-06-13 12:12:12', '2');
INSERT INTO `player_login` VALUES ('2130', '130636742', '771', '2013-06-13 12:18:20', '2');
INSERT INTO `player_login` VALUES ('2131', '5523586', '670', '2013-06-13 12:25:29', '0');
INSERT INTO `player_login` VALUES ('2132', '5844226', '699', '2013-06-13 12:36:35', '2');
INSERT INTO `player_login` VALUES ('2133', '5523586', '670', '2013-06-13 12:48:08', '2');
INSERT INTO `player_login` VALUES ('2134', '5844226', '699', '2013-06-13 12:54:59', '0');
INSERT INTO `player_login` VALUES ('2135', '75255942', '769', '2013-06-13 13:00:02', '2');
INSERT INTO `player_login` VALUES ('2136', '5844226', '699', '2013-06-13 13:08:34', '2');
INSERT INTO `player_login` VALUES ('2137', '5844226', '699', '2013-06-13 13:10:16', '0');
INSERT INTO `player_login` VALUES ('2138', '121339078', '473', '2013-06-13 13:15:49', '2');
INSERT INTO `player_login` VALUES ('2139', '121339078', '473', '2013-06-13 13:17:00', '0');
INSERT INTO `player_login` VALUES ('2140', '119824134', '772', '2013-06-13 13:17:08', '0');
INSERT INTO `player_login` VALUES ('2141', '107586694', '315', '2013-06-13 13:17:36', '0');
INSERT INTO `player_login` VALUES ('2142', '107586694', '315', '2013-06-13 13:20:16', '2');
INSERT INTO `player_login` VALUES ('2143', '97089606', '758', '2013-06-13 13:20:54', '0');
INSERT INTO `player_login` VALUES ('2144', '107586694', '773', '2013-06-13 13:21:15', '0');
INSERT INTO `player_login` VALUES ('2145', '107586694', '773', '2013-06-13 13:24:04', '2');
INSERT INTO `player_login` VALUES ('2146', '107586694', '774', '2013-06-13 13:25:02', '0');
INSERT INTO `player_login` VALUES ('2147', '119824134', '772', '2013-06-13 13:26:16', '2');
INSERT INTO `player_login` VALUES ('2148', '119824134', '775', '2013-06-13 13:26:37', '0');
INSERT INTO `player_login` VALUES ('2149', '119824134', '775', '2013-06-13 13:29:27', '2');
INSERT INTO `player_login` VALUES ('2150', '119824134', '776', '2013-06-13 13:29:47', '0');
INSERT INTO `player_login` VALUES ('2151', '121339078', '473', '2013-06-13 13:30:02', '2');
INSERT INTO `player_login` VALUES ('2152', '102666694', '459', '2013-06-13 13:32:23', '2');
INSERT INTO `player_login` VALUES ('2153', '43186246', '777', '2013-06-13 13:45:24', '0');
INSERT INTO `player_login` VALUES ('2154', '38392390', '759', '2013-06-13 13:49:36', '0');
INSERT INTO `player_login` VALUES ('2155', '97089606', '758', '2013-06-13 13:54:23', '2');
INSERT INTO `player_login` VALUES ('2156', '43186246', '777', '2013-06-13 13:54:26', '2');
INSERT INTO `player_login` VALUES ('2157', '43186246', '777', '2013-06-13 13:56:26', '0');
INSERT INTO `player_login` VALUES ('2158', '5844226', '699', '2013-06-13 14:03:57', '2');
INSERT INTO `player_login` VALUES ('2159', '56331078', '778', '2013-06-13 14:05:26', '0');
INSERT INTO `player_login` VALUES ('2160', '43186246', '777', '2013-06-13 14:07:55', '2');
INSERT INTO `player_login` VALUES ('2161', '43186246', '779', '2013-06-13 14:08:21', '0');
INSERT INTO `player_login` VALUES ('2162', '5844226', '699', '2013-06-13 14:10:56', '0');
INSERT INTO `player_login` VALUES ('2163', '106689286', '645', '2013-06-13 14:11:11', '0');
INSERT INTO `player_login` VALUES ('2164', '119824134', '776', '2013-06-13 14:11:47', '2');
INSERT INTO `player_login` VALUES ('2165', '56331078', '778', '2013-06-13 14:12:59', '2');
INSERT INTO `player_login` VALUES ('2166', '56331078', '780', '2013-06-13 14:13:31', '0');
INSERT INTO `player_login` VALUES ('2167', '130197126', '781', '2013-06-13 14:15:18', '0');
INSERT INTO `player_login` VALUES ('2168', '5523586', '670', '2013-06-13 14:16:20', '0');
INSERT INTO `player_login` VALUES ('2169', '21938310', '770', '2013-06-13 14:19:31', '0');
INSERT INTO `player_login` VALUES ('2170', '21938310', '770', '2013-06-13 14:21:43', '2');
INSERT INTO `player_login` VALUES ('2171', '43186246', '779', '2013-06-13 14:22:12', '2');
INSERT INTO `player_login` VALUES ('2172', '21938310', '770', '2013-06-13 14:23:58', '0');
INSERT INTO `player_login` VALUES ('2173', '43186246', '782', '2013-06-13 14:24:07', '0');
INSERT INTO `player_login` VALUES ('2174', '43186246', '782', '2013-06-13 14:26:33', '2');
INSERT INTO `player_login` VALUES ('2175', '5168002', '671', '2013-06-13 14:26:55', '0');
INSERT INTO `player_login` VALUES ('2176', '43186246', '783', '2013-06-13 14:27:02', '0');
INSERT INTO `player_login` VALUES ('2177', '56331078', '780', '2013-06-13 14:30:16', '2');
INSERT INTO `player_login` VALUES ('2178', '130197126', '781', '2013-06-13 14:37:44', '2');
INSERT INTO `player_login` VALUES ('2179', '5523586', '670', '2013-06-13 14:40:39', '2');
INSERT INTO `player_login` VALUES ('2180', '5523586', '784', '2013-06-13 14:41:11', '0');
INSERT INTO `player_login` VALUES ('2181', '21938310', '770', '2013-06-13 14:44:20', '2');
INSERT INTO `player_login` VALUES ('2182', '18066822', '785', '2013-06-13 14:48:15', '0');
INSERT INTO `player_login` VALUES ('2183', '5844226', '699', '2013-06-13 14:54:00', '2');
INSERT INTO `player_login` VALUES ('2184', '5844226', '699', '2013-06-13 14:54:34', '0');
INSERT INTO `player_login` VALUES ('2185', '18066822', '785', '2013-06-13 14:57:03', '2');
INSERT INTO `player_login` VALUES ('2186', '5844226', '699', '2013-06-13 15:15:17', '2');
INSERT INTO `player_login` VALUES ('2187', '5844226', '786', '2013-06-13 15:15:34', '0');
INSERT INTO `player_login` VALUES ('2188', '5523586', '784', '2013-06-13 15:18:55', '2');
INSERT INTO `player_login` VALUES ('2189', '43186246', '783', '2013-06-13 15:19:45', '2');
INSERT INTO `player_login` VALUES ('2190', '37623174', '787', '2013-06-13 15:24:02', '0');
INSERT INTO `player_login` VALUES ('2191', '5844226', '786', '2013-06-13 15:26:06', '2');
INSERT INTO `player_login` VALUES ('2192', '5844226', '786', '2013-06-13 15:26:29', '0');
INSERT INTO `player_login` VALUES ('2193', '87880902', '752', '2013-06-13 15:35:47', '0');
INSERT INTO `player_login` VALUES ('2194', '37623174', '787', '2013-06-13 15:38:01', '2');
INSERT INTO `player_login` VALUES ('2195', '87880902', '752', '2013-06-13 15:39:02', '0');
INSERT INTO `player_login` VALUES ('2196', '5844226', '786', '2013-06-13 15:41:47', '2');
INSERT INTO `player_login` VALUES ('2197', '106689286', '645', '2013-06-13 15:53:12', '2');
INSERT INTO `player_login` VALUES ('2198', '39024902', '788', '2013-06-13 15:59:35', '0');
INSERT INTO `player_login` VALUES ('2199', '39024902', '788', '2013-06-13 16:03:01', '2');
INSERT INTO `player_login` VALUES ('2200', '39024902', '789', '2013-06-13 16:03:24', '0');
INSERT INTO `player_login` VALUES ('2201', '39024902', '789', '2013-06-13 16:05:53', '2');
INSERT INTO `player_login` VALUES ('2202', '87880902', '752', '2013-06-13 16:08:51', '2');
INSERT INTO `player_login` VALUES ('2203', '38392390', '759', '2013-06-13 16:22:44', '2');
INSERT INTO `player_login` VALUES ('2204', '38392390', '759', '2013-06-13 16:23:10', '0');
INSERT INTO `player_login` VALUES ('2205', '38392390', '759', '2013-06-13 16:26:33', '2');
INSERT INTO `player_login` VALUES ('2206', '38392390', '759', '2013-06-13 16:31:43', '0');
INSERT INTO `player_login` VALUES ('2207', '87880902', '752', '2013-06-13 16:33:58', '0');
INSERT INTO `player_login` VALUES ('2208', '38392390', '759', '2013-06-13 16:44:12', '2');
INSERT INTO `player_login` VALUES ('2209', '38392390', '790', '2013-06-13 16:44:33', '0');
INSERT INTO `player_login` VALUES ('2210', '130860230', '791', '2013-06-13 16:45:46', '2');
INSERT INTO `player_login` VALUES ('2211', '120616966', '792', '2013-06-13 16:50:45', '0');
INSERT INTO `player_login` VALUES ('2212', '38392390', '790', '2013-06-13 16:51:25', '2');
INSERT INTO `player_login` VALUES ('2213', '38392390', '793', '2013-06-13 16:51:44', '0');
INSERT INTO `player_login` VALUES ('2214', '101502918', '794', '2013-06-13 16:53:52', '0');
INSERT INTO `player_login` VALUES ('2215', '101502918', '794', '2013-06-13 16:55:06', '2');
INSERT INTO `player_login` VALUES ('2216', '115665030', '795', '2013-06-13 17:03:03', '0');
INSERT INTO `player_login` VALUES ('2217', '120616966', '792', '2013-06-13 17:06:33', '2');
INSERT INTO `player_login` VALUES ('2218', '125688646', '0', '2013-06-13 17:07:14', '2');
INSERT INTO `player_login` VALUES ('2219', '38392390', '793', '2013-06-13 17:18:36', '2');
INSERT INTO `player_login` VALUES ('2220', '38392390', '797', '2013-06-13 17:18:51', '0');
INSERT INTO `player_login` VALUES ('2221', '115665030', '795', '2013-06-13 17:28:07', '2');
INSERT INTO `player_login` VALUES ('2222', '127551622', '735', '2013-06-13 17:28:20', '0');
INSERT INTO `player_login` VALUES ('2223', '87880902', '752', '2013-06-13 17:29:06', '2');
INSERT INTO `player_login` VALUES ('2224', '38392390', '797', '2013-06-13 17:30:44', '2');
INSERT INTO `player_login` VALUES ('2225', '21289606', '728', '2013-06-13 17:31:18', '0');
INSERT INTO `player_login` VALUES ('2226', '49675462', '757', '2013-06-13 17:31:58', '0');
INSERT INTO `player_login` VALUES ('2227', '126573062', '798', '2013-06-13 17:33:31', '0');
INSERT INTO `player_login` VALUES ('2228', '126573062', '798', '2013-06-13 17:33:50', '2');
INSERT INTO `player_login` VALUES ('2229', '27434886', '799', '2013-06-13 17:45:10', '0');
INSERT INTO `player_login` VALUES ('2230', '27434886', '799', '2013-06-13 17:45:36', '2');
INSERT INTO `player_login` VALUES ('2231', '30269894', '800', '2013-06-13 17:51:39', '0');
INSERT INTO `player_login` VALUES ('2232', '49675462', '757', '2013-06-13 17:53:07', '2');
INSERT INTO `player_login` VALUES ('2233', '127551622', '735', '2013-06-13 17:53:39', '2');
INSERT INTO `player_login` VALUES ('2234', '21289606', '728', '2013-06-13 17:53:57', '2');
INSERT INTO `player_login` VALUES ('2235', '21289606', '728', '2013-06-13 18:04:32', '0');
INSERT INTO `player_login` VALUES ('2236', '30269894', '800', '2013-06-13 18:04:41', '0');
INSERT INTO `player_login` VALUES ('2237', '49675462', '757', '2013-06-13 18:04:56', '0');
INSERT INTO `player_login` VALUES ('2238', '127551622', '735', '2013-06-13 18:05:30', '0');
INSERT INTO `player_login` VALUES ('2239', '127551622', '735', '2013-06-13 18:26:20', '2');
INSERT INTO `player_login` VALUES ('2240', '21289606', '728', '2013-06-13 18:28:11', '2');
INSERT INTO `player_login` VALUES ('2241', '127551622', '735', '2013-06-13 18:28:35', '0');
INSERT INTO `player_login` VALUES ('2242', '21289606', '801', '2013-06-13 18:28:38', '0');
INSERT INTO `player_login` VALUES ('2243', '38392390', '797', '2013-06-13 18:29:18', '0');
INSERT INTO `player_login` VALUES ('2244', '21289606', '801', '2013-06-13 18:30:21', '2');
INSERT INTO `player_login` VALUES ('2245', '21289606', '802', '2013-06-13 18:30:38', '0');
INSERT INTO `player_login` VALUES ('2246', '38392390', '797', '2013-06-13 18:33:23', '0');
INSERT INTO `player_login` VALUES ('2247', '21289606', '802', '2013-06-13 18:35:58', '2');
INSERT INTO `player_login` VALUES ('2248', '21289606', '803', '2013-06-13 18:36:15', '0');
INSERT INTO `player_login` VALUES ('2249', '38392390', '797', '2013-06-13 18:56:23', '2');
INSERT INTO `player_login` VALUES ('2250', '38392390', '797', '2013-06-13 19:00:45', '0');
INSERT INTO `player_login` VALUES ('2251', '127551622', '735', '2013-06-13 19:04:20', '2');
INSERT INTO `player_login` VALUES ('2252', '127551622', '804', '2013-06-13 19:04:46', '0');
INSERT INTO `player_login` VALUES ('2253', '38392390', '797', '2013-06-13 19:06:12', '2');
INSERT INTO `player_login` VALUES ('2254', '38392390', '805', '2013-06-13 19:06:26', '0');
INSERT INTO `player_login` VALUES ('2255', '21289606', '803', '2013-06-13 19:28:02', '2');
INSERT INTO `player_login` VALUES ('2256', '30269894', '800', '2013-06-13 19:28:09', '2');
INSERT INTO `player_login` VALUES ('2257', '49675462', '757', '2013-06-13 19:28:23', '2');
INSERT INTO `player_login` VALUES ('2258', '127551622', '804', '2013-06-13 19:28:47', '2');
INSERT INTO `player_login` VALUES ('2259', '127551622', '806', '2013-06-13 19:29:25', '0');
INSERT INTO `player_login` VALUES ('2260', '127551622', '806', '2013-06-13 19:34:12', '2');
INSERT INTO `player_login` VALUES ('2261', '99124038', '807', '2013-06-13 20:07:23', '0');
INSERT INTO `player_login` VALUES ('2262', '99124038', '807', '2013-06-13 20:08:57', '2');
INSERT INTO `player_login` VALUES ('2263', '38392390', '805', '2013-06-13 20:47:59', '0');
INSERT INTO `player_login` VALUES ('2264', '38392390', '805', '2013-06-13 20:55:35', '2');
INSERT INTO `player_login` VALUES ('2265', '78268486', '808', '2013-06-13 20:57:50', '2');
INSERT INTO `player_login` VALUES ('2266', '42713158', '450', '2013-06-13 21:12:58', '0');
INSERT INTO `player_login` VALUES ('2267', '134506822', '809', '2013-06-13 23:44:27', '0');
INSERT INTO `player_login` VALUES ('2268', '134506822', '809', '2013-06-13 23:44:38', '2');
INSERT INTO `player_login` VALUES ('2269', '88253766', '810', '2013-06-13 23:48:39', '0');
INSERT INTO `player_login` VALUES ('2270', '88253766', '810', '2013-06-13 23:48:47', '2');
INSERT INTO `player_login` VALUES ('2271', '83493446', '811', '2013-06-14 00:16:07', '0');
INSERT INTO `player_login` VALUES ('2272', '83493446', '811', '2013-06-14 00:16:16', '2');
INSERT INTO `player_login` VALUES ('2273', '88253766', '810', '2013-06-14 02:46:34', '0');
INSERT INTO `player_login` VALUES ('2274', '88253766', '810', '2013-06-14 02:46:43', '2');
INSERT INTO `player_login` VALUES ('2275', '87880902', '752', '2013-06-14 04:40:19', '0');
INSERT INTO `player_login` VALUES ('2276', '87880902', '752', '2013-06-14 04:53:00', '2');
INSERT INTO `player_login` VALUES ('2277', '87880902', '752', '2013-06-14 04:55:14', '0');
INSERT INTO `player_login` VALUES ('2278', '87880902', '752', '2013-06-14 05:18:33', '2');
INSERT INTO `player_login` VALUES ('2279', '68528070', '812', '2013-06-14 08:23:12', '0');
INSERT INTO `player_login` VALUES ('2280', '68528070', '812', '2013-06-14 08:23:25', '2');
INSERT INTO `player_login` VALUES ('2281', '128518982', '753', '2013-06-14 08:31:51', '0');
INSERT INTO `player_login` VALUES ('2282', '128518982', '753', '2013-06-14 08:31:58', '2');
INSERT INTO `player_login` VALUES ('2283', '128518982', '753', '2013-06-14 08:32:08', '0');
INSERT INTO `player_login` VALUES ('2284', '128518982', '753', '2013-06-14 08:32:12', '2');
INSERT INTO `player_login` VALUES ('2285', '128518982', '753', '2013-06-14 08:32:22', '0');
INSERT INTO `player_login` VALUES ('2286', '128518982', '753', '2013-06-14 08:32:28', '2');
INSERT INTO `player_login` VALUES ('2287', '97231046', '813', '2013-06-14 09:30:20', '0');
INSERT INTO `player_login` VALUES ('2288', '38643142', '814', '2013-06-14 09:30:26', '0');
INSERT INTO `player_login` VALUES ('2289', '38643142', '814', '2013-06-14 09:30:41', '2');
INSERT INTO `player_login` VALUES ('2290', '97231046', '813', '2013-06-14 09:31:06', '2');
INSERT INTO `player_login` VALUES ('2291', '78500614', '815', '2013-06-14 10:44:10', '0');
INSERT INTO `player_login` VALUES ('2292', '78500614', '815', '2013-06-14 10:45:43', '2');
INSERT INTO `player_login` VALUES ('2293', '130725702', '816', '2013-06-14 10:47:00', '0');
INSERT INTO `player_login` VALUES ('2294', '28760582', '817', '2013-06-14 10:48:01', '0');
INSERT INTO `player_login` VALUES ('2295', '130725702', '816', '2013-06-14 10:52:26', '2');
INSERT INTO `player_login` VALUES ('2296', '130725702', '818', '2013-06-14 10:53:00', '0');
INSERT INTO `player_login` VALUES ('2297', '28760582', '817', '2013-06-14 10:53:54', '2');
INSERT INTO `player_login` VALUES ('2298', '28760582', '819', '2013-06-14 10:54:12', '0');
INSERT INTO `player_login` VALUES ('2299', '28760582', '819', '2013-06-14 11:02:09', '2');
INSERT INTO `player_login` VALUES ('2300', '28760582', '820', '2013-06-14 11:02:23', '0');
INSERT INTO `player_login` VALUES ('2301', '130725702', '818', '2013-06-14 11:10:54', '2');
INSERT INTO `player_login` VALUES ('2302', '130725702', '821', '2013-06-14 11:11:23', '0');
INSERT INTO `player_login` VALUES ('2303', '130725702', '821', '2013-06-14 11:29:11', '2');
INSERT INTO `player_login` VALUES ('2304', '325762', '822', '2013-06-14 11:33:43', '0');
INSERT INTO `player_login` VALUES ('2305', '28760582', '820', '2013-06-14 11:36:10', '2');
INSERT INTO `player_login` VALUES ('2306', '325762', '822', '2013-06-14 11:52:24', '2');
INSERT INTO `player_login` VALUES ('2307', '5844226', '786', '2013-06-14 12:09:18', '0');
INSERT INTO `player_login` VALUES ('2308', '82755782', '823', '2013-06-14 12:16:01', '0');
INSERT INTO `player_login` VALUES ('2309', '82755782', '823', '2013-06-14 12:16:26', '2');
INSERT INTO `player_login` VALUES ('2310', '5844226', '786', '2013-06-14 12:24:04', '2');
INSERT INTO `player_login` VALUES ('2311', '82755782', '823', '2013-06-14 12:34:25', '0');
INSERT INTO `player_login` VALUES ('2312', '82755782', '823', '2013-06-14 12:48:04', '2');
INSERT INTO `player_login` VALUES ('2313', '82755782', '823', '2013-06-14 13:30:22', '0');
INSERT INTO `player_login` VALUES ('2314', '82755782', '823', '2013-06-14 13:51:50', '2');
INSERT INTO `player_login` VALUES ('2315', '28760582', '820', '2013-06-14 14:28:12', '0');
INSERT INTO `player_login` VALUES ('2316', '97089606', '758', '2013-06-14 14:44:13', '0');
INSERT INTO `player_login` VALUES ('2317', '92816262', '824', '2013-06-14 14:44:30', '0');
INSERT INTO `player_login` VALUES ('2318', '92816262', '825', '2013-06-14 14:45:45', '0');
INSERT INTO `player_login` VALUES ('2319', '92816262', '826', '2013-06-14 14:48:56', '0');
INSERT INTO `player_login` VALUES ('2320', '92816262', '826', '2013-06-14 14:52:03', '2');
INSERT INTO `player_login` VALUES ('2321', '92816262', '827', '2013-06-14 14:52:17', '0');
INSERT INTO `player_login` VALUES ('2322', '92816262', '828', '2013-06-14 14:53:46', '0');
INSERT INTO `player_login` VALUES ('2323', '92816262', '829', '2013-06-14 14:55:32', '0');
INSERT INTO `player_login` VALUES ('2324', '28760582', '820', '2013-06-14 14:56:29', '2');
INSERT INTO `player_login` VALUES ('2325', '92816262', '830', '2013-06-14 14:57:38', '0');
INSERT INTO `player_login` VALUES ('2326', '92816262', '831', '2013-06-14 15:01:40', '0');
INSERT INTO `player_login` VALUES ('2327', '92816262', '832', '2013-06-14 15:04:14', '0');
INSERT INTO `player_login` VALUES ('2328', '97089606', '758', '2013-06-14 15:11:37', '2');
INSERT INTO `player_login` VALUES ('2329', '9171844', '833', '2013-06-14 15:29:00', '0');
INSERT INTO `player_login` VALUES ('2330', '9171844', '833', '2013-06-14 15:29:04', '2');
INSERT INTO `player_login` VALUES ('2331', '58547974', '834', '2013-06-14 15:35:43', '0');
INSERT INTO `player_login` VALUES ('2332', '87507078', '835', '2013-06-14 16:04:00', '0');
INSERT INTO `player_login` VALUES ('2333', '87507078', '835', '2013-06-14 16:04:05', '2');
INSERT INTO `player_login` VALUES ('2334', '58547974', '834', '2013-06-14 16:16:25', '2');
INSERT INTO `player_login` VALUES ('2335', '58547974', '836', '2013-06-14 16:16:47', '0');
INSERT INTO `player_login` VALUES ('2336', '58547974', '837', '2013-06-14 16:23:51', '0');
INSERT INTO `player_login` VALUES ('2337', '114702790', '320', '2013-06-14 16:53:45', '0');
INSERT INTO `player_login` VALUES ('2338', '58547974', '0', '2013-06-14 17:17:29', '2');
INSERT INTO `player_login` VALUES ('2339', '58547974', '837', '2013-06-14 17:20:01', '0');
INSERT INTO `player_login` VALUES ('2340', '20026630', '488', '2013-06-14 17:33:45', '0');
INSERT INTO `player_login` VALUES ('2341', '20026630', '488', '2013-06-14 17:34:08', '2');
INSERT INTO `player_login` VALUES ('2342', '114702790', '320', '2013-06-14 17:55:51', '2');
INSERT INTO `player_login` VALUES ('2343', '58547974', '837', '2013-06-14 17:59:50', '2');
INSERT INTO `player_login` VALUES ('2344', '114702790', '320', '2013-06-14 18:08:12', '0');
INSERT INTO `player_login` VALUES ('2345', '58547974', '837', '2013-06-14 18:08:20', '0');
INSERT INTO `player_login` VALUES ('2346', '114702790', '320', '2013-06-14 18:19:03', '2');
INSERT INTO `player_login` VALUES ('2347', '114702790', '838', '2013-06-14 18:19:13', '0');
INSERT INTO `player_login` VALUES ('2348', '33932166', '839', '2013-06-14 22:26:23', '2');
INSERT INTO `player_login` VALUES ('2349', '44915270', '840', '2013-06-14 22:27:26', '0');
INSERT INTO `player_login` VALUES ('2350', '44915270', '840', '2013-06-14 22:28:55', '2');
INSERT INTO `player_login` VALUES ('2351', '58547974', '837', '2013-06-14 22:58:20', '2');
INSERT INTO `player_login` VALUES ('2352', '114702790', '838', '2013-06-14 23:58:43', '2');
INSERT INTO `player_login` VALUES ('2353', '1951110', '841', '2013-06-15 00:23:18', '0');
INSERT INTO `player_login` VALUES ('2354', '1951110', '841', '2013-06-15 00:23:28', '2');
INSERT INTO `player_login` VALUES ('2355', '114702790', '838', '2013-06-15 01:03:59', '0');
INSERT INTO `player_login` VALUES ('2356', '114702790', '838', '2013-06-15 01:28:25', '2');
INSERT INTO `player_login` VALUES ('2357', '114702790', '838', '2013-06-15 01:30:23', '0');
INSERT INTO `player_login` VALUES ('2358', '114702790', '838', '2013-06-15 01:30:44', '2');
INSERT INTO `player_login` VALUES ('2359', '114702790', '838', '2013-06-15 01:32:43', '0');
INSERT INTO `player_login` VALUES ('2360', '114702790', '838', '2013-06-15 01:34:05', '2');
INSERT INTO `player_login` VALUES ('2361', '114702790', '838', '2013-06-15 01:36:05', '0');
INSERT INTO `player_login` VALUES ('2362', '114702790', '838', '2013-06-15 01:36:27', '2');
INSERT INTO `player_login` VALUES ('2363', '114702790', '838', '2013-06-15 01:38:30', '0');
INSERT INTO `player_login` VALUES ('2364', '114702790', '838', '2013-06-15 01:40:23', '2');
INSERT INTO `player_login` VALUES ('2365', '114702790', '838', '2013-06-15 01:42:26', '0');
INSERT INTO `player_login` VALUES ('2366', '114702790', '838', '2013-06-15 01:43:30', '2');
INSERT INTO `player_login` VALUES ('2367', '114702790', '838', '2013-06-15 01:45:32', '0');
INSERT INTO `player_login` VALUES ('2368', '114702790', '838', '2013-06-15 01:54:35', '2');
INSERT INTO `player_login` VALUES ('2369', '59233158', '842', '2013-06-15 01:58:10', '0');
INSERT INTO `player_login` VALUES ('2370', '59233158', '842', '2013-06-15 02:35:26', '2');
INSERT INTO `player_login` VALUES ('2371', '130833542', '843', '2013-06-15 03:21:31', '0');
INSERT INTO `player_login` VALUES ('2372', '130833542', '843', '2013-06-15 03:35:22', '2');
INSERT INTO `player_login` VALUES ('2373', '21266630', '844', '2013-06-15 04:27:59', '0');
INSERT INTO `player_login` VALUES ('2374', '21266630', '844', '2013-06-15 04:28:16', '2');
INSERT INTO `player_login` VALUES ('2375', '21266630', '844', '2013-06-15 04:32:12', '0');
INSERT INTO `player_login` VALUES ('2376', '21266630', '844', '2013-06-15 04:40:02', '2');
INSERT INTO `player_login` VALUES ('2377', '21266630', '844', '2013-06-15 04:55:27', '0');
INSERT INTO `player_login` VALUES ('2378', '128683910', '845', '2013-06-15 04:57:21', '0');
INSERT INTO `player_login` VALUES ('2379', '128683910', '845', '2013-06-15 05:16:07', '2');
INSERT INTO `player_login` VALUES ('2380', '21266630', '844', '2013-06-15 05:17:02', '2');
INSERT INTO `player_login` VALUES ('2381', '21266630', '846', '2013-06-15 05:17:26', '0');
INSERT INTO `player_login` VALUES ('2382', '21266630', '846', '2013-06-15 05:19:47', '2');
INSERT INTO `player_login` VALUES ('2383', '21266630', '847', '2013-06-15 05:20:05', '0');
INSERT INTO `player_login` VALUES ('2384', '21266630', '847', '2013-06-15 05:21:16', '2');
INSERT INTO `player_login` VALUES ('2385', '68992390', '848', '2013-06-15 06:37:43', '0');
INSERT INTO `player_login` VALUES ('2386', '68992390', '848', '2013-06-15 06:37:48', '2');
INSERT INTO `player_login` VALUES ('2387', '130833542', '849', '2013-06-15 07:37:02', '0');
INSERT INTO `player_login` VALUES ('2388', '130833542', '849', '2013-06-15 07:42:13', '2');
INSERT INTO `player_login` VALUES ('2389', '100675526', '850', '2013-06-15 07:46:11', '0');
INSERT INTO `player_login` VALUES ('2390', '100675526', '850', '2013-06-15 07:46:19', '2');
INSERT INTO `player_login` VALUES ('2391', '31020870', '851', '2013-06-15 07:51:05', '0');
INSERT INTO `player_login` VALUES ('2392', '96761734', '852', '2013-06-15 08:38:08', '0');
INSERT INTO `player_login` VALUES ('2393', '96761734', '852', '2013-06-15 08:44:21', '2');
INSERT INTO `player_login` VALUES ('2394', '101233414', '853', '2013-06-15 09:28:02', '0');
INSERT INTO `player_login` VALUES ('2395', '101233414', '853', '2013-06-15 09:28:09', '2');
INSERT INTO `player_login` VALUES ('2396', '128518982', '753', '2013-06-15 10:27:45', '0');
INSERT INTO `player_login` VALUES ('2397', '128518982', '753', '2013-06-15 10:27:49', '2');
INSERT INTO `player_login` VALUES ('2398', '14388870', '854', '2013-06-15 10:31:49', '0');
INSERT INTO `player_login` VALUES ('2399', '14388870', '854', '2013-06-15 10:31:58', '2');
INSERT INTO `player_login` VALUES ('2400', '30629958', '102', '2013-06-15 10:39:13', '0');
INSERT INTO `player_login` VALUES ('2401', '30629958', '102', '2013-06-15 11:05:56', '2');
INSERT INTO `player_login` VALUES ('2402', '38398726', '855', '2013-06-15 11:27:46', '0');
INSERT INTO `player_login` VALUES ('2403', '38398726', '855', '2013-06-15 11:27:53', '2');
INSERT INTO `player_login` VALUES ('2404', '73406214', '856', '2013-06-15 11:48:59', '0');
INSERT INTO `player_login` VALUES ('2405', '73406214', '856', '2013-06-15 11:49:07', '2');
INSERT INTO `player_login` VALUES ('2406', '56796806', '857', '2013-06-15 12:25:13', '0');
INSERT INTO `player_login` VALUES ('2407', '56796806', '857', '2013-06-15 12:36:33', '2');
INSERT INTO `player_login` VALUES ('2408', '93390150', '858', '2013-06-15 13:05:45', '0');
INSERT INTO `player_login` VALUES ('2409', '93390150', '858', '2013-06-15 13:05:59', '2');
INSERT INTO `player_login` VALUES ('2410', '56782214', '859', '2013-06-15 13:25:35', '0');
INSERT INTO `player_login` VALUES ('2411', '56782214', '859', '2013-06-15 13:40:59', '2');
INSERT INTO `player_login` VALUES ('2412', '56782214', '859', '2013-06-15 13:41:18', '0');
INSERT INTO `player_login` VALUES ('2413', '58547974', '837', '2013-06-15 13:44:04', '0');
INSERT INTO `player_login` VALUES ('2414', '75255942', '860', '2013-06-15 13:58:40', '0');
INSERT INTO `player_login` VALUES ('2415', '10977472', '516', '2013-06-15 14:02:19', '0');
INSERT INTO `player_login` VALUES ('2416', '36757894', '861', '2013-06-15 14:03:44', '0');
INSERT INTO `player_login` VALUES ('2417', '36757894', '861', '2013-06-15 14:03:49', '2');
INSERT INTO `player_login` VALUES ('2418', '75573318', '862', '2013-06-15 14:27:15', '0');
INSERT INTO `player_login` VALUES ('2419', '75255942', '860', '2013-06-15 14:28:36', '2');
INSERT INTO `player_login` VALUES ('2420', '75255942', '863', '2013-06-15 14:29:07', '0');
INSERT INTO `player_login` VALUES ('2421', '10977472', '516', '2013-06-15 14:39:41', '2');
INSERT INTO `player_login` VALUES ('2422', '130952262', '864', '2013-06-15 14:40:04', '0');
INSERT INTO `player_login` VALUES ('2423', '75255942', '863', '2013-06-15 14:40:51', '2');
INSERT INTO `player_login` VALUES ('2424', '58547974', '837', '2013-06-15 14:41:02', '2');
INSERT INTO `player_login` VALUES ('2425', '26652166', '865', '2013-06-15 14:42:17', '0');
INSERT INTO `player_login` VALUES ('2426', '26652166', '865', '2013-06-15 14:42:47', '2');
INSERT INTO `player_login` VALUES ('2427', '75255942', '863', '2013-06-15 14:59:49', '0');
INSERT INTO `player_login` VALUES ('2428', '130952262', '864', '2013-06-15 15:02:30', '2');
INSERT INTO `player_login` VALUES ('2429', '75573318', '862', '2013-06-15 15:17:08', '2');
INSERT INTO `player_login` VALUES ('2430', '130342342', '866', '2013-06-15 15:20:05', '0');
INSERT INTO `player_login` VALUES ('2431', '75255942', '863', '2013-06-15 16:00:30', '2');
INSERT INTO `player_login` VALUES ('2432', '75255942', '863', '2013-06-15 16:00:57', '0');
INSERT INTO `player_login` VALUES ('2433', '75255942', '863', '2013-06-15 16:03:32', '2');
INSERT INTO `player_login` VALUES ('2434', '75255942', '863', '2013-06-15 16:03:49', '0');
INSERT INTO `player_login` VALUES ('2435', '58547974', '837', '2013-06-15 16:05:57', '0');
INSERT INTO `player_login` VALUES ('2436', '75255942', '863', '2013-06-15 16:23:52', '2');
INSERT INTO `player_login` VALUES ('2437', '58547974', '837', '2013-06-15 16:51:16', '2');
INSERT INTO `player_login` VALUES ('2438', '130342342', '866', '2013-06-15 17:04:42', '2');
INSERT INTO `player_login` VALUES ('2439', '11470854', '20', '2013-06-15 17:28:07', '2');
INSERT INTO `player_login` VALUES ('2440', '9358278', '867', '2013-06-15 17:36:29', '0');
INSERT INTO `player_login` VALUES ('2441', '11001670', '868', '2013-06-15 17:41:39', '0');
INSERT INTO `player_login` VALUES ('2442', '9943366', '869', '2013-06-15 17:44:17', '0');
INSERT INTO `player_login` VALUES ('2443', '9358278', '867', '2013-06-15 17:56:33', '2');
INSERT INTO `player_login` VALUES ('2444', '9358278', '870', '2013-06-15 17:56:59', '0');
INSERT INTO `player_login` VALUES ('2445', '9943366', '869', '2013-06-15 17:59:37', '2');
INSERT INTO `player_login` VALUES ('2446', '9943366', '871', '2013-06-15 18:00:00', '0');
INSERT INTO `player_login` VALUES ('2447', '9943366', '871', '2013-06-15 18:00:05', '2');
INSERT INTO `player_login` VALUES ('2448', '11001670', '868', '2013-06-15 18:00:27', '2');
INSERT INTO `player_login` VALUES ('2449', '9943366', '871', '2013-06-15 18:05:56', '0');
INSERT INTO `player_login` VALUES ('2450', '130952262', '864', '2013-06-15 18:06:12', '0');
INSERT INTO `player_login` VALUES ('2451', '9358278', '870', '2013-06-15 18:06:32', '0');
INSERT INTO `player_login` VALUES ('2452', '130952262', '864', '2013-06-15 18:07:30', '2');
INSERT INTO `player_login` VALUES ('2453', '11001670', '868', '2013-06-15 18:20:31', '0');
INSERT INTO `player_login` VALUES ('2454', '24158918', '872', '2013-06-15 18:24:14', '0');
INSERT INTO `player_login` VALUES ('2455', '24158918', '872', '2013-06-15 18:24:20', '2');
INSERT INTO `player_login` VALUES ('2456', '119800966', '873', '2013-06-15 18:33:36', '0');
INSERT INTO `player_login` VALUES ('2457', '119800966', '873', '2013-06-15 18:33:46', '2');
INSERT INTO `player_login` VALUES ('2458', '9943366', '871', '2013-06-15 18:37:07', '2');
INSERT INTO `player_login` VALUES ('2459', '9358278', '870', '2013-06-15 18:39:33', '2');
INSERT INTO `player_login` VALUES ('2460', '21599430', '874', '2013-06-15 18:43:16', '0');
INSERT INTO `player_login` VALUES ('2461', '21599430', '874', '2013-06-15 18:43:26', '2');
INSERT INTO `player_login` VALUES ('2462', '58547974', '837', '2013-06-15 18:47:27', '0');
INSERT INTO `player_login` VALUES ('2463', '11001670', '868', '2013-06-15 18:51:07', '2');
INSERT INTO `player_login` VALUES ('2464', '11001670', '875', '2013-06-15 18:51:36', '0');
INSERT INTO `player_login` VALUES ('2465', '130610886', '876', '2013-06-15 19:09:41', '0');
INSERT INTO `player_login` VALUES ('2466', '130610886', '876', '2013-06-15 19:29:31', '2');
INSERT INTO `player_login` VALUES ('2467', '97893638', '877', '2013-06-15 19:48:35', '0');
INSERT INTO `player_login` VALUES ('2468', '97855366', '878', '2013-06-15 19:48:38', '0');
INSERT INTO `player_login` VALUES ('2469', '97855366', '878', '2013-06-15 19:49:18', '2');
INSERT INTO `player_login` VALUES ('2470', '97893638', '877', '2013-06-15 19:49:28', '2');
INSERT INTO `player_login` VALUES ('2471', '30269894', '800', '2013-06-15 20:04:55', '0');
INSERT INTO `player_login` VALUES ('2472', '30269894', '800', '2013-06-15 20:38:14', '2');
INSERT INTO `player_login` VALUES ('2473', '11001670', '875', '2013-06-15 20:54:08', '2');
INSERT INTO `player_login` VALUES ('2474', '17481414', '0', '2013-06-15 22:39:11', '2');
INSERT INTO `player_login` VALUES ('2475', '119866886', '0', '2013-06-15 23:00:14', '2');
INSERT INTO `player_login` VALUES ('2476', '97267142', '881', '2013-06-15 23:18:35', '0');
INSERT INTO `player_login` VALUES ('2477', '30269894', '800', '2013-06-15 23:19:24', '0');
INSERT INTO `player_login` VALUES ('2478', '30269894', '0', '2013-06-15 23:52:44', '2');
INSERT INTO `player_login` VALUES ('2479', '30269894', '800', '2013-06-15 23:54:12', '0');
INSERT INTO `player_login` VALUES ('2480', '30269894', '800', '2013-06-16 00:04:22', '0');
INSERT INTO `player_login` VALUES ('2481', '97267142', '881', '2013-06-16 00:04:35', '0');
INSERT INTO `player_login` VALUES ('2482', '130833542', '849', '2013-06-16 00:19:12', '0');
INSERT INTO `player_login` VALUES ('2483', '130833542', '849', '2013-06-16 00:23:44', '2');
INSERT INTO `player_login` VALUES ('2484', '97267142', '881', '2013-06-16 00:34:54', '2');
INSERT INTO `player_login` VALUES ('2485', '97267142', '882', '2013-06-16 00:35:37', '0');
INSERT INTO `player_login` VALUES ('2486', '30269894', '800', '2013-06-16 00:39:58', '2');
INSERT INTO `player_login` VALUES ('2487', '30269894', '883', '2013-06-16 00:40:21', '0');
INSERT INTO `player_login` VALUES ('2488', '97267142', '882', '2013-06-16 00:42:16', '2');
INSERT INTO `player_login` VALUES ('2489', '97267142', '884', '2013-06-16 00:42:52', '0');
INSERT INTO `player_login` VALUES ('2490', '30269894', '883', '2013-06-16 00:45:24', '2');
INSERT INTO `player_login` VALUES ('2491', '30269894', '885', '2013-06-16 00:45:46', '0');
INSERT INTO `player_login` VALUES ('2492', '97267142', '884', '2013-06-16 00:52:52', '2');
INSERT INTO `player_login` VALUES ('2493', '97267142', '886', '2013-06-16 00:53:36', '0');
INSERT INTO `player_login` VALUES ('2494', '42864134', '887', '2013-06-16 02:00:13', '0');
INSERT INTO `player_login` VALUES ('2495', '97267142', '886', '2013-06-16 02:32:47', '2');
INSERT INTO `player_login` VALUES ('2496', '68992390', '848', '2013-06-16 02:33:27', '0');
INSERT INTO `player_login` VALUES ('2497', '68992390', '848', '2013-06-16 02:33:34', '2');
INSERT INTO `player_login` VALUES ('2498', '30269894', '885', '2013-06-16 02:33:36', '2');
INSERT INTO `player_login` VALUES ('2499', '58547974', '888', '2013-06-16 02:45:54', '0');
INSERT INTO `player_login` VALUES ('2500', '42864134', '887', '2013-06-16 02:58:28', '2');
INSERT INTO `player_login` VALUES ('2501', '58547974', '888', '2013-06-16 03:07:54', '0');
INSERT INTO `player_login` VALUES ('2502', '58547974', '888', '2013-06-16 03:23:53', '2');
INSERT INTO `player_login` VALUES ('2503', '3766534', '11', '2013-06-16 03:38:31', '0');
INSERT INTO `player_login` VALUES ('2504', '3766534', '11', '2013-06-16 03:48:23', '2');
INSERT INTO `player_login` VALUES ('2505', '3766534', '11', '2013-06-16 03:52:32', '0');
INSERT INTO `player_login` VALUES ('2506', '91082438', '0', '2013-06-16 03:53:02', '2');
INSERT INTO `player_login` VALUES ('2507', '42864134', '887', '2013-06-16 04:31:59', '0');
INSERT INTO `player_login` VALUES ('2508', '3766534', '11', '2013-06-16 04:36:53', '2');
INSERT INTO `player_login` VALUES ('2509', '42864134', '887', '2013-06-16 04:44:28', '2');
INSERT INTO `player_login` VALUES ('2510', '42864134', '890', '2013-06-16 04:44:52', '0');
INSERT INTO `player_login` VALUES ('2511', '3766534', '11', '2013-06-16 04:51:25', '0');
INSERT INTO `player_login` VALUES ('2512', '42864134', '890', '2013-06-16 04:53:01', '2');
INSERT INTO `player_login` VALUES ('2513', '3766534', '11', '2013-06-16 06:00:07', '2');
INSERT INTO `player_login` VALUES ('2514', '3766534', '11', '2013-06-16 06:35:57', '0');
INSERT INTO `player_login` VALUES ('2515', '68679430', '276', '2013-06-16 06:39:30', '0');
INSERT INTO `player_login` VALUES ('2516', '119295750', '644', '2013-06-16 06:40:30', '0');
INSERT INTO `player_login` VALUES ('2517', '68679430', '276', '2013-06-16 06:50:00', '2');
INSERT INTO `player_login` VALUES ('2518', '3766534', '11', '2013-06-16 06:50:18', '2');
INSERT INTO `player_login` VALUES ('2519', '3766534', '11', '2013-06-16 06:53:05', '0');
INSERT INTO `player_login` VALUES ('2520', '68679430', '276', '2013-06-16 06:53:51', '0');
INSERT INTO `player_login` VALUES ('2521', '119295750', '644', '2013-06-16 07:01:28', '0');
INSERT INTO `player_login` VALUES ('2522', '3766534', '11', '2013-06-16 07:25:27', '2');
INSERT INTO `player_login` VALUES ('2523', '68679430', '276', '2013-06-16 07:48:17', '2');
INSERT INTO `player_login` VALUES ('2524', '119295750', '644', '2013-06-16 07:50:21', '2');
INSERT INTO `player_login` VALUES ('2525', '4704134', '891', '2013-06-16 07:51:18', '0');
INSERT INTO `player_login` VALUES ('2526', '4704134', '891', '2013-06-16 08:12:55', '2');
INSERT INTO `player_login` VALUES ('2527', '3960900', '892', '2013-06-16 09:36:45', '0');
INSERT INTO `player_login` VALUES ('2528', '3960900', '892', '2013-06-16 09:38:14', '2');
INSERT INTO `player_login` VALUES ('2529', '4704134', '891', '2013-06-16 09:47:14', '0');
INSERT INTO `player_login` VALUES ('2530', '4704134', '891', '2013-06-16 09:52:11', '2');
INSERT INTO `player_login` VALUES ('2531', '68679430', '276', '2013-06-16 10:13:17', '0');
INSERT INTO `player_login` VALUES ('2532', '68679430', '276', '2013-06-16 10:24:36', '2');
INSERT INTO `player_login` VALUES ('2533', '3766534', '11', '2013-06-16 10:35:26', '0');
INSERT INTO `player_login` VALUES ('2534', '58547974', '893', '2013-06-16 10:59:24', '0');
INSERT INTO `player_login` VALUES ('2535', '58547974', '893', '2013-06-16 11:10:43', '2');
INSERT INTO `player_login` VALUES ('2536', '58547974', '894', '2013-06-16 11:11:00', '0');
INSERT INTO `player_login` VALUES ('2537', '68679430', '276', '2013-06-16 11:14:14', '0');
INSERT INTO `player_login` VALUES ('2538', '58547974', '894', '2013-06-16 11:15:12', '2');
INSERT INTO `player_login` VALUES ('2539', '68679430', '276', '2013-06-16 11:21:25', '2');
INSERT INTO `player_login` VALUES ('2540', '3766534', '11', '2013-06-16 11:43:23', '2');
INSERT INTO `player_login` VALUES ('2541', '3766534', '11', '2013-06-16 11:50:03', '0');
INSERT INTO `player_login` VALUES ('2542', '3766534', '11', '2013-06-16 11:54:19', '0');
INSERT INTO `player_login` VALUES ('2543', '3766534', '11', '2013-06-16 11:55:04', '2');
INSERT INTO `player_login` VALUES ('2544', '3766534', '11', '2013-06-16 11:55:32', '0');
INSERT INTO `player_login` VALUES ('2545', '3766534', '11', '2013-06-16 11:56:14', '0');
INSERT INTO `player_login` VALUES ('2546', '3766534', '11', '2013-06-16 12:01:15', '2');
INSERT INTO `player_login` VALUES ('2547', '3766534', '11', '2013-06-16 12:05:12', '0');
INSERT INTO `player_login` VALUES ('2548', '3766534', '11', '2013-06-16 12:12:03', '0');
INSERT INTO `player_login` VALUES ('2549', '3766534', '11', '2013-06-16 12:12:16', '2');
INSERT INTO `player_login` VALUES ('2550', '3766534', '11', '2013-06-16 12:12:31', '0');
INSERT INTO `player_login` VALUES ('2551', '3766534', '11', '2013-06-16 12:15:06', '2');
INSERT INTO `player_login` VALUES ('2552', '134706502', '895', '2013-06-16 12:23:30', '0');
INSERT INTO `player_login` VALUES ('2553', '134706502', '895', '2013-06-16 12:26:13', '2');
INSERT INTO `player_login` VALUES ('2554', '93390150', '858', '2013-06-16 13:23:50', '0');
INSERT INTO `player_login` VALUES ('2555', '93390150', '858', '2013-06-16 13:24:05', '2');
INSERT INTO `player_login` VALUES ('2556', '517633AX', '754', '2013-06-16 13:27:43', '0');
INSERT INTO `player_login` VALUES ('2557', '517633AX', '754', '2013-06-16 13:28:16', '2');
INSERT INTO `player_login` VALUES ('2558', '90518982', '896', '2013-06-16 13:30:26', '0');
INSERT INTO `player_login` VALUES ('2559', '75255942', '897', '2013-06-16 13:51:13', '0');
INSERT INTO `player_login` VALUES ('2560', '90518982', '896', '2013-06-16 13:52:05', '2');
INSERT INTO `player_login` VALUES ('2561', '68679430', '276', '2013-06-16 13:52:59', '0');
INSERT INTO `player_login` VALUES ('2562', '90518982', '896', '2013-06-16 13:53:51', '0');
INSERT INTO `player_login` VALUES ('2563', '90518982', '896', '2013-06-16 13:55:50', '2');
INSERT INTO `player_login` VALUES ('2564', '75255942', '897', '2013-06-16 14:00:11', '2');
INSERT INTO `player_login` VALUES ('2565', '75255942', '897', '2013-06-16 14:37:07', '0');
INSERT INTO `player_login` VALUES ('2566', '121339078', '473', '2013-06-16 14:39:05', '0');
INSERT INTO `player_login` VALUES ('2567', '121339078', '473', '2013-06-16 14:44:21', '2');
INSERT INTO `player_login` VALUES ('2568', '121339078', '473', '2013-06-16 14:48:21', '0');
INSERT INTO `player_login` VALUES ('2569', '3766534', '11', '2013-06-16 14:50:32', '0');
INSERT INTO `player_login` VALUES ('2570', '75255942', '897', '2013-06-16 15:03:20', '2');
INSERT INTO `player_login` VALUES ('2571', '75255942', '898', '2013-06-16 15:03:44', '0');
INSERT INTO `player_login` VALUES ('2572', '3766534', '11', '2013-06-16 15:27:23', '2');
INSERT INTO `player_login` VALUES ('2573', '3766534', '11', '2013-06-16 15:29:08', '0');
INSERT INTO `player_login` VALUES ('2574', '121339078', '899', '2013-06-16 15:49:51', '0');
INSERT INTO `player_login` VALUES ('2575', '68679430', '276', '2013-06-16 15:59:28', '2');
INSERT INTO `player_login` VALUES ('2576', '121339078', '899', '2013-06-16 16:01:03', '2');
INSERT INTO `player_login` VALUES ('2577', '6796608', '900', '2013-06-16 16:06:59', '0');
INSERT INTO `player_login` VALUES ('2578', '121339078', '899', '2013-06-16 16:07:15', '0');
INSERT INTO `player_login` VALUES ('2579', '121339078', '899', '2013-06-16 16:08:05', '2');
INSERT INTO `player_login` VALUES ('2580', '68679430', '276', '2013-06-16 16:13:32', '0');
INSERT INTO `player_login` VALUES ('2581', '68679430', '276', '2013-06-16 16:21:21', '2');
INSERT INTO `player_login` VALUES ('2582', '6796608', '900', '2013-06-16 16:21:58', '2');
INSERT INTO `player_login` VALUES ('2583', '97855366', '878', '2013-06-16 16:44:04', '0');
INSERT INTO `player_login` VALUES ('2584', '97855366', '878', '2013-06-16 16:44:11', '2');
INSERT INTO `player_login` VALUES ('2585', '3766534', '11', '2013-06-16 17:23:34', '2');
INSERT INTO `player_login` VALUES ('2586', '3766534', '901', '2013-06-16 17:24:15', '0');
INSERT INTO `player_login` VALUES ('2587', '3766534', '901', '2013-06-16 17:24:41', '2');
INSERT INTO `player_login` VALUES ('2588', '3766534', '901', '2013-06-16 17:25:11', '0');
INSERT INTO `player_login` VALUES ('2589', '3766534', '901', '2013-06-16 17:25:16', '2');
INSERT INTO `player_login` VALUES ('2590', '3766534', '901', '2013-06-16 17:26:27', '0');
INSERT INTO `player_login` VALUES ('2591', '75255942', '898', '2013-06-16 17:26:56', '2');
INSERT INTO `player_login` VALUES ('2592', '3766534', '901', '2013-06-16 17:30:53', '2');
INSERT INTO `player_login` VALUES ('2593', '59062982', '902', '2013-06-16 19:19:17', '0');
INSERT INTO `player_login` VALUES ('2594', '78268486', '808', '2013-06-16 19:25:11', '0');
INSERT INTO `player_login` VALUES ('2595', '78268486', '808', '2013-06-16 19:25:20', '2');
INSERT INTO `player_login` VALUES ('2596', '59062982', '902', '2013-06-16 19:32:19', '2');
INSERT INTO `player_login` VALUES ('2597', '60662150', '903', '2013-06-16 20:49:31', '0');
INSERT INTO `player_login` VALUES ('2598', '60662150', '903', '2013-06-16 20:49:43', '2');
INSERT INTO `player_login` VALUES ('2599', '56782214', '859', '2013-06-16 20:56:49', '0');
INSERT INTO `player_login` VALUES ('2600', '56782214', '859', '2013-06-16 20:58:34', '2');
INSERT INTO `player_login` VALUES ('2601', '31538310', '904', '2013-06-16 21:23:23', '0');
INSERT INTO `player_login` VALUES ('2602', '31538310', '904', '2013-06-16 21:23:39', '2');
INSERT INTO `player_login` VALUES ('2603', '99124038', '807', '2013-06-16 21:29:32', '0');
INSERT INTO `player_login` VALUES ('2604', '99124038', '807', '2013-06-16 21:31:13', '2');
INSERT INTO `player_login` VALUES ('2605', '99124038', '807', '2013-06-16 21:31:27', '0');
INSERT INTO `player_login` VALUES ('2606', '99124038', '807', '2013-06-16 21:31:31', '2');
INSERT INTO `player_login` VALUES ('2607', '26657158', '905', '2013-06-16 23:53:57', '0');
INSERT INTO `player_login` VALUES ('2608', '26657158', '905', '2013-06-17 00:00:49', '2');
INSERT INTO `player_login` VALUES ('2609', '27939526', '906', '2013-06-17 01:09:40', '0');
INSERT INTO `player_login` VALUES ('2610', '27939526', '906', '2013-06-17 01:09:51', '2');
INSERT INTO `player_login` VALUES ('2611', '3766534', '901', '2013-06-17 01:50:21', '0');
INSERT INTO `player_login` VALUES ('2612', '56782214', '859', '2013-06-17 02:07:03', '0');
INSERT INTO `player_login` VALUES ('2613', '75255942', '898', '2013-06-17 02:43:41', '0');
INSERT INTO `player_login` VALUES ('2614', '75255942', '898', '2013-06-17 03:00:07', '2');
INSERT INTO `player_login` VALUES ('2615', '75255942', '898', '2013-06-17 03:05:40', '0');
INSERT INTO `player_login` VALUES ('2616', '56782214', '859', '2013-06-17 03:11:12', '0');
INSERT INTO `player_login` VALUES ('2617', '75255942', '898', '2013-06-17 03:15:40', '2');
INSERT INTO `player_login` VALUES ('2618', '3766534', '901', '2013-06-17 03:16:42', '0');
INSERT INTO `player_login` VALUES ('2619', '3766534', '901', '2013-06-17 03:30:30', '2');
INSERT INTO `player_login` VALUES ('2620', '56782214', '859', '2013-06-17 03:48:11', '2');

-- ----------------------------
-- Procedure structure for `pCleanup`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pCleanup`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanup`()
BEGIN

#starts outofbounds cleanup
	CALL pCleanupOOB();
	
#remove dead players from data table
	DELETE 
		FROM character_data 
		WHERE Alive=0;	
	
#remove vehicles with 100% damage
	DELETE
		FROM object_data 
		WHERE Damage = '1';					

#remove unused vehicles older then 14 days
	DELETE
		FROM object_data
		WHERE DATE(last_updated) < CURDATE() - INTERVAL 14 DAY
			AND Classname != 'dummy'
			AND Classname != 'Hedgehog_DZ'
			AND Classname != 'Wire_cat1'
			AND Classname != 'Sandbag1_DZ'
			AND Classname != 'BearTrap_DZ'
			AND Classname != 'StashSmall'
			AND Classname != 'StashMedium';

#Remove camonets whose owner has been dead for 1 day
DELETE 
	FROM object_data
	USING object_data, character_data
	WHERE (object_data.Classname = 'CamoNet_DZ')
		AND object_data.CharacterID = character_data.CharacterID
		AND character_data.Alive = 0
		AND DATE(character_data.last_updated) < CURDATE() - INTERVAL 1 Day;
		
#remove tents/stashs whose owner has been dead for four days
	DELETE
		FROM object_data
		USING object_data, character_data
		WHERE (object_data.Classname = 'TentStorage' or object_data.Classname = 'StashSmall' or object_data.Classname = 'StashMedium')
			AND object_data.CharacterID = character_data.CharacterID
			AND character_data.Alive = 0
			AND DATE(character_data.last_updated) < CURDATE() - INTERVAL 4 DAY;

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
			AND Classname != '-'						#exclude dummys
			AND Classname != 'Hedgehog_DZ'			#exclude hedgehog
			AND Classname != 'Wire_cat1'				#exclude wirecat
			AND Classname != 'Sandbag1_DZ'			#exclude Sanbag
			AND Classname != 'BearTrap_DZ'			#exclude trap
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
							AND Classname != '-'						#exclude dummys
							AND Classname != 'Hedgehog_DZ'			#exclude hedgehog
							AND Classname != 'Wire_cat1'				#exclude wirecat
							AND Classname != 'Sandbag1_DZ'			#exclude Sanbag
							AND Classname != 'BearTrap_DZ'			#exclude trap
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
