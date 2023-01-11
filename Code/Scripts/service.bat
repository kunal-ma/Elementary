::------------------------------
:: Services Manager v1.0
:: By Kunal M.A.
::------------------------------

::------------------------------
:: Initialization
::------------------------------

@echo off
color 0F
mode 60,30
title Services Manager

goto menu

::------------------------------
:: Selection Menu
::------------------------------

 :menu
cls
echo.
echo    This is the Services Manager. This script is
echo    written in Batch, and uses the Windows Command 
echo    Prompt to run custom functions. Enjoy !
echo.
echo    Please select your command :
echo.
echo    1  - Shutdown
echo    2  - Restart
echo    3  - Abort
echo.
echo    4  - Android Mirroring
echo    5  - Croc File Transfer
echo    6  - Administrator Account
echo.
echo    7  - Tiles Editor
echo    8  - System Monitor
echo    9  - Windows Registry
echo.
echo    0 - Exit
echo.

set /p select=
if %select%==1 goto redir-shut
if %select%==2 goto redir-shut
if %select%==3 goto redir-shut
if %select%==4 goto scrcpy
if %select%==5 goto croc
if %select%==6 goto verify
if %select%==7 goto redir-sys
if %select%==8 goto redir-sys
if %select%==9 goto redir-sys
if %select%==0 goto stop

goto menu

::------------------------------
:: CAPTCHA Gateway
::------------------------------

 :verify
 
set /a pass=%RANDOM%%%9000+1000

cls
echo.
echo    To ensure usage of these functions is not  
echo    accidental, please verify the code to proceed.
echo.
echo    [ 0 - Exit ]  
echo. 
echo    Verificaton ID : %pass%
echo.
echo    Please enter the ID :
echo.

set /p code=
if %code%==%pass% goto redir-verify
if %code%==0 goto menu

goto verify

::------------------------------
:: Query Handler
::------------------------------

 :redir-shut

if %select%==1 shutdown.exe /s /t 60
if %select%==2 shutdown.exe /r /t 60
if %select%==3 shutdown.exe /a

goto menu

 :redir-verify

if %select%==6 goto admin

goto menu

 :redir-sys

if %select%==7 start tiles
if %select%==8 start monitor
if %select%==9 regedit

goto menu

::------------------------------
:: Exit Message
::------------------------------

 :stop
cls
echo.
echo    [--------------------------------------]
echo    [ Thank You For Using Services Manager ]
echo    [                                      ]
echo    [            Made by Kunal             ]
echo    [--------------------------------------]
echo.
pause
exit

::------------------------------
:: Android Mirroring
::------------------------------

 :scrcpy
 
cd .\Scrcpy
adb start-server 

cls
echo.
echo    This is the Android Mirroring. It uses the scrcpy
echo    program to remote access an android device and 
echo    interact with it using the PC. For connecting 
echo    wirelessly to the PC, setup the device first.
echo.
echo    Please select your command :
echo.
echo    1 - Start Mirroring
echo    2 - Setup Wireless
echo.
echo    3 - List devices
echo    4 - Remove devices
echo.
echo    0 - Exit
echo.

set /p control=
if %control%==1 scrcpy 
if %control%==2 goto scrcpy-wireless
if %control%==3 adb devices
if %control%==4 adb disconnect
if %control%==0 goto menu

pause
goto scrcpy

 :scrcpy-wireless
echo.
echo    [--------------------------------------]
echo.
echo     NOTE : Please connect the device and 
echo            the PC to a common WiFi network.  
echo            Otherwise, this will not work.
echo.

for /f "tokens=*" %%a in ('ipconfig /all ^| find /i "DHCP Server"') do set dhcp=%%a
set ip=%dhcp:~36,16%

echo     Current DHCP Address : %ip%
echo.
echo     To proceed with the address above, do
echo     not input anything. If not, please 
echo     enter the IP address of the device.
echo.
set /p ip=
echo.
echo    [--------------------------------------]
echo.

adb tcpip 5555
adb connect %ip%:5555

echo.
echo    [--------------------------------------]
echo.
pause
goto scrcpy

::------------------------------
:: Administartor Account
::------------------------------

 :admin
cls
echo. 
echo    This function controls the activation and 
echo    deactivation of the Windows Administrator Login,
echo    gives access to ALL PRIVILEDGES in the system. 
echo.
echo    Please select your command :
echo.
echo    1 - Activate
echo    2 - Deactivate
echo.
echo    0 - Exit
echo.

set /p control=
if %control%==1 net user administrator /active:yes
if %control%==2 net user administrator /active:no
if %control%==0 goto menu

pause
goto menu

::------------------------------
:: Croc CLI
::------------------------------

 :croc
 
cd .\Croc

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

goto croc

 :croc-s

echo.
echo    [--------------------------------------]
echo.
echo     NOTE : Please connect the device and 
echo            the PC to a common WiFi network  
echo            Otherwise, this will not work.         
echo.
echo     Please move the file you need to send
echo     to the following address :
echo.
echo            C:\@Startup\Manager\Croc
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
echo    [--------------------------------------]
echo.
pause
goto croc

::------------------------------
:: Hotspot Configuration
::------------------------------

 :hotspot
cls
echo.
echo    This is the Hotspot Configuration. It allows the 
echo    use of the the Microsoft's virtual drivers to setup
echo    and control a hosted WiFi hotspot. Enjoy !
echo.
echo    Please select your command :
echo.
echo    1 - Start Service
echo    2 - Stop Service
echo.
echo    3 - Show Configuration           
echo    4 - Reset Service
echo.
echo    0 - Exit
echo.

set /p control=
if %control%==1 netsh wlan start hostednetwork
if %control%==2 netsh wlan stop hostednetwork
if %control%==3 goto hotspot-config
if %control%==4 netsh wlan set hostednetwork mode=allow ssid=Local Hotspot key=Lenovo#123 keyUsage=persistent
if %control%==0 goto menu

pause
goto hotspot

 :hotspot-config
echo.
echo    [-------------------------------------------------]
echo.
echo      Name : Local Hotspot
echo      Pass : Lenovo#1234
echo.
echo      NOTE : Microsoft Hosted Network Virtual Adapter 
echo             Driver is required to run the hotspot.
echo.
echo    [-------------------------------------------------]
echo.
pause
goto hotspot

::------------------------------
:: Web Server
::------------------------------

:server
cls
echo.
echo    Welcome to Web Server Config. This program is a 
echo    subclient to the Windows Command Prompt. Please
echo    do not use without permission or knowledge. Enjoy !
echo.
echo    Please select your command :
echo.
echo    1 - Hard Drive
echo    2 - Cloud Data
echo    3 - Sandbox
echo.
echo    0 - Exit
echo.

set /p control=
if %control%==1 goto server-hdd
if %control%==2 goto server-cloud
if %control%==3 goto server-sand
if %control%==0 goto menu
goto server

 :server-hdd
echo.
cd /d X:\
python -m http.server 8080 --bind 
goto menu

 :server-cloud
echo.
cd /d C:\Users\kunalma\Documents\MEGA
python -m http.server 8080 --bind 
192.168.43.215
goto menu

 :server-sand
echo.
cd /d E:\
python -m http.server 8080 --bind 192.168.43.215
goto menu

::------------------------------
:: GodMode Registry Folder
::------------------------------

 :godmode
cls
echo. 
echo    This function will create the GodMode Registry
echo    folder, which acts as a backdoor and easy access
echo    to the internals of the system.
echo.
echo    Continue ?
echo.
echo    1 - Yes
echo    2 - No
echo.

set /p control=
if %control%==1 goto godmode-folder
if %control%==2 goto menu

goto godmode

 :godmode-folder
cd C:\
mkdir "Special Folders
cd ".\Special Folders
mkdir "God Mode.{ED7BA470-8E54-465E-825C-99712043E01C}
mkdir "Location Settings.{00C6D95F-329C-409a-81D7-C46C66EA7F33}
mkdir "Biometric Settings.{0142e4d0-fb7a-11dc-ba4a-000ffe7ab428}
mkdir "Power Settings.{025A5937-A6BE-4686-A844-36FE4BEC8B6D}
mkdir "Icons And Notifications.{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}
mkdir "Credentials and Logins.{1206F5F1-0569-412C-8FEC-3204630DFB70}
mkdir "Programs and Features.{15eae92e-f17a-4431-9f28-805e482dafd4}
mkdir "Default Programs.{17cd9488-1228-4b2f-88ce-4298e93e0966}
mkdir "All NET Frameworks and COM Libraries.{1D2680C9-0E2A-469d-B787-065558BC7D43}
mkdir "All Networks For Current Connection.{1FA9085F-25A2-489B-85D4-86326EEDCD87}
mkdir "Network.{208D2C60-3AEA-1069-A2D7-08002B30309D}
mkdir "My Computer.{20D04FE0-3AEA-1069-A2D8-08002B30309D}
mkdir "Printers.{2227A280-3AEA-1069-A2DE-08002B30309D}
mkdir "Application Connections.{241D7C96-F8BF-4F85-B01F-E2B043341A4B}
mkdir "Firewall and Security.{4026492F-2F69-46B8-B9BF-5654FC07E423}
mkdir "Performance.{78F3955E-3B90-4184-BD14-5397C15F1EFC}
echo.
echo    GodMode Registry made successfully !!
echo         [ Check C:\ for the data ]
echo.
pause
goto menu

::------------------------------
