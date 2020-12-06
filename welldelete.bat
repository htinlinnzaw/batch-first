@echo off
prompt $p$g

:destroy
color E0
cls
dir /a/w
set /p m= destroy to -

:why
set /p val = sure deleted, you select directory (y/n)?
if /i "%val%" == "y" goto: del
if /i "%val%" == "n" goto: destroy
goto: why

:del
if not exist %m% goto: driveDestroyError
attrib -s -h -r %M%
del /f /q %M%
if not exist %M% goto: shredComp
rd /s %M%

:shredComp
color 1A
echo MyBox = MsgN=Box("File and Folder has been deleted", 6000, "Htin") > drivedestroy.vbs
start /w drivedestroy.vbs
del /f /q drivedestroy.vbs
goto: destroy

:driveDestroyError
color 4E
echo MyBox = MsgN=Box("File and Folder doesn't exist", 6000, "Htin") > folderatt.vbs
start /w folderatt.vbs
del /f /q folderatt.vbs
goto: destroy
