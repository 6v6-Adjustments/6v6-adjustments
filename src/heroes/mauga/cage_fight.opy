#!mainFile "../../dev_main.opy"


rule "[mauga/init.opy]: Reduce Cage Fight duration":
    @Event eachPlayer
    @Hero mauga
    @Condition eventPlayer.isUsingUltimate()

    wait(ADJ_MAUGA_CAGE_DURATION)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
