@echo off
rem -------------------------------------------------------------------
rem LYRINIT.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem -------------------------------------------------------------------
    rem CONST
    rem -------------------------------------------------------------------
    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------

    rem Выход из сценария. Дальше - только функции.
    exit /b 0
:end

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRINIT ()
rem --------------------------------------------------------------------------------
:LYRINIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRINIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    echo ERROR: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
rem begin
    if not defined (
        rem -------------------------------------------------------------------
        rem запуск скриптов БИБЛИОТЕКИ LYR
        rem -------------------------------------------------------------------
        rem source "$LIB_SH/LYRConst.sh"
        rem source "$LIB_SH/LYRFileUtils.sh"
        rem source "$LIB_SH/LYRLog.sh"
        rem source "$LIB_SH/LYRConst.sh"
        rem source "$LIB_SH/LYRDateTime.sh"
        rem source "$LIB_SH/LYRSupport.sh"
        rem source "$LIB_SH/LYRParserINI.sh"
        rem source "$LIB_SH/LYRConsole.sh"
        rem SET_LIB "$1"
        set INIT_LIB=1
    fi

rem end
rem --------------------------------------------------------------------------------
