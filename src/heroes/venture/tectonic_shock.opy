#!mainFile "../../dev_main.opy"


rule "[venture/tectonic_shock.opy]: Increase Tectonic Shock damage":
    @Event playerDealtDamage
    @Hero venture
    @Condition eventAbility == Button.ULTIMATE

    # if distance(attacker, victim) <= ADJ_VENTURE_TECTONIC_SHOCK_CRIT_RADIUS:
    #     damage(
    #         victim, 
    #         attacker, 
    #         ((eventDamage/eventPlayer._base_damage_scalar) * ((ADJ_VENTURE_TECTONIC_SHOCK_CRIT_MULTIPLIER*ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE)/OW2_VENTURE_TECTONIC_SHOCK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    # else:
        damage(
            victim, 
            attacker, 
            ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE/OW2_VENTURE_TECTONIC_SHOCK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
