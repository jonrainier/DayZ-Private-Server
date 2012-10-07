-----------------------------------------
 !!! PLEASE USE THE ONLINE DOCS !!!
-----------------------------------------
  
http://ibattle.org/install-and-configure/

This is just a general readme file. 
for full documentation use the online docs.

http://ibattle.org/install-and-configure/

-----------------------------------------
 !!! PLEASE USE THE ONLINE DOCS !!!
-----------------------------------------



************** Startup **************
Options:
  -h, --help    show this help message and exit.
  -f FILENAME,    --file=FILENAME

Where FILENAME is the name of your config file. the file should be located inside the Config dir..
Example:
Bec.exe -f myserver.cfg


************** What is Bec and Whats does it do!. **************
Bec , Aka Battleye Extended Controls.

Bec is a admin tool for ArmA2 servers that has enabled Battleye. This is a server application only, no need for anything as a client.
What this Tool does is give you Be Power on the Chatline ingame the mission.
Logs Chat to file with timestamps, log Be events to Own file. all organized.
Allows for multiple admins. Set up Admin Groups. Setup Multiple "clone" commands.
Allows you to set up Premission levels on each Command.
Ie. !bpl  bans a player 10 min, !btk bans a player 20 min for Teamkill.
Nick filter. use file with rude, offencive names that you do not allow on your server. auto kicks player on connection.
++ more


!!! Summary !!!
* Multi Admin Support
* Define Custom Names on Commands
* Set Group Level on Admins
* Set Group Level on Commands
* Organized Chat logger
* Organized BE Event logger
* Commit heartbeat on ban files for servers running multiple servers
* Check Guid of players who connects againt a central ban database
* Report GameHacks to a central ban database
* Nick Filter, Auto kick offensive names defined by you
* Word Filter. warn/autokick on offencive chat.
* Chat restriction
* Autokick lobby idlers
* Auto Lock/unlock the server. (Flood control) 
* Create schedules

******************************************************************************************************
!!! CONFIGURE !!!

*** PreConfigure ***
First you need to setup BEServer.cfg for BattlEye.
http://community.bistudio.com/wiki/BattlEye
and|or the forums. http://forums.bistudio.com for more info about that.

Place the Bec directory anywhere you want. it doesnt really matter where its located on your disk.
Open the "Bec\Config" directory and edit the files called.
* Config_EXAMPLE.cfg
* Admins_EXAMPLE.xml 
* Commands_EXAMPLE.xml
* Schediler_EXAMPLE.xml

For more info Visit http://ibattle.org/install-and-configure/

----------------------------------------------------------
EXAMPLE CONFIG FILE, ALL PARAMETERS DEFINED.:
----------------------------------------------------------
[Bec]
Ip = 127.0.0.1
Port = 2302
BePath = C:\SERVER1\BattlEye
LogDir = MyServer1
Admins = Admins.xml
Commands = Commands.xml

#**************************************************
# Optional
[Misc]
AsciiNickOnly = True
AsciiChatOnly = True
IgnoreChars = Â£Ã¦Ã¸Ã¥
NickFilterFile = C:\Path\Bec-V.1.20\Config\BadNames.txt
WordFilterFile = C:\Path\Bec-V.1.20\Config\BadWords.txt
Warnings = 5
ServerExeName = myArma2_Server.exe
Color = 0c
Timeout = 40
KickLobbyIdlers = 300
Scheduler = Scheduler.xml
MaxPlayerNameLength = 30
DisallowPlayerNameChars = [](){}<>/\^¨|§!"'#¤%&@£$€
ChatChannelFiles = true
###################
#FloodControl1 = 5
# Or
#FloodControl2 = 1
#FloodSampleTime = 5
#FloodLockTime = 10
###################

#**************************************************
# Optional
[ChatRestriction]
Global = 10
Side = -1
Group = -1
Vehicle = -1
Command = -1
Commander = -1
Direct = -1

#**************************************************
# Optional
[Reporter]
User = your
Password = pwd

#**************************************************
# Optional
[Heartbeat]
BeBanFile0 = C:\SERVER2\BattlEye\bans.txt
BeBanFile1 = C:\SERVER3\BattlEye\bans.txt



---------------------
MINIMAL CONFIG FILE
---------------------
[bec]
Ip = 127.0.0.1
Port = 2302
Password = 123456
BeBanFile = C:\SERVER1\BattlEye\bans.txt
LogDir = MyServer1
Admins = Admins.xml
Commands = Commands.xml
---------------------


# Note that Misc, ChatRestriction, Reporter, Heartbeat are all fully optional and does not need to be in the config file.
The only time [Misc] is needed, is if the arma server exe file has been renamed.
If your running a single server you have no need for [heartbeat] in your config file.

Now..
Make a Shortcut to Bec Some place.
Go to properties of this shortcut and edit the Target box, put in the -f argument.
Example!
Target| "c:\..\..\Bec\Bec.exe" -f Config.cfg
Or set up Bec as a service. 


Some explanation of the parameters used by Bec.

------------------------------------------------------------------------------------
* BEC *
------------------------------------------------------------------------------------
In the [Bec] block we define Rcon parameters such as Ip, porta etc. 
All are needed for Bec to work.

-------------------
* Ip *

The ip Bec need to connect to the server.
By default you should use 127.0.0.1.
But in some cases you need to use other Ip, 
Example if you have 2 servers running on same port and are using multihoming.
if unsure. try with 127.0.0.1 1st

-------------------
* Port *

The the port the server is running on.

-------------------
* BePath *

The full path to your Battleye directory for you current profile.

-------------------
* LogDir *

This is the Dir inside Bec/Log where all Bec logs will be stored.
Use the name of your server or something like that

-------------------
* Admins *

This is the file where you define your admin and the group level on your admins.
This file does not need to be named Admins.xml. but to make it more understandeble, we call it Admins.xml for now.
If you do not set full path to this file. it will look in the Config directory 1st.

Valid methodes:

Admis = Admins.xml
Admins = C:\some\path\Admins.xml
Admins = \some\path\Admins.xml 

Note. if last methode is used. Bec needs to be located on the same partition.

For more information on how to create a admin file, Visit:
http://ibattle.org/install-and-configure/define-admins/

-------------------
* Commands *

This is the file where you create your commands.
Set custom names and group level in this file.
This file does not need to be named Commands.xml. but to make it more understandeble, we call it Commands.xml for now.
If you do not set full path to this file. it will look in the Config directory 1st.

Valid methodes:

Commands = Commands.xml
Commands = C:\some\path\Commands.xml
Commands = \some\path\Commands.xml 

Note. if last methode is used. Bec needs to be located on the same partition.

For more information on how to create a command file, Visit:
http://ibattle.org/install-and-configure/define-commands/

------------------------------------------------------------------------------------
* MISC 
------------------------------------------------------------------------------------
This Block is optional with 1 exception. 
In cases where you have renamed your exe file and need to use ServerExeName.

-------------------
* AsciiNickOnly *

If set to True it will autokick all players who has none ascii chars in the nickname.
Kick happens instant on connect.
If this parameter is not defined, AsciiNickOnly will be set to False by default 

-------------------
* AsciiChatOnly *

If set to True a warning will be send to the player who does not use Ascii on chat.
You will need to set parameter Warnings to 0 or higher for this option to work..
If this parameter is not defined, AsciiChatOnly will be set to False by default

-------------------
* IgnoreChatChars *

This Option will only work if AsciiChatOnly is set on.
Add in chars/symbols that is not listed in the ascii table.
example you dont want to have/allow german/russian chars. but norwegian is ok for you
then you can do it like.

AsciiChatOnly = True
IgnoreChatChars = æøå

It's reccomended that you use a proper editor like Notepad++
When using non ascii chares. you need to save the file with utf encoding.

-------------------
* NickFilterFile *

Here you can define player names you do not allow on your server.
If a players nick matches any lines in the file he will be autokicked upon connection
If this parameter is not defined, NickFilterFile will be disabled by default
If you do not set full path to this file. it will look in the Config directory 1st.

Valid methodes:

NickFilterFile = BadNames.txt
NickFilterFile = C:\some\path\BadNames.txt
NickFilterFile = \some\path\BadNames.txt

Note. if last methode is used. Bec needs to be located on the same partition.

-------------------
* WordFilterFile *

Here you can define words you do not allow on your chat.
If a players chat matches any lines in the file he will be sendt a warning.
You will need to set parameter Warnings to 0 or higher for this option to work..
Autokick will happen when he|she reaches the set value..
If this parameter is not defined, WordFilterFile will be disabled by default

Valid methodes:

WordFilterFile = BadNames.txt
WordFilterFile = C:\some\path\BadWords.txt
WordFilterFile = \some\path\BadWords.txt

Note. if last methode is used. Bec needs to be located on the same partition.

-------------------
* Warnings *

This is the number of warning a player should get before autokick happens
If exampe warning is set to 3. the player will get 3 warnings, if he|she still example continue to use none ascii after the 3rd warning. he|she will be kicked.

There are 3 functions that uses this parameter.
1 * AsciiChatOnly
2 * WordFilterFile
3 * Warn "command in Commands.xml file"

Example of reply message from Bec:
22:21:24 : (Global) SomeDude:fucking noob.
22:21:25 : RCon admin #0: (To SomeDude) Watch your language. Warnings left:2

Set this to -1 to diable warnings/warnkick functions
1 * AsciiChatOnly
2 * WordFilterFile
3 * Warn "command in Commands.xml file"

Setting the value to 0 means Instant kick without warning.
the player will then only get a message on the kick reason why kick happend.
Also take a note, the command "warn" in Commands.xml will only work if this value is set higher than 0,
Since there is no point in send a warning when the value is 0 "instant kick". we use !kpl or other names you defined

NOTE: if you do not define this parameter. it will be det to -1 by default. 
All 3 depending functions will then be disabled by default.

-------------------
* ServerExeName *

If you for some reason had to rename your Arma2 server exe file. 
You must use this parameter and set its name. do include the full name inclusive .exe, but not the path.
ServerExeName = myA2Server.exe

-------------------
* Color *

Does only change color of rcon screen. not the starup screen..
You use hex values to set the color. 0-f
Color = e1
Play around on CMD.exe and type color XX to find wanted color, not much more to say.

-------------------
* Timeout *

If your server for some reason needs longer than 30 seconds to start up. 
You can then set custom timeout with this parameter
Timeout = 60
The number is set in seconds.

-------------------
* FloodControl *

There are 2 types of floodcontrols.

Type 1. 
Locks the server Based on how many players are in the lobby
This is to allow the server to prossess data of the connected players before new one can join.
Note. The Server may lock/unlock itself even is no players are joining. this happens if players are in mission and goes back to the lobby

FloodControl1 = 5
This will lock the server when 5 players has connected or is in the lobby.
Bec unlocks the server again as soon as the player count in the lobby is less than FloodControl value.
To diable this function, dont define this parameter or set it to 0.
Note. it may have 3 sec delay.

Type 2.
Locks the server based on how many players are connecting within given time. server will stay locked for given time aswell.

FloodControl2 = 10
FloodSampleTime = 3
FloodLockTime = 3
This will Lock the server when 10 players has connected within the sampling time (3sec). then stay locked for 3 seconds.


-------------------
* KickLobbyIdlers *

Auto kick lobby idlers who take up a slot without playing. lowest timeout is 180 sec. 
if you set this to 0 it will be dissabled or if you dont define this parameter at all it will be igonored.

KickLobbyIdlers = 300
this will kick a player who has been idling in the lobby for 300 sec. 5min
value is set in seconds.

NOTES:
A players is considered to be in the lobby until hes/she is fully ingame.
A player sitting in the briefing screen will be seen as if the player is in the lobby.
A players loading the mission will also bee seen as if they are in the lobby.

-------------------
* Scheduler *

Set the path to your scheduler file.
allows you to create simple schedules.

This is the file where you define your svhedules
This file does not need to be named Scheduler.xml.
If you do not set full path to this file. it will look in the Config directory 1st.

Valid methodes:

Scheduler = Scheduler.xml
Scheduler = C:\some\path\Scheduler.xml
Scheduler = \some\path\Scheduler.xml 

Note. if last methode is used. Bec needs to be located on the same partition.


For more information on how to create schedules, Visit:
http://ibattle.org/install-and-configure/setting-up-the-scheduler/

-------------------
* MaxPlayerNameLength *

MaxPlayerNameLength = 16
Set the max lenght a player name can have.
Players connecting with a name longer than defined in this parameter will be kicked from the server.

-------------------
* DisallowPlayerNameChars *

Limits chars a player can have in the nick
DisallowPlayerNameChars = [](){}<>/\^¨|§!"'#¤%&@£$€
Players connecting and have any chars set in this parameter in their player name will be kicked from the server.

-------------------
* ChatChannelFiles *

if enabled. it will create additional chat files. once for each channeø.
files will only be created if there is chat in channels.

------------------------------------------------------------------------------------
* Reporting *
------------------------------------------------------------------------------------
In the [Reporter] block we add in account data so that GameHacks gets automatically reported to a central ban database.
You will need an account for this to work.
If you don't have one or don't want to create one, just remove this block since its fully optional.

[Reporter]
User = you
Password = secret

It will also check status on a Guid.
Again this will only work if you have a valid user account..
If this is enabled every player that connects is checked against the database.

If you see a file called "Reporting_Failures.log", this is a a fallback file if the host is down or unavaileble for some reason.
If the file contains any guids, Bec will try to uploade the info every 10 min.



------------------------------------------------------------------------------------
* ChatRestriction *
------------------------------------------------------------------------------------
Here you can set max message that is allowed for each channel.
If you want to restrict usage of example global chat.

[ChatRestriction]
Global = 10

This will autokick a player after the 10th message in global channel.
setting the value to 0 mean instant kick..
setting the value to -1 mean its disabled. 

The player will recive warings when typing in the global chat

[ChatRestriction]
Global = 10
Side = -1
Group = -1
Vehicle = -1
Command = -1
Commander = -1
Direct = -1

Is the same as 

[ChatRestriction]
Global = 10

So if you dont need any channels to be restricted. you can delete the hole block [ChatRestriction]
Note: This is will not use the Warnings Parameter for its counter.



------------------------------------------------------------------------------------
* Heartbeat function *
------------------------------------------------------------------------------------
Here you spesify all "other" Be banfiles for your other servers.. 
Once you ban on example server 1. the ban will be automaticly added to server 2,3,4 so on.. depends on how many files you spesify.
This function is only usefull if you are running multiple servers on one machine.
If you are running a single server do not use this. Delete the hole [Heartbeat] block.
Do not confuse this with merge. it will not merge the files only add in new bans to defined files


 
_____________________________________________________________________________________
|																					 |
|					  * Understanding the Permission system *						 |
|____________________________________________________________________________________|

Both Admin and the Command must have assigned a group number.
To be able to execute a command. the admin must have the same or a lower group number as the command.

A lower ranked admin can not kick or ban a higher ranked admin..
When i say higher ranked admin.. it means that a admin that has a lower group number than the admin who tried to execute the command.
Equal ranked admins can only kick eachother.
When making commands you should consider the level.

*** Short persudo example ***

You may want to use 3 Preset Ban commands and one Kick.
ban for 10min
ban for 60min 
and one ban for PermBan

You may not want all admins to be able to do a permban. but only short bans.
Lets say we have 4 admins and 4 commands.

**************************
# Admins.xml
admin_a - group 0
admin_b - group 1
admin_c - group 2
admin_d - group 1

#Commands.xml
ban_a - group 0 - Perm ban
ban_b - group 1 - 60 min
ban_c - group 2 - 10 min
kick_a - group 3
**************************


# Admin Ban/Kick On ordinary players 
(admin_a) can execute command (ban_a, ban_b, ban_c) on any players 				
(admin_b) can execute command (ban_b, ban_c) on any players						
(admin_c) can execute command (ban_c) on any players
(admin_d) can execute command (ban_b, ban_c) on any players
(admin_a, admin_b, admin_c, admin_d) can execute command kick_a on any players.


# Admins vs Admins
* Kick 
admin_a can execute kick_a on (admin_a, admin_b, admin_c, admin_d)
admin_b can execute kick_a on (admin_b, admin_c, admin_d)
admin_d can execute kick_a on (admin_c, admin_d)
admin_c can only execute kick_a on (admin_c)

Yes you are reading correct. you can kick yourself. ;)
I use this verry much for a fast exit, i hate pressning esc. disconnect, disconnect, then esc again.. !kpl in much faster ;D


* Ban
admin_a can execute (ban_a, ban_b, ban_c) on (admin_b, admin_c, admin_d)
admin_b can execute (ban_b, ban_c) on (admin_c)
admin_c can not ban any of (admin_a, admin_b, admin_c, admin_d) due to its lower rank..

Temp Admins may never execute any kick or ban commands on a perm admin.