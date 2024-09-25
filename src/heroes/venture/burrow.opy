#!mainFile "../../dev_main.opy"


rule "[venture/burrow.opy]: Correct Burrow damage":
    @Event playerDealtDamage
    @Hero venture
    @Condition eventAbility == Button.ABILITY_1
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_BURROW_DAMAGE / OW2_VENTURE_BURROW_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
