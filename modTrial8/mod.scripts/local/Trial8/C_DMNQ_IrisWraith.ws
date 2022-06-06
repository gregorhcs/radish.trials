class C_DMNQ_IrisWraith extends CNewNPC 
{
    event OnDeath(damageAction : W3DamageAction) 
    {
        super.OnDeath(damageAction);
        FactsAdd("DMNQ_living_wraiths", -1, -1);
    }
}