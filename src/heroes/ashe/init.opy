#!mainFile "../../dev_main.opy"


rule "[ashe/init.opy]: Initialize Ashe":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ASHE

    setCustomHp(ADJ_ASHE_HEALTH, 0, 0)
    setUltCost(ADJ_ASHE_ULT_COST)
    removeSelfHealing()

    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_ASHE_BOB_HEALTH/OW2_ASHE_BOB_HEALTH)
