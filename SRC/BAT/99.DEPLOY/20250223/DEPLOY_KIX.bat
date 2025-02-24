rem --------------------------------------------------------------------------------
rem procedure MAIN_03_KIX ()
rem --------------------------------------------------------------------------------
:MAIN_03_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_03_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 03_KIX ...
    echo ===============================

    call :REPO_WORK !DIR_TOOLS_SRC_KIX! 0 || exit /b 1
    call :UPDATE_TOOLS_KIX || exit /b 1
    call :REPO_WORK !DIR_TOOLS_KIX! 0 || exit /b 1

    call :git_pull !DIR_TOOLS_KIX_! || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_KIX (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_KIX
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_KIX!\SRC\BAT
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SRC\BAT
    set LDIR_TO=!DIR_TOOLS_KIX!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_KIX!\SRC\LIB
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SRC\LIB
    set LDIR_TO=!DIR_TOOLS_KIX!\LIB
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_KIX!\SRC\LIB
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SRC\SCRIPTS
    set LDIR_TO=!DIR_TOOLS_KIX!\SCRIPTS
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_KIX!\SRC\SCRIPTS
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_KIX!\SRC\SCRIPTS
    set LDIR_TO=!DIR_TOOLS_KIX!\BAT
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction
