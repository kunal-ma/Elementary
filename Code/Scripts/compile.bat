:: C Compiler terminal script for Windows

:: Note : put this file in the same folder
:: as gcc.exe, and ensure the directory
:: is in PATH.

:: Usage : "compile *filename*" in terminal

@echo off
cls
set file=%1
cd /d E:\Container
gcc -g %file%.c -o %file% -lm
if %ERRORLEVEL% == 0 .\%file%.exe
