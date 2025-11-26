@echo off
rem -------------------------------------------------------------------
rem test_LYRSupport.bat
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

    
    rem call :test_LYRSupport
    
    rem call :test_PressAnyKey
    
    rem call :test_Pause

    rem call :test_Read_P 01 "O1 default" "O1 caption"

    rem call :test_Read_P 01 "" "O1 caption"

    rem call :test_Read_F

    rem call :test_Read_N 1 2 3

    rem call :test_GetDir
    rem call :test_GetFile
    rem call :test_FORCicle
    rem call :test_GetSET
    rem call :test_GetCMD
    rem call :test_CheckErrorlevel
    rem call :test_GET_Ox

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRSupport () -> None
rem --------------------------------------------------------------------------------
:test_LYRSupport
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRSupport || exit /b 1

    echo ....test_LYRSupport: Ok

    rem pause

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure PressAnyKey ()
rem --------------------------------------------------------------------------------
:test_PressAnyKey
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :PressAnyKey || exit /b 1

    echo ....test_PressAnyKey: Ok

    rem pause

    exit /b 0
rem endfunction
   
rem --------------------------------------------------------------------------------
rem procedure Pause (APause) -> None
rem --------------------------------------------------------------------------------
:test_Pause
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :Pause 1 || exit /b 1

    echo ....test_Pause: Ok

    rem pause

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Read_P (P_Name, P_Value, P_Caption) -> None
rem --------------------------------------------------------------------------------
:test_Read_P
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    rem имя переменной
    set Aname=%1
    rem echo Aname:!Aname!
    rem значение переменной по умолчанию
    set Adefault=%~2
    rem echo Adefault:!Adefault!
    rem caption переменной
    set Acaption=%~3
    rem echo Acaption:!Acaption!

    rem [!%Aname%!] - значение переменной по умолчанию
    set Ox=!%Aname%!
    rem echo Ox:!Ox!

    rem !Aname! - имя переменной
    set Ox_Name=!Aname!
    rem echo Ox_Name:!Ox_Name!
    rem !Acaption! - caption переменной
    set Ox_Caption=!Acaption!
    rem echo Ox_Caption:!Ox_Caption!
    rem !Adefault!значение переменной по умолчанию
    set Ox_Default=!Adefault!
    rem echo Ox_Default:!Ox_Default!
    set Ox=!Ox_Default!
    rem echo Ox:!Ox!
    set PN_CAPTION=!Ox_Caption!
    rem echo PN_CAPTION:!PN_CAPTION!

    if not defined Ox (
        call :Read_P Ox "!Adefault!" "!Acaption!" || exit /b 1
        set !Aname!=!Ox!
    ) else (
        rem call :Read_P Ox || exit /b 1
        set !Aname!=!Ox!
    )
    if defined Ox (
        rem set !Aname!=!%Aname%!
        set !Aname!=!Ox!
    ) else (
        set !Aname!=
        echo INFO: Ox [Ox_Name:!Ox_Name! Ox_Caption:!Ox_Caption!] not defined ...
        rem echo INFO: Ox [Ox_Name:!Aname! Ox_Caption:!Acaption!] not defined ...
    )
    echo !Aname!:!%Aname%!
    
    echo ....test_Read_P: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure Read_F (P_Name, P_List, ADefault, ACaption, Atimeout) -> None
rem --------------------------------------------------------------------------------
:test_Read_F
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    rem set C1_Name=C1
    rem set C1_List=123456789ABCDEFGHIQ
    rem set C1_Caption=operation
    rem set C1_Default=Q
    rem set C1=!O1_Default!
    rem set PN_CAPTION=!C1_Caption!
    rem procedure Read_F (P_Name, P_List, ADefault, ACaption, Atimeout)
    rem call :Read_F C1 !C1_List! !C1_Default! !C1_Caption! 10 || exit /b 1
    rem echo C1:!C1!
    rem set ChoiceOperation=!C1!
    
    set no-dev=N
    set PN_CAPTION=Do not update the development dependencies. ^(Deprecated^)
    call :Read_F no-dev "yN" N "!PN_CAPTION!" 0 || exit /b 1
    if defined no-dev (
        echo no-dev: !no-dev!
    )

    echo ....test_Read_F: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function Read_N () -> Read_N
rem --------------------------------------------------------------------------------
:test_Read_N
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    rem -------------------------------------------------------------------
    rem Количество аргументов
    rem -------------------------------------------------------------------
    call :Read_N %* || exit /b 1
    echo Read_N:!Read_N!

    pause

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetDir (ASET, Aview, Aarg) -> None
rem --------------------------------------------------------------------------------
:test_GetDir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GetDir || exit /b 1

    pause

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetFile (ASET, Aview, Aarg) -> None
rem --------------------------------------------------------------------------------
:test_GetFile
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GetFile || exit /b 1

    pause

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure FORCicle (Astart, Astep, Aend) -> None
rem --------------------------------------------------------------------------------
:test_FORCicle
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :FORCicle || exit /b 1

    pause

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetSET (ASET Adelims Atokens) -> None
rem --------------------------------------------------------------------------------
:test_GetSET
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GetSET || exit /b 1

    pause

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetCMD (ASET Adelims Atokens) -> None
rem --------------------------------------------------------------------------------
:test_GetCMD
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GetCMD || exit /b 1

    pause

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CheckErrorlevel (ATEXT, AERRORLEVEL, APAUSE) -> None
rem --------------------------------------------------------------------------------
:test_CheckErrorlevel
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :CheckErrorlevel || exit /b 1

    pause

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_Ox (Aname Acaption Adefault) -> script
rem --------------------------------------------------------------------------------
:test_GET_Ox
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GET_Ox || exit /b 1

    pause

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRSupport.bat
rem =================================================
:LYRSupport
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetDir
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetFile
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:FORCicle
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetSET
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetCMD
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:CheckErrorlevel
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GET_Ox
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem ===================================================================
