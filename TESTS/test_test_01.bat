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

    rem Как удалить все переменные в cmd (только в одном окне)?
    rem Совершенно верно, можно при помощи for с ключом /f обработать вывод команды set без параметров, получив имена всех (почти) определённых переменных среды (частей выводимых строк до знака =: delims==):
    rem for /f "delims==" %v in ('set') do  set "%v="
    rem (при использовании в командных файлах % перед переменной цикла надо удвоить).


    exit /b 0
:end
rem =================================================
