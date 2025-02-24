rem --------------------------------------------------------------------------------
rem procedure MAIN_GIT ()
rem --------------------------------------------------------------------------------
:MAIN_GIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_GIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo GIT ...
    echo ===============================

    call :REPO_WORK !DIR_TOOLS_SRC_GIT! 0 || exit /b 1
    call :UPDATE_TOOLS_GIT || exit /b 1
    call :REPO_WORK !DIR_TOOLS_GIT! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_GIT_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_GIT (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_GIT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_GIT!\BAT
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\BAT
    set LDIR_TO=!DIR_TOOLS_GIT!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_GIT!\BAT_KIX
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\BAT_KIX
    set LDIR_TO=!DIR_TOOLS_GIT!\BAT_KIX
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction
