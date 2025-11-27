@echo off
rem -------------------------------------------------------------------
rem test_LYRStrUtils.bat
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

    call :test_LYRStrUtils
    call :test_TrimLeft
    call :test_TrimRight
    call :test_Trim
    call :test_Left
    call :test_Mid
    call :test_TrimQuotes
    call :test_ListToStr

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRStrUtils () -> None
rem --------------------------------------------------------------------------------
:test_LYRStrUtils
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRStrUtils || exit /b 1

    echo ....test_LYRStrUtils: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function TrimLeft (ASTR) -> TrimLeft
rem --------------------------------------------------------------------------------
:test_TrimLeft
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :TrimLeft || exit /b 1

    echo ....test_TrimLeft: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function TrimRight (ASTR) -> TrimRight
rem --------------------------------------------------------------------------------
:test_TrimRight
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :TrimRight || exit /b 1

    echo ....test_TrimRight: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function Trim (ASTR) -> Trim
rem --------------------------------------------------------------------------------
:test_Trim
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :Trim || exit /b 1

    echo ....test_Trim: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function Left (ASTR, Alen) -> Left
rem --------------------------------------------------------------------------------
:test_Left
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :Left || exit /b 1

    echo ....test_Left: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function  Mid (ASTR, Aposition, Alen) -> Mid
rem --------------------------------------------------------------------------------
:test_Mid
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :Mid || exit /b 1

    echo ....test_Mid: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function TrimQuotes (ASTR) -> TrimQuotes
rem --------------------------------------------------------------------------------
:test_TrimQuotes
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    set s="test" 
    echo !s!
    call :TrimQuotes !s! || exit /b 1
    echo !TrimQuotes!

    echo ....test_TrimQuotes: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function ListToStr (ASTR*) -> ListToStr
rem --------------------------------------------------------------------------------
:test_ListToStr
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ListToStr || exit /b 1

    echo ....test_ListToStr: Ok

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRStrUtils.bat
rem =================================================
:LYRStrUtils
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimLeft
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimRight
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Trim
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Left
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Mid
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimQuotes
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:ListToStr
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
