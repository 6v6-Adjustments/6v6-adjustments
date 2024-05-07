#!mainFile "../../dev_main.opy"

#!include "heroes/moira/coalescence.opy"

rule "[moira/init.opy]: Moira":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MOIRA

    newHero(200, 0, 0)
    removePassiveHealing()

    eventPlayer.ult_change_check = 0.95
