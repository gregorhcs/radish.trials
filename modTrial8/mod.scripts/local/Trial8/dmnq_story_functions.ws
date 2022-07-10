latent storyscene function DMNQ_NegotiateMonsterHunt_S( player: CStoryScenePlayer, resultFact : CName, rewardName : name, alwaysSuccessful : bool, isItemReward : bool ) {
    var ret : ENegotiationResult;
    var questUniqueScriptTag : CName;
    
    ResetFactQuest(resultFact);
    ret = NegotiateMonsterHunt( player, rewardName, questUniqueScriptTag, alwaysSuccessful, isItemReward );
    switch (ret) {
        case TooMuch:
            FactsAdd( resultFact, 1 ); // 1 if too much
            break;
        case PrettyClose:
            FactsAdd( resultFact, 2 ); // 2 if pretty close
            break;
        case WeHaveDeal:
            FactsAdd( resultFact, 3 ); // 3 if okay
            break;
        case GetLost:
            FactsAdd( resultFact, 4 ); // 4 if haggling rejected
            break;
    }
}