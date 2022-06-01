rem ---------------------------------------------------
rem --- check for settings
rem ---------------------------------------------------
IF %SETTINGS_LOADED% EQU 1 goto :SettingsLoaded

echo ERROR! Settings not loaded! - do not start this file directly!
EXIT /B 1
rem ---------------------------------------------------
:SettingsLoaded

if exist "%DIR_DEF_SHADERCACHE_FILES%\%SHADERCACHE_REGISTRY%" GOTO :GenerateShaderCache
EXIT /B 0

:GenerateShaderCache
echo.
echo --------------------------------------------------------------------------
echo -- GENERATING SHADER CACHE %PATCHING%
echo --------------------------------------------------------------------------
echo.

"%DIR_ENCODER%\w3shaderutil.exe" --pack "%DIR_DEF_SHADERCACHE_FILES%\%SHADERCACHE_REGISTRY%" --output-dir "%DIR_DLC_CONTENT%" --compressed %loglevel%

IF %ERRORLEVEL% NEQ 0 GOTO SomeError

EXIT /b 0

rem ---------------------------------------------------
:SomeError
echo.
echo ERROR! Something went WRONG! Shadercache was NOT GENERATED!
echo.
EXIT /B 1
