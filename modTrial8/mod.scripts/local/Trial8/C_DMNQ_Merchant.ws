class C_DMNQ_Merchant extends CNewNPC {

	protected function Attack(
		hitTarget : CGameplayEntity, 
		animData : CPreAttackEventData, 
		weaponId : SItemUniqueId, 
		parried : bool, 
		countered : bool, 
		parriedBy : array<CActor>, 
		attackAnimationName : name, 
		hitTime : float, 
		weaponEntity : CItemEntity)
    {
    	if (thePlayer.GetHealth() < 1.0) {
    		FactsAdd("DMNQ_fistfight_result");
    	}
    }

}