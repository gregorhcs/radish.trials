class CLogNekker extends CNewNPC {
	
	event OnSpawned(spawnData : SEntitySpawnData) {
		super.OnSpawned(spawnData);
	}

	event OnDeath(damageAction : W3DamageAction) {
		super.OnDeath(damageAction);
		FactsAdd("log_nekker_died", 1, -1);
		theGame.GetGuiManager().ShowNotification("Dead Nekkers: " + FactsQuerySum("log_nekker_died"));
	}

}
