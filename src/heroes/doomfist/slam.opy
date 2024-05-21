#!mainFile "../../dev_main.opy"


rule "[doomfist/slam.opy]: Best Defense for slammed victims":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventAbility == Button.ABILITY_1 # Ability used to damage player is Seismic Slam

    damage(attacker, null, OW2_DOOMFIST_BEST_DEFENSE - ADJ_DOOMFIST_BEST_DEFENSE)
