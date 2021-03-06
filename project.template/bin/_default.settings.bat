rem --------------------------------------------------------------------------------------------------------------
rem --------------------------------------------------------------------------------------------------------------
rem --- the following settings do not need to be adjusted
rem --------------------------------------------------------------------------------------------------------------
rem --------------------------------------------------------------------------------------------------------------

rem --- remove trailing slash
IF %DIR_PROJECT_BASE:~-1%==\ SET DIR_PROJECT_BASE=%DIR_PROJECT_BASE:~0,-1%

rem --- default sub dir values -----------------------------------------------------------------------------------

IF "%DIR_DLC_SCENES%"=="" SET DIR_DLC_SCENES=scenes
IF "%DIR_DLC_ENVS%"=="" SET DIR_DLC_ENVS=envs
IF "%DIR_DLC_MESHES%"=="" SET DIR_DLC_MESHES=entities\meshes
IF "%DIR_DLC_REDFUR%"=="" SET DIR_DLC_REDFUR=entities\meshes

rem --------------------------------------------------------------------------------------------------------------
rem --------------------------------------------------------------------------------------------------------------

rem --- settings for modkit
set DIR_MODKIT_BIN=%DIR_MODKIT%\bin\x64
set DIR_MODKIT_DEPOT=%DIR_MODKIT%\r4data

rem --- settings for encoders
rem path to repository files of encoder
set dir_repo_quests=%dir_encoder%\repo.quests
rem should be the same as repo.quests so world definitions are synced
set dir_repo_worlds=%dir_encoder%\repo.quests
set dir_repo_scenes=%dir_encoder%\repo.scenes
set dir_repo_lipsync=%dir_encoder%\repo.lipsync

rem path to data directory for phoneme extraction/generation
set dir_data_phoneme_generation=%dir_encoder%\data

rem ---------------------------------------------------
rem --- some environment settings

rem dir where all building batch files are located
set DIR_PROJECT_BIN=%DIR_PROJECT_BASE%\bin

rem path to folder hosting cooked dlc and cooked mod folders
set DIR_RESOURCES=%DIR_PROJECT_BASE%\resources\

rem lowercased modname is required for cooking with trimdir
set MODNAME_LC=%MODNAME%
call :ToLowerCase MODNAME_LC

rem ---------------------------------------------------
rem --- output directories

rem --- encode -> uncooked -[cook]-> cooked -[pack]-> dlc

rem tmp directory for seed files, cook db etc. will be deleted and recreated on
rem cleanup
set DIR_TMP=%DIR_PROJECT_BASE%\_tmp
rem tmp directory for all files required for generating the texture cache. will
rem be deleted and recreated on cleanup
set DIR_TMP_TEXTURE_CACHE=%DIR_PROJECT_BASE%\_tmp.texture.cache

rem target root directory for all encoded files to be cooked
set DIR_UNCOOKED=%DIR_PROJECT_BASE%\uncooked

rem target root directory for all encoded mod files
set DIR_COOKED_MOD=%dir_resources%\mod%MODNAME_LC%\files

rem target root directory for all encoded dlc files
set DIR_COOKED_DLC=%dir_resources%\dlc%MODNAME_LC%\files

rem target root directory for all encoded dlc files
set DIR_COOKED_FILES_DB=%dir_tmp%\files.cook.db
set DIR_COOKED_TEXTURES_DB=%dir_tmp%\textures.cook.db

rem game relative dlc path
SET DIR_DLC_GAMEPATH=dlc\dlc%MODNAME_LC%

rem --- directories with additional files that will be copied unmodified
rem  - BEFORE cooking step:
rem       DIR_ADDITIONAL_DLC_PRE_COOK  ->  DIR_UNCOOKED/DIR_DLC_GAMEPATH
rem  - AFTER cooking step:
rem       DIR_ADDITIONAL_DLC_POST_COOK ->  DIR_COOKED_DLC/DIR_DLC_GAMEPATH
rem       DIR_ADDITIONAL_MOD_POST_COOK ->  DIR_COOKED_MOD
rem
set DIR_ADDITIONAL_DLC_PRE_COOK=%DIR_PROJECT_BASE%\additional.dlc.pre-cook
set DIR_ADDITIONAL_DLC_POST_COOK=%DIR_PROJECT_BASE%\additional.dlc.post-cook
set DIR_ADDITIONAL_MOD_POST_COOK=%DIR_PROJECT_BASE%\additional.mod.post-cook

rem target directory for encoded quest file
set DIR_OUTPUT_QUEST=%DIR_UNCOOKED%

rem target directory for encoded w2scene file
set DIR_OUTPUT_SCENES=%DIR_UNCOOKED%\%DIR_DLC_GAMEPATH%\data\%DIR_DLC_SCENES%

rem target directory for encoded w2scene file
set DIR_OUTPUT_WORLD=%DIR_UNCOOKED%\%DIR_DLC_GAMEPATH%\data\levels

rem target directory for encoded env files
set DIR_OUTPUT_ENVS=%DIR_UNCOOKED%\%DIR_DLC_GAMEPATH%\data\%DIR_DLC_ENVS%

rem target directory for imported models
SET DIR_OUTPUT_MESHES=%DIR_UNCOOKED%\%DIR_DLC_GAMEPATH%\data\%DIR_DLC_MESHES%

rem target directory for imported apx files
SET DIR_OUTPUT_REDFUR=%DIR_UNCOOKED%\%DIR_DLC_GAMEPATH%\data\%DIR_DLC_REDFUR%

rem path of final dlc mod
set DIR_DLC=%DIR_W3%\dlc\dlc%MODNAME%

rem path of final mod-part
set DIR_MOD=%DIR_W3%\mods\mod%MODNAME%

rem path of final tmp-mod-part
set DIR_TMP_MOD=%DIR_W3%\mods\mod%MODNAME%_tmp

rem content directory of final dlc
set DIR_DLC_CONTENT=%DIR_DLC%\content

rem content directory of final mod
set DIR_MOD_CONTENT=%DIR_MOD%\content

rem content directory of final tmp mod
set DIR_TMP_MOD_CONTENT=%DIR_TMP_MOD%\content

rem ---------------------------------------------------
rem --- script src dirs

SET DIR_MOD_SCRIPTS=%DIR_PROJECT_BASE%\mod.scripts

SET DIR_TMP_MOD_SCRIPTS=%DIR_PROJECT_BASE%\mod.scripts-tmp

rem ---------------------------------------------------
rem --- w3strings settings

rem target directory for generated strings.csv parts
set DIR_STRINGS=%DIR_PROJECT_BASE%\strings

rem prefix for generated strings.csv files which are
rem concatenated before encoding final w3strings file
set STRINGS_PART_PREFIX=strings.

set ENCODE_STRINGS=%DIR_STRINGS%\_reencode-strings.bat

rem ---------------------------------------------------
rem --- w2scene settings

rem dir with quest definition
set DIR_DEF_SCENES=%DIR_PROJECT_BASE%\definition.scenes

rem prefix used to autodetect scene yml definition
set SCENE_DEF_PREFIX=scene.

rem ---------------------------------------------------
rem --- w2quest settings

rem dir with quest definition
set DIR_DEF_QUEST=%DIR_PROJECT_BASE%\definition.quest

rem prefix for seed files
set SEEDFILE_PREFIX=seed.

rem additionally generated files that need to be processed for texture cache
rem generation
set ADDITIONAL_TEXTURE_CACHE_FILES=*.texarray

rem ---------------------------------------------------
rem --- w3speech settings

rem default language
if "%language%" == "" set language=en
set DIR_SPEECH=%DIR_PROJECT_BASE%\speech
set DIR_AUDIO_WAV=%DIR_SPEECH%\speech.%language%.wav
set DIR_PHONEMES=%DIR_AUDIO_WAV%
set DIR_AUDIO_WEM=%DIR_SPEECH%\speech.%language%.wem
rem ---------------------------------------------------
rem --- w3world settings

rem dir with world definition
set DIR_DEF_WORLD=%DIR_PROJECT_BASE%\definition.world

rem prefix used to autodetect world yml definition
set WORLD_DEF_PREFIX=world.

rem ---------------------------------------------------
rem --- w3envs settings

rem dir with world definition
set DIR_DEF_ENVS=%DIR_PROJECT_BASE%\definition.envs

rem prefix used to autodetect env yml definition
set ENV_DEF_PREFIX=env.

rem ---------------------------------------------------
rem --- redfur settings

rem dir with apx definitions
set DIR_DEF_FUR=%DIR_PROJECT_BASE%\definition.hairworks

rem prefix used to autodetect fur definitions
set FUR_DEF_PREFIX=fur.

rem ---------------------------------------------------
rem --- shadercache settings

rem dir with shadercache definitions
set DIR_DEF_SHADERCACHE=%DIR_PROJECT_BASE%\definition.shaders

rem dir with compiled shaders
set DIR_DEF_SHADERCACHE_FILES=%DIR_DEF_SHADERCACHE%\compiled

rem file with definition of shaders to be included into new shader cache
set SHADERCACHE_REGISTRY=materialgraph-registry.yml

rem ---------------------------------------------------
rem --- model import settings

rem dir with fbx models
set DIR_MODEL_FBX=%DIR_PROJECT_BASE%\models

rem prefix used to autodetect models to be imported
set MODEL_PREFIX=model.

rem ---------------------------------------------------
rem --- texture import settings

rem dir with textures to be imported
set DIR_TEXTURE_IMPORT=%DIR_PROJECT_BASE%\textures.import

rem command to import "one" texture
SET BIN_IMPORT_TEXTURE=call "%DIR_PROJECT_BIN%\_wcc.import.texture.bat"

rem target root directory for imported textures. imported textures are uncooked
rem kept separate from uncooked directory so creation of texturecache is easier
set DIR_UNCOOKED_TEXTURES=%DIR_PROJECT_BASE%\textures.uncooked

rem ---------------------------------------------------
rem ---------------------------------------------------
rem set WCC_LITE="%DIR_MODKIT_BIN%\wcc_lite.exe"
set WCC_LITE=call "%DIR_PROJECT_BIN%\wcc_lite.bat"

rem game relative path to worlds for scanning depot
set DIR_WCC_DEPOT_WORLDS=%DIR_DLC_GAMEPATH%\data\levels
rem ---------------------------------------------------
rem --- default flags for build steps: do nothing
SET PATCH_MODE=1
SET FULL_REBUILD=0

SET ENCODE_WORLD=0
SET ENCODE_ENVS=0
SET ENCODE_SCENES=0
SET ENCODE_QUEST=0
SET ENCODE_SHADOWMESHES=0
SET ENCODE_STRINGS=0
SET ENCODE_SPEECH=0
SET ENCODE_HAIRWORKS=0
SET GENERATE_SHADERCACHE=0
SET WCC_IMPORT_MODELS=0
SET WCC_IMPORT_TEXTURES=0
SET WCC_SEEDFILES=
SET WCC_COOK=0
SET WCC_NAVDATA=0
SET WCC_TEXTURECACHE=0
SET WCC_COLLISIONCACHE=0
rem SET WCC_SHADERCACHE=0
rem SET WCC_DEPCACHE=0
SET WCC_ANALYZE=0
SET WCC_ANALYZE_WORLD=0
SET WCC_REPACK_DLC=0
SET WCC_REPACK_MOD=0
SET DEPLOY_SCRIPTS=0
SET DEPLOY_TMP_SCRIPTS=0
SET START_GAME=0

SET ENVID=
SET SCENEID=
SET SCENE_TIMELINE_START=
SET SCENE_TIMELINE_END=
SET SCENE_TIMELINE_ZOOM=
SET MODELNAME=

SET SETTINGS_LOADED=1
rem ---------------------------------------------------
if not exist "%dir_tmp%" mkdir "%dir_tmp%"

:CheckDlcDir
if exist "%DIR_MODKIT_DEPOT%\dlc\dlc%MODNAME%" GOTO :CheckScriptsDir
echo ERROR: depot directory not found!
echo ERROR: make sure "%DIR_MODKIT_DEPOT%\dlc\dlc%MODNAME%" exists and points to "%DIR_UNCOOKED%\dlc\dlc%MODNAME%"
exit /B 1

:CheckScriptsDir
if exist "%DIR_MODKIT_DEPOT%\scripts\dlc%MODNAME%" GOTO :CheckModkitScriptExtensions
echo ERROR: depot script directory not found!
echo ERROR: make sure "%DIR_MODKIT_DEPOT%\scripts\dlc%MODNAME%" exists and points to "%DIR_MOD_SCRIPTS%"
exit /B 1

:CheckModkitScriptExtensions
if exist "%DIR_MODKIT_DEPOT%\scripts\radishDbg.ws" GOTO :NoError
echo ERROR: modkit radish script extensions not found!
echo ERROR: make sure you install the "radish.tools.unpack.into.r4data" package
exit /B 1

rem ---------------------------------------------------
:NoError
rem reset errorlevel
exit /B 0

rem ---------------------------------------------------
:ToLowerCase
rem http://www.robvanderwoude.com/battech_convertcase.php
rem Subroutine to convert a variable VALUE to all lower case.
rem The argument for this subroutine is the variable NAME.
FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z") DO CALL SET "%1=%%%1:%%~i%%"
exit /B 0
