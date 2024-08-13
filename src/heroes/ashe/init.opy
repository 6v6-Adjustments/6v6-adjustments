#!mainFile "../../dev_main.opy"


def initAshe():
    @Name "[ashe/init.opy]: initAshe()"

    setCustomHp(ADJ_ASHE_HEALTH, 0, 0)
    setUltCost(ADJ_ASHE_ULT_COST)
    removeSelfHealing()
    eventPlayer.max_health_scaler = (ADJ_ASHE_BOB_HEALTH/OW2_ASHE_BOB_HEALTH)

    eventPlayer.hero_initialized = true
