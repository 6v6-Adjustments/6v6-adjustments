#!mainFile "../../dev_main.opy"


rule "[sigma/init.opy]: Increase Accretion damage":
    @Event playerDealtDamage
    @Hero sigma
    @Condition eventAbility == Button.ABILITY_2
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_SIGMA_ACCRETION_DAMAGE/OW2_SIGMA_ACCRETION_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[sigma/init.opy]: Reduce Accretion stun duration":
    @Event playerDealtDamage
    @Hero sigma
    @Condition victim.hasStatusEffect(Status.KNOCKED_DOWN)

    wait(ADJ_SIGMA_ACCRETION_STUN_DURATION)
    victim.clearStatusEffect(Status.KNOCKED_DOWN)
