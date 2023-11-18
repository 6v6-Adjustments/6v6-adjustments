#!mainFile "../../../main.opy"


rule "[dva/bomb.opy]: Force reset ult charge when DVa pops out of Mech":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.DVA)
    @Condition eventPlayer.isInAlternateForm()

    if eventPlayer.isUsingUltimate(): return
    resetUltCharge()
