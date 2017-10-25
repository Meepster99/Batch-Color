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
rem these 2 characters are backspaces, with a single space in between them.
<nul set /p ".=%DEL%" > "%~2" 
findstr /v /a:%1 /R "^$" "%~2" nul 
rem makes a file named "message.txt" containing a backspace, space, and another backspace
rem findstr is the only capable command of outputing only one color. 
rem the /a:%1 does this. Then what this does is
rem takes the file made in the previous command. /v prints only lines that dont contain a match.
rem /R is for regular expressions, and "^" targets the start of the line, and "$" targets the end
rem the only thing the file will now output is back, space, back.
rem and this is where /v comes in. since "back, space, back" does not match the filter of /R "^$",
rem it will be outputted.
rem HOWEVER, the way that findstr outputs data is filename:data.
rem the problem here is that annoying colon. if only we could backspace it.
rem thats where the data comes in.  The data backspaces the linefeed first, and then the colon, leaving 
rem us with the result.
rem however, there is still one problem. the command findstr /v /a:%1 /R "^$" "%~2" still will not
rem output colors.  findstr only supports colors when there are multiple files in use.
rem however, we only want to use 1.  But, what is something that cant exist in batch and windows
rem nul.  then all ls set. 
del "%~2" > nul
rem the above file just deletes the "message.txt" file we made.

goto :eof