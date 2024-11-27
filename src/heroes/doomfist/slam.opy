#!mainFile "../../dev_main.opy"


rule "[doomfist/init.opy]: Correct Seismic Slam damage":
    @Event playerDealtDamage
    @Hero doomfist
    @Condition eventAbility == Button.ABILITY_1

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_DOOMFIST_SEISMIC_SLAM_DAMAGE/OW2_DOOMFIST_SEISMIC_SLAM_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
