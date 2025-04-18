@echo off
REM Detect Visual Studio 2022 Preview
echo Trying to detect Visual Studio 2022 Preview...
"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -latest -prerelease -version [17.0,17.99) -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64
if %ERRORLEVEL% EQU 0 (
    echo Visual Studio 2022 Preview detected successfully!
    set BUILD_VS_YEAR=17
    exit /b 0
) else (
    echo Visual Studio 2022 Preview not found.
    exit /b 1
)
