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

    call :test_SET_project_dir

    rem call :test_GET_project_dir
    rem call :test_SET_projects_dir
    rem call :test_GET_projects_dir
    rem call :test_SET_project_name
    rem call :test_GET_project_name
    rem call :test_SET_script_dir
    rem call :test_GET_script_dir
    rem call :test_SET_script
    rem call :test_GET_script
    rem call :test_SET_venv_dir
    rem call :test_GET_venv_dir
    rem call :test_SET_python_dir
    rem call :test_GET_python_dir
    rem call :test_GET_requirements_file
    rem call :test_GET_package_names
    rem call :test_VENV_START
    rem call :test_VENV_STOP
    rem call :test_VENV_UPDATE

    exit /b 0
:end
rem =================================================

rem --------------------------------------------------------------------------------
rem function SET_project_dir (Aproject_dir) -> project_dir
rem --------------------------------------------------------------------------------
:test_SET_project_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    set project_dir=

    call :SET_project_dir !project_dir! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_dir (Aproject_dir) -> project_dir
rem --------------------------------------------------------------------------------
:test_GET_project_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    set project_dir=

    call :GET_project_dir !project_dir! || exit /b 1

rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_projects_dir (Aprojects_dir) -> projects_dir
rem --------------------------------------------------------------------------------
:test_SET_projects_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_projects_dir (projects_dir) -> projects_dir
rem --------------------------------------------------------------------------------
:test_GET_projects_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_project_name (Aproject_name) -> project_name
rem --------------------------------------------------------------------------------
:test_SET_project_name
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_name (Aproject_name) -> project_name
rem --------------------------------------------------------------------------------
:test_GET_project_name
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_script_dir (Ascript_dir) -> script_dir
rem --------------------------------------------------------------------------------
:test_SET_script_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_script_dir (Ascript_dir) -> script_dir
rem --------------------------------------------------------------------------------
:test_GET_script_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_script (Ascript) -> script
rem --------------------------------------------------------------------------------
:test_SET_script
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_script (script) -> script
rem --------------------------------------------------------------------------------
:test_GET_script
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function venv_dir (Aproject_dir Avenv_dir) -> venv_dir
rem --------------------------------------------------------------------------------
:test_SET_venv_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :SET_VENV_DIR !project_dir! !VENV_DIR! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_venv_dir (project_dir venv_dir) -> venv_dir
rem --------------------------------------------------------------------------------
:test_GET_venv_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function SET_python_dir (Apython_dir) -> python_dir
rem --------------------------------------------------------------------------------
:test_SET_python_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_python_dir (python_dir) -> python_dir
rem --------------------------------------------------------------------------------
:test_GET_python_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_requirements_file (requirements_file) -> requirements_file
rem --------------------------------------------------------------------------------
:test_GET_requirements_file
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_package_names (package_names) -> package_names
rem --------------------------------------------------------------------------------
:test_GET_package_names
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure VENV_START (Avenv_dir) -> None
rem -----------------------------------------------
:test_VENV_START
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :VENV_START !VENV_DIR! || exit /b 1
 
    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure VENV_STOP (Avenv_dir) -> None
rem -----------------------------------------------
:test_VENV_STOP
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :VENV_STOP !VENV_DIR! || exit /b 1

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure VENV_UPDATE (Avenv_dir) -> None
rem -----------------------------------------------
:test_VENV_UPDATE
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    rem call :VENV_UPDATE !VENV_DIR! || exit /b 1

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
