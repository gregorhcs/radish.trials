class C_DMNQ_Pebble extends W3AnimatedContainer 
{
    event OnItemTaken(itemId : SItemUniqueId, quantity : int)
    {
        super.OnItemTaken(itemId, quantity);
        
        FactsAdd("DMNQ_looted_pebbles", 1, -1);
        //theGame.GetGuiManager().ShowNotification("Looted Pebbles: " + FactsQuerySum("DMNQ_looted_pebbles"));
    }
}
