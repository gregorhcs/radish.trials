class C_DMNQ_RitualBowl extends W3AnimationInteractionEntity 
{
    event OnInteraction(actionName : string, activator : CEntity)
    {
        var inv : CInventoryComponent;

        var pebbles : int;
        var amulets : int;

        super.OnInteraction(actionName, activator);

        // ------------------------------------------------------

        inv = GetWitcherPlayer().GetInventory();

        pebbles = inv.GetItemQuantityByName('dmnq_pebble');
        amulets = inv.GetItemQuantityByName('dmnq_amulet');

        //theGame.GetGuiManager().ShowNotification("Amulets/Pebbles: " + amulets + "/" + pebbles + " || " + amulets2 + "/" + pebbles2);


        if (pebbles > 0) {

            FactsAdd("DMNQ_deposited_pebbles", pebbles, -1);
            //theGame.GetGuiManager().ShowNotification("Deposited Pebbles: " + FactsQuerySum("DMNQ_deposited_pebbles"));

            inv.RemoveItemByName('dmnq_pebble', -1);
            //theSound.SoundEvent('gui_global_loot_all');
            //theSound.SoundEvent('gui_global_loot_all');
            //theSound.SoundEvent('work_loot_ground');
            //theSound.SoundEvent('gui_global_loot');
            //theSound.SoundEvent('gui_inventory_drop');
            theSound.SoundEvent('gui_inventory_ranged_back');
        }

        if (amulets > 0) {

            FactsAdd("DMNQ_deposited_amulet", 1, -1);
            //theGame.GetGuiManager().ShowNotification("Deposited Amulet: " + FactsQuerySum("DMNQ_deposited_amulet"));

            inv.RemoveItemByName('dmnq_amulet', -1);
            theSound.SoundEvent('gui_inventory_ranged_back');
        }
    }
}