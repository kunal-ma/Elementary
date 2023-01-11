::------------------------------
:: Croc CLI v1.0
:: By Kunal M.A.
::------------------------------

:: https://github.com/schollz/croc
:: Add the Croc.exe to the same folder as this file

::------------------------------
:: Initialization
::------------------------------

@echo off
color 0F
mode 60,30
title Croc File Transfer

goto croc

::------------------------------
:: Selection menu
::------------------------------

:croc

cls
echo.
echo    This is the File Transfer Tool. It uses the Croc
echo    program to connect another PC with this device, 
echo    and allows sending and receiving of files.
echo.
echo    Please select your command :
echo.
echo    1 - Send Files
echo    2 - Receive Files
echo.
echo    0 - Exit
echo.

set /p control=
if %control%==1 goto croc-s 
if %control%==2 goto croc-r
if %control%==0 goto menu

pause
goto croc

::------------------------------
:: Send Files
::------------------------------

 :croc-s

echo.
echo    [--------------------------------------]
echo.
echo     NOTE : Please connect the device and 
echo            the PC to a common WiFi network  
echo            Otherwise, this will not work.         
echo.
echo     Please move the file you need to send
echo     into the current folder.
echo.
echo    [--------------------------------------]
echo.

for /f "tokens=*" %%a in ('ipconfig /all ^| find /i "DHCP Server"') do set dhcp=%%a
set ip=%dhcp:~36,16%

echo     Current IP Address : %ip%
echo.
echo     Set a code phrase for the file transfer.
echo     It must be more than 6 letters, and must
echo     not have any spaces in between.
echo.
set /p cp=
echo.
echo     Enter the filename :
echo.
set /p file=
echo.
echo    [--------------------------------------]
echo.

croc send --code %cp% %file%

echo.
echo    [--------------------------------------]
echo    [                                      ]
echo    [       File transfer completed !      ]
echo    [                                      ]
echo    [--------------------------------------]
echo.
pause
goto croc

::------------------------------
:: Receive Files
::------------------------------

 :croc-r

echo.
echo    [--------------------------------------]
echo.
echo     NOTE : Please connect the device and 
echo            the PC to a common WiFi network  
echo            Otherwise, this will not work.         
echo.
echo    [--------------------------------------]
echo.

for /f "tokens=*" %%a in ('ipconfig /all ^| find /i "DHCP Server"') do set dhcp=%%a
set ip=%dhcp:~36,16%

echo     Current IP Address : %ip%
echo.
echo     Please enter the code phrase provided
echo     by the sending device :
echo.
set /p rp=
echo.
echo    [--------------------------------------]
echo.

croc %rp%

echo.
echo    [--------------------------------------]
echo    [                                      ]
echo    [       File transfer completed !      ]
echo    [                                      ]
echo    [    The file has been downloaded to   ]
echo    [          the current folder.         ]
echo    [                                      ]
echo    [--------------------------------------]
echo.
pause
goto croc

:: --------------------------------------------------------