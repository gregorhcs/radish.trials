@echo off
rem ---------------------------------------------------
rem --- settings
rem ---------------------------------------------------
call ../_settings_.bat

rem ---------------------------------------------------

:: auto execution of every step that is needed
SET PATCH_MODE=0

SET ENCODE_HAIRWORKS=1

call "%DIR_PROJECT_BIN%\build.bat"
