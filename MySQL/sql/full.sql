-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.22 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-12-13 13:38:43
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table default.character_data
CREATE TABLE IF NOT EXISTS `character_data` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table default.character_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_data` ENABLE KEYS */;


-- Dumping structure for table default.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `user` varchar(255) NOT NULL DEFAULT '',
  `timestamp` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table default.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Dumping structure for table default.object_classes
CREATE TABLE IF NOT EXISTS `object_classes` (
  `Classname` varchar(32) NOT NULL DEFAULT '',
  `Chance` varchar(4) NOT NULL DEFAULT '0',
  `MaxNum` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Damage` varchar(20) NOT NULL DEFAULT '0',
  `Type` text NOT NULL,
  PRIMARY KEY (`Classname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table default.object_classes: 54 rows
/*!40000 ALTER TABLE `object_classes` DISABLE KEYS */;
INSERT INTO `object_classes` (`Classname`, `Chance`, `MaxNum`, `Damage`, `Type`) VALUES
	('ATV_CZ_EP1', '0.70', 6, '0.05000', 'atv'),
	('car_hatchback', '0.73', 3, '0.05000', 'car'),
	('datsun1_civil_3_open', '0.75', 3, '0.05000', 'car'),
	('Fishing_Boat', '0.61', 1, '0.05000', 'largeboat'),
	('S1203_TK_CIV_EP1', '0.69', 1, '0.05000', 'bus'),
	('tractor', '0.7', 1, '0.05000', 'farmvehicle'),
	('BAF_Offroad_D', '0.54', 1, '0.05000', 'car'),
	('UAZ_Unarmed_TK_EP1', '0.7', 2, '0.05000', 'car'),
	('UH1H_DZ', '0.59', 2, '0.05000', 'helicopter'),
	('UralCivil2', '0.67', 1, '0.05000', 'truck'),
	('V3S_Civ', '0.66', 1, '0.05000', 'truck'),
	('Volha_2_TK_CIV_EP1', '0.71', 2, '0.05000', 'car'),
	('Ikarus', '0.59', 1, '0.05000', 'bus'),
	('ATV_US_EP1', '0.70', 5, '0.05000', 'atv'),
	('BAF_Offroad_W', '0.54', 1, '0.05000', 'car'),
	('car_sedan', '0.59', 1, '0.05000', 'car'),
	('hilux1_civil_1_open', '0.59', 1, '0.05000', 'car'),
	('hilux1_civil_2_covered', '0.59', 1, '0.05000', 'car'),
	('hilux1_civil_3_open', '0.59', 1, '0.05000', 'car'),
	('Ikarus_TK_CIV_EP1', '0.59', 1, '0.05000', 'bus'),
	('LandRover_TK_CIV_EP1', '0.59', 1, '0.05000', 'car'),
	('MH6J_EP1', '0.32', 1, '0.05000', 'helicopter'),
	('Old_bike_TK_CIV_EP1', '0.64', 4, '0.05000', 'bike'),
	('Old_bike_TK_INS_EP1', '0.64', 4, '0.05000', 'bike'),
	('PBX', '0.59', 1, '0.05000', 'smallboat'),
	('Skoda', '0.68', 4, '0.05000', 'car'),
	('SkodaBlue', '0.68', 2, '0.05000', 'car'),
	('SkodaGreen', '0.68', 1, '0.05000', 'car'),
	('Smallboat_1', '0.59', 2, '0.05000', 'mediumboat'),
	('Smallboat_2', '0.59', 2, '0.05000', 'mediumboat'),
	('SUV_TK_CIV_EP1', '0.59', 1, '0.05000', 'car'),
	('TentStorage', '0.59', 0, '0.05000', 'tent'),
	('TT650_Ins', '0.72', 1, '0.05000', 'motorcycle'),
	('TT650_TK_CIV_EP1', '0.72', 1, '0.05000', 'motorcycle'),
	('TT650_TK_EP1', '0.72', 1, '0.05000', 'motorcycle'),
	('UAZ_INS', '0.59', 2, '0.05000', 'car'),
	('UAZ_RU', '0.59', 1, '0.05000', 'car'),
	('UAZ_Unarmed_TK_CIV_EP1', '0.59', 3, '0.05000', 'car'),
	('UAZ_Unarmed_UN_EP1', '0.59', 1, '0.05000', 'car'),
	('UralCivil', '0.59', 1, '0.05000', 'truck'),
	('Mi17_DZ', '0.49', 2, '0.05000', 'helicopter'),
	('AN2_DZ', '1', 1, '0.05000', 'plane'),
	('Hedgehog_DZ', '0', 0, '0', 'Hedgehog'),
	('Wire_cat1', '0', 0, '0', 'wire'),
	('Sandbag1_DZ', '0', 0, '0', 'Sandbag'),
	('AH6X_DZ', '0.48', 1, '0.05000', 'helicopter'),
	('datsun1_civil_1_open', '0.59', 2, '0.05000', 'car'),
	('Lada1_TK_CIV_EP1', '0.59', 3, '0.05000', 'car'),
	('M1030', '0.58', 2, '0.05000', 'motorcycle'),
	('SUV_TK_EP1', '0.39', 1, '0.05000', 'car'),
	('VolhaLimo_TK_CIV_EP1', '0.49', 1, '0.05000', 'car'),
	('Lada2', '0.59', 2, '0', 'car'),
	('hilux1_civil_3_open_EP1', '0.59', 3, '0', 'car'),
	('LandRover_CZ_EP1', '0.59', 3, '0', 'car');
/*!40000 ALTER TABLE `object_classes` ENABLE KEYS */;


-- Dumping structure for table default.object_data
CREATE TABLE IF NOT EXISTS `object_data` (
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
  KEY `ObjectUID` (`ObjectUID`),
  KEY `Instance` (`Damage`,`Instance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table default.object_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `object_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_data` ENABLE KEYS */;


-- Dumping structure for table default.object_spawns
CREATE TABLE IF NOT EXISTS `object_spawns` (
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Classname` varchar(32) DEFAULT NULL,
  `Worldspace` varchar(64) DEFAULT NULL,
  `Inventory` longtext,
  `Hitpoints` varchar(999) NOT NULL DEFAULT '[]',
  `MapID` varchar(255) NOT NULL DEFAULT '',
  `Last_changed` int(10) DEFAULT NULL,
  PRIMARY KEY (`ObjectUID`,`MapID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table default.object_spawns: 112 rows
/*!40000 ALTER TABLE `object_spawns` DISABLE KEYS */;
INSERT INTO `object_spawns` (`ObjectUID`, `Classname`, `Worldspace`, `Inventory`, `Hitpoints`, `MapID`, `Last_changed`) VALUES
	(348, 'LandRover_CZ_EP1', '[64,[9653.4443,13555.063,0]]', '[]', '[]', '110', NULL),
	(718, 'Tractor', '[-3,[11934.478,9518.6309,0]]', '[]', '[]', '106', NULL),
	(719, 'Tractor', '[-3,[12288.495,11094.473,0]]', '[]', '[]', '107', NULL),
	(347, 'hilux1_civil_3_open_EP1', '[-1,[12276.199,10586.779,0]]', '[]', '[]', '108', NULL),
	(720, 'Tractor', '[0,[6158.7725,9005.5732,0]]', '[]', '[]', '109', NULL),
	(717, 'Tractor', '[-3,[12118.503,9445.8721,0]]', '[]', '[]', '105', NULL),
	(716, 'Tractor', '[-3,[12090.864,9453.6055,0]]', '[]', '[]', '104', NULL),
	(811, 'UH1H_DZ', '[27,[9686.75,3604.3081,0]]', '[]', '[]', '0', NULL),
	(311, 'Volha_2_TK_CIV_EP1', '[124,[9676.3398,8880.75,0]]', '[[[],[]],[[],[]],[[],[]]]', '[["motor",0.8],["karoserie",1],["palivo",0.8],["wheel_1_1_steering",1],["wheel_2_1_steering",1],["wheel_1_2_steering",1],["wheel_2_2_steering",1]]', '1', NULL),
	(111, 'ATV_US_EP1', '[84,[8837.4805,2844.75,0]]', '[[[],[]],[["ItemTent","ItemHeatPack","FoodCanBakedBeans"],[1,1,1]],[[],[]]]', '[["motor",0.8],["wheel_1_2_steering",1],["wheel_2_1_steering",0.0156045],["wheel_1_3_steering",0.0401988],["wheel_2_3_steering",1]]', '2', NULL),
	(112, 'ATV_US_EP1', '[294,[8830.5,2863.95,0]]', '[[[],[]],[["FoodCanFrankBeans","ItemPainkiller","ItemHeatPack"],[1,1,1]],[[],[]]]', '[["motor",1],["palivo",0.368047],["wheel_1_1_steering",0.331809],["wheel_1_2_steering",1],["wheel_2_1_steering",0.0473658],["wheel_2_2_steering",0.332376],["karoserie",0.355141],["wheel_1_3_steering",0.0401988],["wheel_2_3_steering",1]]', '3', NULL),
	(611, 'TT650_TK_CIV_EP1', '[13,[8783.2061,11723.631,0]]', '[]', '[]', '4', NULL),
	(612, 'TT650_TK_CIV_EP1', '[-17,[8636.0049,6856.8818,0]]', '[]', '[]', '5', NULL),
	(511, 'Old_bike_TK_CIV_EP1', '[160,[8346.9404,2458.27,0]]', '[]', '[]', '6', NULL),
	(512, 'Old_bike_TK_CIV_EP1', '[197,[8342.5996,2460.51,0]]', '[]', '[]', '7', NULL),
	(211, 'Fishing_Boat', '[253,[8299.9502,2358.95,0]]', '[[[],[]],[[],[]],[[],[]]]', '[]', '8', NULL),
	(312, 'UAZ_Unarmed_TK_EP1', '[160,[8115.6299,9295.5,0]]', '[[[],[]],[["HandGrenade_East","SmokeShell","SmokeShellRed","SmokeShellYellow","SmokeShellGreen","ItemWaterbottle","30Rnd_545x39_AK","10Rnd_762x54_SVD","ItemTent"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '9', NULL),
	(513, 'Old_bike_TK_CIV_EP1', '[285,[8091.2998,3350.3101,0]]', '[]', '[]', '10', NULL),
	(313, 'Volha_2_TK_CIV_EP1', '[185,[8039.1299,2916.3899,0]]', '[[[],[]],[[],[]],[[],[]]]', '[["motor",0.8],["karoserie",1],["palivo",0.8],["wheel_1_1_steering",1],["wheel_2_1_steering",1],["wheel_1_2_steering",1],["wheel_2_2_steering",1]]', '11', NULL),
	(514, 'Old_bike_TK_CIV_EP1', '[4,[8027.8701,7076.1699,0]]', '[]', '[]', '12', NULL),
	(314, 'Skoda', '[49,[8001.5898,3342.51,0]]', '[[[],[]],[[],[]],[[],[]]]', '[]', '13', NULL),
	(515, 'Old_bike_TK_CIV_EP1', '[130,[7919.9063,7231.3369,0]]', '[]', '[]', '14', NULL),
	(315, 'datsun1_civil_3_open', '[215,[7807.3442,3539.9856,0]]', '[]', '[]', '15', NULL),
	(812, 'UH1H_DZ', '[-23,[7154.9399,8157.1401,0]]', '[]', '[]', '16', NULL),
	(316, 'UAZ_Unarmed_TK_EP1', '[340,[6850.1362,2480.0134,0]]', '[]', '[]', '17', NULL),
	(411, 'Ikarus', '[202,[6575.8828,2868.105,0]]', '[]', '[]', '18', NULL),
	(613, 'TT650_TK_CIV_EP1', '[46,[6404.5347,3209.2341,0]]', '[]', '[]', '19', NULL),
	(813, 'UH1H_DZ', '[34,[6360.2271,2767.6943,0]]', '[]', '[]', '20', NULL),
	(317, 'UAZ_Unarmed_TK_EP1', '[231,[6319.1499,7733.6499,0]]', '[]', '[]', '21', NULL),
	(516, 'Old_bike_TK_CIV_EP1', '[70,[6294.96,7833.77,0]]', '[]', '[]', '22', NULL),
	(318, 'SkodaGreen', '[99,[6293.1201,7827.1201,0]]', '[]', '[]', '23', NULL),
	(412, 'Ikarus', '[102,[6237.4902,7705.6602,0]]', '[]', '[]', '24', NULL),
	(319, 'Volha_2_TK_CIV_EP1', '[222,[5136.8501,2362.4299,0]]', '[]', '[]', '25', NULL),
	(320, 'datsun1_civil_3_open', '[246,[4952.6401,5616.5098,0]]', '[]', '[]', '26', NULL),
	(814, 'AH6X_DZ', '[2,[12010.7,12637.2,0]]', '[]', '[]', '27', NULL),
	(321, 'UAZ_Unarmed_TK_EP1', '[226,[4790.1299,2571.3501,0]]', '[]', '[]', '28', NULL),
	(413, 'Ikarus', '[304,[4564.6948,4506.1382,0]]', '[]', '[]', '29', NULL),
	(815, 'Mi17_DZ', '[156,[7660.271,3982.0063,0]]', '[]', '[]', '30', NULL),
	(911, 'AN2_DZ', '[252,[4530.52,10785.1,0]]', '[]', '[]', '31', NULL),
	(816, 'UH1H_DZ', '[268,[4238.04,10781.7,0]]', '[]', '[]', '32', NULL),
	(113, 'ATV_US_EP1', '[313,[4087.0901,11669.4,0]]', '[[[],[]],[[],[]],[[],[]]]', '[["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",0.0156045],["wheel_1_3_steering",0.0401988],["wheel_2_3_steering",1]]', '33', NULL),
	(114, 'ATV_US_EP1', '[121,[4059.3201,11658.4,0]]', '[[[],[]],[["FoodCanFrankBeans","ItemPainkiller","ItemHeatPack"],[1,1,1]],[[],[]]]', '[["motor",0.8],["wheel_1_2_steering",1],["wheel_2_1_steering",0.0156045],["wheel_1_3_steering",0.0401988],["wheel_2_3_steering",1]]', '34', NULL),
	(711, 'tractor', '[-32,[3790.79,8961.0898,0]]', '[]', '[]', '35', NULL),
	(115, 'ATV_US_EP1', '[274,[3748.5901,5990.8701,0]]', '[[[],[]],[["ItemTent","ItemHeatPack","FoodCanBakedBeans"],[1,1,1]],[[],[]]]', '[["motor",0.8],["wheel_1_2_steering",0.1],["wheel_2_1_steering",1],["wheel_1_3_steering",0.0401988],["wheel_2_3_steering",0.5]]', '36', NULL),
	(414, 'Ikarus', '[180,[3728.0701,8669.0098,0]]', '[]', '[]', '37', NULL),
	(322, 'BAF_Offroad_D', '[162,[3702.04,6044.3101,0]]', '[]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '38', NULL),
	(517, 'Old_bike_TK_CIV_EP1', '[51,[3572.6201,2545.29,0]]', '[]', '[]', '39', NULL),
	(323, 'BAF_Offroad_W', '[71,[3708.5,5999.4199,0]]', '[[[],[]],[["HandGrenade_West","SmokeShell","SmokeShellRed","SmokeShellYellow","SmokeShellGreen","ItemWaterbottle","30Rnd_556x45_Stanag","20Rnd_762x51_DMR","ItemTent"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '40', NULL),
	(518, 'Old_bike_TK_CIV_EP1', '[202,[2947.2,2036.92,0]]', '[]', '[]', '41', NULL),
	(519, 'Old_bike_TK_CIV_EP1', '[-3,[2882.28,5270.4902,0]]', '[]', '[]', '42', NULL),
	(520, 'Old_bike_TK_CIV_EP1', '[-149,[2792.48,3114.03,0]]', '[]', '[]', '43', NULL),
	(415, 'Ikarus', '[309,[2768.26,6000.1602,0]]', '[]', '[]', '44', NULL),
	(324, 'Volha_2_TK_CIV_EP1', '[82,[2578.5901,5084.1099,0]]', '[]', '[]', '45', NULL),
	(325, 'BAF_Offroad_D', '[141,[11953.279,9107.3896,0]]', '[]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '46', NULL),
	(326, 'car_hatchback', '[287,[1967.1801,9147.2197,0]]', '[]', '[]', '47', NULL),
	(416, 'UralCivil2', '[233,[1915.7,12442.2,0]]', '[]', '[]', '48', NULL),
	(417, 'S1203_TK_CIV_EP1', '[183,[13367.5,6601.1099,0]]', '[]', '[]', '49', NULL),
	(327, 'UAZ_Unarmed_TK_EP1', '[89,[13127.792,11561.818,0]]', '[]', '[]', '50', NULL),
	(418, 'V3S_Civ', '[330,[13088.4,7108.5698,0]]', '[]', '[]', '51', NULL),
	(328, 'SkodaBlue', '[186,[12903.9,4431.3799,0]]', '[]', '[]', '52', NULL),
	(419, 'S1203_TK_CIV_EP1', '[-38,[12167.4,9748.5498,0]]', '[]', '[]', '53', NULL),
	(420, 'S1203_TK_CIV_EP1', '[376,[12130.7,3516.8899,0]]', '[]', '[]', '54', NULL),
	(817, 'UH1H_DZ', '[7,[12057.56,12626.336,0]]', '[]', '[]', '55', NULL),
	(614, 'TT650_TK_CIV_EP1', '[272,[11945.3,9130.3398,0]]', '[]', '[]', '56', NULL),
	(116, 'ATV_US_EP1', '[-37,[11483.7,11382.7,0]]', '[[[],[]],[["FoodCanFrankBeans","ItemPainkiller","ItemHeatPack"],[1,1,1]],[[],[]]]', '[["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",0.0156045],["wheel_1_3_steering",0.0401988],["wheel_2_3_steering",1]]', '57', NULL),
	(421, 'S1203_TK_CIV_EP1', '[245,[11463.3,7545.9302,0]]', '[]', '[]', '58', NULL),
	(117, 'ATV_US_EP1', '[42,[11461.1,11380.5,0]]', '[[[],[]],[[],[]],[[],[]]]', '[["motor",0.8],["wheel_1_2_steering",0.1],["wheel_2_1_steering",1],["wheel_1_3_steering",0.0401988],["wheel_2_3_steering",0.5]]', '59', NULL),
	(712, 'tractor', '[191,[11424.036,7355.7295,0]]', '[]', '[]', '60', NULL),
	(329, 'datsun1_civil_3_open', '[210,[11351.6,6633.52,0]]', '[]', '[]', '61', NULL),
	(818, 'UH1H_DZ', '[160,[11216.4,4234.8101,0]]', '[]', '[]', '62', NULL),
	(330, 'BAF_Offroad_W', '[322,[7201.5181,3034.3232,0]]', '[]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '63', NULL),
	(331, 'Volha_2_TK_CIV_EP1', '[189,[10812.7,2686.29,0]]', '[]', '[]', '64', NULL),
	(422, 'Ikarus', '[241,[10641.2,8073.2202,0]]', '[]', '[]', '65', NULL),
	(332, 'Volha_2_TK_CIV_EP1', '[306,[10454.8,8872.0996,0]]', '[]', '[]', '66', NULL),
	(423, 'Ikarus', '[62,[10320.025,2157.7627,0]]', '[]', '[]', '67', NULL),
	(819, 'AH6X_DZ', '[113,[6880.2007,11454.291,0]]', '[]', '[]', '68', NULL),
	(820, 'Mi17_DZ', '[-188,[7220.6538,9116.3428,0]]', '[]', '[]', '69', NULL),
	(333, 'SUV_TK_EP1', '[-93,[9157.7549,11019.93,0]]', '[]', '[]', '70', NULL),
	(334, 'car_sedan', '[-68,[7438.0454,5180.8857,0]]', '[]', '[]', '71', NULL),
	(615, 'M1030', '[-71,[8330.4639,5971.6885,0]]', '[]', '[]', '72', NULL),
	(335, 'Lada1_TK_CIV_EP1', '[-120,[8440.3926,5975.1753,0]]', '[]', '[]', '73', NULL),
	(521, 'Old_bike_TK_INS_EP1', '[-138,[8511.4111,6044.689,0]]', '[]', '[]', '74', NULL),
	(336, 'datsun1_civil_1_open', '[-134,[6448.6953,6543.1836,0]]', '[]', '[]', '75', NULL),
	(337, 'VolhaLimo_TK_CIV_EP1', '[-14,[6208.9775,10403.117,0]]', '[]', '[]', '76', NULL),
	(338, 'Lada1_TK_CIV_EP1', '[105,[6027.7988,10459.635,0]]', '[]', '[]', '77', NULL),
	(522, 'Old_bike_TK_CIV_EP1', '[-63,[5986.3462,10373.445,0]]', '[]', '[]', '78', NULL),
	(339, 'datsun1_civil_1_open', '[7,[5969.1924,10313.057,0]]', '[]', '[]', '79', NULL),
	(118, 'ATV_US_EP1', '[-32,[5984.6064,10161.703,0]]', '[[[],[]],[["FoodCanFrankBeans","ItemPainkiller","ItemHeatPack"],[1,1,1]],[[],[]]]', '[["motor",0.8],["wheel_1_2_steering",0.1],["wheel_2_1_steering",1],["wheel_1_3_steering",0.0401988],["wheel_2_3_steering",0.5]]', '80', NULL),
	(340, 'SkodaBlue', '[-163,[9691.2695,6551.8672,0]]', '[]', '[]', '81', NULL),
	(821, 'Mi17_DZ', '[4,[13584.044,3199.9648,0]]', '[]', '[]', '82', NULL),
	(912, 'AN2_DZ', '[134,[5172.3457,2172.7046,0]]', '[]', '[]', '83', NULL),
	(913, 'AN2_DZ', '[108,[5260.3203,2261.9851,0]]', '[]', '[]', '84', NULL),
	(914, 'AN2_DZ', '[-212,[5156.3555,2651.9055,0]]', '[]', '[]', '85', NULL),
	(915, 'AN2_DZ', '[-125,[4809.2461,2539.2903,0]]', '[]', '[]', '86', NULL),
	(341, 'BAF_Offroad_W', '[-95,[4713.7666,2616.6179,0]]', '[]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '87', NULL),
	(616, 'M1030', '[37,[4360.8408,2482.9688,0]]', '[]', '[]', '88', NULL),
	(342, 'car_sedan', '[19,[4454.373,2453.6816,0]]', '[]', '[]', '89', NULL),
	(119, 'ATV_US_EP1', '[-190,[4564.9624,2371.521,0]]', '[[[],[]],[["ItemTent","ItemHeatPack","FoodCanBakedBeans"],[1,1,1]],[[],[]]]', '[["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",0.0156045],["wheel_1_3_steering",0.0401988],["wheel_2_3_steering",1]]', '90', NULL),
	(523, 'Old_bike_TK_INS_EP1', '[-56,[4570.3975,2421.6531,0]]', '[]', '[]', '91', NULL),
	(822, 'AH6X_DZ', '[-190,[13112.096,10432.461,0]]', '[]', '[]', '92', NULL),
	(343, 'hilux1_civil_3_open', '[-161,[13145.874,10416.225,0]]', '[]', '[]', '93', NULL),
	(424, 'UralCivil2', '[108,[13109.942,10302.45,0]]', '[]', '[]', '94', NULL),
	(425, 'UralCivil2', '[-161,[13098.729,10248.01,0]]', '[]', '[]', '95', NULL),
	(426, 'S1203_TK_CIV_EP1', '[-3,[12996.397,10078.24,0]]', '[]', '[]', '96', NULL),
	(344, 'Lada2', '[-171,[12989.563,10075.743,0]]', '[]', '[]', '97', NULL),
	(345, 'datsun1_civil_1_open', '[-75,[12987.494,10039.641,0]]', '[]', '[]', '98', NULL),
	(713, 'Tractor', '[-75,[12670.277,10015.792,0]]', '[]', '[]', '99', NULL),
	(714, 'Tractor', '[108,[12684.55,10074.417,0]]', '[]', '[]', '100', NULL),
	(427, 'UralCivil', '[-25,[12683.362,9825.7119,0]]', '[]', '[]', '101', NULL),
	(346, 'Lada1_TK_CIV_EP1', '[-122,[12283.381,9464.5566,0]]', '[]', '[]', '102', NULL),
	(715, 'Tractor', '[-3,[12102.996,9451.2998,0]]', '[]', '[]', '103', NULL),
	(823, 'AH6X_DZ', '[-117,[9698.9893,13686.655,0]]', '[]', '[]', '111', NULL);
/*!40000 ALTER TABLE `object_spawns` ENABLE KEYS */;


-- Dumping structure for table default.object_spawns_original
CREATE TABLE IF NOT EXISTS `object_spawns_original` (
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Classname` varchar(32) DEFAULT NULL,
  `Worldspace` varchar(64) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ObjectUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table default.object_spawns_original: 143 rows
/*!40000 ALTER TABLE `object_spawns_original` DISABLE KEYS */;
INSERT INTO `object_spawns_original` (`ObjectUID`, `Classname`, `Worldspace`, `Description`, `last_updated`) VALUES
	(10314121553079, 'Ikarus', '[79,[10314.1,2155.32,-1.19209]]', 'On the Main road in Elektrozavodsk', NULL),
	(104548887210334, 'Volha_2_TK_CIV_EP1', '[334,[10454.8,8872.1,0]]', 'At the gas station east of Gorka', NULL),
	(106412807320227, 'Ikarus', '[227,[10641.2,8073.22,0.00663757]]', 'At the Polana general store', NULL),
	(108127268630204, 'Volha_2_TK_CIV_EP1', '[204,[10812.7,2686.29,0]]', 'In the small complex between Drakon island and Elektrozavodsk.', NULL),
	(112164423480132, 'UH1H_DZ', '[132,[11216.4,4234.81,0.00119019]]', 'At the top of Rog Castle ', NULL),
	(113516663350255, 'datsun1_civil_3_open', '[255,[11351.6,6633.52,0]]', 'In the large sheet-metal building in Dolina ', NULL),
	(114234734790213, 'tractor', '[213,[11423.4,7347.94,0.00274658]]', 'Near factory on the north of Dolina (GR: 115076)', NULL),
	(11461311380706, 'ATV_US_EP1', '[6,[11461.1,11380.5,0.000762939]]', 'At top of a hill South-South East of Krasnostav. (GR: 114039) ', NULL),
	(114633754590219, 'S1203_TK_CIV_EP1', '[219,[11463.3,7545.93,0]]', 'On the road between the factory north of Dolina and Polana', NULL),
	(114843113836021, 'ATV_US_EP1', '[17,[11483.7,11382.7,0.0155945]]', 'At top of a hill South-South East of Krasnostav. (GR: 114039) ', NULL),
	(119453913030169, 'TT650_TK_CIV_EP1', '[169,[11945.3,9130.34,4.19617]]', 'Outside Berezino hospital', NULL),
	(120126126401018, 'UH1H_DZ', '[18,[12012.6,12640.1,0.00793457]]', 'In a Hanger at Krasnostav Airstrip (NE)', NULL),
	(121307351690353, 'S1203_TK_CIV_EP1', '[353,[12130.7,3516.89,6.67572]]', 'On the main road in Kamyshovo', NULL),
	(12167497486012, 'S1203_TK_CIV_EP1', '[12,[12167.4,9748.55,0]]', 'In the football field near the military camp in Berezino', NULL),
	(129039443140165, 'SkodaBlue', '[165,[12903.9,4431.38,0.00242615]]', 'Found in Tulga (GR: 128109)', NULL),
	(130884710860341, 'V3S_Civ', '[341,[13088.4,7108.57,0]]', 'In the Quarry at Solnichniy', NULL),
	(1312901155970100, 'UAZ_Unarmed_TK_EP1', '[130,[13129.8,11560,0.0706997]]', 'Half sunken, on the edge of Black Lake SE of NEAF', NULL),
	(133675660110167, 'S1203_TK_CIV_EP1', '[167,[13367.5,6601.11,0.0126638]]', 'On the gas station north of Solnichniy (GR:133087)', NULL),
	(191571244220252, 'UralCivil2', '[252,[1915.7,12442.2,0.000778198]]', 'Small building complex along the road between Grozovoy Pass and Lopatino (GR:019029)', NULL),
	(19672914720310, 'car_hatchback', '[310,[1967.18,9147.22,0.00106812]]', 'House at the end of the dirt road South South-West of Lopatino', NULL),
	(25786508410123, 'Volha_2_TK_CIV_EP1', '[123,[2578.59,5084.11,0]]', 'Zelenogorsk supermarket', NULL),
	(27683600020346, 'Ikarus', '[346,[2768.26,6000.16,0.00302124]]', 'Between Zelenogorsk and Sosnovka', NULL),
	(2792531140051, 'Old_bike_TK_CIV_EP1', '[51,[2792.48,3114.03,-1.52588]]', 'On the secondary road that leads south out of Bor (Closest to Komarovo)', NULL),
	(2882352705015, 'Old_bike_TK_CIV_EP1', '[15,[2882.28,5270.49,0.0126953]]', 'In Zelenogorsk on the main road that leads to the East', NULL),
	(29472203690211, 'Old_bike_TK_CIV_EP1', '[211,[2947.2,2036.92,0.00710678]]', 'On the main road, next to the railroads, west of Komarovo (Right North of the lighthouse on the shore)', NULL),
	(35726254530108, 'Old_bike_TK_CIV_EP1', '[108,[3572.62,2545.29,0.00117016]]', 'On the main road leading North/North West out of Komarovo', NULL),
	(37022604400122, 'BAF_Offroad_D', '[123,[3702.04,6044.31,0.00994873]]', 'At Green Mountain', NULL),
	(37281866900250, 'Ikarus', '[250,[3728.07,8669.01,0.000427246]]', 'On the road immediately southwest of Vybor', NULL),
	(37488599070284, 'ATV_US_EP1', '[284,[3748.59,5990.87,0.00488281]]', 'At Green Mountain. (GR: 037083)', NULL),
	(3790889611021, 'tractor', '[21,[3790.79,8961.09,6.10352]]', 'In front of Supermarket in Vybor (GR: 038064)', NULL),
	(405971165880166, 'ATV_US_EP1', '[166,[4059.32,11658.4,0.00622559]]', 'At top of mountain dirt trail NW of NWAF', NULL),
	(408671167010355, 'ATV_US_EP1', '[347,[4087.09,11669.4,0.0127563]]', 'At top of mountain dirt trail NW of NWAF', NULL),
	(3004238041078170, 'UH1H_DZ', '[300,[4238.04,10781.7,0]]', 'At International_Airfield (NW), north part of the runway - Vehicle 32 ', NULL),
	(45636450530322, 'Ikarus', '[322,[4563.58,4505.33,0]]', 'In the red hangar in Kozlovka', NULL),
	(47901257140184, 'UAZ_Unarmed_TK_EP1', '[184,[4790.13,2571.35,0]]', 'In a hangar at Balota airfield', NULL),
	(49526561650224, 'datsun1_civil_3_open', '[224,[4952.64,5616.51,0.00234985]]', 'Beside a house near the southern barns/factory area (? Pulkovo ?) ', NULL),
	(51368236240356, 'Volha_2_TK_CIV_EP1', '[356,[5136.85,2362.43,0]]', 'East end of Balota airfield, outside warehouse.', NULL),
	(62375770570132, 'Ikarus', '[132,[6237.49,7705.66,0]]', 'In the Stary Sobor near Barracks', NULL),
	(6293178271046, 'SkodaGreen', '[46,[6293.12,7827.12,0.00143433]]', 'Next to the grey Skoda(unusable) on Stary Sobor Military Camp ', NULL),
	(6295078338093, 'Old_bike_TK_CIV_EP1', '[93,[6294.96,7833.77,6.10352]]', '?', NULL),
	(63191773360266, 'UAZ_Unarmed_TK_EP1', '[266,[6319.15,7733.65,0.000366211]]', 'At Stary Sobor Military Camp', NULL),
	(6359327688042, 'UH1H_DZ', '[42,[6359.33,2768.85,0]]', 'On the back side of Hospital at Chernogorsk (the one near the red buildings) ', NULL),
	(64043320990215, 'TT650_TK_CIV_EP1', '[215,[6404.28,3209.92,0.000431061]]', 'To the left of the northern most bus stop in Chernogorsk (GR: 065124)', NULL),
	(65785287540228, 'Ikarus', '[228,[6578.48,2875.43,-1.33514]]', 'On the Main road in Chernogorsk', NULL),
	(68465247650168, 'UAZ_Unarmed_TK_EP1', '[168,[6846.48,2476.5,0]]', 'At International Hotel in Chernogorsk', NULL),
	(7154981571028, 'UH1H_DZ', '[28,[7154.94,8157.14,0.00424194]]', 'In the field NE of Novy Sobor ', NULL),
	(78030353500251, 'datsun1_civil_3_open', '[251,[7802.95,3535.03,2.81334]]', 'In a gated/fenced-off area on the west-side of Prigorodki ', NULL),
	(79183723400103, 'Old_bike_TK_CIV_EP1', '[103,[7918.32,7234.04,0.0188293]]', '?', NULL),
	(80016334250106, 'Skoda', '[106,[8001.59,3342.51,0.00014782]]', 'Southern part of Prigorodky, near the road.', NULL),
	(80279707620132, 'Old_bike_TK_CIV_EP1', '[132,[8027.87,7076.17,0.0022583]]', '?', NULL),
	(80391291640356, 'Volha_2_TK_CIV_EP1', '[356,[8039.13,2916.39,0.00257635]]', 'Near the shore south of Prigorodki', NULL),
	(80913335030101, 'Old_bike_TK_CIV_EP1', '[101,[8091.3,3350.31,0.0133638]]', '?', NULL),
	(81156929550151, 'UAZ_Unarmed_TK_EP1', '[151,[8115.63,9295.5,0.00604248]]', 'Far West of Gorka at the end of the Dirt Road at Altar (GR: 081060)', NULL),
	(82999235890260, 'Fishing_Boat', '[260,[8299.95,2358.95,1.28169]]', 'Off the coast of Cap Golova', NULL),
	(83426246050223, 'Old_bike_TK_CIV_EP1', '[223,[8342.6,2460.51,0.0132484]]', '?', NULL),
	(83469245830182, 'Old_bike_TK_CIV_EP1', '[182,[8346.94,2458.27,0.0158215]]', '?', NULL),
	(863516858507, 'TT650_TK_CIV_EP1', '[7,[8635.13,6858.49,0.035614]]', 'On the Dirt Road North of Guglovo that leads to Gorka (GR: 085073)', NULL),
	(878381172580186, 'TT650_TK_CIV_EP1', '[186,[8783.76,11725.8,0.00302124]]', 'South East of Gvozdno in the field, near a building (GR: 091043)', NULL),
	(88305286400337, 'ATV_US_EP1', '[337,[8830.5,2863.95,0.0141296]]', 'On top of the hill directly NE of Cap Golovo (Lighthouse between Chernogorsk and Elektrozavodsk) (GR: 088124)', NULL),
	(88375284470130, 'ATV_US_EP1', '[130,[8837.48,2844.75,0.00938416]]', 'On top of the hill directly NE of Cap Golovo (Lighthouse between Chernogorsk and Elektrozavodsk) (GR: 088124)', NULL),
	(96763888070312, 'Volha_2_TK_CIV_EP1', '[312[312,[9676.34,8880.75,3.05176]]]', 'At the three Gorka barns', NULL),
	(9687236048084, 'UH1H_DZ', '[84,[84,[9687.2,3604.85,0.0254517]]]', 'In a large, open field, directly west of Pobeda Damm ', NULL),
	(453771026770044331, 'Mi17_DZ', '[331,[4537.7,10267.7,-0.044]]', 'North West Airfield', NULL),
	(1088394782627984, 'BAF_Offroad_W', '[339,[7202,3033.41,0.002]]', NULL, NULL),
	(2503118731506265, 'BAF_Offroad_D', '[124,[11952.7,9107.97,0.001]]', NULL, NULL),
	(4351630049046695, 'AN2_DZ', '[242,[4530.52,10785.1,0.081]]', NULL, NULL),
	(4864605479083398, 'AH6X_DZ', '[19,[12010.7,12637.2,0.058]]', NULL, NULL),
	(3395057661282910, 'BAF_Offroad_D', '[50,[3708.5,5999.42,6.10352e-005]]', NULL, NULL),
	(1606448695365431836, 'datsun1_civil_1_open', '[-160,[6448.6953,6543.1836,0]]', NULL, NULL),
	(4474380454518088570, 'car_sedan', '[-44,[7438.0454,5180.8857,0]]', NULL, NULL),
	(7683304639597168850, 'TT650_TK_CIV_EP1', '[-76,[8330.4639,5971.6885,0]]', NULL, NULL),
	(1078440392659751753, 'Lada1_TK_CIV_EP1', '[-107,[8440.3926,5975.1753,0]]', NULL, NULL),
	(1258511411160446890, 'Old_bike_TK_INS_EP1', '[-125,[8511.4111,6044.689,0]]', NULL, NULL),
	(1671336756601110, 'S1203_TK_CIV_EP1', '[167,[13367.5,6601.11,0]]', NULL, NULL),
	(130131298115600, 'UAZ_Unarmed_TK_EP1', '[130,[13129.8,11560,0]]', NULL, NULL),
	(3411308847108570, 'V3S_Civ', '[341,[13088.4,7108.57,0]]', NULL, NULL),
	(72206538911634280, 'Mi17_DZ', '[0,[7220.6538,9116.3428,0]]', NULL, NULL),
	(899157754911019930, 'SUV_TK_EP1', '[-89,[9157.7549,11019.93,0]]', NULL, NULL),
	(1226880200711454291, 'AH6X_DZ', '[122,[6880.2007,11454.291,0]]', NULL, NULL),
	(334104548887210, 'Volha_2_TK_CIV_EP1', '[334,[10454.8,8872.1,0]]', NULL, NULL),
	(79103141215532010, 'Ikarus', '[79,[10314.1,2155.3201,0]]', NULL, NULL),
	(33972023033410, 'BAF_Offroad_W', '[339,[7202,3033.41,0]]', NULL, NULL),
	(2041081272686290, 'Volha_2_TK_CIV_EP1', '[204,[10812.7,2686.29,0]]', NULL, NULL),
	(2271064128073220, 'Ikarus', '[227,[10641.2,8073.22,0]]', NULL, NULL),
	(2251135166633520, 'datsun1_civil_3_open', '[225,[11351.6,6633.52,0]]', NULL, NULL),
	(132112164423481010, 'UH1H_DZ', '[132,[11216.4,4234.8101,0]]', NULL, NULL),
	(2161142403673557295, 'tractor', '[216,[11424.036,7355.7295,0]]', NULL, NULL),
	(61146111138050, 'ATV_US_EP1', '[6,[11461.1,11380.5,0]]', NULL, NULL),
	(171148371138270, 'ATV_US_EP1', '[17,[11483.7,11382.7,0]]', NULL, NULL),
	(2191146337545930, 'S1203_TK_CIV_EP1', '[219,[11463.3,7545.93,0]]', NULL, NULL),
	(121216749748550, 'S1203_TK_CIV_EP1', '[12,[12167.4,9748.55,0]]', NULL, NULL),
	(353121307351688990, 'S1203_TK_CIV_EP1', '[353,[12130.7,3516.8899,0]]', NULL, NULL),
	(171205756126263360, 'UH1H_DZ', '[17,[12057.56,12626.336,0]]', NULL, NULL),
	(169119453913033980, 'TT650_TK_CIV_EP1', '[169,[11945.3,9130.3398,0]]', NULL, NULL),
	(1651290394431380, 'SkodaBlue', '[165,[12903.9,4431.38,0]]', NULL, NULL),
	(1241195279107970, 'BAF_Offroad_D', '[124,[11952.7,9107.97,0]]', NULL, NULL),
	(3101967189147220, 'car_hatchback', '[310,[1967.18,9147.22,0]]', NULL, NULL),
	(252191571244220, 'UralCivil2', '[252,[1915.7,12442.2,0]]', NULL, NULL),
	(3462768266000160, 'Ikarus', '[346,[2768.26,6000.16,0]]', NULL, NULL),
	(1232578595084110, 'Volha_2_TK_CIV_EP1', '[123,[2578.59,5084.11,0]]', NULL, NULL),
	(512792483114030, 'Old_bike_TK_CIV_EP1', '[51,[2792.48,3114.03,0]]', NULL, NULL),
	(152882285270490, 'Old_bike_TK_CIV_EP1', '[15,[2882.28,5270.49,0]]', NULL, NULL),
	(211294722036920, 'Old_bike_TK_CIV_EP1', '[211,[2947.2,2036.92,0]]', NULL, NULL),
	(5037085599941990, 'BAF_Offroad_W', '[50,[3708.5,5999.4199,0]]', NULL, NULL),
	(1083572622545290, 'Old_bike_TK_CIV_EP1', '[108,[3572.62,2545.29,0]]', NULL, NULL),
	(1233702046044310, 'BAF_Offroad_D', '[123,[3702.04,6044.31,0]]', NULL, NULL),
	(1664059321165840, 'ATV_US_EP1', '[166,[4059.32,11658.4,0]]', NULL, NULL),
	(21379079896108980, 'tractor', '[21,[3790.79,8961.0898,0]]', NULL, NULL),
	(2843748595990870, 'ATV_US_EP1', '[284,[3748.59,5990.87,0]]', NULL, NULL),
	(2503728078669010, 'Ikarus', '[250,[3728.07,8669.01,0]]', NULL, NULL),
	(3474087091166940, 'ATV_US_EP1', '[347,[4087.09,11669.4,0]]', NULL, NULL),
	(2424530521078510, 'AN2_DZ', '[242,[4530.52,10785.1,0]]', NULL, NULL),
	(1844790132571350, 'UAZ_Unarmed_TK_EP1', '[184,[4790.13,2571.35,0]]', NULL, NULL),
	(3224563584505330, 'Ikarus', '[322,[4563.58,4505.33,0]]', NULL, NULL),
	(1667660271398200630, 'Mi17_DZ', '[166,[7660.271,3982.0063,0]]', NULL, NULL),
	(191201071263720, 'AH6X_DZ', '[19,[12010.7,12637.2,0]]', NULL, NULL),
	(1326237497705660, 'Ikarus', '[132,[6237.49,7705.66,0]]', NULL, NULL),
	(3565136852362430, 'Volha_2_TK_CIV_EP1', '[356,[5136.85,2362.43,0]]', NULL, NULL),
	(2244952645616510, 'datsun1_civil_3_open', '[224,[4952.64,5616.51,0]]', NULL, NULL),
	(466293127827120, 'SkodaGreen', '[46,[6293.12,7827.12,0]]', NULL, NULL),
	(936294967833770, 'Old_bike_TK_CIV_EP1', '[93,[6294.96,7833.77,0]]', NULL, NULL),
	(2666319157733650, 'UAZ_Unarmed_TK_EP1', '[266,[6319.15,7733.65,0]]', NULL, NULL),
	(2156404283209920, 'TT650_TK_CIV_EP1', '[215,[6404.28,3209.92,0]]', NULL, NULL),
	(426359332768850, 'UH1H_DZ', '[42,[6359.33,2768.85,0]]', NULL, NULL),
	(168684648247650, 'UAZ_Unarmed_TK_EP1', '[168,[6846.48,2476.5,0]]', NULL, NULL),
	(228657848287542990, 'Ikarus', '[228,[6578.48,2875.4299,0]]', NULL, NULL),
	(287154948157140, 'UH1H_DZ', '[28,[7154.94,8157.14,0]]', NULL, NULL),
	(1037918327234040, 'Old_bike_TK_CIV_EP1', '[103,[7918.32,7234.04,0]]', NULL, NULL),
	(2517803436353487330, 'datsun1_civil_3_open', '[251,[7803.436,3534.8733,0]]', NULL, NULL),
	(1068001593342510, 'Skoda', '[106,[8001.59,3342.51,0]]', NULL, NULL),
	(3568039132916390, 'Volha_2_TK_CIV_EP1', '[356,[8039.13,2916.39,0]]', NULL, NULL),
	(1328027877076170, 'Old_bike_TK_CIV_EP1', '[132,[8027.87,7076.17,0]]', NULL, NULL),
	(101809133350310, 'Old_bike_TK_CIV_EP1', '[101,[8091.3,3350.31,0]]', NULL, NULL),
	(2608299952358950, 'Fishing_Boat', '[260,[8299.95,2358.95,0]]', NULL, NULL),
	(151811563929550, 'UAZ_Unarmed_TK_EP1', '[151,[8115.63,9295.5,0]]', NULL, NULL),
	(223834262460510, 'Old_bike_TK_CIV_EP1', '[223,[8342.6,2460.51,0]]', NULL, NULL),
	(1828346942458270, 'Old_bike_TK_CIV_EP1', '[182,[8346.94,2458.27,0]]', NULL, NULL),
	(78635136858490, 'TT650_TK_CIV_EP1', '[7,[8635.13,6858.49,0]]', NULL, NULL),
	(1868783761172580, 'TT650_TK_CIV_EP1', '[186,[8783.76,11725.8,0]]', NULL, NULL),
	(337883052863950, 'ATV_US_EP1', '[337,[8830.5,2863.95,0]]', NULL, NULL),
	(1308837482844750, 'ATV_US_EP1', '[130,[8837.48,2844.75,0]]', NULL, NULL),
	(312967633988880750, 'Volha_2_TK_CIV_EP1', '[312,[9676.3398,8880.75,0]]', NULL, NULL),
	(968723604850, 'UH1H_DZ', '[0,[9687.2,3604.85,0]]', NULL, NULL);
/*!40000 ALTER TABLE `object_spawns_original` ENABLE KEYS */;


-- Dumping structure for procedure default.pCleanup
DELIMITER //
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanup`()
BEGIN


#move dead players to character_dead
#	insert
#		into character_data 
#		select * 
#		from character_data 
#		WHERE Alive = '0';
	
#remove dead players from data table
	DELETE 
		FROM character_data 
		WHERE Alive = '0';	
	
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
			AND Classname != 'TrapBear';

#remove tents whose owner has been dead for four days
	DELETE
		FROM object_data
		USING object_data, character_data
		WHERE object_data.Classname = 'TentStorage'
			AND object_data.CharacterID = character_data.CharacterID
			AND character_data.Alive = 0
			AND DATE(character_data.last_updated) < CURDATE() - INTERVAL 4 DAY;

#remove empty tents older than seven days
	DELETE
		FROM object_data
		WHERE Classname = 'TentStorage'
			AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
			AND Inventory = '[[[],[]],[[],[]],[[],[]]]';
	
	DELETE
		FROM object_data
		WHERE Classname = 'TentStorage'
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
		WHERE Classname = 'TrapBear'
			AND DATE(last_updated) < CURDATE() - INTERVAL 5 DAY;

END//
DELIMITER ;


-- Dumping structure for procedure default.pCleanupOOB
DELIMITER //
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanupOOB`()
BEGIN

	DECLARE intLineCount	INT DEFAULT 0;
	DECLARE intDummyCount	INT DEFAULT 0;
	DECLARE intDoLine			INT DEFAULT 0;
	DECLARE intWest				INT DEFAULT 0;
	DECLARE intNorth			INT DEFAULT 0;

	SELECT COUNT(*)
		INTO intLineCount
		FROM object_data;

	SELECT COUNT(*)
		INTO intDummyCount
		FROM object_data
		WHERE Classname = 'dummy';

	WHILE (intLineCount > intDummyCount) DO
	
		SET intDoLine = intLineCount - 1;

		SELECT ObjectUID, Worldspace
			INTO @rsObjectUID, @rsWorldspace
			FROM object_data
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
			DELETE FROM object_data
				WHERE ObjectUID = @rsObjectUID;
		END IF;
			
		SET intLineCount = intLineCount - 1;

	END WHILE;

END//
DELIMITER ;


-- Dumping structure for table default.player_data
CREATE TABLE IF NOT EXISTS `player_data` (
  `playerID` int(11) NOT NULL DEFAULT '0',
  `playerUID` varchar(45) NOT NULL DEFAULT '0',
  `playerName` varchar(50) NOT NULL DEFAULT 'Null',
  `playerMorality` int(11) NOT NULL DEFAULT '0',
  `playerSex` int(11) NOT NULL DEFAULT '0',
  KEY `playerID` (`playerID`),
  KEY `playerUID` (`playerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table default.player_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_data` ENABLE KEYS */;


-- Dumping structure for table default.player_login
CREATE TABLE IF NOT EXISTS `player_login` (
  `LoginID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(45) NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `datestamp` datetime NOT NULL,
  `Action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table default.player_login: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_login` ENABLE KEYS */;


-- Dumping structure for procedure default.pMain
DELIMITER //
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pMain`()
    MODIFIES SQL DATA
BEGIN

# maximum number of INSTANCE id's USED.
#-----------------------------------------------
	DECLARE sInstance VARCHAR(8) DEFAULT 1;
#-----------------------------------------------
#maximum number of vehicles allowed !!! theoretical max. amount
#-----------------------------------------------
	DECLARE iVehSpawnMax INT DEFAULT 100;
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
			FROM object_data 
			WHERE Instance = sInstance
			AND Classname != '-'						#exclude dummys
			AND Classname != 'Hedgehog_DZ'			#exclude hedgehog
			AND Classname != 'Wire_cat1'				#exclude wirecat
			AND Classname != 'Sandbag1_DZ'			#exclude Sanbag
			AND Classname != 'TrapBear'			#exclude trap
			AND Classname != 'TentStorage';		#exclude TentStorage

		WHILE (iNumVehExisting < iVehSpawnMax) DO		#loop until maximum amount of vehicles is reached

			#select a random vehicle class
			SELECT Classname, Chance, MaxNum, Damage
				INTO @rsClassname, @rsChance, @rsMaxNum, @rsDamage
				FROM object_classes ORDER BY RAND() LIMIT 1;

			#count number of same class already spawned
			SELECT COUNT(*) 
				INTO iNumClassExisting 
				FROM object_data 
				WHERE Instance = sInstance
				AND Classname = @rsClassname;

			IF (iNumClassExisting < @rsMaxNum) THEN

				IF (rndspawn(@rschance) = 1) THEN
				
					INSERT INTO object_data (ObjectUID, Instance, Classname, Damage, CharacterID, Worldspace, Inventory, Hitpoints, Fuel, Datestamp)
						SELECT ObjectUID, sInstance, Classname, RAND(@rsDamage), '0', Worldspace, Inventory, Hitpoints, RAND(1), SYSDATE() 
							FROM object_spawns 
							WHERE Classname = @rsClassname 
								AND NOT ObjectUID IN (select objectuid from object_data where instance = sInstance)
							ORDER BY RAND()
							LIMIT 0, 1;
							
					SELECT COUNT(*) 
						INTO iNumVehExisting 
						FROM object_data 
						WHERE Instance = sInstance
							AND Classname != '-'						#exclude dummys
							AND Classname != 'Hedgehog_DZ'			#exclude hedgehog
							AND Classname != 'Wire_cat1'				#exclude wirecat
							AND Classname != 'Sandbag1_DZ'			#exclude Sanbag
							AND Classname != 'TrapBear'			#exclude trap
							AND Classname != 'TentStorage';		#exclude TentStorage
		
					#update number of same class already spawned
					SELECT COUNT(*) 
						INTO iNumClassExisting 
						FROM object_data 
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
END//
DELIMITER ;


-- Dumping structure for function default.rndspawn
DELIMITER //
CREATE DEFINER=`dayz`@`localhost` FUNCTION `rndspawn`(`chance` double) RETURNS tinyint(1)
BEGIN

	DECLARE bspawn tinyint(1) DEFAULT 0;

	IF (RAND() <= chance) THEN
		SET bspawn = 1;
	END IF;

	RETURN bspawn;

END//
DELIMITER ;


-- Dumping structure for table default.version
CREATE TABLE IF NOT EXISTS `version` (
  `Version` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table default.version: ~1 rows (approximately)
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` (`Version`) VALUES
	(2);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;