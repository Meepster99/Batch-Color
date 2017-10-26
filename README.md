# Batch-Color
## A batch program to color individual letters, using pure batch.

What it does, and how it works

Usage:

call color.bat [hexidecimal color code] "Message"

sample usage: call color.bat 0b "im feeling blue" && echo(

color.bat 0b "im feeling blue" && echo(

"echo(" echos a newline, as color.bat does not by default, so you can have 

multiple colors on the same line.

also, due to the nature of how this works, certain symbols will kill the program.

if you cannot have the character in a filename, it wont work here.  
But expect it to work in a future release.
" ~ # % & * ( ) { } \ : < > ? / + |  Do not work!

for a list of color codes, type color /?


set "DEL= " 

these 2 characters are backspaces, with a single space in between them.

<nul set /p ".=%DEL%" > "%~2" 

makes a file named "message.txt" containing a backspace, space, and another backspace
the <nul is there, since that makes it able to accept spaces in the variable, but then it also accepts things like %DEL%
echo %DEL% > "%~2" would not work

findstr /v /a:%1 /R "^$" "%~2" nul 

findstr is the only capable command of outputing only one color. 
the /a:%1 does this. Then what this does is
takes the file made in the previous command. /v prints only lines that dont contain a match.
/R is for regular expressions, and "^" targets the start of the line, and "$" targets the end
the only thing the file will now output is back, space, back.
and this is where /v comes in. since "back, space, back" does not match the filter of /R "^$",
it will be outputted.
HOWEVER, the way that findstr outputs data is filename:data.
the problem here is that annoying colon. if only we could backspace it.
thats where the data comes in.  The data backspaces the linefeed first, and then the colon, leaving 
us with the result.
however, there is still one problem. the command findstr /v /a:%1 /R "^$" "%~2" still will not
output colors.  findstr only supports colors when there are multiple files in use.
however, we only want to use 1.  But, what is something that cant exist in batch and windows
nul.  then all ls set.

del "%~2" > nul

the above file just deletes the "message.txt" file we made.
