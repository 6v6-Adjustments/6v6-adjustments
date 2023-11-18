#!mainFile "../../../main.opy"

rule "[dva/gun.opy]: OW1 DVa movement penalty when shooting":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.DVA)
    @Condition not eventPlayer.isInAlternateForm()
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)
    @Condition not eventPlayer.isUsingAbility1()

    eventPlayer.setMoveSpeed(percent((1-OW1_DVA_MOVE_PENALTY)/(1-OW2_DVA_MOVE_PENALTY)))


rule "[dva/gun.opy]: Remove movement penalty when flying":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.DVA)
    @Condition eventPlayer.isUsingAbility1()

    eventPlayer.setMoveSpeed(100)
