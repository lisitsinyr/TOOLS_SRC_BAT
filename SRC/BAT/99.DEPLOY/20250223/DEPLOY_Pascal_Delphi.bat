rem --------------------------------------------------------------------------------
rem procedure MAIN_05_Pascal_Delphi ()
rem --------------------------------------------------------------------------------
:MAIN_05_Pascal_Delphi
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_DESKTOP_Pascal_Delphi
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ===============================
    echo 05_Pascal_Delphi ...
    echo ===============================

    call :REPO_WORK !DIR_LUIS_D7! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_D7! 0 || exit /b 1
    call :UPDATE_TOOLS_D7 || exit /b 1

    call :REPO_WORK !DIR_LUIS_D11! 0 || exit /b 1
    call :REPO_WORK !DIR_TOOLS_D11! 0 || exit /b 1
    rem call :UPDATE_TOOLS_D11 || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure UPDATE_D7 (ADirectory)
rem --------------------------------------------------------------------------------
:UPDATE_TOOLS_D7
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set LDIR_TO=D:\TOOLS\EXE
    if exist "!LDIR_TO!" (
        rem del /F /S /Q "!LDIR_TO!"\*.* >> %LOG_FULLFILENAME%
    ) else (
        mkdir "!LDIR_TO!"            >> %LOG_FULLFILENAME%
    )
    set LDIR_FROM=!DIR_TOOLS_D7!\SRC\GetINI
    set LMASK=GetINI.exe
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    set LDIR_FROM=!DIR_TOOLS_D7!\SRC\SetINI
    set LMASK=SetINI.exe
    call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1

    exit /b 0
rem endfunction
