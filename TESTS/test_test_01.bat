@echo off
rem -------------------------------------------------------------------
rem test_GetINI1_py.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    rem echo Старт !BATNAME! ...

    rem set /a mmmax=!mm!
    rem for /L %%i in (0,1,!mmmax!) do (
    rem     set LValue=!LPROJECTS[%%i]!
    rem     echo .... !LValue!
    rem )

    rem FOR /F "tokens=1,2" %%a in ("гитара рыбка") do echo Моя %%a и моя %%b — выводит «Моя гитара и моя рыбка».

    rem set list=A B C D
    rem for %%a in (%list%) do ( 
    rem     echo %%a
    rem )

    exit /b 0
:end
rem =================================================
