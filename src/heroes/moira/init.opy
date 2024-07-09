#!mainFile "../../dev_main.opy"

#!include "heroes/moira/coalescence.opy"

rule "[moira/init.opy]: Initialize Moira":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MOIRA

    setCustomHp(ADJ_MOIRA_HEALTH, 0, 0)
    setUltCost(ADJ_MOIRA_ULT_COST)
    removeRegenPassive()

    eventPlayer.call_init = false
