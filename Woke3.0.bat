@echo off
MODE 37,8
:init
set "started="
2>nul (
 9>"%~f0.lock" (
  set "started=1"
  call :start
 )
)
@if defined started (
    del "%~f0.lock" >nul 2>nul
) else (
    echo Process aborted: Stay Woke is already running
    echo.
    echo this windows will close automatically
    @ping localhost > nul
)

exit /b


:start
cd /d %~dp0
set var1=0
set var2=0
echo ........Your PC is now Woke........
echo.
echo "The tower of power, too sweet to be sour, ohhhh yeah" - Randy Savage
echo.
echo CLOSE THIS WINDOW TO END THE PROGRAM
echo This program has run: 0 time(s)
REM woke for 0 minutes
:loop
set /a var1=%var1%+1
set /a var2=%var2%+10
start notepad.exe ...
taskkill /f /im notepad.exe >nul
timeout /t 500 >null
echo ........Your PC is now Woke........
echo.
echo "The tower of power, too sweet to be sour, ohhhh yeah" - Randy Savage
echo.
echo CLOSE THIS WINDOW TO END THE PROGRAM
echo This program has run: %var1% time(s)
REM woke for %var2% minutes
goto loop