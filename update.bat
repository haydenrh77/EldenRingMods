@echo off
del Game.zip

if not exist "PortableGit\" (
	.\PortableGit-2.39.2-64-bit.7z.exe -o "PortableGit" -y
	.\PortableGit\bin\git.exe init .
	.\PortableGit\bin\git.exe remote add origin https://github.com/haydenrh77/EldenRingMods.git
	.\PortableGit\bin\git.exe fetch --all
	.\PortableGit\bin\git.exe reset --hard origin/main
	
	.\PortableGit\bin\git.exe pull origin main
)

.\PortableGit\bin\git.exe pull origin main

rem powershell.exe -Command "Invoke-WebRequest -OutFile .\Game.zip https://www.dropbox.com/s/xrmqibvjxa9jnb8/Game.zip?dl=1"

rem powershell.exe -Command "Expand-Archive Game.zip -DestinationPath .\.temp"

rem xcopy /y .\.temp .\

rem del Game.zip
rem del /s /q .\.temp
rem @RD /S /Q ".\.temp"

set "file=complete.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs

pause