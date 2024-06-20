#!mainFile "../../dev_main.opy"


rule "[ashe/init.opy]: Ashe":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Hero ashe

    setCustomHp(ADJ_ASHE_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.call_init = false
