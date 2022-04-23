
quest function SetThreatLevel(npcTag : name, newThreatLevel : int) {

	var entities : array<CEntity>;
	var npc : CNewNPC;
	var i : int;

	theGame.GetEntitiesByTag(npcTag, entities);

	if (entities.Size() > 0) {
		for (i = 0; i < entities.Size(); i += 1) {
			npc = (CNewNPC)entities[i];
			if (npc && npc.GetThreatLevel() != 5) {
				npc.ChangeThreatLevel(newThreatLevel);
				//theGame.GetGuiManager().ShowNotification("Adjusted threat level!");
			}
		}
	}
}
