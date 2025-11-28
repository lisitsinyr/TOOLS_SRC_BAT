@echo off
rem -------------------------------------------------------------------
rem test_LYRParserINI.bat
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

    rem -------------------------------------------------------------------
    rem Настройка среды
    rem -------------------------------------------------------------------
    call :SET_LIB %~f0 || exit /b 1

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=

    set /a LOG_FILE_ADD=0

    call :test_SetINI
    call :test_GetINI
    call :test_GetINIParametr
    call :test_GetFileParser

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure SetINI (AFileName, ASection, AParameter, AValue) -> None
rem --------------------------------------------------------------------------------
:test_SetINI
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :SetINI pyproject.toml tool.poetry name PATTERN_PY || exit /b 1

    echo ....test_SetINI: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINI (AFileName, ASection, AParameter) -> None
rem --------------------------------------------------------------------------------
:test_GetINI
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GetINI pyproject.toml || exit /b 1

    echo ....test_GetINI: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINIPY (AFileName, ASection, AParameter) -> None
rem --------------------------------------------------------------------------------
:test_GetINIPY
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GetINIPY || exit /b 1

    echo ....test_GetINIPY: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINIParametr (AFileName, ASection, AParameter) -> None
rem --------------------------------------------------------------------------------
:test_GetINIParametr
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    rem call :GetINIParametr pyproject.toml tool.poetry name || exit /b 1
    rem call :GetINIParametr pyproject.toml tool.poetry description || exit /b 1
    call :GetINIParametr pyproject.toml tool.poetry || exit /b 1

    rem call :GetFileParser test.txt ";" "1,2,3,4,5" "#" || exit /b 1
    rem echo !token1!!token2!!token3!!token4!!token5!

    echo ....test_GetINIParametr: Ok

    exit /b 0
rem endfunction
rem --------------------------------------------------------------------------------
rem procedure GetFileParser (AFileName Adelims Atokens Aeol) -> None
rem --------------------------------------------------------------------------------
:test_GetFileParser
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GetFileParser pyproject.toml "=" "1,2" "#" || exit /b 1

    rem call :GetFileParser test.txt ";" "1,2,3,4,5" "#" || exit /b 1
    rem echo !token1!!token2!!token3!!token4!!token5!

    echo ....test_GetFileParser: Ok

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRLIB.bat
rem =================================================
:LYRLIBINIT
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_LIB
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_POETRY
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:__SET_VAR_SCRIPT
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:__SET_VAR_DEFAULT
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:__SET_VAR_PROJECTS
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:__SET_LOG
%LIB_BAT%\LYRLIB.bat %*
exit /b 0

rem =================================================
rem LYRParserINI.bat
rem =================================================
:LYRParserINIINIT
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:SetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINIPY
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINIParametr
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetFileParser
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
