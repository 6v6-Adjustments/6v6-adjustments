#!mainFile "../../dev_main.opy"


rule "[dva/boosters.opy]: Reduce Boosters damage":
    @Event playerDealtDamage
    @Hero dva
    @Condition eventAbility == Button.ABILITY_1

    heal(victim, null, eventDamage - ((ADJ_DVA_BOOSTER_DAMAGE / OW2_DVA_BOOSTER_DAMAGE) * eventDamage/eventPlayer._base_damage_scalar))
