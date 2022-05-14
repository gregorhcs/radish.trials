quest function Trial8_AddContractToNoticeBoard( boardTag : CName, errandStringKey : string, newQuestFact : string, addedItemName : CName, optional forceActivate : bool ) {
  var newErrand : ErrandDetailsList;
  var newErrands : array<ErrandDetailsList>;
  
  newErrand.errandStringKey = errandStringKey;
  newErrand.newQuestFact = newQuestFact;
  newErrand.addedItemName = addedItemName;

  newErrands.PushBack(newErrand);
  //theGame.GetGuiManager().ShowNotification("Add contract! boardTag: [" + boardTag + "], errandStringKey: [" + errandStringKey + "], newQuestFact" + newQuestFact + "], addedItemName: [" + addedItemName + "]");
  AddErrandsToTheNoticeBoard( boardTag, newErrands, forceActivate );
}