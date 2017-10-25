@echo off
if [%1]==[/?] (
	goto help
	) else (
	if [%1]==[] (
		goto help
		)
	goto main
	)
:help
echo How to use.
echo call color.bat [hexidecimal color code] "Message"
echo sample usage: call color.bat 0b "im feeling blue" && echo(
call color.bat 0b "im feeling blue" && echo(
echo "echo(" echos a newline, as color.bat does not by default, so you can have 
echo multiple colors on the same line.
echo also, due to the nature of how this works, certain symbols will kill the program.
echo if you cannot have the character in a filename, it wont work here.  But expect it to work
echo in a future release.
echo " ~ # % & * ( ) { } \ : < > ? / + |
echo for a list of color codes, type color /?
goto :eof
:main
set "DEL= "
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul
goto :eof
