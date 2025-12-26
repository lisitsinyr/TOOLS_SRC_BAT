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

    set s="   123   "
    rem call :test_TrimLeft !s!
    rem call :test_TrimRight !s!
    rem call :test_Trim !s!

    set s="123456789"
    set len=4
    rem call :test_Left !s! !len!
    
    set s="123456789"
    set position=2
    set len=4
    rem call :test_Mid !s! !position! !len!

    set s=123 456 789
    rem call :test_TrimQuotes "!s!"

    rem call :test_ListToStr 1 2 3

    call :test_StrLen 1 2 3

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem function TrimLeft (ASTR) -> TrimLeft
rem --------------------------------------------------------------------------------
:test_TrimLeft
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :TrimLeft %1 || exit /b 1
    echo TrimLeft:!TrimLeft!

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

    call :TrimRight %1 || exit /b 1
    echo TrimRight:!TrimRight!

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

    call :Trim %1 || exit /b 1
    echo Trim:!Trim!

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

    call :Left %1 %2 || exit /b 1
    echo Left:!Left!

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

    call :Mid %1 %2 %3 || exit /b 1
    echo Mid:!Mid!

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

    call :TrimQuotes %* || exit /b 1
    echo TrimQuotes:!TrimQuotes!

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

    call :ListToStr %* || exit /b 1
    echo ListToStr:!ListToStr!

    echo ....test_ListToStr: Ok

    exit /b 0
rem endfunction

:len
    set len=%~2
    if not "%len%"=="" set /a %1+=1 & call :len %1 "%len:~1%"
goto :eof

rem --------------------------------------------------------------------------------
rem function test_StrLen (ASTR*) -> ListToStr
rem --------------------------------------------------------------------------------
:test_StrLen
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    Set demo=some example string
    call :StrLen demo length || exit /b 1
    echo StrLen:!StrLen!
    echo length:!length!

    Set demo=some example string
    call :StrLen4 demo length
    echo StrLen4:!StrLen4!
    echo length:!length!

    echo ....test_ListToStr: Ok

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
rem LYRStrUtils.bat
rem =================================================
:LYRStrUtilsINIT
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
:StrLen
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:StrLen4
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
