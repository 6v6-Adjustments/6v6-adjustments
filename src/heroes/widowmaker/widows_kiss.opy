#!mainFile "../../dev_main.opy"


rule "[widowmaker/widows_kiss.opy]: Correct other forms of damage while not scoped in":
    @Event playerDealtDamage
    @Hero widowmaker
    @Condition not eventPlayer.isFiringSecondaryFire()
    @Condition eventAbility in [Button.MELEE, Button.PRIMARY_FIRE, Button.ABILITY_1]

    if eventAbility == Button.PRIMARY_FIRE:
        damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_WIDOWMAKER_SMG_DAMAGE/OW2_WIDOWMAKER_SMG_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    else:
        damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[widowmaker/widows_kiss.opy]: Correct other forms of damage while scoped in":
    @Event playerDealtDamage
    @Hero widowmaker
    @Condition eventPlayer.isFiringSecondaryFire()
    @Condition eventAbility in [Button.MELEE, Button.ABILITY_1]

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[widowmaker/widows_kiss.opy]: Add bonus damage over time":
    @Event playerDealtDamage
    @Hero widowmaker
    @Condition eventPlayer.isFiringSecondaryFire()
    @Condition eventAbility == Button.PRIMARY_FIRE
    @Condition eventDamage >= ADJ_WIDOWMAKER_SCOPED_DAMAGE - 1

    if eventWasCriticalHit:
        victim.startDoT(attacker, (ADJ_WIDOWMAKER_DOT_DURATION / 2), ADJ_WIDOWMAKER_DOT_DAMAGE * (OW2_WIDOWMAKER_SCOPED_DAMAGE / ADJ_WIDOWMAKER_SCOPED_DAMAGE * 2) / ADJ_WIDOWMAKER_DOT_DURATION)
    else:
        victim.startDoT(attacker, ADJ_WIDOWMAKER_DOT_DURATION, ADJ_WIDOWMAKER_DOT_DAMAGE * (OW2_WIDOWMAKER_SCOPED_DAMAGE / ADJ_WIDOWMAKER_SCOPED_DAMAGE) / ADJ_WIDOWMAKER_DOT_DURATION)
