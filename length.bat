@echo off

:: Variables
set var=%1
set /a length=0

::Loop
:While
set var=%var:~1%
set /a length=length+1
if NOT DEFINED var (echo %length%) ELSE (goto While)

echo on