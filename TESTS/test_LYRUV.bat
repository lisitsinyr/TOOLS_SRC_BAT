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

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=

    set /a LOG_FILE_ADD=0

    call :test_LYRUV

    rem call :test_UV_python_list
    rem call :test_UV_python_install
    rem call :test_UV_python_uninstall
    rem call :test_UV_python_run
    rem call :test_UV_python_upgrade
    rem call :test_UV_python_find
    rem call :test_UV_python_dir
    rem call :test_UV_python_version
    rem call :test_UV_python_pin
    rem call :test_UV_help
    rem call :test_UV_help_cmd
    rem call :test_UV_version
    rem call :test_UV_self
    rem call :test_UV_self_version
    rem call :test_UV_install_self
    rem call :test_UV_install_other
    rem call :test_UV_update_self
    rem call :test_UV_install_pip
    rem call :test_UV_upgrade_pip
    rem call :test_GET_python_version
    rem call :test_GET_project_type
    rem call :test_GET_package
    rem call :test_GET_no-workspace

    exit /b 0
:end
rem =================================================

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRUV () -> None
rem --------------------------------------------------------------------------------
:test_LYRUV
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_python_list () -> None
rem -----------------------------------------------
:test_UV_python_list
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure UV_self () -> None
rem -----------------------------------------------
:test_UV_self
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

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

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_python_version (python_version) -> python_version
rem --------------------------------------------------------------------------------
:test_GET_python_version
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_project_type (project_type) -> project_type
rem --------------------------------------------------------------------------------
:test_GET_project_type
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_package (package) -> package
rem --------------------------------------------------------------------------------
:test_GET_package
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function GET_no-workspace (no-workspace) -> no-workspace
rem --------------------------------------------------------------------------------
:test_GET_no-workspace
rem beginfunction
    echo ======================================
    echo FUNCNAME%0
    echo --------------------------------------

    call :LYRUV || exit /b 1

    echo ....test_LYRUV: Ok

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem =================================================
rem LYRUV.bat
rem =================================================
:LYRUV
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
:UV_python_
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
:GET_python
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:GET_no-workspace
%LIB_BAT%\LYRUV.bat %*
exit /b 0
:GET_package
%LIB_BAT%\LYRUV.bat %*
exit /b 0
