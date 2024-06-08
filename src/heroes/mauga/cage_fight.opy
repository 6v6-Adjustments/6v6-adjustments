#!mainFile "../../dev_main.opy"


rule "[mauga/init.opy]: Reduce Cage Fight duration":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventPlayer.isUsingUltimate()

    wait(ADJ_MAUGA_CAGE_DURATION)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
