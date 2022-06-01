rem ---------------------------------------------------
rem --- check for settings
rem ---------------------------------------------------
IF %SETTINGS_LOADED% EQU 1 goto :SettingsLoaded

echo ERROR! Settings not loaded! - do not start this file directly!
EXIT /B 1
rem ---------------------------------------------------
:SettingsLoaded

echo.
echo ---------------------------------------------------------------------------
echo -- PREPARE TEXTURE COOKING: COPY ADDITIONAL GENERATED TEXTURE CACHE FILES
echo ---------------------------------------------------------------------------
echo.

echo  ^> copying uncooked %ADDITIONAL_TEXTURE_CACHE_FILES% to %DIR_TMP_TEXTURE_CACHE%
robocopy "%DIR_UNCOOKED%" "%DIR_TMP_TEXTURE_CACHE%" %ADDITIONAL_TEXTURE_CACHE_FILES% /s /NFL /NJH /XX
echo  ^> done.

if %ERRORLEVEL% EQU 0 GOTO:CopyUncookedTextures
:: One or more files were copied successfully (that is, new files have arrived).
if %ERRORLEVEL% EQU 1 GOTO:CopyUncookedTextures
:: Some Extra files or directories were detected.
if %ERRORLEVEL% EQU 2 GOTO:CopyUncookedTextures
:: (2+1) Some files were copied. Additional files were present. No failure was encountered.
if %ERRORLEVEL% EQU 3 GOTO:CopyUncookedTextures
:: something else happened
GOTO:SomeError

:CopyUncookedTextures

echo  ^> copying uncooked textures to %DIR_TMP_TEXTURE_CACHE%
robocopy "%DIR_UNCOOKED_TEXTURES%" "%DIR_TMP_TEXTURE_CACHE%" /s /NFL /NJH /XX
echo  ^> done.

if %ERRORLEVEL% EQU 0 GOTO:CookTextures
:: One or more files were copied successfully (that is, new files have arrived).
if %ERRORLEVEL% EQU 1 GOTO:CookTextures
:: Some Extra files or directories were detected.
if %ERRORLEVEL% EQU 2 GOTO:CookTextures
:: (2+1) Some files were copied. Additional files were present. No failure was encountered.
if %ERRORLEVEL% EQU 3 GOTO:CookTextures
:: something else happened
GOTO:SomeError

:CookTextures
echo.
echo --------------------------------------------------------------------------
echo -- WCC_LITE: COOK TEXTURES
echo --------------------------------------------------------------------------
echo.

rem after the previous texture cooking prepare steps at least some project
rem related uncooked textures or some new generated (uncooked) files must be
rem present in the tmp folder in the DIR_DLC_GAMEPATH
if not EXIST "%DIR_TMP_TEXTURE_CACHE%\%DIR_DLC_GAMEPATH%" GOTO:NoneFound

if EXIST "%DIR_COOKED_TEXTURES_DB%" del "%DIR_COOKED_TEXTURES_DB%"

PUSHD "%DIR_MODKIT_BIN%"
%WCC_LITE% cook -platform=pc -mod="%DIR_TMP_TEXTURE_CACHE%" -basedir="%DIR_TMP_TEXTURE_CACHE%" -outdir="%DIR_COOKED_DLC%"
POPD

:: move so it is separated from "normal" files cook.db
if EXIST "%DIR_COOKED_DLC%\cook.db" move "%DIR_COOKED_DLC%\cook.db" "%DIR_COOKED_TEXTURES_DB%"

IF %ERRORLEVEL% NEQ 0 GOTO SomeError

EXIT /B %ERRORLEVEL%

rem ---------------------------------------------------
:SomeError
echo.
echo ERROR! Something went WRONG! at least one import FAILED!
echo.
exit /B 1

rem ---------------------------------------------------
:NoneFound
echo WARN: no files found in "%DIR_TMP_TEXTURE_CACHE%\%DIR_DLC_GAMEPATH%"
echo.
EXIT /B 0
