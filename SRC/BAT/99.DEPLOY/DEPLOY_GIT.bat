@echo off
rem -------------------------------------------------------------------
rem DEPLOY_Python.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo Старт !BATNAME! ...

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_ROOT - Каталог скриптов
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_ROOT=D:
    echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    )
    rem echo SCRIPTS_DIR: !SCRIPTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB
    )
    rem echo LIB_BAT: !LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 1
    )

    set PROJECT_GROUP=GIT
    
    rem -------------------------------------------------------------------
    rem DIR_PROJECT_ROOT - Каталог группы проектов
    rem -------------------------------------------------------------------
    set DIR_PROJECTS_ROOT=!PROJECTS_LYR_DIR!\CHECK_LIST\GIT\PROJECTS_GIT
    echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!

    set PROJECT_NAME=TOOLS_SRC_GIT
    call :DEPLOY_PROJECT

    rem -------------------------------------------------------------------
    rem DIR_PROJECT_ROOT - Каталог группы проектов
    rem -------------------------------------------------------------------
    set DIR_PROJECTS_ROOT=!PROJECTS_LYR_DIR!\CHECK_LIST\GIT
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!
    set PROJECT_NAME=TOOLS_GIT
    call :DEPLOY_PROJECT

    set DIR_TOOLS_GIT_=D:\TOOLS\TOOLS_GIT
    call :git_pull !DIR_TOOLS_GIT_! || exit /b 1

    exit /b 0
:end

rem =================================================
rem LYRDEPLOY.bat
rem =================================================
:REPO_WORK
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:git_pull
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:DEPLOY_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
rem =================================================
rem LYRSupport.bat
rem =================================================
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

    set DIR_PROJECT_NAME=!DIR_PYTHON!\!PROJECT_NAME!
    rem echo DIR_PROJECT_NAME:!DIR_PROJECT_NAME!
    cd /D !DIR_PROJECT_NAME!
    rem set APPRUN=!DIR_PROJECT_NAME!\DEPLOY.bat
    set APPRUN=DEPLOY.bat
    echo APPRUN:!APPRUN!
    if exist "!APPRUN!" (
        call !APPRUN!
    )
