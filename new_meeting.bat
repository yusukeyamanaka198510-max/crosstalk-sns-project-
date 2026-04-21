@echo off
chcp 65001 > nul

set SCRIPT_DIR=%~dp0
set TEMPLATE=%SCRIPT_DIR%meetings\template.md

for /f "tokens=1-3 delims=/" %%a in ("%date%") do (
    set YYYY=%%c
    set MM=%%a
    set DD=%%b
)

set FILENAME=%YYYY%%MM%%DD%.md
set DEST=%SCRIPT_DIR%meetings\%FILENAME%

if exist "%DEST%" (
    echo [警告] %FILENAME% はすでに存在します。上書きしますか？ (y/n)
    set /p CONFIRM=
    if /i not "%CONFIRM%"=="y" (
        echo キャンセルしました。
        exit /b 0
    )
)

copy "%TEMPLATE%" "%DEST%" > nul
echo [完了] 議事録を作成しました: meetings\%FILENAME%
