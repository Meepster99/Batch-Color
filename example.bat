@echo off
call color.bat 0a "0a"
call color.bat 0b "0b"
call color.bat 0c "0c"
echo(
echo(
call color.bat 19 "hi"
call color.bat 2F "black"
call color.bat 4e "white"
echo(
call color.bat 0b "this is " && call color.bat 0c "on the same line" && echo(

:: call color.bat 0b ">" -- this does not work
:: restricted characters:   " ~ # % & * ( ) { } \ : < > ? / + |
