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

    set LFILEINI_test01=BAT.ini 
    set LFILEINI_test02=PROJECT.ini

    rem call :test_SetINI !LFILEINI_test02! general PROJECTS_GROUP 623476817

    rem call :test_GetINI !LFILEINI_test02! general2 PROJECTS_GROUP2
    rem call :test_GetINI !LFILEINI_test02! general2 "" ""
    rem call :test_GetINI !LFILEINI_test02! "" "" ""

    rem call :test_GetINIPY !LFILEINI_test02! general2 PROJECTS_GROUP2
    rem call :test_GetINIPY !LFILEINI_test02! general2 ""  ""
    rem call :test_GetINIPY !LFILEINI_test02! "" "" ""

    rem call :test_GetINIParametr !LFILEINI_test02! general2 PROJECTS_GROUP2 ""
    rem call :test_GetINIParametr !LFILEINI_test02! general2 ""  ""  ""
    rem call :test_GetINIParametr !LFILEINI_test02! "" ""  ""  ""

    rem call :test_GetINI !LFILEINI_test01! SCRIPTS_BAT PROJECT_DIR
    rem call :test_GetINIPY !LFILEINI_test01! SCRIPTS_BAT PROJECT_DIR
    call :test_GetINIParametr !LFILEINI_test01! SCRIPTS_BAT PROJECT_DIR ""
    
    set PROJECTS_NAME=None

    rem call :test_GetINI !LFILEINI_test01! PROJECTS_NAME "" PROJECTS_NAME
    rem call :test_GetINIPY !LFILEINI_test01! PROJECTS_NAME "" PROJECTS_NAME

    rem call :test_GetINIParametr !LFILEINI_test01! PROJECTS_NAME "" PROJECTS_NAME ""
    
    rem call :test_GetFileParser !LFILEINI_test02!

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure SetINI (AFileName, ASection, AKeyName, AValue) -> None
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
rem procedure GetINI (AFileName, ASection, AKeyName) -> None
rem --------------------------------------------------------------------------------
:test_GetINI
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    echo "%~1" "%~2" "%~3" "%~4"
    set a1=%~1
    set a2=%~2
    set a3=%~3
    set a4=%~4

    call :GetINI "%~1" "%~2" "%~3" "%~4"
    if defined a1 ( if defined a2 ( if defined a3 (
        echo KeyName:!KeyName!
        echo KeyValue:!KeyValue!
    )))

    if !SectionsCount! GEQ 0 (
        echo SectionsCount:!SectionsCount!
        rem for /L %%переменная in (начало, шаг, конец) do (оператор)
        for /L %%i in (0, 1, !SectionsCount!) do (
            set LSection=!Sections[%%i]!
            echo !LSection! 
        )
    )

    if !KeyNamesCount! GEQ 0 (
        echo KeyNamesCount:!KeyNamesCount!
        for /L %%i in (0, 1, !KeyNamesCount!) do (
            echo .... i:%%i ....
            if defined PROJECTS_NAME (
                rem set LPROJECTS_NAME=!KeyNames[%%i]!
                set LPROJECTS_NAME=!PROJECTS_NAME[%%i]!
                echo LPROJECTS_NAME:!LPROJECTS_NAME!
            ) else (
                set LKeyName=!KeyNames[%%i]!
                echo LKeyName:!LKeyName! 
            )
        )
    )

    echo ....test_GetINI: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure GetINIPY (AFileName, ASection, AKeyName) -> None
rem --------------------------------------------------------------------------------
:test_GetINIPY
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    echo "%~1" "%~2" "%~3" "%~4"
    set a1=%~1
    set a2=%~2
    set a3=%~3
    set a4=%~4

    call :GetINIPY "%~1" "%~2" "%~3" "%~4"
    if defined a1 ( if defined a2 ( if defined a3 (
        echo KeyName:!KeyName!
        echo KeyValue:!KeyValue!
    )))

    if !SectionsCount! GEQ 0 (
        echo SectionsCount:!SectionsCount!
        rem for /L %%переменная in (начало, шаг, конец) do (оператор)
        for /L %%i in (0, 1, !SectionsCount!) do (
            set LSection=!Sections[%%i]!
            echo !LSection! 
        )
    )

    if !KeyNamesCount! GEQ 0 (
        echo KeyNamesCount:!KeyNamesCount!
        for /L %%i in (0, 1, !KeyNamesCount!) do (
            echo .... i:%%i ....
            if defined PROJECTS_NAME (
                rem set LPROJECTS_NAME=!KeyNames[%%i]!
                set LPROJECTS_NAME=!PROJECTS_NAME[%%i]!
                echo LPROJECTS_NAME:!LPROJECTS_NAME!
            ) else (
                set LKeyName=!KeyNames[%%i]!
                echo LKeyName:!LKeyName! 
            )
        )
    )

    echo ....test_GetINIPY: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure test_GetINIParametr (AFileName, ASection, AKeyName, AKeyNames) -> None
rem --------------------------------------------------------------------------------
:test_GetINIParametr
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    echo "%~1" "%~2" "%~3" "%~4"
    set a1=%~1
    set a2=%~2
    set a3=%~3
    set a4=%~4

    call :GetINIParametr "%~1" "%~2" "%~3" "%~4"
    if defined a1 ( if defined a2 ( if defined a3 (
        echo KeyName:!KeyName!
        echo KeyValue:!KeyValue!
    )))

    if !SectionsCount! GEQ 0 (
        echo SectionsCount:!SectionsCount!
        rem for /L %%переменная in (начало, шаг, конец) do (оператор)
        for /L %%i in (0, 1, !SectionsCount!) do (
            set LSection=!Sections[%%i]!
            echo !LSection! 
        )
    )

    call :GetLenArray Sections
    echo GetLenArray:!GetLenArray!

    if !KeyNamesCount! GEQ 0 (
        echo KeyNamesCount:!KeyNamesCount!
        for /L %%i in (0, 1, !KeyNamesCount!) do (
            echo .... i:%%i ....
            if defined PROJECTS_NAME (
                rem set LPROJECTS_NAME=!KeyNames[%%i]!
                set LPROJECTS_NAME=!PROJECTS_NAME[%%i]!
                echo LPROJECTS_NAME:!LPROJECTS_NAME!
            ) else (
                set LKeyName=!KeyNames[%%i]!
                echo LKeyName:!LKeyName! 
            )
        )
    )
    
    echo ....test_GetINIParametr: Ok

    rem call :GetLenArray !Sections!
    rem echo GetLenArray:!GetLenArray!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure test_GetINIParametr2 (AFileName, ASection, AKeyName, AKeyNames) -> None
rem --------------------------------------------------------------------------------
:test_GetINIParametr2
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    echo "%~1" "%~2" "%~3" "%~4"
    echo "%~1" "%~2" "%~3" "%~4"
    set a1=%~1
    set a2=%~2
    set a3=%~3
    set a4=%~4

    call :GetINIParametr2 "%~1" "%~2" "%~3" "%~4"
    if defined a1 ( if defined a2 ( if defined a3 (
        echo KeyName:!KeyName!
        echo KeyValue:!KeyValue!
    )))

    if !SectionsCount! GEQ 0 (
        echo SectionsCount:!SectionsCount!
        rem for /L %%переменная in (начало, шаг, конец) do (оператор)
        for /L %%i in (0, 1, !SectionsCount!) do (
            set LSection=!Sections[%%i]!
            echo !LSection! 
        )
    )

    if !KeyNamesCount! GEQ 0 (
        echo KeyNamesCount:!KeyNamesCount!
        for /L %%i in (0, 1, !KeyNamesCount!) do (
            echo .... i:%%i ....
            if defined PROJECTS_NAME (
                rem set LPROJECTS_NAME=!KeyNames[%%i]!
                set LPROJECTS_NAME=!PROJECTS_NAME[%%i]!
                echo LPROJECTS_NAME:!LPROJECTS_NAME!
            ) else (
                set LKeyName=!KeyNames[%%i]!
                echo LKeyName:!LKeyName! 
            )
        )
    )

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

    call :GetFileParser %1 "=" "1,2" "#"
    echo GetFileParser:!GetFileParser!

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
:GetINIParametr2
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetFileParser
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0

rem =================================================
rem LYRSupport.bat
rem =================================================
:LYRSupportINIT
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
:Read_P_editenv
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
:GetLenArray
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
