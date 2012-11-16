@echo off
echo.
echo  		DayZ Private Server Launcher - Created By Stapo
echo.
echo.
echo Connecting To MySQL Database...
.\MySQL\bin\mysql --user=root --password=root --host=127.0.0.1 --port=3316 --database=hivemind --execute="call pMain()"
ping 127.0.0.1 -n 5 >NUL
.\MySQL\cecho {0A}Connected{07}
echo.
echo.
echo Starting Server...
start .\Expansion\beta\arma2oaserver.exe -mod=@hive;@dayz -name=cfgdayz -config=cfgdayz\server.cfg -cfg=cfgdayz\arma2.cfg -profiles=cfgdayz
ping 127.0.0.1 -n 16 >NUL
.\MySQL\cecho {0A}Started{07} 
echo.
echo.
echo Leaving The Launcher...
ping 127.0.0.1 -n 5 >NUL
exit