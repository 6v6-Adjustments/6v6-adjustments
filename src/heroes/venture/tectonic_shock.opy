#!mainFile "../../dev_main.opy"


rule "[venture/tectonic_shock.opy]: Tectonic Shock logic":
    @Event playerDealtDamage
    @Hero venture
    @Condition eventAbility == Button.ULTIMATE

    # if distance(attacker, victim) <= ADJ_VENTURE_TECTONIC_SHOCK_CRIT_RADIUS:
    #     damage(
    #         victim, 
    #         attacker, 
    #         ((eventDamage/eventPlayer._base_damage_scalar) * ((ADJ_VENTURE_TECTONIC_SHOCK_CRIT_MULTIPLIER*ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE)/OW2_VENTURE_TECTONIC_SHOCK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    # else:
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE / OW2_VENTURE_TECTONIC_SHOCK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    victim.setMoveSpeed(percent(victim._current_speed_scalar * ((100-ADJ_VENTURE_TECTONIC_SHOCK_SLOW)/100)))
    wait(ADJ_VENTURE_TECTONIC_SHOCK_SLOW_DURATION)
    victim.setMoveSpeed(percent(victim._current_speed_scalar))
