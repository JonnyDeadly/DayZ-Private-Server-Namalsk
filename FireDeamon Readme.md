FireDaemon MySQL and pMain Execution Launch guide.
====

I’ll not divulge into how users should or shouldn’t setup a FD Service, I’d hope you would already know if you are running your own private hive. This is purely for those having issues getting assets to spawn using FD.

You’ll need to add two Pre/Post-Service Executions.
The first should be your SQL Start.bat you could even add the .exe and add the Parameters. 

Your batch file should look something like the following;

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
    exit
    
    :finish

If you haven’t noticed I've removed the 'pause' to prevent additional dialogues opening when you kill ‘mysqld.exe.’
Don’t forget to edit your ‘my.ini’ file with access details including the relevant ports. Generally located in your \MySQL Directory.

You’ll then need to add the pMain execution script, UPDATE YOUR LOGIN INFORMATION, DATABASE OR REMOTE CALL!

    @echo off
    echo.
    echo    	DayZ Private Server pMain - Created by Inch for FireDaemon
    echo.
    echo.
    echo.
    echo Connecting To MySQL Database...
    .\MySQL\bin\mysql --user=root --password=root --host=127.0.0.1 --port=3306 --database=hivemind --execute="call pMain()"
    ping 127.0.0.1 -n 5 >NUL
    .\MySQL\cecho {0A}Connected{07}
    echo.
    echo.
    echo Leaving The Launcher...
    ping 127.0.0.1 -n 5 >NUL
    exit

Once you've setup both batch files and added them you'll need to ensure that mysqld is the first script that runs otherwise the pMain execution will clearly fail.
If you’re unsure about this select the Executable instance once (highlighted blue). Then click the >MoveUP arrow. To the left of ‘Insert…’

You'll then want to add a Pre-Launch Delay under 'settings' of around 5000ms depending on what else you run...

--optional, to kill mySQLd when you stop the service you can add a 'post' executable/batch file which should look something like this,

        @echo off
        taskkill /IM mysqld.exe /F