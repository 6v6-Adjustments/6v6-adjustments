#!mainFile "../../dev_main.opy"

#!include "heroes/dva/hp.opy"


rule "[dva/init.opy]: Initialize D.Va":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DVA

    removeTankPassive()
    removeSelfHealing()

    eventPlayer.call_init = false


rule "[dva/init.opy]: Increase Defense Matrix cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventPlayer.isFiringSecondaryFire()
    @Condition eventPlayer.getAbilityResource(Button.SECONDARY_FIRE) > 66
    
    # Defense Matrix still goes on cooldown visually even when the ability is disabled, so a faux cooldown was not implemented
    waitUntil(eventPlayer.isFiringSecondaryFire() == false, Math.INFINITY)
    eventPlayer.setSecondaryFireEnabled(false)
    wait(ADJ_DVA_MATRIX_COOLDOWN)
    eventPlayer.setSecondaryFireEnabled(true)