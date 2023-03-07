del Game.zip

powershell.exe -Command "Invoke-WebRequest -OutFile .\Game.zip https://www.dropbox.com/s/xrmqibvjxa9jnb8/Game.zip?dl=1"

powershell.exe -Command "Expand-Archive Game.zip -DestinationPath .\.temp"

xcopy /y .\.temp .\

del Game.zip
del /s /q .\.temp
@RD /S /Q ".\.temp"

set "file=complete.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs

exit