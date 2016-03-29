## Requirements
* Steam Copy of [ArmA 2: Combined Operations](http://store.steampowered.com/sub/4639/)
* Instance of a MySQL server (if you do not have one installed, follow steps below)
* Download the following Microsoft C++ Redistributables - make sure to get both `x86` and `x64` versions installed.
	* [Visual C++ Redistributable for Visual Studio 2012 Update 4](https://www.microsoft.com/en-us/download/details.aspx?id=30679)
	* [Visual C++ Redistributable Packages for Visual Studio 2013](https://www.microsoft.com/en-us/download/details.aspx?id=40784)
	* [Visual C++ Redistributable for Visual Studio 2015](https://www.microsoft.com/en-us/download/details.aspx?id=48145)
* Alternativly you can download [Visual Studio 2015 Community Edition](https://www.visualstudio.com/en-us/products/visual-studio-community-vs.aspx) which will install any prerequisites you will ever need.

## Installation Instructions
### Install - ArmA2: Combined Operations
1. Create a path with no spaces somewhere near the root of your drive. (Example: `C:\Servers\DayZ1`)
2. Download [SteamCMD](https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip) and extract it.
3. Download [this batch file](https://rainier.tech/games/dayzmod/update_server.bat) and place it in your SteamCMD extracted directory.
	* Edit `update_server.bat`'s variables to match your settings
		1. Set `STEAM_DIR` to the directory you created in step 1.
		2. Set `STEAM_USERNAME` and `STEAM_PASSWORD` to your Steam login with [ArmA 2: Combined Operations](http://store.steampowered.com/sub/4639)
4. Run `update_server.bat` and wait for it to complete. This will download ArmA2 and ArmA2: Operation Arrowhead into the same directory to make ArmA2: Combined Operations.
### Install - DayZMod Server
1. Download the latest stable release of [this server pack](https://github.com/Pwnoz0r/DayZ-Private-Server/releases) or the [latest development version](https://github.com/Pwnoz0r/DayZ-Private-Server/archive/master.zip).
2. Extract the server pack you have just downloaded into the directory you created in the previous step (`C:\Servers\DayZ1`).
3. After you have completed all of the previous install instructions you can now move on to changing the config. Navigate in your DayZ server directory, then to `cfgdayz`. Inside you'll find a `server.cfg` which will allow you to change the default settings of the server to your liking, such as the server name, password and much more. For any questions regarding the `server.cfg` file, please follow this guide [here](https://community.bistudio.com/wiki/server.cfg).
4. Download [BE Server for Windows - ARMA 2: OPERATION ARROWHEAD (INCLUDING DAYZ MOD)](http://www.battleye.com/downloads) and place it inside the `cfgdayz\BattlEye` folder.

### Install - MySQL Server (Windows)
1. Download [MySQL Community Server Installer](http://dev.mysql.com/downloads/windows/installer) (offline installer is preferred)
2. Accept the license terms and press Next.
3. Select the type of setup you would like. (`Server only` is preferred)
4. After the installer completes it is time to configure the new MySQL instance with the installer
	1. Config Type => `Server Machine` or `Dedicated Machine`
	2. TCP/IP => `Checked`
	3. Port Number => `3306`
	4. Open Firewall port for network access => `Checked`
	5. Click Next
	6. MySQL Root Password => Set it to a `STRONG_PASSWORD`
	7. MySQL User Accounts => Click `Add User`
		1. Username => `dayzhivemind`
		2. Host => `REMOTE_GAME_SERVER_IP`
		3. Role => `DB Admin` (temporary)
		4. Password => `STRONG_PASSWORD`
	8. Press Next and hit Execute, wait for your service to be configured and hit Finish
5. Download and run the [HeidiSQL Installer](http://www.heidisql.com/download.php).
6. Run HeidiSQL and connect to your MySQL server under root privileges. ![HeidiSQL Session Manager Dialogue](http://i.imgur.com/zWhS5ZI.png)
7. Create a database named `hivemind` and use your servers default charset. ![HeidiSQL Database Creation Dialogue](http://i.imgur.com/MetaFxT.png)
8. Download the latest SQL file (`https://raw.githubusercontent.com/Pwnoz0r/DayZ-Private-Server/master/SQL/CURRENT_DAYZ_VERSION.sql`), press `Ctrl + O` in HeidiSQL and load the SQL file. Make sure your `hivemind` database is selected and press `F9` or the blue triangle button up in the toolbar that says `Execute SQL...`
9. After the SQL file executes, you may receive warnings - this is okay to ignore.
10. Once the SQL file is finished, click on the `User manager` and edit your `dayzhivemind` user to only have full permissions to your `hivemind` database and nothing else. It is also a good practice to only allow this user to connect from your `REMOTE_GAME_SERVER_IP`. ![HeidiSQL User Manager Dialogue](http://i.imgur.com/ARIdCAO.png)
11. If you followed all of the previous steps properly, you should now be able to connect to your MySQL service from your game server.

### Install - MySQL Server (Linux)
* The flavor of Linux used in this tutorial was `Ubuntu 15.10 x64`
1. Connect to your machine via SSH and run the following commands:
	* If you would like to confirm everything prior to installing the commands, remove the `-y` switch from each command.
	1. `sudo apt-get update -y && sudo apt-get upgrade -y`
	2. `sudo apt-get install mysql-server -y`
2. Set your root password in the following prompt:
	![MySQL Root Password GUI](http://i.imgur.com/sjhvQcz.png)
3. After your root password has been successfully set, run the following command: `sudo mysql_secure_installation` and follow the steps in securing your new MySQL service properly.
	1. Create database
		1. `mysql -u root -p`
		2. `CREATE DATABASE hivemind;`
	2. Create a remote user for non-SSH access:
		* Root access is temporarily required to execute the SQL file in a few steps.
		1. `CREATE USER 'dayzhivemind'@'REMOTE_GAME_SERVER_IP' IDENTIFIED BY 'STRONG_PASSWORD';`
		2. `GRANT ALL PRIVILEGES ON *.* TO 'dayzhivemind'@'REMOTE_GAME_SERVER_IP' WITH GRANT OPTION;`
		3. `FLUSH PRIVILEGES;`
4.  If you have an issue connecting remotely to your new user, make sure to add your MySQL port to your `iptables` and bind your remote address to the `mysqld.cnf` file.
	1. `iptables -A INPUT -i eth0 -p tcp -m tcp --dport 3306 -j ACCEPT`
	2. `nano /etc/mysql/mysql.conf.d/mysqld.cnf`
	3. Find and change `bind-address = 127.0.0.1` to `bind-address = REMOTE_MYSQL_SERVER_IP`
	4. `service mysql restart`
5. Execute `SERVER_INSTANCE\SQL\CURRENT_DAYZ_VERSION.sql` on your new `hivemind` database. Make sure to change `CURRENT_DAYZ_VERSION` to the latest version that is currently supported.
	1. `wget https://raw.githubusercontent.com/Pwnoz0r/DayZ-Private-Server/master/SQL/CURRENT_DAYZ_VERSION.sql`
	2. `mysql -u root -p hivemind < ~/CURRENT_DAYZ_VERSION.sql;`
6. If that successfully executes, we want to revoke the root access we granted this user and grant it only full permissions to the `hivemind` database.
	1. `REVOKE ALL PRIVILEGES ON *.* FROM 'dayzhivemind'@'REMOTE_GAME_SERVER_IP';`
	2. `GRANT ALL PRIVILEGES ON hivemind.* TO 'dayzhivemind'@'REMOTE_GAME_SERVER_IP' WITH GRANT OPTION;` (grant the user full permissions only to the one database)
	3. `FLUSH PRIVILEGES;`
7. At this point your MySQL Server on Linux should be ready for production. Make sure to remove all unnecessary users that you will not be using. It is also a good idea to only allow the remote machine you will be using for your DayZ Mod game server to connect to the database.

## Configure - `HiveExt.ini`
### MySQL Settings
With the new MySQL server you have just set up, it's time to configure your game server to be able to connect to it. Here is a working example of what we just set up:
```
[Database]
;Hostname or IP of the server to connect to
;You can use the value "." (without quotes) to indicate named-pipe localhost connection
;If you leave this line commented or blank, HiveExt will connect to the OFFICIAL Hive, which requires registration
;See support.dayzmod.com for more information on what OFFICIAL Hive means, what are the rules, etc.
;If using OFFICIAL hive, the rest of the settings in this section have no effect
Host = MYSQL_SERVER_IP

;The default is MySql, which is better supported than Postgre (completely untested)
Type = MySql

;Port to connect to. The default is the default listening port of a server of the selected Type
;Instead of specifying Port, you can specify Socket and set Value to the socket name
Port = 3306

;Database name to connect to (you must supply this if private).
Database = hivemind

;Username to connect with
Username = dayzhivemind
;Password to authenticate with (default is blank)
Password = STRONG_PASSWORD
```
### Time Config
Configuring time can be great if you want to play DayZ without the hassle of night time, you can make the mission constantly day time. An example of making the time constant day would be to change the type setting in the Time section, for example:
```
[Time]
;Possible values: Local, Custom, Static
;You cannot use Static on OFFICIAL Hive, it will just revert to Local
Type = Static
;If using Custom type, offset from UTC in hours (can be negative as well)
;Offset = 0
;If using Static type (Hour value always the same on every server start), the value (0-24) to set the Hour to
Hour = 8
```

## Start Server (Batch - Windows)
1. Download the [following batch file](https://rainier.tech/games/dayzmod/start_server.bat) and extract it into your `STEAM_DIR` you set up earlier.
2. Run the batch file and your server should start right up and become joinable.
    
## Community
Join the community! Remember to visit [OpenDayZ](http://opendayz.net) where you can suggest new ideas and help out other community members.
### Author
DayZ-Private-Server Created by @[Pwnoz0r](https://github.com/Pwnoz0r). Original GitHub README by RazorFlint - updated by @[Pwnoz0r](https://github.com/Pwnoz0r) - 03/29/2016
