class C_DMNQ_IrisWraith extends W3NightWraithIris 
{
    event OnDeath(damageAction : W3DamageAction) 
    {
        super.OnDeath(damageAction);
        FactsAdd("DMNQ_living_wraiths", -1, -1);
    } 
    
    event OnTakeDamage( damageAction : W3DamageAction )
    {
        //damageAction.AddDamage(dmgType : name, dmgVal : float);
        damageAction.SetInstantKill();
        super.OnDeath(damageAction);
    }
}