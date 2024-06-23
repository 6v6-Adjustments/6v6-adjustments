#!mainFile "../../dev_main.opy"


rule "[illari/outburst.opy]: Correct Outburst damage":
    @Event playerDealtDamage
    @Hero illari
    @Condition eventAbility == Button.ABILITY_1

    heal(victim, null, eventDamage - ((ADJ_ILLARI_OUTBURST_DAMAGE/OW2_ILLARI_OUTBURST_DAMAGE) * eventDamage/eventPlayer._base_damage_scalar))


rule "[illari/outburst.opy]: Ignite Outburst victims":
    @Event playerDealtDamage
    @Hero illari
    @Condition eventAbility == Button.ABILITY_1

    victim.setStatusEffect(null, Status.BURNING, ADJ_ILLARI_BURN_DURATION)
    victim.startDoT(attacker, ADJ_ILLARI_BURN_DURATION, ADJ_ILLARI_BURN_TOTAL*(OW2_ILLARI_SUNSTRUCK_DAMAGE/ADJ_ILLARI_SUNSTRUCK_DAMAGE)/ADJ_ILLARI_BURN_DURATION)
