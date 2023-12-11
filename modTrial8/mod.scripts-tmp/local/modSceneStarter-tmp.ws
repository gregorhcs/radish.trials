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
    private var scenePath1: String;
    private var scenePath2: String;
    private var scenePath3: String;
    private var scenePath4: String;
    private var scenePath51: String;
    private var scenePath52: String;
    private var scenePath5: String;
    private var scenePath6: String;
    private var scenePath7: String;
    private var scenePath8: String;
    private var scenePath9: String;
    // ------------------------------------------------------------------------
    default scenePath1 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s1_start_merchant.w2scene";
    default scenePath2 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s2_demons.w2scene";
    default scenePath3 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s3_amulet_from_merchant.w2scene";
    default scenePath4 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s4_demons_2nd_task.w2scene";
    default scenePath51 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s5.1_pebble_hmm.w2scene";
    default scenePath52 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s5.2_pebble_interesting.w2scene";
    default scenePath5 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s5_ritual.w2scene";
    default scenePath6 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s6_unhappy_awakening.w2scene";
    default scenePath7 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s7_geralt_confronts.w2scene";
    default scenePath8 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s8_merchant_reunited.w2scene";
    default scenePath9 = "dlc\dlctrial8\files\dlc\dlctrial8\data\scenes\s9_merchant_selling.w2scene";
    // ------------------------------------------------------------------------
    public function init() {
        super.init();
        theInput.RegisterListener(this, 'OnStartScene', 'TMP_StartScene');
    }
    // ------------------------------------------------------------------------
    event OnStartScene(action: SInputAction) {
        var scene : CStoryScene;
        if (IsReleased(action)) {
            scene = (CStoryScene)LoadResource(scenePath4, true);
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
