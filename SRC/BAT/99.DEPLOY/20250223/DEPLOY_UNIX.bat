rem --------------------------------------------------------------------------------
rem procedure MAIN_01_UNIX ()
rem --------------------------------------------------------------------------------
:MAIN_01_UNIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_01_UNIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 01_UNIX ...
    echo ===============================

    call :REPO_WORK !DIR_COMMANDS_SH! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SRC_SH! 0 || exit /b 1
    call :UPDATE_TOOLS_SH || exit /b 1
    call :REPO_WORK !DIR_TOOLS_SH! 0 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_SH (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_SH
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_SH!\SH
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_SH!\SRC\SH
    set LDIR_TO=!DIR_TOOLS_SH!\SH
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_SH!\LIB
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_SH!\SRC\LIB
    set LDIR_TO=!DIR_TOOLS_SH!\LIB
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_GIT!\SH
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_GIT!\SH
    set LDIR_TO=!DIR_TOOLS_SH!\SH_GIT
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.sh
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction



rem --------------------------------------------------------------------------------
rem procedure UPDATE_TOOLS_PY (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_PY
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_PY!\SRC\BAT
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\BAT
    set LDIR_TO=!DIR_TOOLS_PY!\BAT
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    set LDIR_TO=!DIR_TOOLS_PY!\SCRIPTS
    rem rmdir "!LDIR_TO!"
    if exist "!LDIR_TO!" (
        del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LMASK=*.*
    call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    rem --------------------------------------------------------
    rem !DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    rem --------------------------------------------------------
    set LDIR_FROM=!DIR_TOOLS_SRC_PY!\SRC\SCRIPTS
    set LDIR_TO=!DIR_TOOLS_PY!\BAT
    set LMASK=*.bat
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1

    exit /b 0
rem endfunction
