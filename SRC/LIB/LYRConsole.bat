@echo off
rem -------------------------------------------------------------------
rem LYRConsole.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    rem ����� �� ��������. ������ - ������ �������.
    exit /b 0
:end

rem =================================================
rem �������
rem =================================================

rem --------------------------------------------------------------------------------
rem procedure LYRConsole ()
rem --------------------------------------------------------------------------------
:LYRConsole
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRConst
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem -------------------------------------------------------------------
    rem CONST [33mYellow[0m !sBEGIN!!sEND! [0!sEND!
    rem -------------------------------------------------------------------

    set sESC_hex=\x1b
    set sESC_Unicode=\u001b
    set sESC_oct=33
    set sESC_str=
    set sBEGIN=!sESC_str![
    set sEND=m
    rem ����� � ��������� ���������
    set sRESET=!sESC_str![0!sEND!
    rem ��������� � ���������� �����
    set sRESET_1=!sBEGIN!0^;!sEND!
    set sRESET_2=!sBEGIN!!sEND!

    rem ������ �������� ������� (CR) ����������� ������ ASCII, ������� ���������� ��� \r � ����� ��� 0x0D
    rem ������� �������                    13  015 0x0D 00001101 CR \r &#013;  
    set sR=\r
    rem ������� �� ���� ������ (BACKSPACE)  8  010 0x08 00001000 BS \b &#008;  
    set sB=\b

    rem --------------------------------------
    rem  ��������� ����� (Styles)
    rem --------------------------------------
    rem ������
    set cS_BOLD=01
    rem �������
    set cS_02=02
    rem ������
    set cS_ITALIC=03
    rem ������������
    set cS_UNDERLINE=04
    rem �������
    set cS_05=05
    rem
    set cS_06=06
    rem ������ 
    set cS_REVERSE=07
    rem
    set cS_08=08
    rem ����������� 
    set cS_09=09

    rem --------------------------------------
    rem ��������� ����� ������
    rem --------------------------------------
    rem ׸����
    set cFG8_BLACK=30
    rem �������
    set cFG8_RED=31
    rem ������
    set cFG8_GREEN=32
    rem Ƹ����
    set cFG8_YELLOW=33
    rem �����
    set cFG8_BLUE=34
    rem ���������� (��������� ����)
    set cFG8_MAGENTA=35
    rem ��������� (������� ����)
    set cFG8_CYAN=36
    rem �����
    set cFG8_WHITE=37

    rem --------------------------------------
    rem  ��������� ����� ����
    rem --------------------------------------
    set cBG8_BLACK=40
    set cBG8_RED=41
    set cBG8_GREEN=42
    set cBG8_YELLOW=43
    set cBG8_BLUE=44
    set cBG8_MAGENTA=45
    set cBG8_CYAN=46
    set cBG8_WHITE=47
    
    set cNOTSET=!cFG8_WHITE! !cBG8_BLACK!
    set cDEBUG=!cFG8_BLUE!
    set cINFO=!cFG8_WHITE!
    set cWARNING=!cS_BOLD! !FG8_YELLOW!
    set cERROR=!cS_BOLD! !cFG8_WHITE! !cBG8_RED!
    set cCRITICAL=!cS_BOLD! !cFG8_BLACK! !cBG8_RED!
    set cBEGIN=!cS_BOLD! !cFG8_GREEN!
    set cEND=!cS_BOLD! !cFG8_GREEN!
    set cPROCESS=!cS_BOLD! !cFG8_GREEN!
    set cDEBUGTEXT=!cS_BOLD! !cFG8_BLUE!
    set cTEXT=!cS_BOLD! !cFG8_YELLOW!

    rem -------------------------------------------------------------------
    rem VAR
    rem -------------------------------------------------------------------

    rem echo ERROR: function !FUNCNAME! not implemented! ...

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ConsoleTEST_00 ()
rem --------------------------------------------------------------------------------
:ConsoleTEST_00
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRConst
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
    
    echo [101;93m STYLES [0m
    echo [0mReset[0m
    echo [1mBold[0m
    echo [4mUnderline[0m
    echo [7mInverse[0m
    echo.
    echo [101;93m NORMAL FOREGROUND COLORS [0m
    echo [101;30mBlack[0m (black)
    echo [101;31mRed[0m
    echo [101;32mGreen[0m
    echo [101;33mYellow[0m
    echo [101;34mBlue[0m
    echo [101;35mMagenta[0m
    echo [101;36mCyan[0m
    echo [101;37mWhite[0m
    echo.
    echo [101;93m NORMAL BACKGROUND COLORS [0m
    echo [40mBlack[0m
    echo [41mRed[0m
    echo [42mGreen[0m
    echo [43mYellow[0m
    echo [44mBlue[0m
    echo [45mMagenta[0m
    echo [46mCyan[0m
    echo [47mWhite[0m (white)

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure ConsoleTEST_01 ()
rem --------------------------------------------------------------------------------
:ConsoleTEST_01
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRConst
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=
    
    echo [101;93m STYLES [0m
    echo ^<ESC^>[0m [0mReset[0m
    echo ^<ESC^>[1m [1mBold[0m
    echo ^<ESC^>[4m [4mUnderline[0m
    echo ^<ESC^>[7m [7mInverse[0m
    echo.
    echo [101;93m NORMAL FOREGROUND COLORS [0m
    echo ^<ESC^>[30m [30mBlack[0m (black)
    echo ^<ESC^>[31m [31mRed[0m
    echo ^<ESC^>[32m [32mGreen[0m
    echo ^<ESC^>[33m [33mYellow[0m
    echo ^<ESC^>[34m [34mBlue[0m
    echo ^<ESC^>[35m [35mMagenta[0m
    echo ^<ESC^>[36m [36mCyan[0m
    echo ^<ESC^>[37m [37mWhite[0m
    echo.
    echo [101;93m NORMAL BACKGROUND COLORS [0m
    echo ^<ESC^>[40m [40mBlack[0m
    echo ^<ESC^>[41m [41mRed[0m
    echo ^<ESC^>[42m [42mGreen[0m
    echo ^<ESC^>[43m [43mYellow[0m
    echo ^<ESC^>[44m [44mBlue[0m
    echo ^<ESC^>[45m [45mMagenta[0m
    echo ^<ESC^>[46m [46mCyan[0m
    echo ^<ESC^>[47m [47mWhite[0m (white)

    exit /b 0
rem endfunction
    
rem --------------------------------------------------------------------------------
rem procedure ConsoleTEST_02 ()
rem --------------------------------------------------------------------------------
:ConsoleTEST_02
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=LYRConst
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    echo.
    echo [101;93m STRONG FOREGROUND COLORS [0m
    echo ^<ESC^>[90m [90mWhite[0m
    echo ^<ESC^>[91m [91mRed[0m
    echo ^<ESC^>[92m [92mGreen[0m
    echo ^<ESC^>[93m [93mYellow[0m
    echo ^<ESC^>[94m [94mBlue[0m
    echo ^<ESC^>[95m [95mMagenta[0m
    echo ^<ESC^>[96m [96mCyan[0m
    echo ^<ESC^>[97m [97mWhite[0m
    echo.
    echo [101;93m STRONG BACKGROUND COLORS [0m
    echo ^<ESC^>[100m [100mBlack[0m
    echo ^<ESC^>[101m [101mRed[0m
    echo ^<ESC^>[102m [102mGreen[0m
    echo ^<ESC^>[103m [103mYellow[0m
    echo ^<ESC^>[104m [104mBlue[0m
    echo ^<ESC^>[105m [105mMagenta[0m
    echo ^<ESC^>[106m [106mCyan[0m
    echo ^<ESC^>[107m [107mWhite[0m
    echo.
    echo [101;93m COMBINATIONS [0m
    echo ^<ESC^>[31m                     [31mred foreground color[0m
    echo ^<ESC^>[7m                      [7minverse foreground ^<-^> background[0m
    echo ^<ESC^>[7;31m                   [7;31minverse red foreground color[0m
    echo ^<ESC^>[7m and nested ^<ESC^>[31m [7mbefore [31mnested[0m
    echo ^<ESC^>[31m and nested ^<ESC^>[7m [31mbefore [7mnested[0m

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  FormatColorStr (AStyles, AFG8, ABG8, AFG256, ABG256, AESC, s):
rem -------------------------------------------------
:FormatColorStr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=FormatColorStr
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set s=%1
    rem echo s:!s!
    set AStyles=%2
    rem echo AStyles:!AStyles!
    set AFG8=%3
    rem echo AFG8:!AFG8!
    set ABG8=%4
    rem echo ABG8:!ABG8!
    set AFG256=%5
    rem echo AFG256:!AFG256!
    set ABG256=%6
    rem echo ABG256:!ABG256!
    set AESC=%7
    rem echo AESC:!AESC!

    rem LStyles = LUSupport.TupleToStr (AStyles)
    set LStyles=
    set LResult=
    if defined AESC (
        if defined AStyles (
            set LResult=!sBEGIN!!AStyles!^;!AESC!!s!!sRESET!
        ) else (
            set LResult=!sBEGIN!!AESC!!s!!sRESET!
        )
        rem echo 0.LResult:!LResult!
    ) else (

        rem --------------------------------------------
        if defined AStyles set res=true
        if defined AFG8 set res=true
        if defined ABG8 set res=true
        if defined AFG256 set res=true
        if defined ABG256 set res=true
        if defined res ( 
            set LResult=!sBEGIN!
        )

        rem --------------------------------------------
        if defined LStyles (
            set LResult=!LResult!!LStyles!
        )
        rem echo 1.LResult:!LResult!

        rem --------------------------------------------
        if defined AFG8 (
            if defined LStyles (
                set LResult=!LResult!^;!AFG8!
            ) else (
                set LResult=!LResult!!AFG8!
            )
        )
        rem echo 2.LResult:!LResult!

        rem --------------------------------------------
        if defined ABG8 (
            if defined LStyles set res=true
            if defined AFG8 set res=true
            if defined res ( 
                set LResult=!LResult!^;!ABG8!
            ) else (
                set LResult=!LResult!!ABG8!
            )
        )
        rem echo 3.LResult:!LResult!

        rem --------------------------------------------
        if defined AFG8 if defined ABG8 (
            if defined AFG256 (
                if defined LStyles (
                    set LResult=!LResult!^;!sFG256_BEGIN!!AFG256!
                ) else (
                    set LResult=!LResult!!sFG256_BEGIN!!AFG256!
                )
                rem echo LResult:!LResult!
            )

            rem --------------------------------------------
            if defined ABG256 (
                if defined LStyles set res=true
                if defined AFG256 set res=true
                if defined res ( 
                    set LResult=!LResult!^;!sBG256_BEGIN!!ABG256!
                ) else (
                    set LResult=!LResult!!sBG256_BEGIN!!ABG256!
                )
                rem echo LResult:!LResult!
            )
        )
        rem --------------------------------------------
        echo 4.LResult:!LResult!

        if defined LResult (
            set LResult=!LResult!!sEND!!s!!sRESET!
        ) else (
            set LResult=!s!
        )
    )

    set FormatColorStr=!LResult!
    set !FUNCNAME!=!LResult!
    rem echo !FUNCNAME!: !%FUNCNAME%!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function aListToStr (ASTR) -> ListToStr
rem --------------------------------------------------------------------------------
:aListToStr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=aListToStr
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem echo _:%*
    set ASTR=%*

    set LSTR=
    call :Read_N %*
    rem echo Read_N:!Read_N!
    if !Read_N! GTR 0 (
        if !Read_N! EQU 1 (
            set LSTR=%1
        ) else (
            set n=1
            for %%a in ( %* ) do (
                rem ECHO a:%%a
                if !n! EQU 1 (
                    set LSTR=!LSTR!%%a
                ) else (
                    if !n! EQU !Read_N! (
                        set LSTR=!LSTR!!sEND!%%a
                    ) else (
                        set LSTR=!LSTR!^;%%a
                    )
                )
                set /A n+=1
            )
            set LSTR=!sBEGIN!!LSTR!!sRESET!
        )
    )
    rem echo LSTR:!LSTR!

    set aListToStr=!LSTR!
    set !FUNCNAME!=!LSTR!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem function bListToStr (ASTR) -> ListToStr
rem --------------------------------------------------------------------------------
:bListToStr
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=bListToStr
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem echo _:%*
    set ASTR=%*
                         
    set LSTR=
    call :Read_N %*
    rem echo Read_N:!Read_N!
    if !Read_N! GTR 0 (
        if !Read_N! EQU 1 (
            set LSTR=%1
        ) else (
            set n=1
            for %%a in ( %* ) do (
                rem echo a:%%a
                if !n! EQU 1 (
                    set LSTR=!LSTR!%%a
                ) else (
                    if !n! EQU !Read_N! (
                        set LSTR=!LSTR!^;%%a
                    ) else (
                        set LSTR=!LSTR!^;%%a
                    )
                )
                set /A n+=1
            )
            set LSTR=!LSTR!
        )
    )
    rem echo LSTR:!LSTR!

    set bListToStr=!LSTR!
    set !FUNCNAME!=!LSTR!

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  SetColor (AStyles, AFG8, ABG8, AFG256, ABG256)
rem -------------------------------------------------
:SetColor
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=SetColor
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    rem ������� �echo�, ������������ � �������� ������ ��� ������ ������,
    rem ��������� ������� 0x0D, 0x0A (Carriage Return � Line Feed).
    rem ����� �������� �����, ������ ���������� �����-���� ������� �������
    
    call :bListToStr %* || exit /b 1
    rem echo bListToStr:!bListToStr!

    rem <nul set /p strTemp=[33m
    rem <nul set /p strTemp=[!cFG8_WHITE!^;!cBG8_BLACK!m
    rem <nul set /p strTemp=[37^;40m
    rem <nul set /p strTemp=[!cS_BOLD!;!cFG8_WHITE!;!cBG8_RED!!sEND!

    rem �� ���������� ���� � ���������� �nul� � ������� �set /p� ��� �������� ������� �echo�.
    <nul set /p strTemp=!sBEGIN!!bListToStr!!sEND!
    
    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  ReSetColorCR ():
rem -------------------------------------------------
:ReSetColorCR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ReSetColorCR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    echo !sRESET!
    rem <nul set /p strTemp=!sRESET!

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  ReSetColor ():
rem -------------------------------------------------
:ReSetColor
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=ReSetColor
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    <nul set /p strTemp=!sRESET!

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  Write (s)
rem -------------------------------------------------
:Write
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=Write
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :ListToStr %* || exit /b 1

    rem echo !ListToStr!
    <nul set /p strTemp=!ListToStr!

    rem call :FormatColorStr %* || exit /b 1
    rem echo FormatColorStr:!FormatColorStr!
    rem echo !FormatColorStr!

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteCR ()
rem -------------------------------------------------
:WriteCR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteCR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    echo.

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteLN (AStyles, AFG8, ABG8, AFG256, ABG256, s)
rem -------------------------------------------------
:WriteLN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteLN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :aListToStr %* || exit /b 1
    echo !aListToStr!

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteLOG (Level, s):
rem -------------------------------------------------
:WriteLOG
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteLOG
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    set ALevel=%1
    set s=%2

    if !ALevel! EQU !NOTSET! (
        call :WriteLN !cNOTSET! !s!
    )
    if !ALevel! EQU !DEBUG! (
        call :WriteLN !cDEBUG! !s!
    )
    if !ALevel! EQU !INFO! (
        call :WriteLN !cINFO! !s!
    )
    if !ALevel! EQU !WARNING! (
        call :WriteLN !cWARNING! !s!
    )
    if !ALevel! EQU !ERROR! (
        call :WriteLN !cERROR! !s!
    )
    if !ALevel! EQU !CRITICAL! (
        call :WriteLN !cCRITICAL! !s!
    )
    if !ALevel! EQU !BEGIN! (
        call :WriteLN !cBEGIN! !s!
    )
    if !ALevel! EQU !END! (
        call :WriteLN !cEND! !s!
    )
    if !ALevel! EQU !PROCESS! (
        call :WriteLN !cPROCESS! !s!
    )
    if !ALevel! EQU !DEBUGTEXT! (
        call :WriteLN !cDEBUGTEXT! !s!
    )
    if !ALevel! EQU !TEXT! (
        call :WriteLN !cTEXT! !s!
    )

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteNOTSET (s):
rem -------------------------------------------------
:WriteNOTSET
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteNOTSET
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cNOTSET!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteDEBUG (s):
rem -------------------------------------------------
:WriteDEBUG
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteDEBUG
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cDEBUG!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteINFO (s):
rem -------------------------------------------------
:WriteINFO
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteINFO
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cINFO!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteWARNING (s):
rem -------------------------------------------------
:WriteWARNING
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteWARNING
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cWARNING!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteERROR (s):
rem -------------------------------------------------
:WriteERROR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteERROR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cERROR!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteCRITICAL (s):
rem -------------------------------------------------
:WriteCRITICAL
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteCRITICAL
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cCRITICAL!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteBEGIN (s):
rem -------------------------------------------------
:WriteBEGIN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteBEGIN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cBEGIN!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteEND (s):
rem -------------------------------------------------
:WriteEND
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteEND
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cEND!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WritePROCESS (s):
rem -------------------------------------------------
:WritePROCESS
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WritePROCESS
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cPROCESS!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteDEBUGTEXT (s):
rem -------------------------------------------------
:WriteDEBUGTEXT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteDEBUGTEXT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cDEBUGTEXT!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem -------------------------------------------------
rem  WriteTEXT (s):
rem -------------------------------------------------
:WriteTEXT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=WriteTEXT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )
    set !FUNCNAME!=

    call :SetColor !cTEXT!
    call :ListToStr %* || exit /b 1
    call :Write !ListToStr!
    call :ReSetColorCR

    exit /b 0
rem endfunction

rem =================================================
rem LYRSupport.bat
rem =================================================
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem =================================================
rem LYRStrUtils.bat
rem =================================================
:ListToStr
%LIB_BAT%\LYRStrUtils.bat %*
exit /b 0

rem ===================================================================
