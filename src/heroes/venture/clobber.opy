#!mainFile "../../dev_main.opy"


rule "[venture/clobber.opy]: Correct Venture melee damage":
    @Event playerDealtDamage
    @Hero venture
    @Condition eventAbility == Button.MELEE
    
    damage(
        victim, 
        attacker, 
        ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_CLOBBER_DAMAGE / OW2_VENTURE_CLOBBER_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
