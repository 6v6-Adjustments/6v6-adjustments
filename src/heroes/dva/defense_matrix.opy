#!mainFile "../../dev_main.opy"


rule "[dva/defense_matrix.opy]: Increase Defense Matrix cooldown":
    @Event eachPlayer
    @Hero dva
    @Condition eventPlayer.isFiringSecondaryFire()
    
    # Defense Matrix still goes on cooldown visually even when the ability is disabled, so a faux cooldown was not implemented
    waitUntil(eventPlayer.isFiringSecondaryFire() == false, Math.INFINITY)
    eventPlayer.setSecondaryFireEnabled(false)
    wait(ADJ_DVA_MATRIX_COOLDOWN)
    eventPlayer.setSecondaryFireEnabled(true)
