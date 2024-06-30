<!-- :: Batch section
@echo off
setlocal

del .\dinput8.dll
del /s /q .\mods
@RD /S /Q ".\mods"
del .\ModLoader2\config_eldenring.toml
FINDSTR /R /I /V "^$ @import "update.css";" default.css>default.css.tmp
move /Y "default.css.tmp" "default.css" > nul

powershell.exe -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/haydenrh77/EldenRingMods/main/version -OutFile version"
set /p curr=< currentVersion 
set /p new=< version

if %new% gtr %curr% (
	echo update available
	echo @import "update.css"; >> default.css
)

echo Select an option:
for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "HTAreply=%%a"
echo End of HTA window, reply: "%HTAreply%"
if %HTAreply%==1 (start "" cmd /c ".\start_protected_game.exe")
rem if %HTAreply%==2 (xcopy "mods_ranged_rework\" "mods\")
rem if %HTAreply%==2 (cd ModLoader2)
rem if %HTAreply%==2 (xcopy ".\config_eldenring_ranged_rework.toml" ".\config_eldenring.toml*")
if %HTAreply%==2 (start "" cmd /c ".\ersc_launcher.exe")
if %HTAreply%==3 (xcopy "mods_randomizer\" "mods\")
if %HTAreply%==3 (cd ModLoader2)
if %HTAreply%==3 (xcopy ".\config_eldenring_randomizer.toml" ".\config_eldenring.toml*")
if %HTAreply%==3 (start cmd /k Call ".\launchmod_eldenring.bat")
if %HTAreply%==4 (start cmd /k Call ".\update.bat")
if %HTAreply%==5 (exit)
goto :EOF
-->


<HTML>
<HEAD>
<HTA:APPLICATION SCROLL="no" SYSMENU="no" >
<link href="default.css" rel="stylesheet" type="text/css">

<TITLE>Hayden's Simple Launcher</TITLE>

<SCRIPT language="JavaScript">
window.resizeTo(400,500);

function closeHTA(reply){
   var fso = new ActiveXObject("Scripting.FileSystemObject");
   fso.GetStandardStream(1).WriteLine(reply);
   window.close();
}


</SCRIPT>
</HEAD>
<BODY style="background-color:#A7B8D9;">
   <button class="button" onclick="closeHTA(1);">Unmodded</button>
   <button class="button" onclick="closeHTA(2);">Seamless Coop Only</button>
   <button class="button" onclick="closeHTA(3);" disabled>Randomized Seamless Coop</button>
   <button class="updateButton" onclick="closeHTA(4);">Update</button>
   <button class="button" onclick="closeHTA(5);">Exit</button>
   <br><br><h3 class=update>NEW UPDATE AVAILABLE!</h3>
   <img class="barn" src="barn.png" alt="Barn" width="325" height="238"> 
</BODY>
</HTML>