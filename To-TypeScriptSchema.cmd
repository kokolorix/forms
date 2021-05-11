
@echo off
cd /d "%~dp0"
set wait=5

if "%*" NEQ "" echo %*
:: empty call => call with test argument
if "%*" EQU "" call %0 SiNa18.xml
if "%~1"=="" goto:eof

:loop
:: if no more arguments break the loop
if "%~1"=="" (
  :: Wenn mit Coderunner in VS-Code gestartet wurde, sofort beeenden
  if "%VSCODE_PID%" NEQ "" goto:eof

  choice /c wq /t %wait% /d q /m "W=pause, Q=quit(%wait%s)"
  if errorlevel 2 goto:eof
  if errorlevel 1 goto:pause
)
call:doIt %1
shift
goto:loop

:pause
pause
goto:eof

:doIt
set outFile=%~dpn1.ts

set path=%cd%\tools;%path%
set xslt2=%~dp0Tools\%~n0.xslt

if exist "%~1" AltovaXML.exe -xslt2 "%xslt2%" -in "%~1" -param outFile='file:///%outFile:\=/%' -out "%outFile%" 
echo Gespeichert in: %outFile% 
goto:eof

