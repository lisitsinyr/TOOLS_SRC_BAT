@echo off
rem -------------------------------------------------------------------
rem INIT_TOOLS_SRC_BAT.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo ����� !BATNAME! ...

    rem -------------------------------------------------------------------
    rem ��������� PROJECTS_LYR_DIR
    rem -------------------------------------------------------------------
    call :INIT_PROJECTS_LYR_DIR
    rem -------------------------------------------------------------------
    rem ��������� ������� PATTERN
    rem -------------------------------------------------------------------
    call :INIT_PROJECT
    rem -------------------------------------------------------------------
    rem ��������� LIB LYR
    rem -------------------------------------------------------------------
    call :INIT_LIB "$1"

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem --------------------------------------------------------------------------------
rem procedure INIT_PROJECTS_LYR_DIR ()
rem --------------------------------------------------------------------------------
:INIT_PROJECTS_LYR_DIR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=INIT_PROJECTS_LYR_DIR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - ������� �������� LYR
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR:!PROJECTS_LYR_DIR!

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure INIT_PROJECT ()
rem -----------------------------------------------
:INIT_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=INIT_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    if not defined INIT_PROJECT (
        rem -------------------------------------------------------------------
        rem ������������� ������� PATTERN
        rem -------------------------------------------------------------------
        set PROJECT=TOOLS_SRC_BAT
        set PROJECTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT
        set PROJECT_DIR=!PROJECTS_DIR!\!PROJECT!
        set LPROJECTSET=!PROJECT_DIR!\!PROJECT!_SET.bat
    
        if not exist "!LPROJECTSET!" (
            echo INFO: ���� "!LPROJECTSET!" �� ����������...
        ) else (
            echo INFO: �������� !LPROJECTSET! ...
            call "!LPROJECTSET!"
        )
        set INIT_PROJECT=1
    )

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure INIT_LIB (SCRIPT)
rem -----------------------------------------------
:INIT_LIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=INIT_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    if not defined INIT_LIB (
        rem -------------------------------------------------------------------
        rem SCRIPTS_DIR - ������� ��������
        rem -------------------------------------------------------------------
        set SCRIPTS_DIR=!PROJECTS_LYR_DIR!\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
        rem -------------------------------------------------------------------
        rem LIB_BAT - ������� ���������� ��������
        rem -------------------------------------------------------------------
        if not defined LIB_SH (
            set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB
        )
        if not exist "!LIB_BAT!"\ (
            echo ERROR: ������� ���������� LYR !LIB_BAT! �� ����������...
        ) else (
            rem -------------------------------------------------------------------
            rem ������������� ���������� LYR
            rem -------------------------------------------------------------------
            echo INFO: ������������� ���������� LYR !LIB_BAT! ...
            call "!LIB_BAT!"\LYRINIT.bat "$1"
        )
    )

    exit /b 0
rem endfunction
