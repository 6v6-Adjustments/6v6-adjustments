#!mainFile "../../dev_main.opy"


rule "[venture/drill_dash.opy]: Correct Drill Dash damage":
    @Event playerDealtDamage
    @Hero venture
    @Condition eventAbility == Button.SECONDARY_FIRE
    
    damage(
        victim, 
        attacker, 
        ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
