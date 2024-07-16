#!mainFile "../../dev_main.opy"


rule "[doomfist/init.opy]: Correct Seismic Slam damage":
    @Event playerDealtDamage
    @Hero doomfist
    @Condition eventAbility == Button.ABILITY_1

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_DOOMFIST_SEISMIC_SLAM_DAMAGE/OW2_DOOMFIST_SEISMIC_SLAM_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[doomfist/slam.opy]: Best Defense for slammed victims":
    @Event playerDealtDamage
    @Hero doomfist
    @Condition eventAbility == Button.ABILITY_1 # Ability used to damage player is Seismic Slam

    damage(attacker, null, OW2_DOOMFIST_BEST_DEFENSE - ADJ_DOOMFIST_BEST_DEFENSE)
