#!mainFile "../../dev_main.opy"

#!include "heroes/moira/coalescence.opy"

rule "[moira/init.opy]: Moira":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MOIRA

    newHero(ADJ_MOIRA_HEALTH, 0, 0)
    removePassiveHealing()

    eventPlayer.call_init = false
