class CPirateInitializer extends ISpawnTreeScriptedInitializer {
    // ------------------------------------------------------------------------
    function Init(actor: CActor) : bool {

        var level : int;
        var npc : CNewNPC;

        npc = (CNewNPC)actor;

        if (npc) {
            if (FactsQuerySum("trial7_unconscious_pirates") <= 1) {

                npc.isMiniBossLevel = true;
                npc.level = 42;
                npc.currentLevel = 42;
                npc.willBeUnconscious = true;

                FactsAdd("trial7_unconscious_pirates", 1, -1);
            }
            else {
                level = RandRange(20,40);
                npc.level = level;
                npc.currentLevel = level;
            }
        }

        return true;
    }
    // ------------------------------------------------------------------------
}