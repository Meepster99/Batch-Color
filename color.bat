@echo off
set "DEL= " 
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul 
del "%~2" > nul
goto :eof