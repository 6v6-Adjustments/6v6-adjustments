#!mainFile "../../dev_main.opy"


rule "[ashe/init.opy]: Initialize Ashe":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ASHE

    setCustomHp(ADJ_ASHE_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.call_init = false
