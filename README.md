![OpenDayZ Logo](http://i.imgur.com/2Q0V5KA.png)<br />

##Requirements
* Minimum of 1024MB RAM (1GB)
* 2.0GHZ Processor or higher
* 20GB Free HDD space
* Steam/Retail Copy of ArmA II: Combined Operations

##Installation Instructions
Installing takes around 10 - 15 minutes depending on whether your HDD can transfer GB's of data at a moderate speed.
###Install - Part 1
Firstly before installing the server software, create a file in your chosen location of where you want the server files to be located create a new folder titles 'DayZ Private Server' or something along those lines. After, copy the ArmA 2 directory from either:

* C:\Program Files\Steam\steamapps\ArmA 2\ (Steam)
* C:\Program Files\Bohemia Interactive\ArmA 2\ (Retail)

If you're on a 64-Bit OS then append 'x86' to the end of the Program Files directory.

Same applies for ArmA II: Operation Arrowhead, copy the contents into the same folder as the one you just created along with the ArmA II files, overwriting if necessary.
###Installation - Part 2
After merging both directories, download the latest release from the GitHub master repo then copy the contents of the downloaded files into the directory where you merged both ArmA II and ArmA II: Operation Arrowhead to make ArmA II: Combined Operations. Your folder structure should contain the following directories where 'serverfolder' is the directory you created:

    /serverfolder/Addons/
    /serverfolder/BattleEye/
    /serverfolder/cfgdayz/
    /serverfolder/@dayz/
    /serverfolder/@hive/
    /serverfolder/MySQL/
    /serverfolder/MPMissions/
    
###Installation - Part 3
After you have completed all of the previous install instructions you can now move on to changing the config. Navigate in your DayZ server directory, then to cfgdayz. Inside you'll find a server.cfg which will allow you to change the default settings of the server to your liking, such as the server name, password and much more.

##Extra Config Options
###Time Config
Configuring time can be great if you want to play DayZ without the hassle of night time, you can make the mission constantly day time by editing the HiveExt.ini in the /cfgdayz/ directory. An example of making the time constant day would be to change the type setting in the Time section, for example:

    [Time]
    ;Possible values: Local, Custom, Static
    ;You cannot use Static on OFFICIAL Hive, it will just revert to Local
    Type = Static
    ;If using Custom type, offset from UTC in hours (can be negative as well)
    ;Offset = 0
    ;If using Static type (Hour value always the same on every server start), the value (0-24) to set the Hour to
    Hour = 8
    
##Community
Join the community! Remember to visit [OpenDayZ](http://opendayz.net) where you can suggest new ideas and help out other community members.
###Author
DayZ-Private-Server Created by Pwnoz0r, GitHub readme by RazorFlint
