@echo off
rem -------------------------------------------------------------------
rem test_LYRUV.bat
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

    rem call :test_UV_python_list
rem pause
    rem call :test_UV_python_install 3.13
rem pause
    rem call :test_UV_python_uninstall 3.10
rem pause
    rem call :test_UV_python_run
rem pause
    rem call :test_UV_python_upgrade
rem pause
    rem call :test_UV_python_find 3.13
rem pause
    rem call :test_UV_python_dir
rem pause
    rem call :test_UV_python_version
rem pause
    rem call :test_UV_python_pin 3.13
rem pause
    rem call :test_UV_help
rem pause
    rem auth
    rem run
    rem init
    rem add
    rem remove
    rem version
    rem sync
    rem lock
    rem export
    rem tree
    rem format
    rem tool
    rem python
    rem pip
    rem venv
    rem build
    rem publish
    rem cache
    rem self
    rem generate-shell-completion
    rem call :test_UV_help_cmd init
rem pause
    rem call :test_UV_version
rem pause
    rem call :test_UV_self cmd
rem pause
    rem call :test_UV_self_version
rem pause
    rem call :test_UV_install_self
rem pause
    rem call :test_UV_install_other
rem pause
    rem call :test_UV_update_self
rem pause
    rem call :test_UV_install_pip
rem pause
    rem call :test_UV_upgrade_pip
rem pause
    set python_version=3.13
    call :test_GET_python_version
pause
    rem app
    rem lib
    rem bare
    rem script
    rem call :test_GET_project_type
rem pause
    rem call :test_GET_package
rem pause
    rem call :test_GET_no-workspace
rem pause

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem -----------------------------------------------
rem procedure UV_python_list () -> None
rem -----------------------------------------------
:test_UV_python_list
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_python_list || exit /b 1
    echo UV_python_list:!UV_python_list!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_install (Aversion) -> version
rem -----------------------------------------------
:test_UV_python_install
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_python_install %1 || exit /b 1
    echo UV_python_install:!UV_python_install!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_uninstall (Aversion) -> version
rem -----------------------------------------------
:test_UV_python_uninstall
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_python_uninstall %1 || exit /b 1
    echo UV_python_uninstall:!UV_python_uninstall!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_run () -> None
rem -----------------------------------------------
:test_UV_python_run
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_python_run || exit /b 1
    echo UV_python_run:!UV_python_run!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_upgrade () -> None
rem -----------------------------------------------
:test_UV_python_upgrade
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_python_upgrade || exit /b 1
    echo UV_python_upgrade:!UV_python_upgrade!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_find (Aversion) -> version
rem -----------------------------------------------
:test_UV_python_find
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_python_find %1 || exit /b 1
    echo UV_python_find:!UV_python_find!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_dir () -> None
rem -----------------------------------------------
:test_UV_python_dir
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_python_dir || exit /b 1
    echo UV_python_dir:!UV_python_dir!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_version () -> None
rem -----------------------------------------------
:test_UV_python_version
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_python_version || exit /b 1
    echo UV_python_version:!UV_python_version!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_pin (Aversion) -> version
rem -----------------------------------------------
:test_UV_python_pin
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_python_pin %1 || exit /b 1
    echo UV_python_pin:!UV_python_pin!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_help () -> None
rem -----------------------------------------------
:test_UV_help
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_help || exit /b 1
    echo UV_help:!UV_help!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_help_cmd () -> None
rem -----------------------------------------------
:test_UV_help_cmd
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_help_cmd %1 || exit /b 1
    echo UV_help_cmd:!UV_help_cmd!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_version () -> None
rem -----------------------------------------------
:test_UV_version
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_version || exit /b 1
    echo UV_version:!UV_version!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_self (cmd) -> None
rem -----------------------------------------------
:test_UV_self
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_self %1 || exit /b 1
    echo UV_self:!UV_self!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_self_version () -> None
rem -----------------------------------------------
:test_UV_self_version
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_self_version || exit /b 1
    echo UV_self_version:!UV_self_version!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_install_self () -> None
rem -----------------------------------------------
:test_UV_install_self
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_install_self || exit /b 1
    echo UV_install_self:!UV_install_self!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_install_other () -> None
rem -----------------------------------------------
:test_UV_install_other
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_install_other || exit /b 1
    echo UV_install_other:!UV_install_other!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_update_self () -> None
rem -----------------------------------------------
:test_UV_update_self
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_update_self || exit /b 1
    echo UV_update_self:!UV_update_self!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_install_pip () -> None
rem -----------------------------------------------
:test_UV_install_pip
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_install_pip || exit /b 1
    echo UV_install_pip:!UV_install_pip!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_upgrade_pip () -> None
rem -----------------------------------------------
:test_UV_upgrade_pip
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :UV_upgrade_pip || exit /b 1
    echo UV_upgrade_pip:!UV_upgrade_pip!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_python_version () -> python_version
rem --------------------------------------------------------------------------------
:test_GET_python_version
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GET_python_version python_version "python_version_caption" "3.13" || exit /b 1
    echo GET_python_version:!GET_python_version!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_project_type () -> project_type
rem --------------------------------------------------------------------------------
:test_GET_project_type
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GET_project_type project_type "project_type_caption" "app" || exit /b 1
    echo GET_project_type:!GET_project_type!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_package () -> package
rem --------------------------------------------------------------------------------
:test_GET_package
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GET_package package "package_caption" "Y" || exit /b 1
    echo GET_package:!GET_package!

    echo ....%0: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function test_GET_no-workspace () -> no-workspace
rem --------------------------------------------------------------------------------
:test_GET_no-workspace
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :GET_no-workspace no-workspace "no-workspace_caption" "Y" || exit /b 1
    echo GET_no-workspace:!GET_no-workspace!

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
rem LYRUV.bat
rem =================================================
:LYRUVINIT
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_python_list
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_python_install
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_python_uninstall
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_python_run
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_python_upgrade
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_python_find
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_python_dir
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_python_version
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_python_pin
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_help
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_help_cmd
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_version
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_self
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_self_version
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_install_self
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_install_other
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_update_self
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_install_pip
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:UV_upgrade_pip
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:GET_project_type
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:GET_package
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:GET_python_version
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:GET_no-workspace
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:GET_package
%LIB_BAT%\LYRUV.bat %*
exit /b 0
