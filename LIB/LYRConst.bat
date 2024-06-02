@echo off
rem -------------------------------------------------------------------
rem LYRConst.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

rem -------------------------------------------------------------------
rem :__SET_VAR_SCRIPT
rem SCRIPT_FULLFILENAME - ���� ������� [�������+���+����������]
rem     SCRIPT_FULLFILENAME=
rem SCRIPT_BASEFILENAME - ���� ������� [���+����������]
rem     SCRIPT_BASEFILENAME=
rem SCRIPT_FILENAME - ���� ������� [���]
rem     SCRIPT_FILENAME=
rem -------------------------------------------------------------------
rem :__SET_SCRIPTS_DIR
rem SCRIPTS_DIR - ������� ��������
rem     SCRIPTS_DIR=
rem -------------------------------------------------------------------
rem :__SET_VAR_DEFAULT
rem LOG_FILENAME - ���� ������� [���]
rem     LOG_FILENAME=
rem DATETIME_STAMP - ������ ����� ����� ������� [YYYYMMDDHHMMSS]
rem     DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
rem LOG_FILENAME_FORMAT - ������ ����� ����� ������� [FILENAME,DT,...]
rem     LOG_FILENAME_FORMAT=FILENAME
rem LOG_OPT - ��������� ������� [11]
rem     LOG_OPT=11
rem -------------------------------------------------------------------
rem :__SET_VAR_PROJECTS
rem PROJECTS -
rem     PROJECTS=
rem CURRENT_SYSTEM -
rem     CURRENT_SYSTEM=
rem UNAME -
rem     UNAME=
rem USERNAME -
rem     USERNAME=
rem PROJECTS_LYR_DIR -
rem     PROJECTS_LYR_DIR=
rem PROJECTS_DIR -
rem     PROJECTS_DIR=
rem CURRENT_DIR - ������� �������
rem     CURRENT_DIR=

rem -------------------------------------------------------------------
rem :SET_CHECK_REPO

rem REPO_NAME - ��� �����������
rem     REPO_NAME=
rem REPO_INI - ���� � ����������� �����������
rem     REPO_INI=REPO.ini

rem -------------------------------------------------------------------
rem :SET_CHECK_PROJECT
rem PROJECT_NAME - �������
rem     PROJECT_NAME=
rem PROJECT_INI - ���� � ����������� �������
rem     PROJECT_INI=PROJECT.ini

rem -------------------------------------------------------------------
rem :SET_CHECK_POETRY
rem PROJECT_NAME - �������
rem     PROJECT_NAME=
rem POETRY_INI - ���� � ����������� �������
rem     POETRY_INI=POETRY.ini

rem -------------------------------------------------------------------
rem :__SET_LOG
rem LOG_DT_FORMAT -
rem     LOG_DT_FORMAT=
rem LOG_FILENAME_FORMAT - ������ ����� ����� ������� [FILENAME,DATETIME,...]
rem     LOG_FILENAME_FORMAT=
rem LOG_FILE_ADD - ��������� ������� [0]
rem     LOG_FILE_ADD=  
rem LOG_FILE_DT - ��������� ������� [0]
rem     LOG_FILE_DT=
rem LOG_DIR - ������� �������
rem     LOG_DIR=
rem LOG_FILENAME - ���� ������� [���]
rem     LOG_FILENAME=
rem LOG_FILESCRIPT - ���� ������� ������� [���]
rem     LOG_FILESCRIPT=
rem LOG_STR -
rem     LOG_STR=
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
rem KIX_DIR - ������� � ������� .KIX
rem     KIX_DIR=
rem APP_KIX_DIR - ������� APP_KIX
rem     APP_KIX_DIR=
rem APP_KIX - ������ APP_KIX [���+����������]
rem     APP_KIX=lyrxxx_������.kix
rem -------------------------------------------------------------------
rem LIB_KIX - ������� ���������� KIX
rem     LIB_KIX=
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
rem �������
rem :LYRConst
rem :SET_LIB
rem :SET_KIX

rem :__SET_VAR_DEFAULT
rem :__SET_VAR_PROJECTS
rem :__SET_VAR_SCRIPT
rem :__SET_LOG

rem -------------------------------------------------------------------

:begin
rem ����� �� ��������. ������ - ������ �������.
:Exit
exit /b 0

rem =================================================
rem �������
rem =================================================
rem --------------------------------------------------------------------------------
rem procedure LYRConst ()
rem --------------------------------------------------------------------------------
:LYRConst
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRConst
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure SET_LIB (ASCRIPT)
rem -----------------------------------------------
:SET_LIB
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_LIB
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
 
    set ASCRIPT=%1

    call :__SET_VAR_SCRIPT !ASCRIPT! || exit /b 1
    call :__SET_VAR_DEFAULT || exit /b 1
    call :__SET_VAR_PROJECTS || exit /b 1
    call :__SET_LOG || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :SET_POETRY ()
rem --------------------------------------------------------------------------------
:SET_POETRY
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem POETRY - 
    rem -------------------------------------------------------------------
    set APP=poetry
    set OPTION= -v --no-ansi
    set OPTION= -v --ansi
    set ARGS=
    set APPRUN=
    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem :SET_KIX ()
rem --------------------------------------------------------------------------------
:SET_KIX
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SET_KIX
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem LIB_KIX - ������� ���������� KIX [�������]
    rem -------------------------------------------------------------------
    if not defined LIB_KIX (
        echo INFO: Directory LIB_KIX not set ...
        if "!COMPUTERNAME!"=="!USERDOMAIN!" (
            set LIB_KIX=!SCRIPTS_DIR_KIX!\LIB
        ) else (
            set LIB_KIX=\\S73FS01\APPInfo\tools\LIB
        )
    )
    echo LIB_KIX: !LIB_KIX!
    if exist !LIB_KIX! (
        echo INFO: Directory !LIB_KIX! exist ...
    ) else (
        echo INFO: Directory !LIB_KIX! not exist ...
        rem exit /b 1
    )

    rem -------------------------------------------------------------------
    rem APP_KIX_DIR - ������� APP_KIX
    rem -------------------------------------------------------------------
    set APP_KIX_DIR=!SCRIPTS_DIR_KIX!\KIX

    rem -------------------------------------------------------------------
    rem APP_KIX - ������ APP_KIX ���
    rem -------------------------------------------------------------------
    rem set APP_KIX=[lyrxxx_]PATTERN_KIX
    rem echo APP_KIX: !APP_KIX!

    if not defined APP_KIX (
        echo ERROR: Script APP_KIX not set...
        exit /b 1
    ) else (
        if exist !APP_KIX!.kix (
            echo INFO: Script !APP_KIX!.kix exist ...
            set APP_KIX_DIR=.
        ) else (
            echo INFO: Script !APP_KIX!.kix not exist ...
            if exist KIX\!APP_KIX!.kix (
                echo INFO: Script KIX\!APP_KIX!.kix exist ...
                set APP_KIX_DIR=KIX
            ) else (
                echo INFO: Script KIX\!APP_KIX!.kix not exist ...
                if exist !APP_KIX!\!APP_KIX!.kix (
                    echo INFO: Script !APP_KIX!\!APP_KIX!.kix exist ...
                    set APP_KIX_DIR=!APP_KIX!
                ) else (
                    if defined APP_KIX_DIR (
                        if exist !APP_KIX_DIR!\!APP_KIX!.kix (
                            echo INFO: Script !APP_KIX_DIR!\!APP_KIX!.kix exist ...
                        ) else (
                            echo ERROR: Script !APP_KIX_DIR!\!APP_KIX!.kix not exist ...
                            exit /b 1
                        )
                    ) else (
                        echo ERROR: Script !APP_KIX!\!APP_KIX!.kix not exist ...
                        exit /b 1
                    )
                )
            )
        )
    )
    echo APP_KIX_DIR: !APP_KIX_DIR!
    echo APP_KIX: !APP_KIX!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_SCRIPT (AFULLFILENAME)
rem --------------------------------------------------------------------------------
:__SET_VAR_SCRIPT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_VAR_SCRIPT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set AFULLFILENAME=%1

    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - ���� ������� [�������+���+����������]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%1
    rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - ���� ������� [�������+���+����������]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%~f1
    rem echo SCRIPT_FULLFILENAME: !SCRIPT_FULLFILENAME!

    rem -------------------------------------------------------------------
    rem SCRIPT_BASEFILENAME - ���� ������� [���+����������]
    rem -------------------------------------------------------------------
    set SCRIPT_BASEFILENAME=%~n1%~x1
    rem echo SCRIPT_BASEFILENAME: !SCRIPT_BASEFILENAME!

    rem -------------------------------------------------------------------
    rem SCRIPT_FILENAME - ���� ������� [���]
    rem -------------------------------------------------------------------
    set SCRIPT_FILENAME=%~n1
    rem echo SCRIPT_FILENAME: !SCRIPT_FILENAME!

    rem -------------------------------------------------------------------
    rem ���� �������: �������
    rem -------------------------------------------------------------------
    set SCRIPT_FILEDIR=
    rem echo SCRIPT_FILEDIR: !SCRIPT_FILEDIR!

    rem -------------------------------------------------------------------
    rem ���� �������: ����������
    rem -------------------------------------------------------------------
    set SCRIPT_FILEEXT=
    rem echo SCRIPT_FILEEXT: !SCRIPT_FILEEXT!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_DEFAULT ()
rem --------------------------------------------------------------------------------
:__SET_VAR_DEFAULT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_VAR_DEFAULT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set APP=
    set COMMAND=
    set OPTION=
    set ARGS=
    set APPRUN=

    set touchRUN=touch -f
    set touchRUN=D:\TOOLS\EXE\touch.exe

    set SetINIAPP=D:\TOOLS\EXE\setini.exe
    set GetINIAPP=D:\TOOLS\EXE\getini.exe

    rem -------------------------------------------------------------------
    rem DATETIME_STAMP - ������ ����� ����� ������� [YYYYMMDDHHMMSS]
    rem -------------------------------------------------------------------
    set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    rem echo DATETIME_STAMP [YYYYMMDDHHMMSS]: !DATETIME_STAMP!

    rem -------------------------------------------------------------------
    rem SLEEP - Number
    rem -------------------------------------------------------------------
    set /a SLEEP=0
    rem echo SLEEP: !SLEEP!

    rem -------------------------------------------------------------------
    rem REPO_INI - ���� � ����������� �����������
    rem -------------------------------------------------------------------
    set REPO_INI=REPO.ini
    rem echo REPO_INI [REPO.ini]: !REPO_INI!

    rem -------------------------------------------------------------------
    rem REPO_NAME - ��� �����������
    rem -------------------------------------------------------------------
    set REPO_NAME=

    rem -------------------------------------------------------------------
    rem PROJECT_INI - ���� � ����������� �������
    rem -------------------------------------------------------------------
    set PROJECT_INI=PROJECT.ini
    rem echo PROJECT_INI [PROJECT.ini]: !PROJECT_INI!

    rem -------------------------------------------------------------------
    rem PROJECT_NAME - ��� �������
    rem -------------------------------------------------------------------
    set PROJECT_NAME=

    rem -------------------------------------------------------------------
    rem POETRY_INI - ���� � ����������� �������
    rem -------------------------------------------------------------------
    set POETRY_INI=POETRY.ini
    rem echo POETRY_INI [POETRY.ini]: !POETRY_INI!

    rem -------------------------------------------------------------------
    rem POETRY_NAME - ��� �������
    rem -------------------------------------------------------------------
    set POETRY_NAME=

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_VAR_PROJECTS ()
rem --------------------------------------------------------------------------------
:__SET_VAR_PROJECTS
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_VAR_PROJECTS
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem PROJECTS - ������
    rem -------------------------------------------------------------------
    set PROJECTS=
    rem echo PROJECTS: !PROJECTS!

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR -
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
    rem echo PROJECTS_LYR_DIR: !PROJECTS_LYR_DIR!
    
    rem -------------------------------------------------------------------
    rem PROJECTS_DIR -
    rem -------------------------------------------------------------------
    set PROJECTS_DIR=
    rem echo PROJECTS_DIR: !PROJECTS_DIR!

    rem -------------------------------------------------------------------
    rem CURRENT_SYSTEM -
    rem -------------------------------------------------------------------
    set CURRENT_SYSTEM=%OS%
    rem echo CURRENT_SYSTEM: !CURRENT_SYSTEM!

    rem -------------------------------------------------------------------
    rem UNAME - COMPUTERNAME
    rem -------------------------------------------------------------------
    set UNAME=%COMPUTERNAME%
    rem echo UNAME: !UNAME!

    rem -------------------------------------------------------------------
    rem USERNAME - USERNAME
    rem -------------------------------------------------------------------
    set USERNAME=%USERNAME%
    rem echo USERNAME: !USERNAME!

    rem -------------------------------------------------------------------
    rem CURRENT_DIR - ������� �������
    rem -------------------------------------------------------------------
    set CURRENT_DIR=%CD%
    rem echo CURRENT_DIR: !CURRENT_DIR!

    rem -------------------------------------------------------------------
    rem TEMP_DIR - ��������� �������
    rem -------------------------------------------------------------------
    set TEMP_DIR=%temp%
    rem echo TEMP_DIR: !TEMP_DIR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure __SET_LOG ()
rem --------------------------------------------------------------------------------
:__SET_LOG
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=__SET_LOG
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem LOG_DIR - ������� ������� [�������]
    rem -------------------------------------------------------------------
    rem set LOG_DIR=
    
    rem -------------------------------------------------------------------
    rem LOG_FILENAME - ���� ������� [���]
    rem -------------------------------------------------------------------
    rem set LOG_FILENAME=

    rem ------------------------------------------------------
    rem LOG_FILESCRIPT - ���� ������� ������� [���]
    rem ------------------------------------------------------
    set LOG_FILESCRIPT=

    rem ------------------------------------------------------
    rem LOG_STR
    rem ------------------------------------------------------
    set LOG_STR=

    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT -
    rem -------------------------------------------------------------------
    rem set LOG_DT_FORMAT=

    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - ������ ����� ����� ������� [FILENAME,DATETIME,...]
    rem -------------------------------------------------------------------
    rem set LOG_FILENAME_FORMAT=

    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT_DEFAULT -
    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT_DEFAULT='%Y%m%d'
    set LOG_DT_FORMAT_DEFAULT=%date:~6,4%%date:~3,2%%date:~0,2%
    rem echo LOG_DT_FORMAT_DEFAULT: !LOG_DT_FORMAT_DEFAULT!

    rem -------------------------------------------------------------------
    rem LOG_FILE_ADD - ��������� ������� [0]
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_ADD (
        set /a LOG_FILE_ADD=0
    )
    rem echo LOG_FILE_ADD: !LOG_FILE_ADD!

    rem -------------------------------------------------------------------
    rem LOG_FILE_DT - ��������� ������� [0]
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_DT (
        set /a LOG_FILE_DT=0
    )

    rem ------------------------------------------------------
    rem LOG_DT_FORMAT -
    rem -------------------------------------------------------------------
    if not defined LOG_DT_FORMAT (
        set LOG_DT_FORMAT=!LOG_DT_FORMAT_DEFAULT!
    )
    rem echo LOG_DT_FORMAT: !LOG_DT_FORMAT!

    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - ������ ����� ����� ������� [FILENAME,DATETIME,...]
    rem -------------------------------------------------------------------
    if not defined LOG_FILENAME_FORMAT (
        set LOG_FILENAME_FORMAT=FILENAME
        rem set LOG_FILENAME_FORMAT=DATETIME
    )
    rem echo LOG_FILENAME_FORMAT [FILENAME,DATETIME,...]: !LOG_FILENAME_FORMAT!

    rem -------------------------------------------------------------------
    rem LOG_FILE_ADD -
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_ADD (
        set /a LOG_FILE_ADD=0
    )
    rem echo LOG_FILE_ADD: !LOG_FILE_ADD!

    rem -------------------------------------------------------------------
    rem LOG_FILE_DT -
    rem -------------------------------------------------------------------
    if not defined LOG_FILE_DT (
        set /a LOG_FILE_DT=0
    )
    rem echo LOG_FILE_DT: !LOG_FILE_DT!

    rem -------------------------------------------------------------------
    rem LOG_DIR - ������� ������� [�������]
    rem -------------------------------------------------------------------
    if not defined LOG_DIR (
        set LOG_DIR=!PROJECTS_LYR_DIR!\LOG
    )
    rem echo LOG_DIR: !LOG_DIR!
    if not exist !LOG_DIR! (
        echo INFO: Dir !LOG_DIR! not exist ...
        rem echo INFO: ������� "!LOG_DIR!" �� ����������...
        echo INFO: Create !LOG_DIR! ...
        mkdir "!LOG_DIR!"
        rem echo ERRORLEVEL: !ERRORLEVEL!
        if not !ERRORLEVEL!==0 (
            echo ERROR: Dir !LOG_DIR! not created...
            exit /b 1
        )
    )

    rem -------------------------------------------------------------------
    rem LOG_FILENAME - ���� ������� [���]
    rem -------------------------------------------------------------------
    if not defined LOG_FILENAME (
        if "!LOG_FILENAME_FORMAT!"=="FILENAME" (
            set LOG_FILENAME=!SCRIPT_FILENAME!
        ) else (
            if "!LOG_FILENAME_FORMAT!"=="DATETIME" (
                set LOG_FILENAME=!DATETIME_STAMP!
            ) else (
                echo ERROR: LOG_FILENAME_FORMAT not set...
                exit /b 1
            )
        )
    )
    if "!LOG_FILENAME_FORMAT!"=="FILENAME" (
        if LOG_FILE_DT==1 (
           set LOG_FILENAME=!DATETIME_STAMP!_!LOG_FILENAME!
        )
    )
    rem echo LOG_FILENAME: !LOG_FILENAME!

    rem -------------------------------------------------------------------
    rem LOG_FULLFILENAME - ���� ������� [�������+���+����������]
    rem -------------------------------------------------------------------
    set LOG_FULLFILENAME=!LOG_DIR!\!LOG_FILENAME!.log
    rem echo LOG_FULLFILENAME: !%LOG_FULLFILENAME!

    exit /b 0
rem endfunction

rem ===================================================================
