@echo off
rem -------------------------------------------------------------------
rem [lyrxxx_]PATTERN_empty.bat
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
    set BATNAME=%~nx0
    echo ����� !BATNAME! ...

    set ShortcutName="Google Chrome"
    set TargetPath="C:\Program Files\Google\Chrome\Application\chrome.exe"
    set Arguments="--incognito"  :: ��������� ��� �������
    set IconLocation="C:\Program Files\Google\Chrome\Application\chrome.exe,0"  :: ���� � ������
    set ShortcutLocation="%USERPROFILE%\Desktop\Google Chrome.lnk"

    :: ������� �����
    powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%ShortcutLocation%'); $s.TargetPath = '%TargetPath%'; $s.Arguments = '%Arguments%'; $s.IconLocation = '%IconLocation%'; $s.Description = '������ Google Chrome � ������ ���������'; $s.Save()"

    exit /b 0
:end

rem ===================================================================
