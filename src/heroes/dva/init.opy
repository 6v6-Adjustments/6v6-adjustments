#!mainFile "../../dev_main.opy"

#!include "heroes/dva/hp.opy"


rule "[dva/init.opy]: Initialize D.Va":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DVA

    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_DVA_CANNON_DAMAGE/OW2_DVA_CANNON_DAMAGE)

    waitUntil(eventPlayer.getUltCharge() > 0, Math.INFINITY)
    eventPlayer.setUltCharge(0)

    eventPlayer.call_init = false


rule "[dva/init.opy]: Increase Defense Matrix cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventPlayer.isFiringSecondaryFire()
    
    # Defense Matrix still goes on cooldown visually even when the ability is disabled, so a faux cooldown was not implemented
    waitUntil(eventPlayer.isFiringSecondaryFire() == false, Math.INFINITY)
    eventPlayer.setSecondaryFireEnabled(false)
    wait(ADJ_DVA_MATRIX_COOLDOWN)
    eventPlayer.setSecondaryFireEnabled(true)
