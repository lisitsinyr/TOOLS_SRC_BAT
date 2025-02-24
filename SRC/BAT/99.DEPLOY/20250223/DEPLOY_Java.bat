

rem --------------------------------------------------------------------------------
rem procedure MAIN_05_Java ()
rem --------------------------------------------------------------------------------
:MAIN_05_Java
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_05_Java
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_Java ...
    echo ===============================

    call :REPO_WORK !DIR_TESTS_JAVA! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SRC_JAVA! 0 || exit /b 1
    call :UPDATE_TOOLS_JAVA || exit /b 1
    call :REPO_WORK !DIR_TOOLS_JAVA! 0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_JAVA (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_JAVA
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    exit /b 0
rem endfunction
