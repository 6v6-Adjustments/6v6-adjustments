#!mainFile "../../dev_main.opy"

#!include "heroes/moira/coalescence.opy"

def initMoira():
    @Name "[moira/init.opy]: initMoira()"

    setCustomHp(ADJ_MOIRA_HEALTH, 0, 0)
    setUltCost(ADJ_MOIRA_ULT_COST)
    removeRegenPassive()

    eventPlayer.hero_initialized = true
