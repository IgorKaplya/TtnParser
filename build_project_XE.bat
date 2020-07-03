echo off
set BuildProject=%1
set BuildConfiguration=%2
set BuildMode=%3
rem Verbosity: quiet, minimal, normal (default), detailed
set BuildVerbosity=minimal
set OutPath=%4
set XEVer="C:\Program Files (x86)\Embarcadero\Studio\%5.0\bin\rsvars.bat"
set ProjectDir=%~nx1
echo ------------------------Starting build script------------------------
echo [Conf]
echo     Build project: %BuildProject%
echo     Build configuration: %BuildConfiguration%
echo     Build mode: %BuildMode%
echo     BuildVerbosity: %BuildVerbosity%
echo     OutPath: %OutPath%
echo     DelphiVer: %XEVer%
echo     ProjectDir: %ProjectDir%
echo.
echo [rsvars]
echo     Setting up variables for ms build.
call %XEVer%
echo     BDS: %BDS%
echo     FrameworkDir: %FrameworkDir%
echo     FrameworkVersion: %FrameworkVersion%
echo     BDSINCLUDE: %BDSINCLUDE%
echo     BDSCOMMONDIR: %BDSCOMMONDIR%
echo     FrameworkSDKDir: %BDS%
echo     LANGDIR: %LANGDIR%
echo     PLATFORM: %PLATFORM%
echo     PlatformSDK: %PlatformSDK%
echo     PATH: %PATH%
echo.
echo [Build]
echo     Building project.
call msbuild %BuildProject% /t:%BuildMode% /p:config=%BuildConfiguration% /v:%BuildVerbosity% /p:DCC_ExeOutput=%OutPath%
echo.
echo ------------------------Build script complete------------------------
