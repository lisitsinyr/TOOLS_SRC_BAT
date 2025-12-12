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

    call :test_GetINI PROJECT.ini general PROJECTS_GROUP
    
    rem call :test_SetINI PROJECT.ini general PROJECTS_GROUP 623476817
    rem call :test_GetINI PROJECT.ini general PROJECTS_GROUP

    rem call :test_GetINIParametr PROJECT.ini general PROJECTS_GROUP

    call :test_GetINIPY PROJECT.ini general PROJECTS_GROUP
    
    rem call :test_GetFileParser

    rem call :test_ PROJECT.ini

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

    call :SetINI %1 %2 %3 %4
    echo SetINI:!SetINI!

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

    call :GetINI %1 %2 %3
    echo GetINI:!GetINI!

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

    call :GetINIPY %1 %2 %3
    echo GetINIPY:!GetINIPY!

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

    call :GetINIParametr %1 %2 %3
    echo GetINIParametr:!GetINIParametr!

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

    call :GetFileParser PROJECT.ini "=" "1,2" "#"
    echo GetFileParser:!GetFileParser!

    echo ....test_GetFileParser: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure test_
rem --------------------------------------------------------------------------------
:test_
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    set FILEINI=%1

    call :GetINI !FILEINI!
    echo GetINI_file:!GetINI!
    rem call :GetINIPY !FILEINI!
    rem call :GetINIParametr !FILEINI!

    rem call :GetLenArray !Sections!
    rem echo GetLenArray:!GetLenArray!

    rem set /a nmax=SectionsCount-1
    for /L %%i in (0,1,!SectionsCount!) do (
        set Section=!Sections[%%i]!
        echo !Section! 

        call :GetINI !FILEINI! !Section!

        rem set /a kmax=ParametersCount-1
        for /L %%i in (0,1,!ParametersCount!) do (
            set Parameter=!Parameters[%%i]!
            echo !Parameter!

            call :GetINI !FILEINI! !Section! !Parameter!
            echo GetINI:!GetINI!
            
            call :GetINIParametr !FILEINI! !Section! !Parameter!
            echo GetINIParametr:!GetINIParametr!
            rem echo !ParameterValue!
        )
    )

    rem set list=A B C D
    rem for %%a in (%list%) do ( 
    rem     echo %%a
    rem )

    echo ....test_: Ok

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
