spawn_move = 0;
dayz_admin = 0;

while {true} do
{
    if (serverCommandAvailable "#kick" ) then 
	{
	    if (dayz_admin == 0) then 
        {
		dayz_admin = 1;
		spawn_move = 1;
	    player enableSimulation true;
        execvm "initSpecKey.sqf";
        };
	};
    sleep 0.1;    
};