@echo off
setlocal

rem set "sourceDir=C:\Users\valma\Desktop\ak3\Labs\PZ-23y-1\Marchenko\from"

rem set "targetDir=C:\Users\valma\Desktop\ak3\Labs\PZ-23y-1\Marchenko\to"

echo Enter path to FROM catalog:

set /p sourceDir=

echo Enter path to TO catalog:

set /p targetDir=

rem Перевірка існування вихідного каталогу
if not exist "%sourceDir%" (
    echo There is no such FROM catalog: %sourceDir%
	goto :help
)

rem Перевірка існування цільового каталогу
if not exist "%targetDir%" (
    echo There is no such TO catalog: %targetDir%
	goto :help
)

rem Переміщення файлів з вихідного каталогу в цільовий каталог
move "%sourceDir%\*" "%targetDir%\"

rem Перевірка результату операції переміщення
if %errorlevel% equ 0 (
    echo Successful cut from %sourceDir% to %targetDir%
) else (
    echo Error in cut
)

endlocal
pause
exit /b 0

:help
echo Usage: %0 "[path_to_directory]"
echo.
echo Parameters:
echo    path_to_directory - The path to the directory you want to cut from
pause
exit /b 1
