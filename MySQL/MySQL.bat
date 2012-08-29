@echo off
COLOR F
echo.
echo __________________________________MySQL 5.5.24__________________________________
echo.
echo  MySQL started.
echo.
echo.
echo.
cecho {0C} To shut down MySQL, Press CTRL + C and close this window afterwards.{#}
echo.
echo.
cecho {0C} DO NOT DO THIS, unless you've shut down the DayZ Server{#}
cecho {08}
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
.\bin\mysqld --console
if errorlevel 1 goto error
goto finish

:error
cls
echo.
cecho {0C} MySQL could not be started.
cecho {08}
echo.
echo.
pause
exit

:finish
