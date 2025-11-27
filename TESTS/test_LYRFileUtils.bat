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

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=

    set /a LOG_FILE_ADD=0

    call :test_LYRFileUtils
    call :test_ExtractFileDir
    call :test_FullFileName
    call :test_ExtractFileName
    call :test_ExtractFileNameWithoutExt
    call :test_ExtractFileExt
    call :test_FileAttr
    call :test_FileSize
    call :test_CreateDir
    call :test_CreateFile
    call :test_CheckFile
    call :test_CurrentDir
    call :test_COPY_FILE
    call :test_COPY_FILES
    call :test_XCOPY_FILES

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRFileUtils () -> None
rem --------------------------------------------------------------------------------
:test_LYRFileUtils
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRFileUtils || exit /b 1

    echo ....test_LYRFileUtils: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function ExtractFileDir (AFullFilename) -> ExtractFileDir
rem --------------------------------------------------------------------------------
:test_ExtractFileDir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :ExtractFileDir || exit /b 1

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

    call :FullFileName || exit /b 1

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

    call :ExtractFileName || exit /b 1

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

    call :ExtractFileNameWithoutExt || exit /b 1

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

    call :LYRFileUtils || exit /b 1

    echo ....test_LYRFileUtils: Ok

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

    call :FileAttr || exit /b 1

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

    call :FileSize || exit /b 1

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

    call :CreateDir || exit /b 1

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

    call :ClearDir || exit /b 1

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

    call :CreateFile || exit /b 1

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

    call :CheckFile || exit /b 1

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

    call :COPY_FILE || exit /b 1

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

    call :COPY_FILES || exit /b 1

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

    call :XCOPY_FILES || exit /b 1

    echo ....test_XCOPY_FILES: Ok

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRFileUtils.bat
rem =================================================
:LYRFileUtils
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
