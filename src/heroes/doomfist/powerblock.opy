#!mainFile "../../dev_main.opy"


rule "[doomfist/powerblock.opy]: Reduce Power Block active duration":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST
    @Condition eventPlayer.isUsingAbility2()

    wait(ADJ_DOOMFIST_POWER_BLOCK_DURATION)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
