@echo off
rem -------------------------------------------------------------------
rem test_LYRPY.bat
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

    set projects_dir=
    rem call :test_SET_projects_dir
    rem pause
    rem call :test_GET_projects_dir
    rem pause

    set projects_dir=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir
    rem call :test_SET_projects_dir
    rem pause
    rem call :test_GET_projects_dir
    rem pause

    set project_name=
    rem call :test_SET_project_name
    rem pause
    rem call :test_GET_project_name
    rem pause

    set project_name=project_name
    rem call :test_SET_project_name
    rem pause
    call :test_GET_project_name
    rem pause

    set project_dir=
    rem call :test_SET_project_dir
    rem pause
    rem call :test_GET_project_dir
    rem pause

    set project_dir=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir\projectdir
    rem call :test_SET_project_dir
    rem pause
    rem call :test_GET_project_dir
    rem pause

rem pause

    set script_dir=
    rem call :test_SET_script_dir
    rem call :test_GET_script_dir

    set script_dir=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir\scriptdir
    rem call :test_SET_script_dir
    rem call :test_GET_script_dir

rem pause

    set script=
    rem call :test_SET_script
    rem call :test_GET_script

    set script=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir\scriptdir\HelloWorld.py
    rem call :test_SET_script
    rem call :test_GET_script

rem pause

    set project_dir=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir\projectdir

    set venv_dir=
    rem call :test_SET_venv_dir
    rem call :test_GET_venv_dir

    set venv_dir=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir\projectdir
    rem call :test_SET_venv_dir "!project_dir!" "!venv_dir!"
    rem call :test_GET_venv_dir "!project_dir!" "!venv_dir!"

rem pause

    set python_dir=3.13
    rem call :test_GET_python_dir
    rem call :test_SET_python_dir

    set python_dir=
    rem call :test_GET_python_dir
    rem call :test_SET_python_dir

rem pause

    set requirements_file=
    rem call :test_GET_requirements_file

    set requirements_file=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir\projectdir\requirements_file
    rem call :test_GET_requirements_file

rem pause

    set package_names=
    rem call :test_GET_package_names

    set package_names=a b c
    rem call :test_GET_package_names

rem pause

    set VENV_DIR=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313\
    set venv_dir=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir\projectdir
    rem call :test_VENV_START !VENV_DIR!

rem pause

    set VENV_DIR=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313\
    set venv_dir=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir\projectdir
    rem call :test_VENV_STOP !VENV_DIR!

rem pause

    set VENV_DIR=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\VENV\P313\
    set venv_dir=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT\TESTS\projectsdir\projectdir
    rem call :test_VENV_UPDATE !VENV_DIR!

rem pause

    exit /b 0
:end
rem =================================================

rem --------------------------------------------------------------------------------
rem function test_SET_project_dir () -> project_dir
rem --------------------------------------------------------------------------------
:test_SET_project_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar project_dir

    call :SET_project_dir project_dir !project_dir! || exit /b 1
    echo SET_project_dir:!SET_project_dir!

    echo project_dir=!cd!
    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_project_dir () -> project_dir
rem --------------------------------------------------------------------------------
:test_GET_project_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar project_dir

    call :CurrentDir || exit /b 1
    set VarDefault=!CurrentDir!

    call :GET_project_dir project_dir "project_dir_caption" "!VarDefault!" || exit /b 1
    echo GET_project_dir:!GET_project_dir!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_SET_projects_dir () -> projects_dir
rem --------------------------------------------------------------------------------
:test_SET_projects_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar projects_dir

    call :SET_projects_dir projects_dir !projects_dir!! || exit /b 1
    echo SET_projects_dir:!SET_projects_dir!

    echo projects_dir=!cd!
    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_projects_dir () -> projects_dir
rem --------------------------------------------------------------------------------
:test_GET_projects_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar projects_dir

    call :CurrentDir || exit /b 1
    set VarDefault=!CurrentDir!

    call :GET_projects_dir projects_dir "projects_dir_caption" "!VarDefault!" || exit /b 1
    echo GET_projects_dir:!GET_projects_dir!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_SET_project_name () -> project_name
rem --------------------------------------------------------------------------------
:test_SET_project_name
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar project_name

    call :SET_project_name project_name !project_name! || exit /b 1
    echo SET_project_name:!SET_project_name!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_project_name () -> project_name
rem --------------------------------------------------------------------------------
:test_GET_project_name
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar project_name

    call :GET_project_name project_name "project_name_caption" "" || exit /b 1
    echo GET_project_name:!GET_project_name!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_SET_script_dir () -> script_dir
rem --------------------------------------------------------------------------------
:test_SET_script_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar script_dir

    call :SET_script_dir script_dir !script_dir! || exit /b 1
    echo SET_script_dir:!SET_script_dir!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_test_GET_script_dir () -> script_dir
rem --------------------------------------------------------------------------------
:test_GET_script_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar script_dir

    call :CurrentDir || exit /b 1
    set VarDefault=!CurrentDir!

    call :GET_script_dir script_dir "script_dir_caption" "!VarDefault!" || exit /b 1
    echo GET_script_dir:!GET_script_dir!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_SET_script () -> script
rem --------------------------------------------------------------------------------
:test_SET_script
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar script

    call :SET_script script !script! || exit /b 1
    echo SET_script:!SET_script!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_script () -> script
rem --------------------------------------------------------------------------------
:test_GET_script
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar script

    call :GET_script script "script_dir_caption" ""  || exit /b 1
    echo GET_script:!GET_script!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_SET_venv_dir () -> venv_dir
rem --------------------------------------------------------------------------------
:test_SET_venv_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar venv_dir

    call :SET_VENV_DIR !project_dir! venv_dir !venv_dir! || exit /b 1
    echo SET_venv_dir:!SET_venv_dir!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_venv_dir () -> venv_dir
rem --------------------------------------------------------------------------------
:test_GET_venv_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar venv_dir

    call :GET_VENV_DIR !project_dir! venv_dir "VENV_DIR_caption" "" || exit /b 1
    echo GET_venv_dir:!GET_venv_dir!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_SET_python_dir () -> python_dir
rem --------------------------------------------------------------------------------
:test_SET_python_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar python_dir

    call :SET_python_dir python_dir !python_dir! || exit /b 1
    echo SET_python_dir:!SET_python_dir!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_python_dir () -> python_dir
rem --------------------------------------------------------------------------------
:test_GET_python_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar python_dir

    call :GET_python_dir python_dir "project_dir_caption" "3.13" || exit /b 1
    echo GET_python_dir:!GET_python_dir!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_requirements_file () -> requirements_file
rem --------------------------------------------------------------------------------
:test_GET_requirements_file
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar requirements_file

    call :GET_requirements_file requirements_file "requirements_file_caption" ""
    echo GET_requirements_file:!GET_requirements_file!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_package_names () -> package_names
rem --------------------------------------------------------------------------------
:test_GET_package_names
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar requirements_file

    call :GET_package_names package_names "package_names_caption" ""
    echo GET_package_names:!GET_package_names!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure test_VENV_START () -> None
rem -----------------------------------------------
:test_VENV_START
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar venv_dir

    call :VENV_START !venv_dir! || exit /b 1
    echo VENV_START:!VENV_START!

    echo ....%0: Ok
 
    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure test_VENV_STOP () -> None
rem -----------------------------------------------
:test_VENV_STOP
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar venv_dir

    call :VENV_STOP !venv_dir! || exit /b 1
    echo VENV_STOP:!VENV_STOP!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure test_VENV_UPDATE (r) -> None
rem -----------------------------------------------
:test_VENV_UPDATE
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :EchoVar venv_dir

    rem call :VENV_UPDATE !venv_dir! || exit /b 1
    echo VENV_UPDATE:!VENV_UPDATE!

    echo ....%0: Ok

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
rem LYRPY.bat
rem =================================================
:LYRPYINIT
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:SET_project_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_project_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:SET_projects_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_projects_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:SET_project_name
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_project_name
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:SET_script_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_script_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:SET_project_name
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_project_name
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:SET_script_name
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_script_name
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:SET_venv_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_venv_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:SET_python_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_python_dir
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:SET_script
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_script
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_requirements_file
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:GET_package_names
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:VENV_START
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:VENV_STOP
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:VENV_UPDATE
%LIB_BAT%\LYRPY.bat %*
exit /b 0

rem =================================================
rem LYRFileUtils.bat
rem =================================================
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
:COPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:XCOPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CHANGE_STR
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0

rem =================================================
rem LYRLog.bat
rem =================================================
:LYRLogINIT
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SETVarLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SHORTLevelName
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__LOG_STR
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogConsole
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:EchoVar
%LIB_BAT%\LYRLog.bat %*
exit /b 0
