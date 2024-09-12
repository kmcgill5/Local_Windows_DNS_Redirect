echo off
setlocal enabledelayedexpansion
cd /d E:\Ban
[40m
:Title
cls
echo [96m=======================================================================================================================
echo [95m                                                    Website Redirect
echo [96m=======================================================================================================================
echo [91m B: (Blocks)         [33mR: (Re-direct)         [94mE: (Enables)         [92mL: (Lists sites)         [97mC: (Clear)         [90mQ: (Quit)
echo.
echo [93mBlocks entire websites, not just games on that website (ex. blocks YouTube.com, not only a certain video)
echo Please enter website as follows: www.example.com, example.com, something.example.com
echo Don't enter any http://, https://, or anything after the .com, .org, etc
:Input
echo.[97m
choice /c brelcq /n /m "What do you want to do? "
if ERRORLEVEL 255 (
    goto Input
) else if ERRORLEVEL 6 (
    break>"C:\Users\student\AppData\Local\Google\Chrome\User Data\Default\Network\Cookies"
    echo [0m
    endlocal
    echo on
) else if ERRORLEVEL 5 (
    goto Title
) else if ERRORLEVEL 4 (
    echo.[92m
    for /f "skip=21 tokens=*" %%a in (C:\Windows\System32\drivers\etc\hosts) do (echo %%a)
    goto Input
) else if ERRORLEVEL 3 (
    echo.[94m
    set /p website=What website do you want enabled? 
    findstr /v !website! C:\Windows\System32\drivers\etc\hosts >> temp.txt
    break>C:\Windows\System32\drivers\etc\hosts
    type temp.txt >> C:\Windows\System32\drivers\etc\hosts
    del temp.txt
    goto Input
) else if ERRORLEVEL 2 (
    echo.[33m
    set /p website=What website do you want re-directed? 
    set /p redirect=What is the new ipv4 address? 
    set /a len=0
    for /f %%i in ('length !redirect!') do set /a len=%%i
    set "space= "
    for /l %%k in (!len!,1,14) do set redirect=!redirect!!space!
    echo         !redirect! !website!>>C:\Windows\System32\drivers\etc\hosts
    goto Input
) else if ERRORLEVEL 1 (
    echo.[91m
    set /p website=What website do you want blocked? 
    echo         127.0.0.1       !website!>>C:\Windows\System32\drivers\etc\hosts
    goto Input
)