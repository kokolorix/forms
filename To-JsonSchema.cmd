
@echo off
cd /d "%~dp0"

if "%*" NEQ "" echo %*
:: empty call => call with test argument
if "%*" EQU "" call %0 SiNa18.xml
if "%~1"=="" goto:eof

:loop
:: if no more arguments break the loop
if "%~1"=="" (
  :: if not started in VSCode pause
  if "%VSCODE_PID%"=="" pause
  goto:eof
)
call:doIt %1
shift
goto:loop

:doIt
set outFile=%~dpn1.json

set path=%cd%\tools;%path%
set xslt2=%~dp0Tools\%~n0.xslt

if exist "%~1" AltovaXML.exe -xslt2 "%xslt2%" -in "%~1" -param outFile='file:///%outFile:\=/%' -out "%outFile%" 
echo Gespeichert in: %outFile% 
goto:eof

