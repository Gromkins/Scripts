@echo off
rem ===================================================================================================
rem This script checks TeamViewer and AnyDesk are installed on your system and removes them.
rem Author Tihon Lipatov (email:gromkins@gmail.com)
rem ===================================================================================================

rem Create logfile
echo script started > C:\script.txt

rem Check if TeamViewer are installed in system
if exist "%programfiles%\TeamViewer\TeamViewer.exe" (
	echo TeamViewer is found >> C:\script.txt
rem Stop service and uninstall TeamViewer
	net stop TeamViewer && "%programfiles%\TeamViewer\uninstall.exe" /S && echo TeamViewer has been removed >> C:\script.txt
) 
if exist "%programfiles(x86)%\TeamViewer\TeamViewer.exe" (
	echo TeamViewer 32 bit is found >> C:\script.txt
rem Stop service and uninstall TeamViewer
	net stop TeamViewer && "%programfiles(x86)%\TeamViewer\uninstall.exe" /S && echo TeamViewer has been removed >> C:\script.txt
) else (
	echo TeamViewer not found >> C:\script.txt
)

rem Check if Anydesk are installed in system
if exist "%programfiles(x86)%\AnyDesk\AnyDesk.exe" (
	echo AnyDesk is found >> C:\script.txt
rem Kill process, uninstall Anydesk and remove Anydesk directory
	taskkill /F /IM Anydesk* && "%programfiles(x86)%\AnyDesk\AnyDesk.exe" --remove --silent && rmdir /S /Q "%Programfiles(x86)%\anydesk" && echo AnyDesk has been removed >> C:\script.txt
) else (
	echo AnyDesk not found >> C:\script.txt
)

echo script ended >> C:\script.txt