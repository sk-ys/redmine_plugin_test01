@echo off
:: get parent directory name and initialize tree.txt
for %%i in (%cd%) do set parent_directory=%%~ni
echo %parent_directory% > tree.txt

:: make tree
for /f "usebackq skip=3 tokens=* delims=" %%i in (`tree /a %1`) do @echo %%i >> tree.txt