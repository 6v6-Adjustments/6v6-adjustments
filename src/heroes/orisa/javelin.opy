#!mainFile "../../dev_main.opy"


rule "[orisa/javelin.opy]: Increase Javelin Spin movement speed":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingAbility2()

    eventPlayer.setMoveSpeed(percent(ADJ_ORISA_SPIN_MOVESPEED/OW2_ORISA_SPIN_MOVESPEED))
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
