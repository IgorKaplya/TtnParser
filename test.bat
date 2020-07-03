echo off

set testRoot=%CD%

echo [Build test]
call build_project_XE %testRoot%\Test\TtnParserTest.dproj Release Build %testRoot%\_out 19
echo.

echo [Run test]
cd /d %testRoot%\_out
call TtnParserTest.exe
echo.

if %errorlevel% == 0 (goto testPassed) else goto testFailed

:testFailed
echo ********** TEST FAILURE **********
pause
exit 1

:testPassed