class CFactAddStorySceneChoiceAction extends CStorySceneChoiceLineActionScripted
{
    editable var factName : String;
    
    function PerformAction()
    {
        FactsAdd(factName, 1, -1);
    }
}

class CAxiiFactAddStorySceneChoiceAction extends CAxiiStorySceneChoiceAction
{
    editable var factName : String;
    
    function PerformAction()
    {
        super.PerformAction();
        FactsAdd(factName, 1, -1);
    }
}

class CPayFactAddStorySceneChoiceAction extends CPayStorySceneChoiceAction
{
    editable var factName : String;
    
    function PerformAction()
    {
        super.PerformAction();
        FactsAdd(factName, 1, -1);
    }
}