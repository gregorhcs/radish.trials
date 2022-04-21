//
// a place for temporary tests, functions, etc. not to be published in final mod
// make sure filename is unique by prefixing with modname!
//
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
// add this hotkey under [Exploration] section in input.settings
// IK_F8=(Action=TMP_StartScene)
// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
class CTmpSceneStarter extends CMod {
    default modName = 'TmpSceneStarter';
    default modAuthor = "rmemr";
    default modUrl = "";
    default modVersion = '0.1.1';
    // ------------------------------------------------------------------------
    private var scenePath: String;
    // ------------------------------------------------------------------------
    default scenePath = "dlc\dlcTrial5\data\scenes\1_dialog_with_maniac.w2scene";
    // ------------------------------------------------------------------------
    public function init() {
        super.init();
        theInput.RegisterListener(this, 'OnStartScene', 'TMP_StartScene');
    }
    // ------------------------------------------------------------------------
    event OnStartScene(action: SInputAction) {
        var scene : CStoryScene;
        if (IsReleased(action)) {
            scene = (CStoryScene)LoadResource( scenePath, true);
            theGame.GetStorySceneSystem().PlayScene(scene, "Input");
        }
    }
    // ------------------------------------------------------------------------
}
// ----------------------------------------------------------------------------
function modCreate_tmpSceneStarter() : CTmpSceneStarter {
    return new CTmpSceneStarter in thePlayer;
}
// ----------------------------------------------------------------------------
