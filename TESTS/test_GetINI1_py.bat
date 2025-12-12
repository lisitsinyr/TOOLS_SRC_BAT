@echo off
rem -------------------------------------------------------------------
rem test_GetINI1_py.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    rem echo Старт !BATNAME! ...

    set WorkDir=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\SCRIPTS_PY\SRC\SCRIPTS_PY\GetINI\
    call !WorkDir!GetINI1_py.bat PROJECT.ini general PROJECTS_GROUP

    exit /b 0
:end
rem =================================================
