quest function IsActive() {
    if (theGame.IsActive()) {
        theGame.GetGuiManager()
               .ShowNotification("Game is active!");
    }
}

quest function DMNQ_AddContractToNoticeBoard( 

  boardTag : CName, 
  errandStringKey : string, 
  newQuestFact : string, 
  addedItemName : CName, 
  optional forceActivate : bool 
) {
  var newErrand : ErrandDetailsList;
  var newErrands : array<ErrandDetailsList>;
  
  newErrand.errandStringKey = errandStringKey;
  newErrand.newQuestFact = newQuestFact;
  newErrand.addedItemName = addedItemName;

  newErrands.PushBack(newErrand);
  //theGame.GetGuiManager().ShowNotification("Add contract! boardTag: [" + boardTag + "], errandStringKey: [" + errandStringKey + "], newQuestFact" + newQuestFact + "], addedItemName: [" + addedItemName + "]");
  AddErrandsToTheNoticeBoard( boardTag, newErrands, forceActivate );
}

    
quest function DMNQ_GiveRewardToPlayer( rewardName : CName )
{
    theGame.GiveReward( rewardName, thePlayer );
    theGame.GetGuiManager().ShowNotification("Rewarded " + rewardName);
}


// Credits: by nikich340
quest function DMNQ_TuneNPC( tag : name, level : int, attitude : string, mortality : string )
{
  var NPCs : array <CNewNPC>;
  var i      : int;
  
  theGame.GetNPCsByTag(tag, NPCs);
  // LogQuest( "<<Tune NPC>>> tag: " + tag + " found npcs: " + NPCs.Size());  - uncomment it to check if NPCs are found
  
  for (i = 0; i < NPCs.Size(); i += 1 )
  { 
    /* SET LEVEL */
    NPCs[i].SetLevel(level);
    NPCs[i].RemoveAbilityAll('NPCDoNotGainBoost');
    NPCs[i].RemoveAbilityAll('NPCLevelBonusDeadly');
    NPCs[i].RemoveAbilityAll('VesemirDamage');
    NPCs[i].RemoveAbilityAll('BurnIgnore');
    NPCs[i].RemoveAbilityAll('_q403Follower');
    //NPCs[i].RemoveAbilityAll('DisableFinishers'); - may be also useful
    
    /* SET ATTITUDE TO PLAYER */
    switch(attitude) {
      case "Friendly":
        NPCs[i].SetTemporaryAttitudeGroup( 'friendly_to_player', AGP_Default );
        NPCs[i].SetAttitude( thePlayer, AIA_Friendly );
        thePlayer.SetAttitude( NPCs[i], AIA_Friendly );
        break;
      case "Hostile":
        NPCs[i].SetTemporaryAttitudeGroup( 'hostile_to_player', AGP_Default );
        NPCs[i].SetAttitude( thePlayer, AIA_Hostile );
        thePlayer.SetAttitude( NPCs[i], AIA_Hostile );
        break;
      case "Neutral":
        NPCs[i].SetTemporaryAttitudeGroup( 'neutral_to_player', AGP_Default );
        NPCs[i].SetAttitude( thePlayer, AIA_Neutral );
        thePlayer.SetAttitude( NPCs[i], AIA_Neutral );
        break;
    }
    
    /* SET MORTALITY */
    switch(mortality) {
      case "None":
        NPCs[i].SetImmortalityMode( AIM_None, AIC_Combat );
        NPCs[i].SetImmortalityMode( AIM_None, AIC_Default );
        NPCs[i].SetImmortalityMode( AIM_None, AIC_Fistfight );
        NPCs[i].SetImmortalityMode( AIM_None, AIC_IsAttackableByPlayer );
        break;
      case "Unconscious":
        NPCs[i].SetImmortalityMode( AIM_Unconscious, AIC_Combat );
        NPCs[i].SetImmortalityMode( AIM_Unconscious, AIC_Default );
        NPCs[i].SetImmortalityMode( AIM_Unconscious, AIC_Fistfight );
        NPCs[i].SetImmortalityMode( AIM_Unconscious, AIC_IsAttackableByPlayer );
        break;
      case "Invulnerable":
        NPCs[i].SetImmortalityMode( AIM_Invulnerable, AIC_Combat );
        NPCs[i].SetImmortalityMode( AIM_Invulnerable, AIC_Default );
        NPCs[i].SetImmortalityMode( AIM_Invulnerable, AIC_Fistfight );
        NPCs[i].SetImmortalityMode( AIM_Invulnerable, AIC_IsAttackableByPlayer );
        break;
      case "Immortal":
        NPCs[i].SetImmortalityMode( AIM_Immortal, AIC_Combat );
        NPCs[i].SetImmortalityMode( AIM_Immortal, AIC_Default );
        NPCs[i].SetImmortalityMode( AIM_Immortal, AIC_Fistfight );
        NPCs[i].SetImmortalityMode( AIM_Immortal, AIC_IsAttackableByPlayer );
        break;
    }
  }
}


quest function DMNQ_FistfightNPC(tag : name, activate : bool) {
    var NPCs : array <CNewNPC>;
    var i      : int;
    
    theGame.GetNPCsByTag(tag, NPCs);
    for (i = 0; i < NPCs.Size(); i += 1 )
    {   
        if (activate) {
            NPCs[i].OnStartFistfightMinigame();
        } else {
            NPCs[i].OnEndFistfightMinigame();
        }
    }
}

quest function DMNQ_FistfightPlayer(activate : bool, optional healthMultiplier : float, optional toDeath : bool, optional endsWithBS : bool) {
    if (activate) {
        if (!toDeath && !endsWithBS)
            thePlayer.SetFistFightParams(toDeath, endsWithBS);
        thePlayer.OnStartFistfightMinigame();
        if (healthMultiplier) {
            thePlayer.ClampGeraltMaxHealth( thePlayer.GetStatMax(BCS_Vitality) * healthMultiplier );
            thePlayer.SetHealthPerc( 100 );
        }
    } else {
        thePlayer.OnEndFistfightMinigame();
    }
}


quest function DMNQ_PlayMusic( areaName : string, eventName : string, optional saveType : string ) 
{
    if ( areaName == "toussaint" )
        theSound.InitializeAreaMusic( (EAreaName)AN_Dlc_Bob );
    else
        theSound.InitializeAreaMusic( AreaNameToType(areaName) );

    switch (saveType) {
        case "SESB_Save":
            SoundEventQuest(eventName, SESB_Save);
            break;
        default:
            SoundEventQuest(eventName, SESB_ClearSaved);
            break;
    }
}


quest function DMNQ_BookRead(bookName : name) : bool {
    var books : array<SItemUniqueId>;
    books = thePlayer.inv.GetItemsByName(bookName);
    if ( books.Size() >= 1 && thePlayer.inv.IsBookRead(books[0]) ) {
        return true;
    }
    return false;
}


quest function DMNQ_FocusSetHighlight(tag : name, highlightType : string, optional overrideCustomLogic : bool ) {
    switch(highlightType) {
        case "FMV_Clue":
            FocusSetHighlight(tag, FMV_Clue, overrideCustomLogic);
            break;
        case "FMV_Interactive":
            FocusSetHighlight(tag, FMV_Interactive, overrideCustomLogic);
            break;
        case "FMV_None":
            FocusSetHighlight(tag, FMV_None, overrideCustomLogic);
            break;
    }
}


quest function DMNQ_ToggleVanillaLayer(layerName : string, hide : bool) {
    if (hide) {
        theGame.GetWorld().HideLayerGroup(layerName);
    } else {
        theGame.GetWorld().ShowLayerGroup(layerName);
    }
}


//quest function DMNQ_DynamicMappin(tag : name, optional enable : bool) {
//    EnableDynamicMappin(name, enable, EDM_EP1QuestAvailable);
//}