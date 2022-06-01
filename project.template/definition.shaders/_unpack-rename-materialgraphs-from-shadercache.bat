@echo off
rem ---------------------------------------------------
rem --- settings
rem ---------------------------------------------------
call ../_settings_.bat

echo.
echo --------------------------------------------------------------------------
echo -- EXTRACTING SHADER DATA FROM SHADER CACHES
echo --------------------------------------------------------------------------
echo.

"%DIR_ENCODER%\w3shaderutil.exe" --unpack "%DIR_W3%\**\shader.cache" --output-dir "%DIR_DEF_SHADERCACHE_FILES%" --rename "%DIR_DEF_SHADERCACHE%\materialgraph-renaming.csv" %loglevel%

:TheEnd
