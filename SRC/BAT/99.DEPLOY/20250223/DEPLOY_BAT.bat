rem --------------------------------------------------------------------------------
rem procedure MAIN_03_BAT ()
rem --------------------------------------------------------------------------------
:MAIN_03_BAT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_03_BAT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 03_BAT ...
    echo ===============================

    call :REPO_WORK !DIR_TOOLS_SRC_BAT! 0 || exit /b 1
    call :UPDATE_TOOLS_BAT || exit /b 1

    call :REPO_WORK !DIR_TOOLS_BAT! 0 || exit /b 1
    call :git_pull !DIR_TOOLS_BAT_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_BAT ()
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_BAT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_BAT!\BAT
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\SRC\BAT
    set LDIR_TO=!DIR_TOOLS_BAT!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_BAT!\BAT\99.[lyr]LYR
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\SRC\BAT\99.[lyr]LYR
    set LDIR_TO=!DIR_TOOLS_BAT!\BAT
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_BAT!\LIB
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_BAT!\SRC\LIB
    set LDIR_TO=!DIR_TOOLS_BAT!\LIB
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    exit /b 0
rem endfunction
