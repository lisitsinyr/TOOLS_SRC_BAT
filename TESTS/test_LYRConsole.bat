@echo off
rem -------------------------------------------------------------------
rem test_LYRConsole.bat
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

    call :test_LYRConsole

    call :test_LYRConsole
    call :test_ConsoleTEST_00
    call :test_ConsoleTEST_01
    call :test_ConsoleTEST_02
    call :test_FormatColorStr
    call :test_aListToStr
    call :test_bListToStr
    call :test_SetColor
    call :test_ReSetColorCR
    call :test_ReSetColor
    call :test_Write
    call :test_WriteCR
    call :test_WriteLN
    call :test_WriteLOG
    call :test_WriteNOTSET
    call :test_WriteDEBUG
    call :test_WriteINFO
    call :test_WriteWARNING
    call :test_WriteERROR
    call :test_WriteCRITICAL
    call :test_WriteBEGIN
    call :test_WriteEND
    call :test_WritePROCESS
    call :test_WriteDEBUGTEXT
    call :test_WriteTEXT

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRConsole () -> None
rem --------------------------------------------------------------------------------
:test_LYRConsole
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRConsole || exit /b 1

    echo ....test_LYRConsole: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ConsoleTEST_00 () -> None
rem --------------------------------------------------------------------------------
:test_ConsoleTEST_00
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ConsoleTEST_00 || exit /b 1

    echo ....test_ConsoleTEST_00: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ConsoleTEST_01 () -> None
rem --------------------------------------------------------------------------------
:test_ConsoleTEST_01
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ConsoleTEST_01 || exit /b 1

    echo ....test_ConsoleTEST_01: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ConsoleTEST_02 () -> None
rem --------------------------------------------------------------------------------
:test_ConsoleTEST_02
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ConsoleTEST_02 || exit /b 1

    echo ....test_ConsoleTEST_02: Ok

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  FormatColorStr (AStyles, AFG8, ABG8, AFG256, ABG256, AESC, s) -> FormatColorStr
rem -------------------------------------------------
:test_FormatColorStr
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :FormatColorStr || exit /b 1

    echo ....test_FormatColorStr: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function aListToStr (ASTR*) -> aListToStr
rem --------------------------------------------------------------------------------
:test_aListToStr
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :aListToStr || exit /b 1

    echo ....test_aListToStr: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function bListToStr (ASTR*) -> bListToStr
rem --------------------------------------------------------------------------------
:test_bListToStr
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :bListToStr || exit /b 1

    echo ....test_bListToStr: Ok

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  SetColor (AStyles, AFG8, ABG8, AFG256, ABG256) -> None
rem -------------------------------------------------
:test_SetColor
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :SetColor || exit /b 1

    echo ....test_SetColor: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ReSetColorCR () -> None
rem --------------------------------------------------------------------------------
:test_ReSetColorCR
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ReSetColorCR || exit /b 1

    echo ....test_ReSetColorCR: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ReSetColor () -> None
rem --------------------------------------------------------------------------------
:test_ReSetColor
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ReSetColor || exit /b 1

    echo ....test_ReSetColor: Ok

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  Write (s, ...) -> None
rem -------------------------------------------------
:test_Write
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :Write || exit /b 1

    echo ....test_Write: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteCR () -> None
rem --------------------------------------------------------------------------------
:test_WriteCR
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteCR || exit /b 1

    echo ....test_WriteCR: Ok

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem WriteLN (AStyles, AFG8, ABG8, AFG256, ABG256, s) -> None
rem -------------------------------------------------
:test_WriteLN
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteLN || exit /b 1

    echo ....test_WriteLN: Ok

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteLOG (Level, s) -> None
rem -------------------------------------------------
:test_WriteLOG
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteLOG || exit /b 1

    echo ....test_WriteLOG: Ok

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteNOTSET (s*) -> None
rem -------------------------------------------------
:test_WriteNOTSET
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteNOTSET || exit /b 1

    echo ....test_WriteNOTSET: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteDEBUG (s*) -> None
rem --------------------------------------------------------------------------------
:test_WriteDEBUG
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteDEBUG || exit /b 1

    echo ....test_WriteDEBUG: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteINFO (s*) -> None
rem --------------------------------------------------------------------------------
:test_WriteINFO
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteINFO || exit /b 1

    echo ....test_WriteINFO: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteWARNING (s*) -> None
rem --------------------------------------------------------------------------------
:test_WriteWARNING
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteWARNING || exit /b 1

    echo ....test_WriteWARNING: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteERROR (s*) -> None
rem --------------------------------------------------------------------------------
:test_WriteERROR
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteERROR || exit /b 1

    echo ....test_WriteERROR: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteCRITICAL (s*) -> None
rem --------------------------------------------------------------------------------
:test_WriteCRITICAL
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteCRITICAL || exit /b 1

    echo ....test_WriteCRITICAL: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteBEGIN (s*) -> None
rem --------------------------------------------------------------------------------
:test_WriteBEGIN
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteBEGIN || exit /b 1

    echo ....test_WriteBEGIN: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteEND (s*) -> None
rem --------------------------------------------------------------------------------
:test_WriteEND
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteEND || exit /b 1

    echo ....test_WriteEND: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WritePROCESS (s*) -> None
rem --------------------------------------------------------------------------------
:test_WritePROCESS
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WritePROCESS || exit /b 1

    echo ....test_WritePROCESS: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteDEBUGTEXT (s*) -> None
rem --------------------------------------------------------------------------------
:test_WriteDEBUGTEXT
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteDEBUGTEXT || exit /b 1

    echo ....test_WriteDEBUGTEXT: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure WriteTEXT (s*) -> None
rem --------------------------------------------------------------------------------
:test_WriteTEXT
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :WriteTEXT || exit /b 1

    echo ....test_WriteTEXT: Ok

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRConsole.bat
rem =================================================
:LYRConsole
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_00
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_01
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_02
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:FormatColorStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:aListToStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:bListToStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:SetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColorCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:Write
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLOG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteNOTSET
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteINFO
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteWARNING
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteERROR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCRITICAL
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteBEGIN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteEND
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WritePROCESS
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUGTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
