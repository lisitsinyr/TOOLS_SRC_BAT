@echo off
rem -------------------------------------------------------------------
rem LYRDEPLOY.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

:begin
    rem Выход из сценария. Дальше - только функции.
    exit /b 0
:end

rem =================================================
rem ФУНКЦИИ
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRDEPLOYINIT () -> None
rem --------------------------------------------------------------------------------
:LYRDEPLOYINIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRDEPLOYINIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem CONST
    rem -------------------------------------------------------------------
    set FILEINI=D:\PROJECTS_LYR\CHECK_LIST\PROJECTS.ini
    rem echo FILEINI:!FILEINI!

    set urlTOOLS_SRC_GIT=git@github.com:lisitsinyr/TOOLS_SRC_GIT.git

    set urlTOOLS_GIT=git@github.com:lisitsinyr/TOOLS_GIT.git

    set urlTOOLS_SRC_BAT=git@github.com:lisitsinyr/TOOLS_SRC_BAT.git
    set urlTOOLS_BAT=git@github.com:lisitsinyr/TOOLS_BAT.git

    set urlTOOLS_SRC_KIX=git@github.com:lisitsinyr/TOOLS_SRC_KIX.git
    set urlTOOLS_KIX=git@github.com:lisitsinyr/TOOLS_KIX.git

    set urlTOOLS_PS=git@github.com:lisitsinyr/TOOLS_PS.git

    set urlTESTS_JAVA=git@github.com:lisitsinyr/JAVA_TESTS.git
    set urlTOOLS_SRC_JAVA=git@github.com:lisitsinyr/TOOLS_SRC_JAVA.git
    set urlTOOLS_JAVA=git@github.com:lisitsinyr/TOOLS_JAVA.git

    set urlLUIS_D7=git@github.com:lisitsinyr/D7_LUIS.git
    set urlTOOLS_D7=git@github.com:lisitsinyr/TOOLS_D7.git
    set urlLUIS_D11=git@github.com:lisitsinyr/D11_LUIS.git
    set urlTOOLS_D11=git@github.com:lisitsinyr/TOOLS_D11.git

    set urlPY_TRICKS=git@github.com:lisitsinyr/PY_TRICKS.git
    set urlEXAMPLES_PY=git@github.com:lisitsinyr/PY_EXAMPLES.git
    set urlLIBRARY_PY=git@github.com:lisitsinyr/PY_LIBRARY.git
    set urlMobileAPP_PY=git@github.com:lisitsinyr/PY_MobileAPP.git
    set urlPATTERN_PY=git@github.com:lisitsinyr/PY_PATTERN.git
    set urlSCRIPTS_PY=git@github.com:lisitsinyr/PY_SCRIPTS.git
    set urlTESTS_PY=git@github.com:lisitsinyr/PY_TESTS.git
    set urlTOOLS_SRC_PY=git@github.com:lisitsinyr/TOOLS_SRC_PY.git
    set urlTOOLS_PY=git@github.com:lisitsinyr/TOOLS_PY.git

    set urlCOMMANDS_SH=git@github.com:lisitsinyr/SH_COMMANDS.git
    set urlTOOLS_SRC_SH=git@github.com:lisitsinyr/TOOLS_SRC_SH.git
    set urlTOOLS_SH=git@github.com:lisitsinyr/TOOLS_SH.git

    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------
    set GPROJECTS_GROUP=PROJECTS_BAT
    set GPROJECTS_GROUP=

    set GPROJECTS_DIR_ROOT=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT
    set GPROJECTS_DIR_ROOT=
    
    set GPROJECT_NAME=

    set GPROJECTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT
    set GPROJECTS_DIR=

    set GPROJECT_PATTERN_DIR=
    
    set GPROJECT_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    set GPROJECT_DIR=

    set Gurl_github=git@github.com:lisitsinyr/TOOLS_SRC_BAT.git
    set Gurl_github=

    set GPROJECTS_INI=

    rem echo ERROR: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure DEPLOY_PROJECT (APROJECT_DIR) -> None
rem --------------------------------------------------------------------------------
:DEPLOY_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=DEPLOY_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APROJECT_DIR=%~1
    echo APROJECT_DIR:!APROJECT_DIR!

    if not defined APROJECT_DIR (
        echo ERROR: APROJECT_DIR not defined ...
        exit /b 1
    ) else (
        if not exist !APROJECT_DIR!\ (
            echo ERROR: !APROJECT_DIR! not exist ...
            exit /b 1
        ) else (
            if not exist !APROJECT_DIR!\!PROJECT_INI! (
                echo ERROR: !APROJECT_DIR!\PROJECT.ini not exist ...
                exit /b 1
            )
        )
    )

    rem ------------------------------------------------
    rem GPROJECTS_GROUP
    rem ------------------------------------------------
    call :GetINIParametr !APROJECT_DIR!\!PROJECT_INI! general PROJECTS_GROUP || exit /b 1
    set GPROJECTS_GROUP=!GetINIParametr!
    echo GPROJECTS_GROUP:!GPROJECTS_GROUP!

    rem -------------------------------------------------------------------
    rem GPROJECTS_DIR_ROOT
    rem -------------------------------------------------------------------
    call :GetINIParametr !APROJECT_DIR!\!PROJECT_INI! general PROJECTS_DIR_ROOT || exit /b 1
    set GPROJECTS_DIR_ROOT=!GetINIParametr!
    echo GPROJECTS_DIR_ROOT:!GPROJECTS_DIR_ROOT!

    rem ------------------------------------------------
    rem GPROJECT_NAME
    rem ------------------------------------------------
    call :GetINIParametr !APROJECT_DIR!\!PROJECT_INI! general PROJECT_NAME || exit /b 1
    set GPROJECT_NAME=!GetINIParametr!
    echo GPROJECT_NAME:!GPROJECT_NAME!

    rem ------------------------------------------------
    rem PROJECT_NAME
    rem ------------------------------------------------
    set GPROJECT_DIR=!APROJECT_DIR!
    echo GPROJECT_DIR:!GPROJECT_DIR!

    set GPROJECTS_INI=!GPROJECTS_DIR_ROOT!\!GPROJECTS_GROUP!.ini
    echo GPROJECTS_INI:!GPROJECTS_INI!

    rem ------------------------------------------------
    rem LPROJECT_DIR
    rem ------------------------------------------------
    call :GetINI !GPROJECTS_INI! !GPROJECT_NAME! PROJECT_DIR || exit /b 1
    set LPROJECT_DIR=!GetINI!
    echo LPROJECT_DIR:!LPROJECT_DIR!

    rem ------------------------------------------------
    rem GPROJECT_PATTERN_DIR
    rem ------------------------------------------------
    call :GetINI !GPROJECTS_INI! !GPROJECT_NAME! PROJECT_PATTERN_DIR || exit /b 1
    set GPROJECT_PATTERN_DIR=!GetINI!
    echo GPROJECT_PATTERN_DIR:!GPROJECT_PATTERN_DIR!

    rem ------------------------------------------------
    rem Gurl_github
    rem ------------------------------------------------
    call :GetINI !GPROJECTS_INI! !GPROJECT_NAME! url || exit /b 1
    set Gurl_github=!GetINI!
    echo Gurl_github:!Gurl_github!

    if not defined GPROJECT_PATTERN_DIR (
        rem ------------------------------------------------
        rem PROJECTS_PATTERN_DIR
        rem ------------------------------------------------
        call :GetINI !PROJECTS_INI! general PROJECTS_PATTERN_DIR || exit /b 1
        set PROJECTS_PATTERN_DIR=!GetINI!
        echo PROJECTS_PATTERN_DIR:!PROJECTS_PATTERN_DIR!
        set GPROJECT_PATTERN_DIR=!PROJECTS_PATTERN_DIR!
    )

    if not defined GPROJECT_PATTERN_DIR (
        echo ERROR: GPROJECT_PATTERN_DIR not defined ...
        exit /b 1
    ) else (
        if not exist !GPROJECT_PATTERN_DIR!\ (
            echo ERROR: !GPROJECT_PATTERN_DIR! not exist ...
            exit /b 1
        )
    )

    if !GPROJECT_NAME!==TOOLS_BAT (
        call :ClearDir !GPROJECT_DIR!\BAT *.bat
        call :UPDATE_TOOLS_BAT_SCRIPTS_BAT
        call :UPDATE_TOOLS_BAT_TOOLS_SRC_BAT
        call :__REPO_WORK_TOOLS !GPROJECT_DIR!
        exit /b 0
    )    

    if !GPROJECT_NAME!==TOOLS_GIT (
        call :ClearDir !GPROJECT_DIR!\BAT *.bat
        call :ClearDir !GPROJECT_DIR!\BAT_KIX *.bat
        call :UPDATE_TOOLS_GIT_TOOLS_SRC_GIT
        call :__REPO_WORK_TOOLS !GPROJECT_DIR!
        exit /b 0
    )    

    if !GPROJECT_NAME!==TOOLS_JAVA (
        call :ClearDir !GPROJECT_DIR!\BAT *.bat
        call :UPDATE_TOOLS_JAVA_SCRIPTS_JAVA
        call :UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA
        call :__REPO_WORK_TOOLS !GPROJECT_DIR!
        exit /b 0
    )    

    if !GPROJECT_NAME!==TOOLS_KIX (
        call :ClearDir !GPROJECT_DIR!\BAT *.bat
        call :UPDATE_TOOLS_KIX_SCRIPTS_KIX
        call :UPDATE_TOOLS_KIX_TOOLS_SRC_KIX
        call :__REPO_WORK_TOOLS !GPROJECT_DIR!
        exit /b 0
    )    

    if !GPROJECT_NAME!==TOOLS_PY (
        call :ClearDir !GPROJECT_DIR!\BAT *.bat
        call :UPDATE_TOOLS_PY_SCRIPTS_PY
        call :UPDATE_TOOLS_PY_TOOLS_SRC_PY
        call :__REPO_WORK_TOOLS !GPROJECT_DIR!
        exit /b 0
    )    

    if !GPROJECT_NAME!==TOOLS_SH (
        call :ClearDir !GPROJECT_DIR!\SH_GIT *.sh
        call :UPDATE_TOOLS_SH_SCRIPTS_SH
        call :UPDATE_TOOLS_SH_TOOLS_SRC_SH
        call :UPDATE_TOOLS_SH_TOOLS_SRC_GIT_SH
        call :__REPO_WORK_TOOLS !GPROJECT_DIR!
        exit /b 0
    )    

    if !GPROJECT_NAME!==TOOLS_PS (
        rem call :__REPO_WORK_TOOLS !GPROJECT_DIR!
        exit /b 0
    )    

    call :__REPO_WORK !GPROJECT_DIR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __CopyFilesFromPATTERN () -> None
rem --------------------------------------------------------------------------------
:__CopyFilesFromPATTERN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__CopyFilesFromPATTERN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -----------------------------------------------------
    rem LDirPATTERN
    rem -----------------------------------------------------
    set LDirPATTERN=

    set res=
    if !PROJECTS_GROUP!==PROJECTS_GIT set res=true
    if !PROJECTS_GROUP!==GIT set res=true
    if defined res ( 
        rem set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\PATTERN_GIT
        call :GetINI !FILEINI! PATTERNS GIT
        set LDirPATTERN=!ParameterValue!
    )

    set res=
    if !PROJECTS_GROUP!==PROJECTS_BAT set res=true
    if !PROJECTS_GROUP!==BAT set res=true
    if defined res ( 
        rem set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\PATTERN_BAT
        call :GetINI !FILEINI! PATTERNS BAT
        set LDirPATTERN=!ParameterValue!
    )

    set res=
    if !PROJECTS_GROUP!==PROJECTS_KIX set res=true
    if !PROJECTS_GROUP!==KIX set res=true
    if defined res ( 
        rem set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\PATTERN_KIX
        call :GetINI !FILEINI! PATTERNS KIX
        set LDirPATTERN=!ParameterValue!
        rem echo LDirPATTERN:!LDirPATTERN!
    )

    set res=
    if !PROJECTS_GROUP!==PROJECTS_PS set res=true
    if !PROJECTS_GROUP!==PowerShell set res=true
    if defined res ( 
        rem set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\PowerShell\PROJECTS_PS\PATTERN_PS
        call :GetINI !FILEINI! PATTERNS PowerShell
        set LDirPATTERN=!ParameterValue!
    )

    set res=
    if !PROJECTS_GROUP!==PROJECTS_UNIX set res=true
    if !PROJECTS_GROUP!==UNIX set res=true
    if defined res ( 
        rem set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\OS\UNIX\PROJECTS_UNIX\PATTERN_SH
        call :GetINI !FILEINI! PATTERNS UNIX
        set LDirPATTERN=!ParameterValue!
    )

    set res=
    if !PROJECTS_GROUP!==PROJECTS_JAVA set res=true
    if !PROJECTS_GROUP!==JAVA set res=true
    if defined res ( 
        rem set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Java\PROJECTS_JAVA\PATTERN_JAVA
        call :GetINI !FILEINI! PATTERNS JAVA
        set LDirPATTERN=!ParameterValue!
    )

    set res=
    if !PROJECTS_GROUP!==PROJECTS_D7 set res=true
    if !PROJECTS_GROUP!==PROJECTS_D11 set res=true
    if !PROJECTS_GROUP!==Pascal_Delphi set res=true
    if defined res ( 
        rem set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Pascal_Delphi\PROJECTS\PATTERN_PAS
        call :GetINI !FILEINI! PATTERNS Pascal_Delphi
        set LDirPATTERN=!ParameterValue!
    )

    set LDirPATTERN=!GPROJECT_PATTERN_DIR!

    call :__CopyFromPATTERN_ALL !LDirPATTERN!

    set res=
    if !PROJECTS_GROUP!==PROJECTS_PY set res=true
    if !PROJECTS_GROUP!==Python set res=true
    if defined res ( 
        rem set LDirPATTERN=D:\PROJECTS_LYR\CHECK_LIST\DESKTOP\Python\PROJECTS_PY\PATTERN_PY
        call :GetINI !FILEINI! PATTERNS Python
        set LDirPATTERN=!ParameterValue!

        set LDirPATTERN=!GPROJECT_PATTERN_DIR!

        call :__CopyFromPATTERN_PYTHON !LDirPATTERN!
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __CopyFromPATTERN_ALL () -> None
rem --------------------------------------------------------------------------------
:__CopyFromPATTERN_ALL
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__CopyFromPATTERN_ALL
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LDirPATTERN=%~1

    if defined LDirPATTERN if exist "!LDirPATTERN!"\ ( 
        echo .... LDirPATTERN:!LDirPATTERN!

        set LFileName=PROJECT.INI
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                echo .... :COPY_FILE !LFileName! ...
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! /Y || exit /b 1
            )
        )

        rem set LFileName=REPO.INI
        rem if exist !LDirPATTERN!\!LFileName! (
        rem     if not exist !GPROJECT_DIR!\!LFileName! (
        rem         echo .... :COPY_FILE !LFileName! ...
        rem         call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! /Y || exit /b 1
        rem     )
        rem )

        set LFileName=.editorconfig
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                echo .... :COPY_FILE !LFileName! ...
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
            )
        )

        set LFileName=.gitignore
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                echo .... :COPY_FILE !LFileName! ...
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! /Y || exit /b 1
            )
            rem pause
        )

        set LFileName=.gitmodules
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                echo .... :COPY_FILE !LFileName! ...
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
            )
        )

        set LFileName=README.md
        if exist !LDirPATTERN!\!LFileName! (
            if not exist !GPROJECT_DIR!\!LFileName! (
                echo .... :COPY_FILE !LFileName! ...
                call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
            )
        )

        set LFileName=LICENSE
        if exist !LDirPATTERN!\!LFileName! (
            echo .... :COPY_FILE !LFileName! ...
            call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! /Y || exit /b 1
        )

        rem set LARG=/D /S /E /V /F /H /R /K /Y /O
        set LMASK=*.*

        set LDIR_FROM=!LDirPATTERN!\BUILD
        set LDIR_TO=!GPROJECT_DIR!\BUILD
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\CONFIG
        set LDIR_TO=!GPROJECT_DIR!\CONFIG
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\DATA
        set LDIR_TO=!GPROJECT_DIR!\DATA
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\DIST
        set LDIR_TO=!GPROJECT_DIR!\DIST
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\DOC
        set LDIR_TO=!GPROJECT_DIR!\DOC
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\EXE
        set LDIR_TO=!GPROJECT_DIR!\EXE
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\LOG
        set LDIR_TO=!GPROJECT_DIR!\LOG
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\OUT
        set LDIR_TO=!GPROJECT_DIR!\OUT
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\SRC
        set LDIR_TO=!GPROJECT_DIR!\SRC
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
            rem call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\TESTS
        set LDIR_TO=!GPROJECT_DIR!\TESTS
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
        set LDIR_FROM=!LDirPATTERN!\WORK
        set LDIR_TO=!GPROJECT_DIR!\WORK
        if exist !LDIR_FROM!\ (
            rem call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
            call :XCOPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! || exit /b 1
        )
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __CopyFromPATTERN_PYTHON () -> None
rem --------------------------------------------------------------------------------
:__CopyFromPATTERN_PYTHON
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__CopyFromPATTERN_PYTHON
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LDirPATTERN=%~1

    set LFileName=pyproject.toml
    if exist !LDirPATTERN!\!LFileName! if not exist !GPROJECT_DIR!\!LFileName! (
        if not exist !GPROJECT_DIR!\!LFileName! (
            echo .... :COPY_FILE !LFileName! ...
            call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
        )
    )
    
    rem set LFileName=requirements.txt
    rem if exist !LDirPATTERN!\!LFileName! if not exist !GPROJECT_DIR!\!LFileName! (
    rem     if not exist !GPROJECT_DIR!\!LFileName! (
    rem         echo .... :COPY_FILE !LFileName! ...
    rem         call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
    rem     )
    rem )

    rem set LFileName=POETRY.ini
    rem if exist !LDirPATTERN!\!LFileName! (
    rem     if not exist !GPROJECT_DIR!\!LFileName! (
    rem         echo .... :COPY_FILE !LFileName! ...
    rem         call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
    rem     )
    rem )

    rem set LFileName=.pypirc
    rem if exist !LDirPATTERN!\!LFileName! (
    rem     if not exist !GPROJECT_DIR!\!LFileName! (
    rem         echo .... :COPY_FILE !LFileName! ...
    rem         call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
    rem     )
    rem )

    set LFileName=.env
    if exist !LDirPATTERN!\!LFileName! if not exist !GPROJECT_DIR!\!LFileName! (
        if not exist !GPROJECT_DIR!\!LFileName! (
            echo .... :COPY_FILE !LFileName! ...
            call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
        )
    )

    set LFileName=.python-version
    if exist !LDirPATTERN!\!LFileName! (
        if not exist !GPROJECT_DIR!\!LFileName! (
            echo .... :COPY_FILE !LFileName! ...
            call :COPY_FILE !LDirPATTERN!\!LFileName! !GPROJECT_DIR! || exit /b 1
        )
    )

    set LDIR_FROM=!LDirPATTERN!\NOTEBOOKS
    set LDIR_TO=!GPROJECT_DIR!\NOTEBOOKS
    if exist !LDIR_FROM!\ (
        call :COPY_FILES !LDIR_FROM! !LDIR_TO! !LMASK! /R || exit /b 1
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure CopyFilesROOT () -> None
rem --------------------------------------------------------------------------------
:__CopyFilesROOT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__CopyFilesROOT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    set LDirectory=D:\PROJECTS_LYR\CHECK_LIST\GIT\PROJECTS_GIT\TOOLS_SRC_GIT\SRC\BAT\A.WORK
    set LFileName=lyrgit_push_main.bat
    rem echo LFileName:!LFileName!
    if exist !LDirectory!\!LFileName! (
        rem echo COPY:!LFileName!
        copy !LDirectory!\!LFileName! > NUL
    )
    set LFileName=lyr__git_pull.bat
    rem echo LFileName:!LFileName!
    if exist !LDirectory!\!LFileName! (
        rem echo COPY:!LFileName!
        copy !LDirectory!\!LFileName! > NUL
    )

    set LDirectory=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\SCRIPTS_BAT\SRC\99.DEPLOY
    set LFileName=DEPLOY_PROJECT.bat
    rem echo LFileName:!LFileName!
    if exist !LDirectory!\!LFileName! (
        rem echo COPY:!LFileName!
        copy !LDirectory!\!LFileName! > NUL
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SetPROJECT_INI () -> None
rem --------------------------------------------------------------------------------
:__SetPROJECT_INI
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SetPROJECT_INI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetINI !GPROJECT_DIR!\PROJECT.ini general PROJECTS_GROUP !PROJECTS_GROUP!
    call :SetINI !GPROJECT_DIR!\PROJECT.ini general PROJECT_NAME !PROJECT_NAME!
    call :SetINI !GPROJECT_DIR!\PROJECT.ini general PROJECTS_DIR_ROOT !PROJECTS_DIR_ROOT!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SetREPO_INI () -> None
rem --------------------------------------------------------------------------------
:__SetREPO_INI
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SetREPO_INI
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetINI !GPROJECT_DIR!\REPO.ini general REPO_NAME !PROJECT_NAME!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __REPO_WORK (ADirectory) -> None
rem --------------------------------------------------------------------------------
:__REPO_WORK
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__REPO_WORK
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!
    
    call :WritePROCESS DEPLOY проекта [__REPO_WORK]: !PROJECT_NAME!

    set ADirectory=%~1
    echo ADirectory:!ADirectory!

    if not exist "!ADirectory!"\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        exit /b 1
    )

    cd /D "!ADirectory!"

    rem call :__CopyFilesROOT

    rem call :__CopyFilesFromPATTERN

    rem call :__SetPROJECT_INI

    rem call :__SetREPO_INI

    cd /D "!ADirectory!"

    if exist .git\ (
        call lyrgit_push_main.bat
    ) else (
        echo INFO: Каталог .git не существует ...
    )

    cd /D "!LSaveDirectory!"

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __REPO_WORK_TOOLS (ADirectory) -> None
rem --------------------------------------------------------------------------------
:__REPO_WORK_TOOLS
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__REPO_WORK_TOOLS
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!

    rem call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    call :WritePROCESS ................................DEPLOY проекта [__REPO_WORK_TOOLS]: !PROJECT_NAME!

    rem call :WritePROCESS PROJECTS_GROUP: !PROJECTS_GROUP!
    rem call :WritePROCESS DIR_PROJECTS_ROOT: !DIR_PROJECTS_ROOT!
    rem call :WritePROCESS GPROJECT_DIR: !GPROJECT_DIR!

    set ADirectory=%~1
    echo ADirectory:!ADirectory!

    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        set __REPO_WORK_TOOLS=
        exit /b 1
    )

    call :__CopyFilesROOT

    rem call :__CopyFilesFromPATTERN

    call :__SetPROJECT_INI

    rem call :__SetREPO_INI

    cd /D "!ADirectory!"
    rem call :CurrentDir
    rem echo CurrentDir:!CurrentDir!

    if exist ".git"\ (
        call lyrgit_push_main.bat
    ) else (
        echo INFO: Каталог .git не существует ...
    )

    call :PULL_PROJECT D:\TOOLS !PROJECT_NAME!

    cd /D "!LSaveDirectory!"

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem =================================================
rem procedure __git_pull (ADirectory) -> None
rem =================================================
:__git_pull
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__git_pull
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!

    rem call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    set LOG_FILE_ADD=1
    set ADirectory=%~1
    rem echo __git_pull:!ADirectory!
    if not exist !ADirectory!\ (
        echo ERROR: Каталог !ADirectory! не существует ...
        set __git_pull=
        exit /b 1
    )

    cd /D "!ADirectory!"

    rem echo "git pull ..."

    call lyr__git_pull.bat
    
    rem git pull
    rem call :CheckErrorlevel !FUNCNAME! Yes

    cd /D "!LSaveDirectory!"

    exit /b 0
rem endfunction

rem =================================================
rem procedure __git_clone (Aurl) -> None
rem =================================================
:__git_clone
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__git_clone
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    set ADIR_PROJECTS_ROOT=%1
    rem echo ADIR_PROJECTS_ROOT:!ADIR_PROJECTS_ROOT!
    set url=%2
    rem echo url:!url!

    if exist "!ADIR_PROJECTS_ROOT!"\ (
        cd /D "!ADIR_PROJECTS_ROOT!"
        if defined url (
            rem git clone !url!
            call lyr__git_clone.bat "!url!"
        ) else (
            echo INFO: Github не существует...
        )
    ) else (
        echo ERROR: Каталог !ADIR_PROJECTS_ROOT! не существует...
        set __git_clone=
        exit /b 1
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure PULL_PROJECT () -> None
rem --------------------------------------------------------------------------------
:PULL_PROJECT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=PULL_PROJECT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set LSaveDirectory=!cd!

    rem call :WritePROCESS ...FUNCNAME:!FUNCNAME!...

    set ADIR_PROJECTS_ROOT=%1
    rem echo ADIR_PROJECTS_ROOT:!ADIR_PROJECTS_ROOT!
    set APROJECT_NAME=%2
    rem echo APROJECT_NAME:!APROJECT_NAME!

    call :WritePROCESS PULL проекта: !APROJECT_NAME! ...

    set LGPROJECT_DIR=!ADIR_PROJECTS_ROOT!\!APROJECT_NAME!
    rem echo LGPROJECT_DIR:!LGPROJECT_DIR!

    if exist "!LGPROJECT_DIR!"\ (
        cd /D "!LGPROJECT_DIR!"
        if exist ".git"\ (
            rem echo "call lyr__git_pull.bat ..."
            call lyr__git_pull.bat
        ) else (
            echo INFO: Каталог .git не существует ...
        )
    ) else (
        echo info: Каталог !LGPROJECT_DIR! не существует...
        if !APROJECT_NAME!==TOOLS_SRC_GIT (
            call :GetINI !FILEINI! GITHUB TOOLS_SRC_GIT
            set urlGITHUB=!ParameterValue!
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlGITHUB!
        )

        if !APROJECT_NAME!==TOOLS_GIT (
            call :GetINI !FILEINI! GITHUB TOOLS_GIT
            set urlGITHUB=!ParameterValue!
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlGITHUB!
        )
        
        if !APROJECT_NAME!==TOOLS_SRC_BAT (
            call :GetINI !FILEINI! GITHUB TOOLS_SRC_BAT
            set urlGITHUB=!ParameterValue!
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlGITHUB!
        )

        if !APROJECT_NAME!==TOOLS_BAT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_BAT!
        )
        if !APROJECT_NAME!==COMMANDS_BAT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlCOMMANDS_BAT!
        )
        if !APROJECT_NAME!==INFO_BAT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlINFO_BAT!
        )
        if !APROJECT_NAME!==SCRIPTS_BAT (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlSCRIPTS_BAT!
        )

        if !APROJECT_NAME!==TOOLS_SRC_KIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_KIX!
        )
        if !APROJECT_NAME!==TOOLS_KIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_KIX!
        )
        if !APROJECT_NAME!==INFO_KIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlINFO_KIX!
        )
        if !APROJECT_NAME!==SCRIPTS_KIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlSCRIPTS_KIX!
        )

        if !APROJECT_NAME!==INFO_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlINFO_JAVA!
        )
        if !APROJECT_NAME!==LANG_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlLANG_JAVA!
        )
        if !APROJECT_NAME!==LIBRARY_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlLIBRARY_JAVA!
        )
        if !APROJECT_NAME!==PATTERNS_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlPATTERNS_JAVA!
        )
        if !APROJECT_NAME!==TESTS_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTESTS_JAVA!
        )
        if !APROJECT_NAME!==TOOLS_SRC_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_JAVA!
        )
        if !APROJECT_NAME!==TOOLS_JAVA (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_JAVA!
        )

        if !APROJECT_NAME!==APPInfo_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlAPPInfo_PY!
        )
        if !APROJECT_NAME!==EXAMPLES_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlEXAMPLES_PY!
        )
        if !APROJECT_NAME!==FRAMEWORK_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlFRAMEWORK_PY!
        )
        if !APROJECT_NAME!==INFO_PYTHON (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlINFO_PYTHON!
        )
        if !APROJECT_NAME!==LANG_PYTHON (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlLANG_PYTHON!
        )
        if !APROJECT_NAME!==LIBRARY_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlLIBRARY_PY!
        )
        if !APROJECT_NAME!==MobileAPP_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlMobileAPP_PY!
        )
        if !APROJECT_NAME!==PATTERN_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlPATTERN_PY!
        )
        if !APROJECT_NAME!==PATTERNS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlPATTERNS_PY!
        )
        if !APROJECT_NAME!==PROJECTS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlPROJECTS_PY!
        )
        if !APROJECT_NAME!==SCRIPTS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlSCRIPTS_PY!
        )
        if !APROJECT_NAME!==SOFTWARE_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlSOFTWARE_PY!
        )
        if !APROJECT_NAME!==TEST_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTEST_PY!
        )
        if !APROJECT_NAME!==TESTS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTESTS_PY!
        )
        if !APROJECT_NAME!==TOOLS_SRC_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_PY!
        )
        if !APROJECT_NAME!==YOUTUBE_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlYOUTUBE_PY!
        )
        if !APROJECT_NAME!==TOOLS_PY (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_PY!
        )

        if !APROJECT_NAME!==LUIS_D7 (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlLUIS_D7!
        )
        if !APROJECT_NAME!==TOOLS_D7 (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_D7!
        )
        if !APROJECT_NAME!==LUIS_D11 (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlLUIS_D11!
        )
        if !APROJECT_NAME!==TOOLS_D11 (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_D11!
        )

        if !APROJECT_NAME!==COMMANDS_SH (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlCOMMANDS_SH!
        )
        if !APROJECT_NAME!==INFO_UNIX (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlINFO_UNIX!
        )
        if !APROJECT_NAME!==SCRIPTS_SH (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlSCRIPTS_SH!
        )
        if !APROJECT_NAME!==SOFTWARE (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlSOFTWARE!
        )
        if !APROJECT_NAME!==TOOLS_SRC_SH (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SRC_SH!
        )
        if !APROJECT_NAME!==TOOLS_SH (
            call :__git_clone !ADIR_PROJECTS_ROOT! !urlTOOLS_SH!
        )
    )   

    cd /D "!LSaveDirectory!"

    exit /b 0
rem endfunction
rem =================================================

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================

rem =================================================
rem LYRConsole.bat
rem =================================================
:LYRConsoleINIT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_00
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_01
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ConsoleTEST_02
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:SetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColorCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:ReSetColor
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:Write
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteLOG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteNOTSET
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUG
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteINFO
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteWARNING
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteERROR
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteCRITICAL
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteBEGIN
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteEND
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WritePROCESS
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteDEBUGTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0
:WriteTEXT
%LIB_BAT%\LYRConsole.bat %*
exit /b 0

rem =================================================
rem LYRConst.bat
rem =================================================
:LYRConstINIT
%LIB_BAT%\LYRConst.bat %*
exit /b 0

rem =================================================
rem LYRDateTime.bat
rem =================================================
:LYRDateTimeINIT
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0

rem =================================================
rem LYRDEPLOY.bat
rem =================================================
:LYRDEPLOYINIT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:__CopyFilesFromPATTERN
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:__CopyFilesROOT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:__SetPROJECT_INI
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:__SetREPO_INI
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:__REPO_WORK
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:DEPLOY_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:__git_pull
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:__git_clone
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0
:PULL_PROJECT
%LIB_BAT%\LYRDEPLOY.bat %*
exit /b 0

rem =================================================
rem LYRDEPLOYTools.bat
rem =================================================
:LYRDEPLOYToolsINIT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_BAT_SCRIPTS_BAT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_BAT_TOOLS_SRC_BAT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_GIT_TOOLS_SRC_GIT
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_JAVA_SCRIPTS_JAVA
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_JAVA_TOOLS_SRC_JAVA
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_KIX_SCRIPTS_KIX
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_KIX_TOOLS_SRC_KIX
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_PY_SCRIPTS_PY
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_PY_TOOLS_SRC_PY
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_SH_SCRIPTS_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_SH_TOOLS_SRC_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0
:UPDATE_TOOLS_SH_TOOLS_SRC_GIT_SH
%LIB_BAT%\LYRDEPLOYTools.bat %*
exit /b 0

rem =================================================
rem LYRFileUtils.bat
rem =================================================
:LYRFileUtilsINIT
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FullFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileNameWithoutExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileAttr
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileSize
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ClearDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:COPY_FILE
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:COPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:XCOPY_FILES
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0

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
rem LYRLog.bat
rem =================================================
:LYRLogINIT
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SETVarLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__SHORTLevelName
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:__LOG_STR
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogConsole
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0

rem =================================================
rem LYRParserINI.bat
rem =================================================
:LYRParserINIINIT
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:SetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINI
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetINIParametr
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0
:GetFileParser
%LIB_BAT%\LYRParserINI.bat %*
exit /b 0

rem =================================================
rem LYRPY.bat
rem =================================================
:LYRPYINIT
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:VENV_START
%LIB_BAT%\LYRPY.bat %*
exit /b 0
:VENV_STOP
%LIB_BAT%\LYRPY.bat %*
exit /b 0

rem =================================================
rem LYRStrUtils.bat
rem =================================================
:LYRStrUtilsINIT
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimLeft
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimRight
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Trim
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Left
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:Mid
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:TrimQuotes
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0
:ListToStr
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0

rem =================================================
rem LYRSupport.bat
rem =================================================
:LYRSupportINIT
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetDir
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetFile
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:FORCicle
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetSET
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:GetCMD
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:CheckErrorlevel
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
