@echo off
rem -------------------------------------------------------------------
rem test_LYRLog.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов BAT
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\SRC\LIB
    )
    rem echo LIB_BAT:!LIB_BAT!
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 1
    )

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=

    set /a LOG_FILE_ADD=0

    call :test_LYRLog
    call :test_AddLogConsole
    call :test_AddLog
    call :test_AddLogFile
    call :test_StartLogFile
    call :test_StopLogFile

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRLog () -> None
rem --------------------------------------------------------------------------------
:test_LYRLog
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRLog || exit /b 1

    echo ....test_LYRLog: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure AddLogConsole (s*) -> None
rem --------------------------------------------------------------------------------
:test_AddLogConsole
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :AddLogConsole || exit /b 1

    echo ....test_AddLogConsole: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure AddLog (Aout, Alevel, ...) -> None
rem --------------------------------------------------------------------------------
:test_AddLog
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :AddLog || exit /b 1

    echo ....test_AddLog: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure AddLogFile (Aout, AFileName) -> None
rem --------------------------------------------------------------------------------
:test_AddLogFile
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :AddLogFile || exit /b 1

    echo ....test_AddLogFile: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure StartLogFile () -> None
rem --------------------------------------------------------------------------------
:test_StartLogFile
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :StartLogFile || exit /b 1

    echo ....test_StartLogFile: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure StopLogFile () -> None
rem --------------------------------------------------------------------------------
:test_StopLogFile
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :StopLogFile || exit /b 1

    echo ....test_StopLogFile: Ok

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRLog.bat
rem =================================================
:LYRLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SETVarLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SHORTLevelName
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__LOG_STR
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogConsole
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
