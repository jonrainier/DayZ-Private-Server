-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.11-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.5053
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

-- Data exporting was unselected.
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

-- Data exporting was unselected.
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

-- Data exporting was unselected.
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

-- Data exporting was unselected.
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
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

-- Data exporting was unselected.
-- Dumping structure for procedure hivemind.pCleanup
DELIMITER //
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanup`()
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

-- Data exporting was unselected.
-- Dumping structure for table hivemind.player_login
CREATE TABLE IF NOT EXISTS `player_login` (
  `LoginID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(45) NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `datestamp` datetime NOT NULL,
  `Action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
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
CREATE DEFINER=`root`@`localhost` FUNCTION `rndspawn`(`chance` double) RETURNS tinyint(1)
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

-- Data exporting was unselected.
-- Dumping structure for table hivemind.vehicle_hitpoints
CREATE TABLE IF NOT EXISTS `vehicle_hitpoints` (
  `ID` int(11) NOT NULL,
  `PartName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `MinDamage` double(20,10) NOT NULL DEFAULT '0.5000000000',
  `MaxDamage` double(20,10) NOT NULL DEFAULT '1.0000000000',
  PRIMARY KEY (`ID`,`PartName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
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

-- Data exporting was unselected.
-- Dumping structure for table hivemind.vehicle_locations
CREATE TABLE IF NOT EXISTS `vehicle_locations` (
  `ID` int(11) NOT NULL,
  `Worldspace` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`,`Worldspace`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='0 ATV\r\n1 Motorcycle\r\n2 Huey\r\n4 Mi-17\r\n3 Little bird\r\n5 AN-2\r\n6 Bike\r\n7 Military car (Landrover, HMMWV, Camo UAZs, Armed pickups)\r\n10 Civilian car (including SUV)\r\n11 Bus\r\n12 Tractor\r\n13 Truck\r\n14 Boat';

-- Data exporting was unselected.
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

-- Data exporting was unselected.
-- Dumping structure for table hivemind.vehicle_spawns_groups
CREATE TABLE IF NOT EXISTS `vehicle_spawns_groups` (
  `Spawn_ID` int(11) NOT NULL,
  `Group_ID` int(11) NOT NULL,
  PRIMARY KEY (`Spawn_ID`,`Group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
