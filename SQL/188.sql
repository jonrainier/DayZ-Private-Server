-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.11-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.5119
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for event hivemind.3h updates
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` EVENT `3h updates` ON SCHEDULE EVERY 3 HOUR STARTS '2015-01-26 03:29:45' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	update event_scheduler set LastRun = NOW() where System = "3hRespawns";
	
	CALL `pMain`('1337');
	
END//
DELIMITER ;

-- Dumping structure for table hivemind.character_data
CREATE TABLE IF NOT EXISTS `character_data` (
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

-- Dumping data for table hivemind.character_data: ~0 rows (approximately)
DELETE FROM `character_data`;
/*!40000 ALTER TABLE `character_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_data` ENABLE KEYS */;

-- Dumping structure for table hivemind.character_dead
CREATE TABLE IF NOT EXISTS `character_dead` (
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

-- Dumping data for table hivemind.character_dead: ~0 rows (approximately)
DELETE FROM `character_dead`;
/*!40000 ALTER TABLE `character_dead` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_dead` ENABLE KEYS */;

-- Dumping structure for function hivemind.countVehicles
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `countVehicles`(`inst` int) RETURNS int(11)
    READS SQL DATA
BEGIN
	DECLARE count INT DEFAULT 0;
	
	SELECT COUNT(*)
	INTO count
	FROM object_data
	WHERE CharacterID = 0
		AND Instance = inst;
	
	RETURN count;
END//
DELIMITER ;

-- Dumping structure for function hivemind.countVehiclesClass
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `countVehiclesClass`(`inst` int,`c` varchar(255)) RETURNS int(11)
    READS SQL DATA
BEGIN
	DECLARE count INT DEFAULT 0;
	
	SELECT COUNT(*)
		INTO count
		FROM object_data
		WHERE Instance = inst
		AND CharacterID = 0
		AND Classname = c;
	
	RETURN count;
END//
DELIMITER ;

-- Dumping structure for function hivemind.countVehiclesGroup
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `countVehiclesGroup`(`inst` int, `groupid` int) RETURNS int(11)
    READS SQL DATA
BEGIN
	DECLARE count INT;
	
	/*SELECT COUNT(*)
		INTO count
		FROM object_data AS obj
		WHERE CharacterID = 0
			AND Instance = instance
		AND t = (SELECT `Group` FROM vehicle_spawns AS spawn WHERE spawn.Classname = obj.Classname LIMIT 1);*/
	
	SELECT COUNT(*)
	INTO count
	FROM object_data
	WHERE CharacterID = 0
		AND Instance = inst
		AND Classname IN
		(
			SELECT Classname
			FROM vehicle_spawns
			WHERE ID IN
			(
				SELECT Spawn_ID
				FROM vehicle_spawns_groups
				WHERE Group_ID = groupid
			)
		);
	
	RETURN count;
END//
DELIMITER ;

-- Dumping structure for table hivemind.event_scheduler
CREATE TABLE IF NOT EXISTS `event_scheduler` (
  `System` text,
  `LastRun` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hivemind.event_scheduler: ~8 rows (approximately)
DELETE FROM `event_scheduler`;
/*!40000 ALTER TABLE `event_scheduler` DISABLE KEYS */;
INSERT INTO `event_scheduler` (`System`, `LastRun`) VALUES
	('3hRespawns', NULL),
	('pCleanup', '2016-06-19 09:36:55'),
	('pCleanupBase', '2016-06-19 09:36:55'),
	('pMain', '2016-06-19 09:36:55'),
	('3hRespawns', NULL),
	('pCleanup', '2016-06-19 09:36:55'),
	('pCleanupBase', '2016-06-19 09:36:55'),
	('pMain', '2016-06-19 09:36:55');
/*!40000 ALTER TABLE `event_scheduler` ENABLE KEYS */;

-- Dumping structure for function hivemind.generateUID
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `generateUID`(`inst` int) RETURNS bigint(20)
BEGIN
	DECLARE Min BIGINT DEFAULT 10000000;
	DECLARE Max BIGINT DEFAULT 99999999;
	
	DECLARE UID BIGINT DEFAULT 0;
	
	WHILE (UID = 0) DO
		SET UID = ROUND(Min + RAND() * (Max - Min));
		
		IF (UID IN (SELECT ObjectUID FROM object_data WHERE CharacterID = 0 AND Instance = inst)) THEN
			SET UID = 0;
		END IF;
	END WHILE;
	
	RETURN UID;
END//
DELIMITER ;

-- Dumping structure for function hivemind.getNumSpawnable
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `getNumSpawnable`(`inst` int, `spawnid` int) RETURNS int(11)
BEGIN
	DECLARE Class_Max INT DEFAULT (SELECT MaxNum - countVehiclesClass(inst, Classname) FROM vehicle_spawns WHERE ID = spawnid LIMIT 1);
	DECLARE Group_Max INT DEFAULT
	(
		SELECT MIN(MaxNum - countVehiclesGroup(inst, ID))
		FROM vehicle_groups
		WHERE ID IN
		(
			SELECT Group_ID
			FROM vehicle_spawns_groups
			WHERE Spawn_ID = spawnid
		)
	);
	
	RETURN IF(ISNULL(Group_Max), Class_Max, IF(Class_Max < Group_Max, Class_Max, Group_Max));
END//
DELIMITER ;

-- Dumping structure for table hivemind.object_classes
CREATE TABLE IF NOT EXISTS `object_classes` (
  `Classname` varchar(32) NOT NULL DEFAULT '',
  `Chance` varchar(4) NOT NULL DEFAULT '0',
  `MaxNum` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Damage` varchar(20) NOT NULL DEFAULT '0',
  `Type` text NOT NULL,
  PRIMARY KEY (`Classname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hivemind.object_classes: 59 rows
DELETE FROM `object_classes`;
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
	('UH1H_DZ', '0.59', 1, '0.05000', 'helicopter'),
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
	('SUV_DZ', '0.59', 1, '0.05000', 'car'),
	('TentStorage', '0.59', 0, '0.05000', 'tent'),
	('TT650_Ins', '0.72', 2, '0.05000', 'motorcycle'),
	('TT650_TK_CIV_EP1', '0.72', 1, '0.05000', 'motorcycle'),
	('TT650_TK_EP1', '0.72', 1, '0.05000', 'motorcycle'),
	('UAZ_INS', '0.59', 2, '0.05000', 'car'),
	('UAZ_RU', '0.59', 1, '0.05000', 'car'),
	('UAZ_Unarmed_TK_CIV_EP1', '0.59', 3, '0.05000', 'car'),
	('UAZ_Unarmed_UN_EP1', '0.59', 1, '0.05000', 'car'),
	('UralCivil', '0.59', 1, '0.05000', 'truck'),
	('Mi17_DZ', '0.49', 1, '0.05000', 'helicopter'),
	('AN2_DZ', '1', 2, '0.05000', 'plane'),
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
	('LandRover_CZ_EP1', '0.59', 3, '0', 'car'),
	('HMMWV_DZ', '0.21', 2, '0', 'car'),
	('MH6J_DZ', '0.48', 1, '0.05000', 'helicopter'),
	('StashSmall', '0', 0, '0', 'StashSmall'),
	('StashMedium', '0', 0, '0', 'StashMedium'),
	('Pickup_PK_INS', '0.10', 1, '0.42500', 'car');
/*!40000 ALTER TABLE `object_classes` ENABLE KEYS */;

-- Dumping structure for table hivemind.object_data
CREATE TABLE IF NOT EXISTS `object_data` (
  `ObjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Instance` int(11) NOT NULL,
  `Classname` varchar(50) DEFAULT NULL,
  `Datestamp` datetime NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Inventory` longtext,
  `Hitpoints` longtext NOT NULL,
  `Fuel` double(13,5) NOT NULL DEFAULT '1.00000',
  `Damage` double(13,5) NOT NULL DEFAULT '0.00000',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ObjectID`),
  UNIQUE KEY `CheckUID` (`ObjectUID`,`Instance`),
  KEY `ObjectUID` (`ObjectUID`),
  KEY `Instance` (`Damage`,`Instance`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- Dumping data for table hivemind.object_data: ~53 rows (approximately)
DELETE FROM `object_data`;
/*!40000 ALTER TABLE `object_data` DISABLE KEYS */;
INSERT INTO `object_data` (`ObjectID`, `ObjectUID`, `Instance`, `Classname`, `Datestamp`, `CharacterID`, `Worldspace`, `Inventory`, `Hitpoints`, `Fuel`, `Damage`, `last_updated`) VALUES
	(1, 44000166, 1337, 'SUV_DZ', '2016-06-19 09:36:55', 0, '[339,[11243.3,5376.82,0]]', '[]', '[["karoserie",0.6695],["motor",0.7473],["palivo",0.6322],["wheel_1_1_steering",0.8382],["wheel_1_2_steering",0.7978],["wheel_2_1_steering",0.8745],["wheel_2_2_steering",0.9794]]', 0.54654, 0.54218, '2016-06-19 09:36:55'),
	(2, 17991566, 1337, 'UAZ_Unarmed_UN_EP1', '2016-06-19 09:36:55', 0, '[337,[9715.0352,6522.8286,0]]', '[]', '[["karoserie",0.8188],["motor",0.6938],["palivo",0.7410],["wheel_1_1_steering",0.6476],["wheel_1_2_steering",0.7918],["wheel_2_1_steering",0.6161],["wheel_2_2_steering",0.9051]]', 0.55513, 0.30835, '2016-06-19 09:36:55'),
	(3, 42194545, 1337, 'Volha_1_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[160,[11940.6,8868.87,0]]', '[]', '[["karoserie",0.6383],["motor",0.6811],["palivo",0.7482],["wheel_1_1_steering",0.7959],["wheel_1_2_steering",0.6899],["wheel_2_1_steering",0.8619],["wheel_2_2_steering",0.8400]]', 0.02823, 0.42584, '2016-06-19 09:36:55'),
	(4, 62258286, 1337, 'Pickup_PK_INS', '2016-06-19 09:36:55', 0, '[272,[6303.11,7833.36,0]]', '[]', '[["glass1",0.8918],["glass2",0.9623],["glass3",0.7363],["glass4",0.9944],["karoserie",0.9634],["motor",0.7170],["palivo",0.6398],["wheel_1_1_steering",0.6962],["wheel_1_2_steering",0.8421],["wheel_2_1_steering",0.7219],["wheel_2_2_steering",0.8834]]', 0.50265, 0.20943, '2016-06-19 09:36:55'),
	(5, 92904876, 1337, 'Old_bike_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[316,[7943.5068,6988.1763,0]]', '[]', '[]', 0.00000, 0.41640, '2016-06-19 09:36:55'),
	(6, 66249459, 1337, 'Volha_1_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[291,[8125.36,3167.17,0]]', '[]', '[["karoserie",0.7752],["motor",0.6630],["palivo",0.6522],["wheel_1_1_steering",0.7445],["wheel_1_2_steering",0.6092],["wheel_2_1_steering",0.6123],["wheel_2_2_steering",0.6341]]', 0.26753, 0.44949, '2016-06-19 09:36:55'),
	(7, 21854659, 1337, 'Tractor', '2016-06-19 09:36:55', 0, '[195,[9681.8213,8947.2354,0]]', '[]', '[["karoserie",0.7724],["motor",0.7520],["palivo",0.7016],["wheel_1_1_steering",0.7041],["wheel_1_2_steering",0.9110],["wheel_2_1_steering",0.6425],["wheel_2_2_steering",0.6795]]', 0.54075, 0.66964, '2016-06-19 09:36:55'),
	(8, 77281500, 1337, 'hilux1_civil_3_open', '2016-06-19 09:36:55', 0, '[353,[12869.565,4450.4077,0]]', '[]', '[["karoserie",0.7979],["motor",0.6462],["palivo",0.7344],["wheel_1_1_steering",0.8665],["wheel_1_2_steering",0.7262],["wheel_2_1_steering",0.8315],["wheel_2_2_steering",0.9792]]', 0.00304, 0.30473, '2016-06-19 09:36:55'),
	(9, 37384221, 1337, 'UAZ_Unarmed_TK_EP1', '2016-06-19 09:36:55', 0, '[58,[3702.54,10182.1,0]]', '[]', '[["karoserie",0.8118],["motor",0.7469],["palivo",0.6172],["wheel_1_1_steering",0.6905],["wheel_1_2_steering",0.9490],["wheel_2_1_steering",0.8737],["wheel_2_2_steering",0.9217]]', 0.77434, 0.45612, '2016-06-19 09:36:55'),
	(10, 88495643, 1337, 'SkodaBlue', '2016-06-19 09:36:55', 0, '[316,[7427.61,5155.17,0]]', '[]', '[["karoserie",0.8676],["motor",0.7459],["palivo",0.7279],["wheel_1_1_steering",0.6045],["wheel_1_2_steering",0.6546],["wheel_2_1_steering",0.8595],["wheel_2_2_steering",0.9339]]', 0.18180, 0.57914, '2016-06-19 09:36:55'),
	(11, 54367316, 1337, 'hilux1_civil_3_open', '2016-06-19 09:36:55', 0, '[223,[4817.6572, 2556.5034,0]]', '[]', '[["karoserie",0.6126],["motor",0.7358],["palivo",0.6603],["wheel_1_1_steering",0.7885],["wheel_1_2_steering",0.7804],["wheel_2_1_steering",0.9366],["wheel_2_2_steering",0.9420]]', 0.60033, 0.31204, '2016-06-19 09:36:55'),
	(12, 86656849, 1337, 'Volha_2_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[266,[9157.8408,11019.819,0]]', '[]', '[["karoserie",0.6846],["motor",0.7005],["palivo",0.7756],["wheel_1_1_steering",0.9532],["wheel_1_2_steering",0.9125],["wheel_2_1_steering",0.7030],["wheel_2_2_steering",0.9776]]', 0.75826, 0.74392, '2016-06-19 09:36:55'),
	(13, 68040965, 1337, 'Volha_2_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[116,[13343.8,12919,0]]', '[]', '[["karoserie",0.8119],["motor",0.7428],["palivo",0.7965],["wheel_1_1_steering",0.9082],["wheel_1_2_steering",0.9620],["wheel_2_1_steering",0.6855],["wheel_2_2_steering",0.7413]]', 0.09998, 0.53906, '2016-06-19 09:36:55'),
	(14, 60173247, 1337, 'S1203_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[344,[2045.3989,7267.4165,0]]', '[]', '[["karoserie",0.7742],["motor",0.7012],["palivo",0.6448],["wheel_1_1_steering",0.8408],["wheel_1_2_steering",0.7353],["wheel_2_1_steering",0.9540],["wheel_2_2_steering",0.7643]]', 0.31885, 0.65623, '2016-06-19 09:36:55'),
	(15, 93737861, 1337, 'AN2_2_DZ', '2016-06-19 09:36:55', 0, '[240,[4586.84,10684.6,0]]', '[]', '[]', 0.22082, 0.00000, '2016-06-19 09:36:55'),
	(16, 24019147, 1337, 'Ikarus', '2016-06-19 09:36:55', 0, '[59,[6705.8887, 2991.9358,0]]', '[]', '[["karoserie",0.6618],["motor",0.6612],["palivo",0.6135],["wheel_1_1_steering",0.7681],["wheel_1_2_steering",0.9592],["wheel_2_1_steering",0.6916],["wheel_2_2_steering",0.7806]]', 0.45626, 0.49819, '2016-06-19 09:36:55'),
	(17, 61462279, 1337, 'SkodaGreen', '2016-06-19 09:36:55', 0, '[106,[5265.94,5492.29,0]]', '[]', '[["karoserie",0.8891],["motor",0.7797],["palivo",0.6651],["wheel_1_1_steering",0.9728],["wheel_1_2_steering",0.8732],["wheel_2_1_steering",0.8476],["wheel_2_2_steering",0.6186]]', 0.30056, 0.64317, '2016-06-19 09:36:55'),
	(18, 65247868, 1337, 'Old_bike_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[73,[8350.0947, 2480.542,0]]', '[]', '[]', 0.00000, 0.20956, '2016-06-19 09:36:55'),
	(19, 20470688, 1337, 'UAZ_Unarmed_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[226,[1975.1283, 9150.0195,0]]', '[]', '[["karoserie",0.9855],["motor",0.6940],["palivo",0.6920],["wheel_1_1_steering",0.9561],["wheel_1_2_steering",0.6284],["wheel_2_1_steering",0.8736],["wheel_2_2_steering",0.6831]]', 0.78901, 0.38479, '2016-06-19 09:36:55'),
	(20, 98343911, 1337, 'Skoda', '2016-06-19 09:36:55', 0, '[228,[12355.3,10821.6,0]]', '[]', '[["karoserie",0.6658],["motor",0.7757],["palivo",0.7797],["wheel_1_1_steering",0.9434],["wheel_1_2_steering",0.8385],["wheel_2_1_steering",0.7623],["wheel_2_2_steering",0.6960]]', 0.78652, 0.31725, '2016-06-19 09:36:55'),
	(21, 59670535, 1337, 'UH1H_2_DZ', '2016-06-19 09:36:55', 0, '[60,[11279.154,4296.0205,0]]', '[]', '[["elektronika",0.8706],["mala vrtule",0.8908],["motor",0.7212],["velka vrtule",0.9402]]', 0.34673, 0.56924, '2016-06-19 09:36:55'),
	(22, 87143059, 1337, 'AH6X_DZ', '2016-06-19 09:36:55', 0, '[258,[7209.86,6984.74,0]]', '[]', '[["elektronika",0.6693],["glass1",0.7180],["glass2",0.9823],["glass3",0.9577],["glass4",0.8415],["glass5",0.7343],["glass6",0.9473],["mala vrtule",0.7338],["motor",0.6134],["munice",0.7328],["NEtrup",0.7835],["sklo predni L",0.7191],["sklo predni P",0.6453],["velka vrtule",0.8692]]', 0.02004, 0.26367, '2016-06-19 09:36:55'),
	(23, 33881839, 1337, 'BAF_Offroad_W', '2016-06-19 09:36:55', 0, '[183,[4752.58,2535.77,0]]', '[]', '[["glass1",0.6165],["glass2",0.7643],["glass3",0.9722],["glass4",0.7681],["karoserie",0.7238],["motor",0.6573],["palivo",0.7011],["sklo predni L",0.8668],["sklo predni P",0.9277],["wheel_1_1_steering",0.6383],["wheel_1_2_steering",0.6081],["wheel_1_3_steering",0.9259],["wheel_1_4_steering",0.6053],["wheel_2_1_steering",0.8487],["wheel_2_2_steering",0.6278],["wheel_2_3_steering",0.7928],["wheel_2_4_steering",0.6806]]', 0.44937, 0.32231, '2016-06-19 09:36:55'),
	(24, 36332087, 1337, 'HMMWV_DZ', '2016-06-19 09:36:55', 0, '[157,[12235.8,9729.92,0]]', '[]', '[["karoserie",0.7143],["motor",0.7104],["palivo",0.7804],["wheel_1_1_steering",0.9422],["wheel_1_2_steering",0.8282],["wheel_2_1_steering",0.7146],["wheel_2_2_steering",0.8885]]', 0.59725, 0.54136, '2016-06-19 09:36:55'),
	(25, 38616533, 1337, 'Volha_2_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[337,[8120.3057,9305.4912,0]]', '[]', '[["karoserie",0.9099],["motor",0.7841],["palivo",0.6559],["wheel_1_1_steering",0.8541],["wheel_1_2_steering",0.7351],["wheel_2_1_steering",0.9133],["wheel_2_2_steering",0.9614]]', 0.13390, 0.27574, '2016-06-19 09:36:55'),
	(26, 95120593, 1337, 'BAF_Offroad_W', '2016-06-19 09:36:55', 0, '[191,[4625.61,9675.62,0]]', '[]', '[["glass1",0.9716],["glass2",0.9233],["glass3",0.7017],["glass4",0.9387],["karoserie",0.7886],["motor",0.7633],["palivo",0.7338],["sklo predni L",0.9579],["sklo predni P",0.7870],["wheel_1_1_steering",0.8613],["wheel_1_2_steering",0.9456],["wheel_1_3_steering",0.7442],["wheel_1_4_steering",0.6840],["wheel_2_1_steering",0.9875],["wheel_2_2_steering",0.6855],["wheel_2_3_steering",0.6652],["wheel_2_4_steering",0.6694]]', 0.30326, 0.42463, '2016-06-19 09:36:55'),
	(27, 59315515, 1337, 'TT650_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[213,[9515.67,7222.07,0]]', '[]', '[["motor",0.6176]]', 0.63888, 0.63652, '2016-06-19 09:36:55'),
	(28, 12416241, 1337, 'Volha_1_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[19,[11066.828,7915.2275,0]]', '[]', '[["karoserie",0.7634],["motor",0.7924],["palivo",0.7171],["wheel_1_1_steering",0.6163],["wheel_1_2_steering",0.7790],["wheel_2_1_steering",0.6462],["wheel_2_2_steering",0.6943]]', 0.66527, 0.47039, '2016-06-19 09:36:55'),
	(29, 93394188, 1337, 'AH6X_DZ', '2016-06-19 09:36:55', 0, '[278,[11162.7,2509.88,0]]', '[]', '[["elektronika",0.7247],["glass1",0.9116],["glass2",0.9842],["glass3",0.7864],["glass4",0.7791],["glass5",0.9365],["glass6",0.9450],["mala vrtule",0.9159],["motor",0.6721],["munice",0.7738],["NEtrup",0.6364],["sklo predni L",0.6605],["sklo predni P",0.7932],["velka vrtule",0.9848]]', 0.28875, 0.75104, '2016-06-19 09:36:55'),
	(30, 81165643, 1337, 'car_hatchback', '2016-06-19 09:36:55', 0, '[363,[5337.62,8656.55,0]]', '[]', '[["karoserie",0.7704],["motor",0.7516],["palivo",0.7025],["wheel_1_1_steering",0.7158],["wheel_1_2_steering",0.9639],["wheel_2_1_steering",0.8721],["wheel_2_2_steering",0.8686]]', 0.25428, 0.54442, '2016-06-19 09:36:55'),
	(31, 36718357, 1337, 'Mi17_DZ', '2016-06-19 09:36:55', 0, '[75,[13614.3,3170.86,0]]', '[]', '[["elektronika",0.9628],["glass1",0.8579],["glass2",0.8012],["glass3",0.8323],["glass4",0.7580],["glass5",0.6929],["glass6",0.9909],["mala vrtule",0.6755],["motor",0.6025],["munice",0.7991],["NEtrup",0.7802],["sklo predni L",0.9036],["sklo predni P",0.7774],["velka vrtule",0.9762]]', 0.29820, 0.22502, '2016-06-19 09:36:55'),
	(32, 39366401, 1337, 'TT650_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[52,[8713.4893, 7103.0518,0]]', '[]', '[["motor",0.6721]]', 0.65937, 0.22353, '2016-06-19 09:36:55'),
	(33, 39413449, 1337, 'Old_bike_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[201,[8070.6958, 3358.7793,0]]', '[]', '[]', 0.00000, 0.61931, '2016-06-19 09:36:55'),
	(34, 40300972, 1337, 'UAZ_RU', '2016-06-19 09:36:55', 0, '[249,[11823.4,12691.1,0]]', '[]', '[["karoserie",0.7693],["motor",0.6214],["palivo",0.6532],["wheel_1_1_steering",0.6033],["wheel_1_2_steering",0.6973],["wheel_2_1_steering",0.6766],["wheel_2_2_steering",0.6914]]', 0.45400, 0.29118, '2016-06-19 09:36:55'),
	(35, 84773887, 1337, 'Old_bike_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[236,[1773.9318,2351.6221,0]]', '[]', '[]', 0.00000, 0.45073, '2016-06-19 09:36:55'),
	(36, 51608908, 1337, 'UralCivil', '2016-06-19 09:36:55', 0, '[338,[1890.9952,12417.333,0]]', '[]', '[["karoserie",0.9528],["motor",0.6046],["palivo",0.6939],["wheel_1_1_steering",0.7118],["wheel_1_2_steering",0.9955],["wheel_2_1_steering",0.6421],["wheel_2_2_steering",0.8239]]', 0.38653, 0.64185, '2016-06-19 09:36:55'),
	(37, 95835599, 1337, 'Old_bike_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[250,[11984.01,3835.9231,0]]', '[]', '[]', 0.00000, 0.49586, '2016-06-19 09:36:55'),
	(38, 80666935, 1337, 'TT650_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[372,[8762.8516, 11727.877,0]]', '[]', '[["motor",0.6334]]', 0.38460, 0.74117, '2016-06-19 09:36:55'),
	(39, 66853997, 1337, 'PBX', '2016-06-19 09:36:55', 0, '[315,[13222.181,10015.431,0]]', '[]', '[["motor",0.7912]]', 0.70796, 0.53402, '2016-06-19 09:36:55'),
	(40, 97584867, 1337, 'Smallboat_1', '2016-06-19 09:36:55', 0, '[268,[13098.13, 8250.8828,0]]', '[]', '[["motor",0.6959]]', 0.38387, 0.77574, '2016-06-19 09:36:55'),
	(41, 92161852, 1337, 'UralCivil', '2016-06-19 09:36:55', 0, '[178,[13276.482, 6098.4463,0]]', '[]', '[["karoserie",0.7958],["motor",0.7418],["palivo",0.6154],["wheel_1_1_steering",0.7035],["wheel_1_2_steering",0.6249],["wheel_2_1_steering",0.8141],["wheel_2_2_steering",0.7958]]', 0.67326, 0.64359, '2016-06-19 09:36:55'),
	(42, 67726354, 1337, 'ATV_US_EP1', '2016-06-19 09:36:55', 0, '[126,[6556.34,5621.66,0]]', '[]', '[["karoserie",0.8765],["motor",0.7065],["palivo",0.7179],["wheel_1_1_steering",0.7404],["wheel_1_2_steering",0.9942],["wheel_2_1_steering",0.9501],["wheel_2_2_steering",0.7678]]', 0.37761, 0.26071, '2016-06-19 09:36:55'),
	(43, 23129250, 1337, 'Old_bike_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[179,[3474.3989, 2562.4915,0]]', '[]', '[]', 0.00000, 0.71666, '2016-06-19 09:36:55'),
	(44, 51494875, 1337, 'Old_bike_TK_CIV_EP1', '2016-06-19 09:36:55', 0, '[50,[8040.6777, 7086.5356,0]]', '[]', '[]', 0.00000, 0.45426, '2016-06-19 09:36:55'),
	(45, 91178741, 1337, 'ATV_US_EP1', '2016-06-19 09:36:55', 0, '[300,[9047.57,4480.17,0]]', '[]', '[["karoserie",0.8423],["motor",0.6647],["palivo",0.7602],["wheel_1_1_steering",0.6143],["wheel_1_2_steering",0.9098],["wheel_2_1_steering",0.9063],["wheel_2_2_steering",0.8020]]', 0.18215, 0.57403, '2016-06-19 09:36:55'),
	(46, 36921802, 1337, 'Smallboat_1', '2016-06-19 09:36:55', 0, '[55,[13454.882, 13731.796,0]]', '[]', '[["motor",0.6388]]', 0.05844, 0.66979, '2016-06-19 09:36:55'),
	(47, 21701829, 1337, 'Tractor', '2016-06-19 09:36:55', 0, '[220,[3083.52,9202.18,0]]', '[]', '[["karoserie",0.8250],["motor",0.6846],["palivo",0.6858],["wheel_1_1_steering",0.9503],["wheel_1_2_steering",0.6364],["wheel_2_1_steering",0.9313],["wheel_2_2_steering",0.9474]]', 0.68622, 0.60985, '2016-06-19 09:36:55'),
	(48, 35170511, 1337, 'Ikarus', '2016-06-19 09:36:55', 0, '[279,[10628.433,8037.8188,0]]', '[]', '[["karoserie",0.9659],["motor",0.7469],["palivo",0.7861],["wheel_1_1_steering",0.7791],["wheel_1_2_steering",0.7789],["wheel_2_1_steering",0.9571],["wheel_2_2_steering",0.6491]]', 0.74829, 0.38502, '2016-06-19 09:36:55'),
	(49, 58633963, 1337, 'ATV_US_EP1', '2016-06-19 09:36:55', 0, '[253,[11459.299,11386.546,0]]', '[]', '[["karoserie",0.6085],["motor",0.6972],["palivo",0.6732],["wheel_1_1_steering",0.7488],["wheel_1_2_steering",0.9051],["wheel_2_1_steering",0.8789],["wheel_2_2_steering",0.6795]]', 0.72157, 0.74791, '2016-06-19 09:36:55'),
	(50, 30026746, 1337, 'ATV_US_EP1', '2016-06-19 09:36:55', 0, '[284,[8854.9082,2891.5762,0]]', '[]', '[["karoserie",0.7724],["motor",0.6975],["palivo",0.6291],["wheel_1_1_steering",0.7061],["wheel_1_2_steering",0.9557],["wheel_2_1_steering",0.8604],["wheel_2_2_steering",0.8351]]', 0.78825, 0.29791, '2016-06-19 09:36:55'),
	(51, 93523898, 1337, 'ATV_US_EP1', '2016-06-19 09:36:55', 0, '[166,[8316.43,7497.42,0]]', '[]', '[["karoserie",0.6899],["motor",0.6679],["palivo",0.6047],["wheel_1_1_steering",0.6402],["wheel_1_2_steering",0.7727],["wheel_2_1_steering",0.9428],["wheel_2_2_steering",0.9958]]', 0.30195, 0.75081, '2016-06-19 09:36:55'),
	(52, 58144503, 1337, 'ATV_US_EP1', '2016-06-19 09:36:55', 0, '[50,[3684.0366, 5999.0117,0]]', '[]', '[["karoserie",0.7205],["motor",0.7803],["palivo",0.7208],["wheel_1_1_steering",0.7267],["wheel_1_2_steering",0.9086],["wheel_2_1_steering",0.9628],["wheel_2_2_steering",0.6883]]', 0.30618, 0.35071, '2016-06-19 09:36:55'),
	(53, 80656716, 1337, 'TT650_Ins', '2016-06-19 09:36:55', 0, '[291,[11945.78,9099.3633,0]]', '[]', '[["motor",0.7204]]', 0.52464, 0.48343, '2016-06-19 09:36:55');
/*!40000 ALTER TABLE `object_data` ENABLE KEYS */;

-- Dumping structure for table hivemind.object_spawns
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

-- Dumping data for table hivemind.object_spawns: 94 rows
DELETE FROM `object_spawns`;
/*!40000 ALTER TABLE `object_spawns` DISABLE KEYS */;
INSERT INTO `object_spawns` (`ObjectUID`, `Classname`, `Worldspace`, `Inventory`, `Hitpoints`, `MapID`, `Last_changed`) VALUES
	(30728533, 'UAZ_Unarmed_TK_EP1', '[0,[12140.168, 12622.802,0]]', '[[[], []], [["20Rnd_762x51_DMR"], [5]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(26883451, 'UAZ_Unarmed_TK_CIV_EP1', '[0,[6279.4966, 7810.3691,0]]', '[[[], []], [["20Rnd_762x51_DMR"], [5]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(42231659, 'UAZ_Unarmed_UN_EP1', '[45,[6865.2432,2481.6943,0]]', '[[[], []], [["30Rnd_556x45_StanagSD"], [5]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(30507947, 'UAZ_RU', '[157,[3693.0386, 5969.1489,0]]', '[[[], []], [["HandGrenade_west"], [2]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(25844760, 'UAZ_Unarmed_TK_CIV_EP1', '[20,[13264.081,12167.432,0]]', '[[[], []], [["20Rnd_762x51_DMR"], [5]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(37699964, 'UAZ_Unarmed_TK_CIV_EP1', '[223,[4817.6572, 2556.5034,0]]', '[[[], []], [["20Rnd_762x51_DMR"], [5]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(10965544, 'UAZ_Unarmed_TK_EP1', '[337,[8120.3057,9305.4912,0]]', '[[[], []], [["20Rnd_762x51_DMR"], [5]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(41727833, 'ATV_US_EP1', '[337,[3312.2793,11270.755,0]]', '[[[], []], [["ItemTent", "Item5Matchbox"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(75742533, 'ATV_US_EP1', '[50,[3684.0366, 5999.0117,0]]', '[[[], []], [["ItemTent", "Item5Matchbox"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(53529173, 'ATV_CZ_EP1', '[202,[11464.035, 11381.071,0]]', '[[[], []], [["Skin_Camo1_DZ", "ItemCompass"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(40418266, 'ATV_US_EP1', '[253,[11459.299,11386.546,0]]', '[[[], []], [["ItemTent", "Item5Matchbox"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(41503818, 'ATV_CZ_EP1', '[335,[8856.8359,2893.7903,0]]', '[[[], []], [["Skin_Camo1_DZ", "ItemCompass"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(86264294, 'SkodaBlue', '[353,[12869.565,4450.4077,0]]', '[[[], []], [["ItemWatch", "ItemKnife"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(6810018, 'Skoda', '[223,[6288.416, 7834.3521,0]]', '[[["Binocular"], [1]], [[], []], [["CZ_VestPouch_EP1"], [1]]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(75257214, 'SkodaGreen', '[306,[8125.7075,3166.3708,0]]', '[[[], []], [["Item5Matchbox", "ItemMap"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(55856021, 'ATV_US_EP1', '[284,[8854.9082,2891.5762,0]]', '[[[], []], [["ItemTent", "Item5Matchbox"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(53508464, 'TT650_Ins', '[291,[11945.78,9099.3633,0]]', '[[[], []], [["ItemJerrycan"], [1]], [[], []]]', '[["motor",1]]', '', NULL),
	(99974261, 'TT650_TK_EP1', '[151,[6592.686,2906.8245,0]]', '[[[], []], [["PartGeneric"], [1]], [[], []]]', '[["motor",1]]', '', NULL),
	(39345918, 'TT650_TK_CIV_EP1', '[372,[8762.8516, 11727.877,0]]', '[[[], []], [["PartWheel"], [1]], [[], []]]', '[["motor",1]]', '', NULL),
	(96806808, 'TT650_TK_CIV_EP1', '[52,[8713.4893, 7103.0518,0]]', '[[[], []], [["PartWheel"], [1]], [[], []]]', '[["motor",1]]', '', NULL),
	(65996290, 'Old_bike_TK_CIV_EP1', '[50,[8040.6777, 7086.5356,0]]', '[]', '[]', '', NULL),
	(39561031, 'Old_bike_TK_CIV_EP1', '[316,[7943.5068,6988.1763,0]]', '[]', '[]', '', NULL),
	(99816288, 'Old_bike_TK_INS_EP1', '[201,[8070.6958, 3358.7793,0]]', '[]', '[]', '', NULL),
	(80398351, 'Old_bike_TK_INS_EP1', '[179,[3474.3989, 2562.4915,0]]', '[]', '[]', '', NULL),
	(2542893, 'Old_bike_TK_INS_EP1', '[236,[1773.9318,2351.6221,0]]', '[]', '[]', '', NULL),
	(71519415, 'Old_bike_TK_CIV_EP1', '[236,[3699.9189,2474.2119,0]]', '[]', '[]', '', NULL),
	(49968400, 'Old_bike_TK_CIV_EP1', '[73,[8350.0947, 2480.542,0]]', '[]', '[]', '', NULL),
	(35283758, 'Old_bike_TK_INS_EP1', '[35,[8345.7227, 2482.6855,0]]', '[]', '[]', '', NULL),
	(26513596, 'Old_bike_TK_CIV_EP1', '[23,[3203.0916, 3988.6379,0]]', '[]', '[]', '', NULL),
	(26716708, 'Old_bike_TK_INS_EP1', '[191,[2782.7134,5285.5342,0]]', '[]', '[]', '', NULL),
	(54042757, 'Old_bike_TK_INS_EP1', '[155,[8680.75,2445.5315,0]]', '[]', '[]', '', NULL),
	(90063662, 'Old_bike_TK_CIV_EP1', '[155,[12158.999,3468.7563,0]]', '[]', '[]', '', NULL),
	(88190045, 'Old_bike_TK_INS_EP1', '[250,[11984.01,3835.9231,0]]', '[]', '[]', '', NULL),
	(70759242, 'Old_bike_TK_CIV_EP1', '[255,[10153.068,2219.3547,0]]', '[]', '[]', '', NULL),
	(89226080, 'UH1H_2_DZ', '[60,[11279.154,4296.0205,0]]', '[[[], []], [["ItemSodaMtngreen","ItemSodaMtngreenEmpty"], [1, 2]], [[], []]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(33852678, 'UH1H_DZ', '[133,[4211.8789,10735.168,0]]', '[[[], []], [["ItemSodaPeppsy"], [5]], [[], []]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(1585150, 'UH1H_DZ', '[52,[6874.0503,11432.864,0]]', '[[[], []], [["ItemSodaPeppsy"], [5]], [[], []]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(6367723, 'UH1H_DZ', '[58,[10571.7,2220.3101,0.0015564]]', '[[[], []], [["ItemSodaPeppsy"], [5]], [[], []]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(27083167, 'UH1H_DZ', '[359,[6377.8799,2757.8899,-0.048767101]]', '[[[], []], [["ItemSodaPeppsy"], [5]], [[], []]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(16312671, 'hilux1_civil_3_open', '[344,[2045.3989,7267.4165,0]]', '[[[], []], [["PartFueltank", "PartWheel"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(313856, 'hilux1_civil_3_open', '[133,[8310.9902, 3348.3579,0]]', '[[[], []], [["PartFueltank", "PartWheel"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(52631272, 'hilux1_civil_3_open', '[124,[11309.963, 6646.3989,0]]', '[[[], []], [["PartFueltank", "PartWheel"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(62214795, 'hilux1_civil_3_open', '[6,[11240.744, 5370.6128,0]]', '[[[], []], [["PartFueltank", "PartWheel"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(53180164, 'Ikarus_TK_CIV_EP1', '[230,[3762.5764,8736.1709,0]]', '[[[], []], [["ItemWatch", "ItemSodaPeppsy"], [1, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(79256439, 'Ikarus', '[279,[10628.433,8037.8188,0]]', '[[[], []], [["PartWheel", "ItemSodaPeppsy"], [1, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(36741707, 'Ikarus', '[245,[4580.3203,4515.9282,0]]', '[[[], []], [["PartWheel", "ItemSodaPeppsy"], [1, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(45939219, 'Ikarus_TK_CIV_EP1', '[333,[6040.0923,7806.5439,0]]', '[[[], []], [["ItemWatch", "ItemSodaPeppsy"], [1, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(19470979, 'Ikarus', '[76,[10314.745, 2147.5374,0]]', '[[[], []], [["PartWheel", "ItemSodaPeppsy"], [1, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(59537240, 'Ikarus_TK_CIV_EP1', '[59,[6705.8887, 2991.9358,0]]', '[[[], []], [["ItemWatch", "ItemSodaPeppsy"], [1, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(39273268, 'Tractor', '[195,[9681.8213,8947.2354,0]]', '[[[], []], [["ItemWire", "ItemJerrycan"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(17754622, 'Tractor', '[262,[3825.1318,8941.4873,0]]', '[[[], []], [["ItemWire", "ItemJerrycan"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(70953310, 'Tractor', '[19,[11246.52, 7534.7954,0]]', '[[[], []], [["ItemWire", "ItemJerrycan"], [1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(1502689, 'S1203_TK_CIV_EP1', '[19,[11066.828,7915.2275,0]]', '[[["Makarov"], [1]], [["FoodCanBakedBeans"], [3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(94653519, 'S1203_TK_CIV_EP1', '[352,[12058.555,3577.8667,0]]', '[[["Makarov"], [1]], [["FoodCanBakedBeans"], [3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(68759530, 'S1203_TK_CIV_EP1', '[218,[11940.854, 8872.8389,0]]', '[[["Makarov"], [1]], [["FoodCanBakedBeans"], [3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(59837095, 'S1203_TK_CIV_EP1', '[346,[13386.471,6604.0098,0]]', '[[["Makarov"], [1]], [["FoodCanBakedBeans"], [3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(92906892, 'V3S_Civ', '[178,[13276.482, 6098.4463,0]]', '[[["MR43"], [1]], [["PartEngine"], [1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(85023176, 'UralCivil', '[338,[1890.9952,12417.333,0]]', '[[[], []], [["PartWheel", "ItemToolbox", "ItemTankTrap"], [1, 1, 1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(46395206, 'car_hatchback', '[226,[1975.1283, 9150.0195,0]]', '[[["LeeEnfield"], [1]], [["5x_22_LR_17_HMR"], [3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(76906508, 'car_hatchback', '[315,[7429.4849,5157.8682,0]]', '[[["LeeEnfield"], [1]], [["5x_22_LR_17_HMR"], [3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(45346927, 'Fishing_Boat', '[315,[8317.2676,2348.6055,0]]', '[]', '[["motor",1]]', '', NULL),
	(96015113, 'Fishing_Boat', '[315,[13222.181,10015.431,0]]', '[]', '[["motor",1]]', '', NULL),
	(44034787, 'PBX', '[55,[13454.882, 13731.796,0]]', '[[[], []], [["ItemFlashlightRed"], [1]], [["DZ_Backpack_EP1"], [1]]]', '[["motor",1]]', '', NULL),
	(32128600, 'Smallboat_1', '[245,[14417.589,12886.104,0]]', '[]', '[["motor",1]]', '', NULL),
	(28538641, 'Smallboat_1', '[268,[13098.13, 8250.8828,0]]', '[]', '[["motor",1]]', '', NULL),
	(46307410, 'Volha_2_TK_CIV_EP1', '[205,[9731.1514,8937.7998,0]]', '[[[], []], [["ItemSodaPeppsy", "FoodCanFrankBeans"], [3, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(45921132, 'Volha_1_TK_CIV_EP1', '[337,[9715.0352,6522.8286,0]]', '[[[], []], [["ItemSodaPeppsy", "FoodCanBakedBeans"], [3, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(90683431, 'Volha_1_TK_CIV_EP1', '[241,[2614.0862,5079.6357,0]]', '[[[], []], [["ItemSodaPeppsy", "FoodCanBakedBeans"], [3, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(15653764, 'Volha_2_TK_CIV_EP1', '[18,[10827.634, 2701.5688,0]]', '[[[], []], [["ItemSodaPeppsy", "FoodCanFrankBeans"], [3, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(6218531, 'Volha_1_TK_CIV_EP1', '[222,[5165.7231,2375.7642,0]]', '[[[], []], [["ItemSodaPeppsy", "FoodCanBakedBeans"], [3, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(84131366, 'Volha_2_TK_CIV_EP1', '[207,[1740.8503,3622.6938,0]]', '[[[], []], [["ItemSodaPeppsy", "FoodCanFrankBeans"], [3, 3]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(2001240, 'SUV_DZ', '[266,[9157.8408, 11019.819,0]]', '[[[], []], [["Pipebomb"], [1]], [[], []]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(57612106, 'car_sedan', '[222,[12360.468, 10817.882,0]]', '[[[], []], [["ItemFlashlight", "ItemMap"], [1, 1]], [["DZ_ALICE_Pack_EP1"], [1]]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(82056815, 'UH1H_DZ', '[310,[6365.7402,7795.3501,-0.048767101]]', '[[[], []], [["ItemSodaPeppsy"], [5]], [[], []]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(37447759, 'UH1H_DZ', '[14,[13308.511,3227.0215,0]]', '[[[], []], [["ItemSodaPeppsy"], [5]], [[], []]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(41068355, 'UH1H_DZ', '[265,[7695.0356,3991.2056,0]]', '[[[], []], [["ItemSodaPeppsy"], [5]], [[], []]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(92998502, 'UH1H_DZ', '[22,[12009.904,12636.732,0]]', '[[[], []], [["ItemSodaPeppsy"], [5]], [[], []]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(41787450, 'AH6X_DZ', '[2,[12010.7,12637.2,0]]', '[[["Binocular"],[1]],[["TrashJackDaniels","FoodCanFrankBeans"],[1,1]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["glass4",1],["glass5",1],["NEtrup",1.1998],["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1],["munice",1.07084],["sklo predni P",1.04818],["sklo predni L",1.11816],["glass6",1.0402]]', '', NULL),
	(29941745, 'AH6X_DZ', '[113,[6880.2007,11454.291,0]]', '[[["Binocular"],[1]],[["TrashJackDaniels","FoodCanFrankBeans"],[1,1]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["glass4",1],["glass5",1],["NEtrup",1.1998],["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1],["munice",1.07084],["sklo predni P",1.04818],["sklo predni L",1.11816],["glass6",1.0402]]', '', NULL),
	(24346379, 'Mi17_DZ', '[156,[7660.271,3982.0063,0]]', '[[[],[]],[["ItemSodaMtngreen"],[2]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["glass4",1],["glass5",1],["NEtrup",1.1998],["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1],["munice",1.07084],["sklo predni P",1.04818],["sklo predni L",1.11816],["glass6",1.0402]]', '', NULL),
	(31906663, 'Mi17_DZ', '[-188,[7220.6538,9116.3428,0]]', '[[[],[]],[["ItemSodaMtngreen"],[2]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["glass4",1],["glass5",1],["NEtrup",1.1998],["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1],["munice",1.07084],["sklo predni P",1.04818],["sklo predni L",1.11816],["glass6",1.0402]]', '', NULL),
	(86494184, 'Mi17_DZ', '[4,[13584.044,3199.9648,0]]', '[[[],[]],[["ItemSodaMtngreen"],[2]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["glass4",1],["glass5",1],["NEtrup",1.1998],["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1],["munice",1.07084],["sklo predni P",1.04818],["sklo predni L",1.11816],["glass6",1.0402]]', '', NULL),
	(36750931, 'AN2_DZ', '[252,[4530.52,10785.1,0]]', '[]', '[]', '', NULL),
	(24272110, 'BAF_Offroad_D', '[162,[3702.04,6044.3101,0]]', '[[[],[]],[["HandGrenade_West","SmokeShell","SmokeShellRed","SmokeShellYellow","SmokeShellGreen","ItemWaterbottle","30Rnd_556x45_Stanag","20Rnd_762x51_DMR","ItemTent"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '', NULL),
	(11107760, 'BAF_Offroad_D', '[141,[11953.279,9107.3896,0]]', '[[[],[]],[["HandGrenade_West","SmokeShell","SmokeShellRed","SmokeShellYellow","SmokeShellGreen","ItemWaterbottle","30Rnd_556x45_Stanag","20Rnd_762x51_DMR","ItemTent"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '', NULL),
	(82722474, 'BAF_Offroad_W', '[71,[3708.5,5999.4199,0]]', '[[[],[]],[["HandGrenade_West","SmokeShell","SmokeShellRed","SmokeShellYellow","SmokeShellGreen","ItemWaterbottle","30Rnd_556x45_Stanag","20Rnd_762x51_DMR","ItemTent"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '', NULL),
	(80289092, 'BAF_Offroad_W', '[322,[7201.5181,3034.3232,0]]', '[[[],[]],[["HandGrenade_West","SmokeShell","SmokeShellRed","SmokeShellYellow","SmokeShellGreen","ItemWaterbottle","30Rnd_556x45_Stanag","20Rnd_762x51_DMR","ItemTent"],[10,1,1,1,1,1,20,10,1]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["sklo predni P",1],["sklo predni L",1],["karoserie",1],["wheel_1_4_steering",1],["wheel_2_4_steering",1],["wheel_1_3_steering",1],["wheel_2_3_steering",1],["glass4",1]]', '', NULL),
	(53278043, 'MH6J_DZ', '[122,[10137.868,12049.376,-6.1035156e-005]]', '[[[],[]],[["1Rnd_Smoke_M203", "7Rnd_45ACP_1911", "30Rnd_556x45_StanagSD", "200Rnd_556x45_M249", "FoodCanPasta", "15Rnd_W1866_Slug", "5x_22_LR_17_HMR", "15Rnd_9x19_M9SD", "17Rnd_9x19_glock17", "100Rnd_762x51_M240", "6Rnd_45ACP", "8Rnd_9x18_Makarov"],[2,1,1,1,1,1,1,1,1,1,1,1]],[["DZ_Backpack_EP1"],[1]]]', '[["motor",1],["elektronika",1],["mala vrtule",1],["velka vrtule",1]]', '', NULL),
	(25522943, 'HMMWV_DZ', '[0,[13441.056,12003.912,4.5776367e-005]]', '[[["AK_47_M"],[1]],[["PartWoodPile", "ItemBandage", "HandGrenade_west", "6Rnd_45ACP", "ItemEpinephrine", "8Rnd_B_Beneli_74Slug", "HandChemBlue", "8Rnd_B_Beneli_Pellets", "PartEngine", "17Rnd_9x19_glock17", "ItemTent"],[1,2,1,1,1,1,1,1,1,1,1]],[["DZ_CivilBackpack_EP1"],[1]]]', '[["palivo",1],["motor",1],["karoserie",1],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1]]', '', NULL),
	(32124125, 'AN2_DZ', '[32,[12492,12515,0]]', '[]', '[]', '', NULL),
	(12466104, 'Pickup_PK_INS', '[12,[4662.13,10436,-3]]', '[[[],[]],[["HandGrenade_West","ItemWaterbottle","30Rnd_556x45_Stanag"],[5,1,6]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["karoserie",1],["glass4",1]]', '', NULL),
	(12700771, 'Pickup_PK_INS', '[-24,[7006.14,7717.57,-6]]', '[[[],[]],[["HandGrenade_West","ItemWaterbottle","30Rnd_556x45_Stanag"],[5,1,6]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["karoserie",1],["glass4",1]]', '', NULL),
	(36533865, 'Offroad_DSHKM_INS', '[363,[5337.62,8656.55,0]]', '[[[],[]],[[],[]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["karoserie",1],["glass4",1]]', '', NULL),
	(16462967, 'Offroad_DSHKM_INS', '[-169,[4625.61,9675.62,0]]', '[[[],[]],[[],[]],[[],[]]]', '[["glass1",1],["glass2",1],["glass3",1],["motor",0.8],["palivo",0.8],["wheel_1_1_steering",1],["wheel_1_2_steering",1],["wheel_2_1_steering",1],["wheel_2_2_steering",1],["karoserie",1],["glass4",1]]', '', NULL);
/*!40000 ALTER TABLE `object_spawns` ENABLE KEYS */;

-- Dumping structure for procedure hivemind.pCleanup
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pCleanup`()
BEGIN 
#Last ran
	update event_scheduler set LastRun = NOW() where System = "pCleanup";

#starts outofbounds cleanup
        CALL pCleanupOOB();
 
#remove damaged objects
        DELETE
                FROM object_data
                WHERE CharacterID != 0 AND Damage = 1;

#remove damaged vehicles older than vehicle_spawns.CleanupTime
	DELETE FROM object_data
	WHERE CharacterID = 0
		AND Damage = 1
		AND SYSDATE() > DATE(last_updated) + INTERVAL (
			SELECT CleanupTime
			FROM vehicle_spawns
			WHERE vehicle_spawns.Classname = object_data.Classname
			LIMIT 1) MINUTE;

#remove empty tents older than seven days
        DELETE
                FROM object_data
                WHERE (Classname like 'TentStorage%' or Classname like 'StashSmall%' or Classname like 'StashMedium%' or Classname like 'DomeTentStorage%')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
                        AND Inventory = '[[[],[]],[[],[]],[[],[]]]';
       
        DELETE
                FROM object_data
                WHERE (Classname like 'TentStorage%' or Classname like 'StashSmall%' or Classname like 'StashMedium%' or Classname like 'DomeTentStorage%')
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
 
#remove Traps older than five days
        DELETE
                FROM object_data
                WHERE (Classname = 'BearTrap_DZ' or Classname = 'TrapBearTrapFlare' or Classname = 'TrapBearTrapSmoke' or Classname = 'Trap_Cans' or Classname = 'TrapTripwireFlare' or Classname = 'TrapTripwireGrenade' or Classname = 'TrapTripwireSmoke')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 5 DAY; 
                        
#remove incomplete fences after 1 Day								
        DELETE
                FROM object_data
                WHERE (Classname = 'WoodenFence_1_foundation')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 1 Day;  
                        
#remove incomplete fences after 3 Dayz								
        DELETE
                FROM object_data
                WHERE (Classname = 'WoodenFence_1_frame' or Classname = 'WoodenFence_quaterpanel' or Classname = 'WoodenFence_halfpanel' or Classname = 'WoodenFence_thirdpanel')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 3 Day; 
                       
#remove dead players from data table
        DELETE
                FROM character_data
                WHERE Alive=0 AND DATE(last_updated) < CURDATE() - INTERVAL 90 Day; 
#Remove Bad Data
				DELETE
								FROM object_data
								WHERE Classname like '%_base';
			
#Remove wire if the owner has died.						
		DELETE
			FROM Object_DATA
			USING Object_DATA, Character_DATA
				WHERE Object_DATA.Classname = 'Wire_cat1'
					AND Object_DATA.CharacterID = Character_DATA.CharacterID
					AND Character_DATA.Alive = 0;
					
#remove Base_Fire_DZ older than 5 days
        DELETE
            FROM object_data
				WHERE Classname = 'Base_Fire_DZ'
					AND DATE(last_updated) < CURDATE() - INTERVAL 5 DAY;
END//
DELIMITER ;

-- Dumping structure for procedure hivemind.pCleanupBase
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pCleanupBase`()
BEGIN
#Last ran
	update event_scheduler set LastRun = NOW() where System = "pCleanupBase";
	
#Start Maintenance Mode       
	Update
		object_data 
			set Hitpoints = '["Maintenance"]'                    
				WHERE (Classname = 'WoodenFence_1' or Classname = 'WoodenFence_2' or Classname = 'WoodenFence_3' or Classname = 'WoodenFence_4' or Classname = 'WoodenFence_5' or Classname = 'WoodenFence_6' or Classname = 'WoodenFence_7')
				AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
 				AND Hitpoints = '[]';
 				
#Check WoodenFence_1_foundation
	update
		object_data
			set Classname = 'WoodenFence_1_foundation'
				where Classname = 'WoodenFence_1_frame'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;

#Check WoodenFence_1_frame
	update
		object_data
			set Classname = 'WoodenFence_1_frame'
				where Classname = 'WoodenFence_quaterpanel'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;

#Check WoodenFence_halfpanel
	update
		object_data
			set Classname = 'WoodenFence_quaterpanel'
				where Classname = 'WoodenFence_halfpanel'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
#Check WoodenFence_thirdpanel
	update
		object_data
			set Classname = 'WoodenFence_halfpanel'
				where Classname = 'WoodenFence_thirdpanel'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				 
#Check fence 1
	update
		object_data
			set Classname = 'WoodenFence_thirdpanel'
				where Classname = 'WoodenFence_1'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
#Check fence 2
	update
		object_data
			set Classname = 'WoodenFence_1'
				where Classname = 'WoodenFence_2'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;	
#Check fence 3
	update
		object_data
			set Classname = 'WoodenFence_2'
				where Classname = 'WoodenFence_3'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					
#Check fence 4
	update
		object_data
			set Classname = 'WoodenFence_3'
				where Classname = 'WoodenFence_4'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					
#Check fence 5
	update
		object_data
			set Classname = 'WoodenFence_4'
				where Classname = 'WoodenFence_5'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					
#Check fence 6
	update
		object_data
			set Classname = 'WoodenFence_5'
				where Classname = 'WoodenFence_6'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					
#Check fence 7
	update
		object_data
			set Classname = 'WoodenFence_6'
				where Classname = 'WoodenFence_7'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;	
				
#DayZ_WoodenGates = ["WoodenGate_1","WoodenGate_2","WoodenGate_3","WoodenGate_4"];
#Start Maintenance Mode Gates				
	Update
		object_data 
			set Hitpoints = '["Maintenance"]'                    
				WHERE (Classname = 'WoodenGate_1' or Classname = 'WoodenGate_1' or Classname = 'WoodenGate_1' or Classname = 'WoodenGate_1')
				AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
 				AND Hitpoints = '[]';
				
#Check WoodenGate_1
	update
		object_data
			set Classname = 'WoodenGate_1'
				where Classname = 'WoodenGate_foundation'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
#Check WoodenGate_2
	update
		object_data
			set Classname = 'WoodenGate_1'
				where Classname = 'WoodenGate_2'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
#Check WoodenGate_3
	update
		object_data
			set Classname = 'WoodenGate_2'
				where Classname = 'WoodenGate_3'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
#Check WoodenGate_4
	update
		object_data
			set Classname = 'WoodenGate_3'
				where Classname = 'WoodenGate_4'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				
END//
DELIMITER ;

-- Dumping structure for procedure hivemind.pCleanupOOB
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pCleanupOOB`()
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

END//
DELIMITER ;

-- Dumping structure for table hivemind.player_data
CREATE TABLE IF NOT EXISTS `player_data` (
  `playerID` int(11) NOT NULL DEFAULT '0',
  `playerUID` varchar(45) NOT NULL DEFAULT '0',
  `playerName` varchar(50) NOT NULL DEFAULT 'Null',
  `playerMorality` int(11) NOT NULL DEFAULT '0',
  `playerSex` int(11) NOT NULL DEFAULT '0',
  KEY `playerID` (`playerID`),
  KEY `playerUID` (`playerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hivemind.player_data: ~0 rows (approximately)
DELETE FROM `player_data`;
/*!40000 ALTER TABLE `player_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_data` ENABLE KEYS */;

-- Dumping structure for table hivemind.player_login
CREATE TABLE IF NOT EXISTS `player_login` (
  `LoginID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(45) NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `datestamp` datetime NOT NULL,
  `Action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hivemind.player_login: ~0 rows (approximately)
DELETE FROM `player_login`;
/*!40000 ALTER TABLE `player_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_login` ENABLE KEYS */;

-- Dumping structure for procedure hivemind.pMain
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pMain`(IN `i` INT)
    MODIFIES SQL DATA
BEGIN
# Server instance ID.
#-----------------------------------------------
	DECLARE sInstance VARCHAR(8) DEFAULT i;
#-----------------------------------------------
#Last Ran
	update event_scheduler set LastRun = NOW() where System = "pMain";
#Starts Cleanup
	CALL pCleanupBase(); #comment out to disable base decay
	CALL pCleanup();

	CALL pSpawnVehicles(sInstance);
END//
DELIMITER ;

-- Dumping structure for procedure hivemind.pSpawnVehicles
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pSpawnVehicles`(IN `i` int)
BEGIN
	#---------------------------------------------------------------
	#Change this to affect the maximum number of vehicles on the server.
	DECLARE MaxVehicles INT DEFAULT 80;
	
	#Change this to affect the radius that is checked for existing vehicles when spawning.
	#If set to 0 or negative vehicles will always spawn despite blocking vehicles.
	DECLARE SearchRadius DOUBLE DEFAULT 10;
	#---------------------------------------------------------------
	
	DECLARE ServerInstance INT DEFAULT i;
	DECLARE MaxNumSpawn INT DEFAULT MaxVehicles - countVehicles(ServerInstance);
	
	DROP TEMPORARY TABLE IF EXISTS temp_objects;
	CREATE TEMPORARY TABLE temp_objects AS
	(
		SELECT	CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 2), LENGTH(SUBSTRING_INDEX(@ws, ",", 1)) + 2), DECIMAL(10, 5)) AS X,
				CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 3), LENGTH(SUBSTRING_INDEX(@ws, ",", 2)) + 2), DECIMAL(10, 5)) AS Y
		FROM object_data
		WHERE CharacterID = 0
			AND Instance = ServerInstance
			AND (@ws := Worldspace) IS NOT NULL
			AND (@ws := REPLACE(@ws, "[", "")) IS NOT NULL
			AND (@ws := REPLACE(@ws, "]", "")) IS NOT NULL
	);
	
	DROP TEMPORARY TABLE IF EXISTS temp_locations;
	CREATE TEMPORARY TABLE temp_locations AS
	(
		SELECT vehicle_locations.ID, temp2.Worldspace
		FROM
		(
			SELECT Worldspace
			FROM
			(
				SELECT	Worldspace,
						CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 2), LENGTH(SUBSTRING_INDEX(@ws, ",", 1)) + 2), DECIMAL(10, 5)) AS X,
						CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 3), LENGTH(SUBSTRING_INDEX(@ws, ",", 2)) + 2), DECIMAL(10, 5)) AS Y
				FROM (SELECT Worldspace FROM vehicle_locations GROUP BY Worldspace) AS temp
				WHERE (@ws := Worldspace) IS NOT NULL
					AND (@ws := REPLACE(@ws, "[", "")) IS NOT NULL
					AND (@ws := REPLACE(@ws, "]", "")) IS NOT NULL
			) AS temp1
			WHERE
			(
				@distance :=
				(
					SELECT MIN(SQRT((temp_objects.X - temp1.X) * (temp_objects.X - temp1.X) + (temp_objects.Y - temp1.Y) * (temp_objects.Y - temp1.Y)))
					FROM temp_objects
				)
			) IS NULL OR @distance > SearchRadius
		) AS temp2
		JOIN vehicle_locations
			ON vehicle_locations.Worldspace = temp2.Worldspace
	);
	
	DROP TEMPORARY TABLE IF EXISTS temp_spawns;
	CREATE TEMPORARY TABLE temp_spawns AS
	(
		SELECT temp.ID, Classname, Worldspace, Chance, MinFuel, MaxFuel, MinDamage, MaxDamage
		FROM
		(
			SELECT *
			FROM vehicle_spawns
			WHERE (@numSpawnable := getNumSpawnable(ServerInstance, ID)) IS NOT NULL
				AND @numSpawnable > 0
			ORDER BY RAND()
		) AS temp
		JOIN temp_locations
			ON temp_locations.ID = temp.Location
		ORDER BY RAND()
	);
	
	SET @numSpawned = 0;
	WHILE (@numSpawned < MaxNumSpawn AND (SELECT COUNT(*) FROM temp_spawns) > 0) DO
		SET @spawnid = (SELECT ID FROM temp_spawns LIMIT 1);
		SET @chance = (SELECT Chance FROM temp_spawns LIMIT 1);
		SET @numSpawnable = getNumSpawnable(ServerInstance, @spawnid);
		IF (@numSpawnable > 0 AND RAND() < @chance) THEN
			SET @worldspace = (SELECT Worldspace FROM temp_spawns LIMIT 1);
			INSERT INTO object_data (ObjectUID, Classname, Instance, CharacterID, Worldspace, Inventory, Hitpoints, Fuel, Damage, Datestamp)
			SELECT generateUID(ServerInstance), Classname, ServerInstance, 0, Worldspace,
				randomizeVehicleInventory(Classname),
				randomizeVehicleHitpoints(Classname),
				MinFuel + RAND() * (MaxFuel - MinFuel),
				MinDamage + RAND() * (MaxDamage - MinDamage),
				SYSDATE()
			FROM temp_spawns
			LIMIT 1;
			
			DELETE FROM temp_spawns WHERE Worldspace = @worldspace;
			
			SET @numSpawned = @numSpawned + 1;
		END IF;
		
		SET @numSpawnable = @numSpawnable - 1;
		
		IF (@numSpawnable < 1) THEN
			DELETE FROM temp_spawns WHERE ID = @spawnid;
		END IF;
	END WHILE;
	
	SELECT CONCAT(@numSpawned, " vehicles spawned.");
END//
DELIMITER ;

-- Dumping structure for function hivemind.randomizeVehicleHitpoints
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `randomizeVehicleHitpoints`(`class` varchar(255)) RETURNS varchar(2000) CHARSET latin1
    READS SQL DATA
BEGIN
	#---------------------------------------------------------------
	#Random number r is generated in the range ]0, 1[.
	#If r + MinDamage is less than Threshold, damage to part is set to MinDamage.
	DECLARE Threshold DOUBLE DEFAULT 0.5;
	#---------------------------------------------------------------
	
	DECLARE Result varchar(2000);
	DECLARE Hitpoints_ID INT DEFAULT (SELECT Hitpoints FROM vehicle_spawns WHERE Classname = class LIMIT 1);
	
	IF (ISNULL(Hitpoints_ID)) THEN
		RETURN "[]";
	END IF;
	
	SELECT GROUP_CONCAT("[\"", PartName, "\",", TRUNCATE(IF ((@r := MinDamage + RAND() * (MaxDamage - MinDamage)) < Threshold, MinDamage, @r), 4), "]")
		INTO Result
		FROM vehicle_hitpoints
		WHERE ID = Hitpoints_ID;
	
	RETURN CONCAT_WS("", "[", Result, "]");
END//
DELIMITER ;

-- Dumping structure for function hivemind.randomizeVehicleInventory
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `randomizeVehicleInventory`(`c` varchar(255)) RETURNS longtext CHARSET latin1
    READS SQL DATA
BEGIN
	DECLARE WeaponClasses		VARCHAR(255);
	DECLARE WeaponAmounts		VARCHAR(255);
	DECLARE MagazineClasses		VARCHAR(255);
	DECLARE MagazineAmounts		VARCHAR(255);
	DECLARE BackpackClasses		VARCHAR(255);
	DECLARE BackpackAmounts		VARCHAR(255);
	
	DECLARE InventoryID INT DEFAULT (SELECT Inventory FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	
	DECLARE MaxWeapons		INT DEFAULT (SELECT MaxWeapons		FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	DECLARE MaxMagazines	INT DEFAULT (SELECT MaxMagazines	FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	DECLARE MaxBackpacks	INT DEFAULT (SELECT MaxBackpacks	FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	
	IF (ISNULL(InventoryID)) THEN
		RETURN "[]";
	END IF;
	
	#Weapons
	SET @amt := 0;
	SET @sum := 0;
	SELECT	GROUP_CONCAT("\"", Classname, "\""),
			GROUP_CONCAT(IF(@sum > MaxWeapons, MaxWeapons - @sum + @amt, @amt))
	INTO WeaponClasses, WeaponAmounts
	FROM 
	(
		SELECT *
		FROM vehicle_inventory
		WHERE ID = InventoryID
			AND Type = "Weapon" 
			AND RAND() < Chance
		ORDER BY RAND()
	) AS x
	WHERE (@amt := ROUND(x.MinAmount + RAND() * (x.MaxAmount - x.MinAmount))) IS NOT NULL
		AND (@sum := @sum + @amt) IS NOT NULL
		AND @sum - @amt < MaxWeapons;
	
	#Magazines
	SET @amt := 0;
	SET @sum := 0;
	SELECT	GROUP_CONCAT("\"", Classname, "\""),
			GROUP_CONCAT(IF(@sum > MaxMagazines, MaxMagazines - @sum + @amt, @amt))
	INTO MagazineClasses, MagazineAmounts
	FROM 
	(
		SELECT *
		FROM vehicle_inventory 
		WHERE ID = InventoryID
			AND Type = "Magazine" 
			AND RAND() < Chance
		ORDER BY RAND()
	) AS x
	WHERE (@amt := ROUND(x.MinAmount + RAND() * (x.MaxAmount - x.MinAmount))) IS NOT NULL
		AND (@sum := @sum + @amt) IS NOT NULL
		AND @sum - @amt < MaxMagazines;
	
	#Backpacks
	SET @amt := 0;
	SET @sum := 0;
	SELECT	GROUP_CONCAT("\"", Classname, "\""),
			GROUP_CONCAT(IF(@sum > MaxBackpacks, MaxBackpacks - @sum + @amt, @amt))
	INTO BackpackClasses, BackpackAmounts
	FROM 
	(
		SELECT *
		FROM vehicle_inventory 
		WHERE ID = InventoryID
			AND Type = "Backpack" 
			AND RAND() < Chance
		ORDER BY RAND()
	) AS x
	WHERE (@amt := ROUND(x.MinAmount + RAND() * (x.MaxAmount - x.MinAmount))) IS NOT NULL
		AND (@sum := @sum + @amt) IS NOT NULL
		AND @sum - @amt < MaxBackpacks;
	
	#Concatenate all classes and amounts into one string in the format:
	#[[[<backpack classes>],[<weapon amounts>]],[[<magazine classes>],[<magazine amounts>]],[[<backpack classes>],[<backpack amounts>]]]
	RETURN CONCAT_WS
	(
		"",
		"[[[",			WeaponClasses,
		"], [",			WeaponAmounts,
		"]], [[",		MagazineClasses,
		"], [",			MagazineAmounts,
		"]], [[",		BackpackClasses,
		"], [",			BackpackAmounts,
		"]]]"
	);
END//
DELIMITER ;

-- Dumping structure for function hivemind.rndspawn
DELIMITER //
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `rndspawn`(`chance` double) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

	DECLARE bspawn tinyint(1) DEFAULT 0;

	IF (RAND() <= chance) THEN
		SET bspawn = 1;
	END IF;

	RETURN bspawn;

END//
DELIMITER ;

-- Dumping structure for table hivemind.vehicle_groups
CREATE TABLE IF NOT EXISTS `vehicle_groups` (
  `ID` int(11) NOT NULL,
  `MaxNum` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='0 Helicopters\r\n1 Military cars (Landrover W, Landrover D, HMMWV)\r\n2 Armed cars\r\n3 Bikes\r\n4 Trucks\r\n5 Buses\r\n6 Civilian cars\r\n7 Civilian cars high end\r\n8 Civilian cars low end\r\n9 AN-2\r\n10 UH-1H';

-- Dumping data for table hivemind.vehicle_groups: 9 rows
DELETE FROM `vehicle_groups`;
/*!40000 ALTER TABLE `vehicle_groups` DISABLE KEYS */;
INSERT INTO `vehicle_groups` (`ID`, `MaxNum`) VALUES
	(0, 4),
	(1, 3),
	(2, 2),
	(3, 8),
	(4, 2),
	(5, 2),
	(6, 15),
	(9, 1),
	(10, 2);
/*!40000 ALTER TABLE `vehicle_groups` ENABLE KEYS */;

-- Dumping structure for table hivemind.vehicle_hitpoints
CREATE TABLE IF NOT EXISTS `vehicle_hitpoints` (
  `ID` int(11) NOT NULL,
  `PartName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `MinDamage` double(20,10) NOT NULL DEFAULT '0.5000000000',
  `MaxDamage` double(20,10) NOT NULL DEFAULT '1.0000000000',
  PRIMARY KEY (`ID`,`PartName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hivemind.vehicle_hitpoints: 54 rows
DELETE FROM `vehicle_hitpoints`;
/*!40000 ALTER TABLE `vehicle_hitpoints` DISABLE KEYS */;
INSERT INTO `vehicle_hitpoints` (`ID`, `PartName`, `MinDamage`, `MaxDamage`) VALUES
	(1, 'palivo', 0.6000000000, 0.8000000000),
	(1, 'motor', 0.6000000000, 0.8000000000),
	(1, 'karoserie', 0.6000000000, 1.0000000000),
	(1, 'wheel_1_1_steering', 0.6000000000, 1.0000000000),
	(1, 'wheel_1_2_steering', 0.6000000000, 1.0000000000),
	(1, 'wheel_2_1_steering', 0.6000000000, 1.0000000000),
	(1, 'wheel_2_2_steering', 0.6000000000, 1.0000000000),
	(2, 'motor', 0.6000000000, 0.8000000000),
	(3, 'motor', 0.6000000000, 0.8000000000),
	(3, 'elektronika', 0.6000000000, 1.0000000000),
	(3, 'mala vrtule', 0.6000000000, 1.0000000000),
	(3, 'velka vrtule', 0.6000000000, 1.0000000000),
	(4, 'glass1', 0.6000000000, 1.0000000000),
	(4, 'glass2', 0.6000000000, 1.0000000000),
	(4, 'glass3', 0.6000000000, 1.0000000000),
	(4, 'glass4', 0.6000000000, 1.0000000000),
	(4, 'glass5', 0.6000000000, 1.0000000000),
	(4, 'NEtrup', 0.6000000000, 1.0000000000),
	(4, 'motor', 0.6000000000, 0.8000000000),
	(4, 'elektronika', 0.6000000000, 1.0000000000),
	(4, 'mala vrtule', 0.6000000000, 1.0000000000),
	(4, 'velka vrtule', 0.6000000000, 1.0000000000),
	(4, 'munice', 0.6000000000, 1.0000000000),
	(4, 'sklo predni P', 0.6000000000, 1.0000000000),
	(4, 'sklo predni L', 0.6000000000, 1.0000000000),
	(4, 'glass6', 0.6000000000, 1.0000000000),
	(5, 'glass1', 0.6000000000, 1.0000000000),
	(5, 'glass2', 0.6000000000, 1.0000000000),
	(5, 'glass3', 0.6000000000, 1.0000000000),
	(5, 'motor', 0.6000000000, 0.8000000000),
	(5, 'palivo', 0.6000000000, 0.8000000000),
	(5, 'wheel_1_1_steering', 0.6000000000, 1.0000000000),
	(5, 'wheel_1_2_steering', 0.6000000000, 1.0000000000),
	(5, 'wheel_2_1_steering', 0.6000000000, 1.0000000000),
	(5, 'wheel_2_2_steering', 0.6000000000, 1.0000000000),
	(5, 'sklo predni P', 0.6000000000, 1.0000000000),
	(5, 'sklo predni L', 0.6000000000, 1.0000000000),
	(5, 'karoserie', 0.6000000000, 1.0000000000),
	(5, 'wheel_1_4_steering', 0.6000000000, 1.0000000000),
	(5, 'wheel_2_4_steering', 0.6000000000, 1.0000000000),
	(5, 'wheel_1_3_steering', 0.6000000000, 1.0000000000),
	(5, 'wheel_2_3_steering', 0.6000000000, 1.0000000000),
	(5, 'glass4', 0.6000000000, 1.0000000000),
	(6, 'glass1', 0.6000000000, 1.0000000000),
	(6, 'glass2', 0.6000000000, 1.0000000000),
	(6, 'glass3', 0.6000000000, 1.0000000000),
	(6, 'motor', 0.6000000000, 0.8000000000),
	(6, 'palivo', 0.6000000000, 0.8000000000),
	(6, 'wheel_1_1_steering', 0.6000000000, 1.0000000000),
	(6, 'wheel_1_2_steering', 0.6000000000, 1.0000000000),
	(6, 'wheel_2_1_steering', 0.6000000000, 1.0000000000),
	(6, 'wheel_2_2_steering', 0.6000000000, 1.0000000000),
	(6, 'karoserie', 0.6000000000, 1.0000000000),
	(6, 'glass4', 0.6000000000, 1.0000000000);
/*!40000 ALTER TABLE `vehicle_hitpoints` ENABLE KEYS */;

-- Dumping structure for table hivemind.vehicle_inventory
CREATE TABLE IF NOT EXISTS `vehicle_inventory` (
  `ID` int(11) NOT NULL,
  `Type` enum('Backpack','Magazine','Weapon') CHARACTER SET latin1 NOT NULL DEFAULT 'Magazine',
  `Classname` varchar(255) CHARACTER SET latin1 NOT NULL,
  `MinAmount` tinyint(3) NOT NULL DEFAULT '1',
  `MaxAmount` tinyint(3) NOT NULL DEFAULT '1',
  `Chance` double(20,10) NOT NULL DEFAULT '1.0000000000',
  PRIMARY KEY (`ID`,`Type`,`Classname`),
  KEY `ObjectUID` (`ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hivemind.vehicle_inventory: 14 rows
DELETE FROM `vehicle_inventory`;
/*!40000 ALTER TABLE `vehicle_inventory` DISABLE KEYS */;
INSERT INTO `vehicle_inventory` (`ID`, `Type`, `Classname`, `MinAmount`, `MaxAmount`, `Chance`) VALUES
	(30728533, 'Magazine', '20Rnd_762x51_DMR', 2, 4, 1.0000000000),
	(30728533, 'Weapon', 'DMR_DZ', 1, 1, 0.0500000000),
	(26883451, 'Magazine', '20Rnd_762x51_DMR', 1, 3, 1.0000000000),
	(26883451, 'Magazine', '5x_22_LR_17_HMR', 2, 5, 1.0000000000),
	(26883451, 'Weapon', 'huntingrifle', 1, 1, 0.8000000000),
	(42231659, 'Magazine', '30Rnd_556x45_StanagSD', 2, 5, 1.0000000000),
	(42231659, 'Weapon', 'M4A1_Aim_SD_Camo', 1, 1, 0.2000000000),
	(30507947, 'Magazine', 'HandGrenade_west', 1, 2, 0.5000000000),
	(30507947, 'Magazine', '30Rnd_545x39_AK', 2, 4, 1.0000000000),
	(30507947, 'Weapon', 'AK_74', 1, 1, 0.5000000000),
	(25844760, 'Magazine', '20Rnd_762x51_DMR', 1, 3, 1.0000000000),
	(25844760, 'Weapon', 'MeleeMachete', 1, 1, 0.9000000000),
	(25844760, 'Weapon', 'LeeEnfield', 1, 1, 0.7000000000),
	(25844760, 'Magazine', '10x_303', 1, 3, 1.0000000000);
/*!40000 ALTER TABLE `vehicle_inventory` ENABLE KEYS */;

-- Dumping structure for table hivemind.vehicle_locations
CREATE TABLE IF NOT EXISTS `vehicle_locations` (
  `ID` int(11) NOT NULL,
  `Worldspace` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`,`Worldspace`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='0 ATV\r\n1 Motorcycle\r\n2 Huey\r\n4 Mi-17\r\n3 Little bird\r\n5 AN-2\r\n6 Bike\r\n7 Military car (Landrover, HMMWV, Camo UAZs, Armed pickups)\r\n10 Civilian car (including SUV)\r\n11 Bus\r\n12 Tractor\r\n13 Truck\r\n14 Boat';

-- Dumping data for table hivemind.vehicle_locations: 144 rows
DELETE FROM `vehicle_locations`;
/*!40000 ALTER TABLE `vehicle_locations` DISABLE KEYS */;
INSERT INTO `vehicle_locations` (`ID`, `Worldspace`) VALUES
	(0, '[126,[6556.34,5621.66,0]]'),
	(0, '[166,[8316.43,7497.42,0]]'),
	(0, '[202,[11464.035, 11381.071,0]]'),
	(0, '[253,[11459.299,11386.546,0]]'),
	(0, '[284,[8854.9082,2891.5762,0]]'),
	(0, '[300,[9047.57,4480.17,0]]'),
	(0, '[335,[8856.8359,2893.7903,0]]'),
	(0, '[337,[3312.2793,11270.755,0]]'),
	(0, '[50,[3684.0366, 5999.0117,0]]'),
	(1, '[151,[6592.686,2906.8245,0]]'),
	(1, '[213,[9515.67,7222.07,0]]'),
	(1, '[291,[11945.78,9099.3633,0]]'),
	(1, '[372,[8762.8516, 11727.877,0]]'),
	(1, '[52,[8713.4893, 7103.0518,0]]'),
	(2, '[0,[9837.5,3860.2,0]]'),
	(2, '[133,[4211.8789,10735.168,0]]'),
	(2, '[156,[7660.271,3982.0063,0]]'),
	(2, '[172,[7220.6538,9116.3428,0]]'),
	(2, '[181,[10153.5,12026.8,0]]'),
	(2, '[2,[12010.7,12637.2,0]]'),
	(2, '[240,[4871.19,10176.2,0]]'),
	(2, '[241,[4811.56,9603.77,0]]'),
	(2, '[310,[6365.7402,7795.3501,0]]'),
	(2, '[37,[6366.01,2774.14,0]]'),
	(2, '[60,[11279.154,4296.0205,0]]'),
	(2, '[62,[13307,3231.95,0]]'),
	(2, '[67,[10587.8,2188.25,0]]'),
	(2, '[72,[6886.53,11437.1,0]]'),
	(2, '[75,[13614.3,3170.86,0]]'),
	(2, '[80,[6887.07,11436.8,0]]'),
	(3, '[0,[9837.5,3860.2,0]]'),
	(3, '[133,[4211.8789,10735.168,0]]'),
	(3, '[156,[7660.271,3982.0063,0]]'),
	(3, '[172,[7220.6538,9116.3428,0]]'),
	(3, '[181,[10153.5,12026.8,0]]'),
	(3, '[2,[12010.7,12637.2,0]]'),
	(3, '[240,[4871.19,10176.2,0]]'),
	(3, '[241,[4811.56,9603.77,0]]'),
	(3, '[258,[7209.86,6984.74,0]]'),
	(3, '[278,[11162.7,2509.88,0]]'),
	(3, '[310,[6365.7402,7795.3501,0]]'),
	(3, '[37,[6366.01,2774.14,0]]'),
	(3, '[60,[11279.154,4296.0205,0]]'),
	(3, '[62,[13307,3231.95,0]]'),
	(3, '[67,[10587.8,2188.25,0]]'),
	(3, '[72,[6886.53,11437.1,0]]'),
	(3, '[75,[13614.3,3170.86,0]]'),
	(3, '[80,[6887.07,11436.8,0]]'),
	(4, '[0,[9837.5,3860.2,0]]'),
	(4, '[133,[4211.8789,10735.168,0]]'),
	(4, '[156,[7660.271,3982.0063,0]]'),
	(4, '[172,[7220.6538,9116.3428,0]]'),
	(4, '[181,[10153.5,12026.8,0]]'),
	(4, '[241,[4811.56,9603.77,0]]'),
	(4, '[310,[6365.7402,7795.3501,0]]'),
	(4, '[37,[6366.01,2774.14,0]]'),
	(4, '[62,[13307,3231.95,0]]'),
	(4, '[67,[10587.8,2188.25,0]]'),
	(4, '[72,[6886.53,11437.1,0]]'),
	(4, '[75,[13614.3,3170.86,0]]'),
	(4, '[80,[6887.07,11436.8,0]]'),
	(5, '[240,[4586.84,10684.6,0]]'),
	(5, '[252,[4530.52,10785.1,0]]'),
	(5, '[32,[12492,12515,0]]'),
	(6, '[140,[12681.2,9467.42,0]]'),
	(6, '[155,[12158.999,3468.7563,0]]'),
	(6, '[155,[8680.75,2445.5315,0]]'),
	(6, '[179,[3474.3989, 2562.4915,0]]'),
	(6, '[191,[2782.7134,5285.5342,0]]'),
	(6, '[201,[8070.6958, 3358.7793,0]]'),
	(6, '[23,[3203.0916, 3988.6379,0]]'),
	(6, '[236,[1773.9318,2351.6221,0]]'),
	(6, '[236,[3699.9189,2474.2119,0]]'),
	(6, '[250,[11984.01,3835.9231,0]]'),
	(6, '[255,[10153.068,2219.3547,0]]'),
	(6, '[316,[7943.5068,6988.1763,0]]'),
	(6, '[322,[3097.96,7812.64,0]]'),
	(6, '[35,[8345.7227, 2482.6855,0]]'),
	(6, '[50,[8040.6777, 7086.5356,0]]'),
	(6, '[73,[8350.0947, 2480.542,0]]'),
	(7, '[12,[4662.13,10436,0]]'),
	(7, '[141,[11953.279,9107.3896,0]]'),
	(7, '[157,[12235.8,9729.92,0]]'),
	(7, '[157,[3693.0386, 5969.1489,0]]'),
	(7, '[183,[4752.58,2535.77,0]]'),
	(7, '[191,[4625.61,9675.62,0]]'),
	(7, '[203,[3696.23,6013.07,0]]'),
	(7, '[216,[4765.67,10260.7,0]]'),
	(7, '[249,[11823.4,12691.1,0]]'),
	(7, '[272,[6303.11,7833.36,0]]'),
	(7, '[317,[3770.08,10237,0]]'),
	(7, '[337,[6344.92,7772.4,0]]'),
	(7, '[39,[12143.2,12611.2,0]]'),
	(7, '[58,[3702.54,10182.1,0]]'),
	(10, '[0,[6279.4966, 7810.3691,0]]'),
	(10, '[106,[5265.94,5492.29,0]]'),
	(10, '[116,[13343.8,12919,0]]'),
	(10, '[124,[11309.963, 6646.3989,0]]'),
	(10, '[133,[8310.9902, 3348.3579,0]]'),
	(10, '[137,[2159.68,7907.71,0]]'),
	(10, '[160,[11940.6,8868.87,0]]'),
	(10, '[19,[10828.8,2703.23,0]]'),
	(10, '[19,[11066.828,7915.2275,0]]'),
	(10, '[194,[9727.78,8932.72,0]]'),
	(10, '[207,[1740.8503,3622.6938,0]]'),
	(10, '[222,[5165.7231,2375.7642,0]]'),
	(10, '[223,[4817.6572, 2556.5034,0]]'),
	(10, '[223,[6288.416, 7834.3521,0]]'),
	(10, '[226,[1975.1283, 9150.0195,0]]'),
	(10, '[228,[12355.3,10821.6,0]]'),
	(10, '[229,[6914.04,2487.6,0]]'),
	(10, '[241,[2614.0862,5079.6357,0]]'),
	(10, '[266,[9157.8408,11019.819,0]]'),
	(10, '[274,[11604.3,10636.8,0]]'),
	(10, '[291,[8125.36,3167.17,0]]'),
	(10, '[298,[9076.47,8016.35,0]]'),
	(10, '[316,[7427.61,5155.17,0]]'),
	(10, '[324,[13388,6603.21,0]]'),
	(10, '[336,[7006.14,7717.57,0]]'),
	(10, '[337,[8120.3057,9305.4912,0]]'),
	(10, '[337,[9715.0352,6522.8286,0]]'),
	(10, '[339,[11243.3,5376.82,0]]'),
	(10, '[344,[2045.3989,7267.4165,0]]'),
	(10, '[352,[12058.555,3577.8667,0]]'),
	(10, '[353,[12869.565,4450.4077,0]]'),
	(10, '[363,[5337.62,8656.55,0]]'),
	(11, '[230,[3762.5764,8736.1709,0]]'),
	(11, '[245,[4580.3203,4515.9282,0]]'),
	(11, '[279,[10628.433,8037.8188,0]]'),
	(11, '[333,[6040.0923,7806.5439,0]]'),
	(11, '[59,[6705.8887, 2991.9358,0]]'),
	(11, '[76,[10314.745, 2147.5374,0]]'),
	(12, '[19,[11246.52, 7534.7954,0]]'),
	(12, '[195,[9681.8213,8947.2354,0]]'),
	(12, '[220,[3083.52,9202.18,0]]'),
	(12, '[262,[3825.1318,8941.4873,0]]'),
	(12, '[95,[1690.58,5095.92,0]]'),
	(13, '[178,[13276.482, 6098.4463,0]]'),
	(13, '[338,[1890.9952,12417.333,0]]'),
	(14, '[245,[14417.589,12886.104,0]]'),
	(14, '[268,[13098.13, 8250.8828,0]]'),
	(14, '[315,[13222.181,10015.431,0]]'),
	(14, '[315,[8317.2676,2348.6055,0]]'),
	(14, '[55,[13454.882, 13731.796,0]]');
/*!40000 ALTER TABLE `vehicle_locations` ENABLE KEYS */;

-- Dumping structure for table hivemind.vehicle_spawns
CREATE TABLE IF NOT EXISTS `vehicle_spawns` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Classname` varchar(255) NOT NULL,
  `Chance` double NOT NULL,
  `MaxNum` int(11) NOT NULL DEFAULT '1',
  `Location` int(11) NOT NULL,
  `Inventory` int(11) DEFAULT NULL,
  `Hitpoints` int(11) DEFAULT NULL,
  `MinDamage` double NOT NULL,
  `MaxDamage` double NOT NULL,
  `MinFuel` double NOT NULL,
  `MaxFuel` double NOT NULL,
  `MaxWeapons` int(11) NOT NULL,
  `MaxMagazines` int(11) NOT NULL,
  `MaxBackpacks` int(11) NOT NULL,
  `CleanupTime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Classname` (`Classname`) USING HASH
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table hivemind.vehicle_spawns: 38 rows
DELETE FROM `vehicle_spawns`;
/*!40000 ALTER TABLE `vehicle_spawns` DISABLE KEYS */;
INSERT INTO `vehicle_spawns` (`ID`, `Classname`, `Chance`, `MaxNum`, `Location`, `Inventory`, `Hitpoints`, `MinDamage`, `MaxDamage`, `MinFuel`, `MaxFuel`, `MaxWeapons`, `MaxMagazines`, `MaxBackpacks`, `CleanupTime`) VALUES
	(1, 'UAZ_Unarmed_TK_EP1', 0.7, 2, 7, NULL, 1, 0.2, 0.8, 0, 0.8, 1, 3, 0, 300),
	(2, 'UAZ_Unarmed_UN_EP1', 0.59, 2, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 1, 0, 0, 300),
	(3, 'UAZ_RU', 0.59, 1, 7, NULL, 1, 0.2, 0.8, 0, 0.8, 1, 2, 0, 300),
	(4, 'UAZ_Unarmed_TK_CIV_EP1', 0.59, 3, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(5, 'SkodaBlue', 0.68, 2, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(6, 'Skoda', 0.68, 2, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(7, 'SkodaGreen', 0.68, 2, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(8, 'ATV_US_EP1', 0.7, 6, 0, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 120),
	(9, 'TT650_Ins', 0.72, 1, 1, NULL, 2, 0.2, 0.8, 0, 0.8, 0, 0, 0, 120),
	(10, 'TT650_TK_CIV_EP1', 0.72, 3, 1, NULL, 2, 0.2, 0.8, 0, 0.8, 0, 0, 0, 120),
	(11, 'Old_bike_TK_CIV_EP1', 0.64, 8, 6, NULL, NULL, 0.2, 0.8, 0, 0, 0, 0, 0, 60),
	(12, 'hilux1_civil_3_open', 0.59, 3, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(13, 'Ikarus', 0.59, 2, 11, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 180),
	(14, 'Ikarus_TK_CIV_EP1', 0.59, 2, 11, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 180),
	(15, 'Tractor', 0.7, 3, 12, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 60),
	(16, 'S1203_TK_CIV_EP1', 0.69, 2, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(17, 'V3S_Civ', 0.66, 2, 13, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(18, 'UralCivil', 0.59, 2, 13, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(19, 'car_hatchback', 0.73, 2, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(20, 'Fishing_Boat', 0.61, 1, 14, NULL, 2, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(21, 'PBX', 0.59, 1, 14, NULL, 2, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(22, 'Smallboat_1', 0.59, 2, 14, NULL, 2, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(23, 'Volha_1_TK_CIV_EP1', 0.71, 3, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(24, 'Volha_2_TK_CIV_EP1', 0.71, 3, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(25, 'SUV_DZ', 0.59, 1, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(26, 'car_sedan', 0.59, 2, 10, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(27, 'UH1H_DZ', 0.59, 2, 2, NULL, 3, 0.2, 0.8, 0, 0.8, 0, 0, 0, 900),
	(28, 'AH6X_DZ', 0.48, 3, 3, NULL, 4, 0.2, 0.8, 0, 0.8, 0, 0, 0, 900),
	(29, 'Mi17_DZ', 0.49, 1, 4, NULL, 4, 0.2, 0.8, 0, 0.8, 0, 0, 0, 900),
	(30, 'AN2_DZ', 0.6, 1, 5, NULL, NULL, 0, 0, 0.1, 0.4, 0, 0, 0, 900),
	(31, 'BAF_Offroad_D', 0.54, 2, 7, NULL, 5, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(32, 'BAF_Offroad_W', 0.54, 2, 7, NULL, 5, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(33, 'MH6J_DZ', 0.48, 2, 3, NULL, 3, 0.2, 0.8, 0, 0.8, 0, 0, 0, 900),
	(34, 'HMMWV_DZ', 0.21, 2, 7, NULL, 1, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(35, 'Pickup_PK_INS', 0.1, 2, 7, NULL, 6, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(36, 'Offroad_DSHKM_INS', 0.07, 1, 7, NULL, 6, 0.2, 0.8, 0, 0.8, 0, 0, 0, 300),
	(37, 'AN2_2_DZ', 1, 1, 5, NULL, NULL, 0, 0, 0.1, 0.4, 0, 0, 0, 900),
	(38, 'UH1H_2_DZ', 0.3, 1, 2, NULL, 3, 0.2, 0.8, 0, 0.8, 0, 0, 0, 900);
/*!40000 ALTER TABLE `vehicle_spawns` ENABLE KEYS */;

-- Dumping structure for table hivemind.vehicle_spawns_groups
CREATE TABLE IF NOT EXISTS `vehicle_spawns_groups` (
  `Spawn_ID` int(11) NOT NULL,
  `Group_ID` int(11) NOT NULL,
  PRIMARY KEY (`Spawn_ID`,`Group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hivemind.vehicle_spawns_groups: ~29 rows (approximately)
DELETE FROM `vehicle_spawns_groups`;
/*!40000 ALTER TABLE `vehicle_spawns_groups` DISABLE KEYS */;
INSERT INTO `vehicle_spawns_groups` (`Spawn_ID`, `Group_ID`) VALUES
	(2, 6),
	(4, 6),
	(5, 6),
	(6, 6),
	(7, 6),
	(12, 6),
	(13, 5),
	(14, 5),
	(16, 6),
	(17, 4),
	(18, 4),
	(19, 6),
	(23, 6),
	(24, 6),
	(26, 6),
	(27, 0),
	(27, 10),
	(28, 0),
	(29, 0),
	(30, 9),
	(31, 1),
	(32, 1),
	(33, 0),
	(34, 1),
	(35, 2),
	(36, 2),
	(37, 9),
	(38, 0),
	(38, 10);
/*!40000 ALTER TABLE `vehicle_spawns_groups` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
