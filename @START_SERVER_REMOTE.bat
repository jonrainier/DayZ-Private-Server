@echo off
echo Executing spawn script...
.\MySQL\bin\mysql --user=SAME_AS_INI --password=SAME_AS_INI --host=SAME_AS_INI --port=SAME_AS_INI --database=SAME_AS_INI --execute="call pMain()"
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}	OK.{07}
echo.
echo.
echo.
echo Starting server...
start .\Expansion\beta\arma2oaserver.exe -mod=@dayz;@hive -name=cfgdayz -config=cfgdayz\server.cfg -cfg=cfgdayz\arma2.cfg -profiles=cfgdayz
.\MySQL\cecho {0A}	OK.{07} 
echo.
echo.
echo.
echo.
echo.
echo.
.\MySQL\cecho {0B}Launcher created by Pwnoz0r.{07}
ping 127.0.0.1 -n 5 >NUL
echo.
echo.
echo.
echo.
.\MySQL\cecho {0A}Leaving le launcher...{07}
ping 127.0.0.1 -n 5 >NUL
echo.
echo.
echo.
echo.
echo.
exit