#!mainFile "../../dev_main.opy"


rule "[venture/tectonic_shock.opy]: Tectonic Shock logic":
    @Event playerDealtDamage
    @Hero venture
    @Condition eventAbility == Button.ULTIMATE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE/OW2_VENTURE_TECTONIC_SHOCK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
