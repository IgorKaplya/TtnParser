cls
echo off

echo [Deploy directories]
set deployroot=%CD%
set outTtn=%CD%\_out
echo   root: %deployroot%
echo   out:  %outTtn%
set success_count=0

call test.bat

echo [Build TtnParser.exe]
cd /d %deployroot%
call build_project_XE ".\TtnParser.dproj" Release Build %outTtn% 19
if %errorlevel% == 0 (set /a success_count = %success_count% + 1) else goto errorBuild

echo [Delete meta files from out DIR]
echo   Deleting MAP files.
cd /d %outTtn%
del /s *.map
echo   Deleting DRC files.
cd /d %outTtn%
del /s *.drc
echo.

echo [Deploy summary]
echo    Sucessfuly built project count: %success_count%
echo.
pause
exit

:errorBuild
echo ********** BUILD FAILURE **********
pause