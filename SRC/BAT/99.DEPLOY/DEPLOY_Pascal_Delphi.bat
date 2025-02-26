@echo off
rem -------------------------------------------------------------------
rem DEPLOY_Python.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo ����� !BATNAME! ...

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_ROOT - ������� ��������
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_ROOT=D:
    rem echo PROJECTS_LYR_ROOT:!PROJECTS_LYR_ROOT!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - ������� ��������
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=!PROJECTS_LYR_ROOT!\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - ������� ��������
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    )
    rem echo SCRIPTS_DIR: !SCRIPTS_DIR!

    rem -------------------------------------------------------------------
    rem LIB_BAT - ������� ���������� ��������
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB
    )
    rem echo LIB_BAT: !LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: ������� ���������� LYR !LIB_BAT! �� ����������...
        exit /b 1
    )

    set PROJECT_GROUP=Pascal_Delphi
    
    rem -------------------------------------------------------------------
    rem DIR_PROJECT_ROOT - ������� ������ ��������
    rem -------------------------------------------------------------------
    set DIR_PROJECTS_ROOT=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT
    set DIR_PROJECTS_ROOT=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Pascal_Delphi\Delphi_7\PROJECTS_D7
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!

    set PROJECT_NAME=LUIS_D7
    rem call :REPO_WORK !DIR_LUIS_D7! 0 || exit /b 1
    call :DEPLOY_PROJECT

    set PROJECT_NAME=TOOLS_D7
    rem call :REPO_WORK !DIR_TOOLS_D7! 0 || exit /b 1
    call :DEPLOY_PROJECT
    rem call :UPDATE_TOOLS_D7 || exit /b 1


    rem -------------------------------------------------------------------
    rem DIR_PROJECT_ROOT - ������� ������ ��������
    rem -------------------------------------------------------------------
    set DIR_PROJECTS_ROOT=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT
    set DIR_PROJECTS_ROOT=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Pascal_Delphi\Delphi_11\PROJECTS_D11
    rem echo DIR_PROJECTS_ROOT:!DIR_PROJECTS_ROOT!

    set PROJECT_NAME=LUIS_D11
    rem call :REPO_WORK !DIR_LUIS_D11! 0 || exit /b 1
    call :DEPLOY_PROJECT
 
    set PROJECT_NAME=TOOLS_D11
    rem call :REPO_WORK !DIR_TOOLS_D11! 0 || exit /b 1
    call :DEPLOY_PROJECT
    rem call :UPDATE_TOOLS_D11 || exit /b 1

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
