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

    rem call :test_SetColor
    rem call :test_ReSetColor
    rem call :test_ReSetColorCR
    
    rem call :test_Write
    rem call :test_WriteCR
    rem call :test_WriteLN
    
    rem call :test_WriteLOG WriteLOG ...
    call :test_WriteNOTSET WriteNOTSET ...
    rem call :test_WriteDEBUG WriteDEBUG ...
    rem call :test_WriteINFO WriteINFO ...
    rem call :test_WriteWARNING WriteWARNING ...
    rem call :test_WriteERROR WriteERROR ...
    rem call :test_WriteCRITICAL WriteCRITICAL ...
    rem call :test_WriteBEGIN WriteBEGIN ...
    rem call :test_WriteEND WriteEND ...
    rem call :test_WritePROCESS WritePROCESS ...
    rem call :test_WriteDEBUGTEXT WriteDEBUGTEXT ...
    rem call :test_WriteTEXT WriteTEXT ...

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem -------------------------------------------------
rem  SetColor (AStyles, AFG8, ABG8, AFG256, ABG256) -> None
rem -------------------------------------------------
:test_SetColor
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :SetColor !cERROR!
    call :ReSetColor

    call :SetColor !cTEXT!
    call :Write Тест Тест Тест
    call :WriteCR
    call :ReSetColor

    echo ....test_SetColor: Ok

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

    call :SetColor !cERROR!
    call :ReSetColor

    call :SetColor !cTEXT!
    call :Write Тест Тест Тест
    call :WriteCR
    call :ReSetColor

    echo ....test_ReSetColor: Ok

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

    call :SetColor !cERROR!
    call :ReSetColorCR

    call :SetColor !cTEXT!
    call :Write Тест Тест Тест
    call :WriteCR
    call :ReSetColorCR

    echo ....test_ReSetColorCR: Ok

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

    call :Write Тест Тест Тест

    call :SetColor !cTEXT!
    call :Write Тест Тест Тест
    call :ReSetColor

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

    call :WriteCR

    call :Write Тест Тест Тест
    call :WriteCR

    call :SetColor !cERROR!
    call :Write Тест Тест Тест
    call :WriteCR
    call :ReSetColorCR

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

    call :WriteLN "Тест Тест Тест"

    call :SetColor !cERROR!
    call :WriteLN "Тест Тест Тест"
    call :ReSetColor

    call :WriteLN !cS_BOLD! !cFG8_GREEN! !cBG8_WHITE! "WriteLN ..."
    call :WriteLN !cS_BOLD! !cFG8_GREEN! !cBG8_WHITE! Тест
    call :WriteLN !cS_BOLD! !cFG8_GREEN! !cBG8_WHITE! "Тест Тест Тест"

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

    call :WriteLOG !lNOTSET! "%*"
    call :WriteLOG !lDEBUG! DEBUG
    call :WriteLOG !lINFO! INFO
    call :WriteLOG !lWARNING! WARNING
    call :WriteLOG !lERROR! ERROR
    call :WriteLOG !lCRITICAL! CRITICAL
    call :WriteLOG !lBEGIN! BEGIN
    call :WriteLOG !lEND! END
    call :WriteLOG !lPROCESS! PROCESS
    call :WriteLOG !lDEBUGTEXT! DEBUGTEXT
    call :WriteLOG !lTEXT! TEXT

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

    call :WriteNOTSET %*

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

    call :WriteDEBUG %*

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

    call :WriteINFO %*

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

    call :WriteWARNING %*

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

    call :WriteERROR %*

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

    call :WriteCRITICAL %*

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

    call :WriteBEGIN %*

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

    call :WriteEND %*

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

    call :WritePROCESS %*

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

    call :WriteDEBUGTEXT %*

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

    call :WriteTEXT %*

    echo ....test_WriteTEXT: Ok

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
rem LYRConsole.bat
rem =================================================
:LYRConsoleINIT
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
:__FormatColorStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:__aListToStr
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:__bListToStr
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
:WriteLOG2
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
