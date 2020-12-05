@echo off
prompt $p$g
title Control Registry Editor
:control
cls
echo Control Registry Editor
echo 1. Disable Registry Editor
echo 2. Enable Registry Editor
set/p val = Your choice;
if "%val%" == "1" goto -1
if "%val%" == "2" goto -2
:-1
reg add hkcu\software\microsoft\windows\currentversion\policies\explorer /v disableregistrytools /t reg_dword /d 1 /f
pause
goto :control
:-2
reg delete hkcu\software\microsoft\windows\currentversion\policies\explorer /v disableregistrytools /f
pause
goto :control