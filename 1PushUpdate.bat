@echo off
setlocal ENABLEDELAYEDEXPANSION

set /p curr=< currentVersion

SET a=%curr:~0,1%
SET b=%curr:~2,3%

set /a "d=%b%+1"
if %d% gtr 9 (
	set /a "a=%a%+1"
	set /a "d=0"
)

echo %a%.%d%>currentVersion
echo %a%.%d%>version

.\PortableGit\bin\git.exe add .
.\PortableGit\bin\git.exe commit -m "%a%.%d%"
.\PortableGit\bin\git.exe push -u origin main

pause