@echo off
rem -------------------------------------------------------------------
rem test_LYRFileUtils.bat
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

    set FileName=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\test_LYRFileUtils.bat
    rem call :test_ExtractFileDir !FileName!
    rem call :test_FullFileName !FileName!
    rem call :test_ExtractFileName !FileName!
    rem call :test_ExtractFileNameWithoutExt !FileName!
    rem call :test_ExtractFileExt !FileName!
    rem call :test_FileAttr !FileName!
    rem call :test_FileSize !FileName!

    set DirParh=test
    rem call :test_CreateDir !DirParh!

    set FileName=WORK\testfile.txt
    rem call :test_CreateFile !FileName!
    rem call :test_CheckFile !FileName!

    rem call :test_CurrentDir

    set FileName=WORK\testfile.txt
    set DirTO=TEMP
    rem call :test_COPY_FILE !FileName! !DirTO!
    rem call :test_COPY_FILE !FileName! !DirTO! /Y

    set DirFROM=.\
    set DirTO=TEMP
    set MASK=*.bat
    set sub1=/R
    set sub2=/Y
    rem call :test_COPY_FILES !DirFROM! !DirTO! !MASK! "" ""

    set DirFROM=TEST_BAT\
    set DirTO=TEMP
    set MASK=*.bat
    rem call :test_XCOPY_FILES !DirFROM! !DirTO! !MASK! ""

    set FileName=WORK\requirements.txt
    rem call :test_CHANGE_STR !FileName! "==" ">="
    
    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem function ExtractFileDir (AFullFilename) -> ExtractFileDir
rem --------------------------------------------------------------------------------
:test_ExtractFileDir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ExtractFileDir %1 || exit /b 1
    echo ExtractFileDir:!ExtractFileDir!

    echo ....test_ExtractFileDir: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function FullFileName (AFilename) -> FullFileName
rem --------------------------------------------------------------------------------
:test_FullFileName
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :FullFileName %1 || exit /b 1
    echo FullFileName:!FullFileName!

    echo ....test_FullFileName: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function ExtractFileName (AFilename) -> ExtractFileName
rem --------------------------------------------------------------------------------
:test_ExtractFileName
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ExtractFileName %1 || exit /b 1
    echo ExtractFileName:!ExtractFileName!

    echo ....test_ExtractFileName: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function ExtractFileNameWithoutExt (AFileName) -> ExtractFileNameWithoutExt
rem --------------------------------------------------------------------------------
:test_ExtractFileNameWithoutExt
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ExtractFileNameWithoutExt %1 || exit /b 1
    echo ExtractFileNameWithoutExt:!ExtractFileNameWithoutExt!

    echo ....test_ExtractFileNameWithoutExt: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function ExtractFileExt (AFileName) -> ExtractFileExt
rem --------------------------------------------------------------------------------
:test_ExtractFileExt
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ExtractFileExt %1 || exit /b 1
    echo ExtractFileExt:!ExtractFileExt!

    echo ....test_ExtractFileExt: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function FileAttr (AFileName) -> FOLDER
rem --------------------------------------------------------------------------------
:test_FileAttr
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :FileAttr %1 || exit /b 1
    echo FileAttr:!FileAttr!

    echo ....test_FileAttr: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function FileSize (AFileName) -> FileSize
rem --------------------------------------------------------------------------------
:test_FileSize
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :FileSize %1 || exit /b 1
    echo FileSize:!FileSize!

    echo ....test_FileSize: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function CreateDir (ADIRECTORY) -> CreateDir
rem --------------------------------------------------------------------------------
:test_CreateDir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :CreateDir %1 || exit /b 1
    echo CreateDir:!CreateDir!

    echo ....test_CreateDir: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function ClearDir (ADIRECTORY, AMASK) -> None
rem --------------------------------------------------------------------------------
:test_ClearDir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ClearDir %1 %2 || exit /b 1
    echo ClearDir:!ClearDir!

    echo ....test_ClearDir: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function CreateFile (AFILENAME) -> CreateFile
rem --------------------------------------------------------------------------------
:test_CreateFile
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :CreateFile %1 || exit /b 1
    echo CreateFile:!CreateFile!

    echo ....test_CreateFile: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function CheckFile (FILENAME) -> CheckFile
rem --------------------------------------------------------------------------------
:test_CheckFile
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :CheckFile %1 || exit /b 1
    echo CheckFile:!CheckFile!

    echo ....test_CheckFile: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function CurrentDir () -> CurrentDir
rem --------------------------------------------------------------------------------
:test_CurrentDir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :CurrentDir || exit /b 1
    echo CurrentDir:!CurrentDir!

    echo ....test_CurrentDir: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure COPY_FILE (FileName, DIR_TO, /Y) -> None
rem --------------------------------------------------------------------------------
:test_COPY_FILE
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :COPY_FILE %1 %2 %3 || exit /b 1
    echo COPY_FILE:!COPY_FILE!

    echo ....test_COPY_FILE: Ok

    exit /b 0
rem endfunction


rem --------------------------------------------------------------------------------
rem procedure COPY_FILES (DIR_FROM, DIR_TO, MASK, /R /Y) -> None
rem --------------------------------------------------------------------------------
:test_COPY_FILES
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :COPY_FILES %1 %2 %3 %4 %5 || exit /b 1
    echo COPY_FILES:!COPY_FILES!

    echo ....test_COPY_FILES: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure XCOPY_FILES (DIR_FROM, DIR_TO, MASK, ARG) -> None
rem --------------------------------------------------------------------------------
:test_XCOPY_FILES
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :XCOPY_FILES %1 %2 %3 %4 || exit /b 1
    echo XCOPY_FILES:!XCOPY_FILES!

    echo ....test_XCOPY_FILES: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CHANGE_STR (FileName, str_find, str_replace) -> None
rem --------------------------------------------------------------------------------
:test_CHANGE_STR
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :CHANGE_STR %1 %2 %3 || exit /b 1
    echo CHANGE_STR:!CHANGE_STR!

    echo ....test_CHANGE_STR: Ok

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
rem LYRFileUtils.bat
rem =================================================
:LYRFileUtilsINIT
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FullFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileNameWithoutExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileAttr
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileSize
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:COPY_FILE
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:COPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:XCOPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CHANGE_STR
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
