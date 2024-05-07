#!mainFile "../../dev_main.opy"

#!include "heroes/zenyatta/transc.opy"


rule "[zenyatta/init.opy]: Zenyatta":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ZENYATTA

    newHero(50, 0, 150)
    removeSelfHealing()

    eventPlayer.setKnockbackDealt(7)

    eventPlayer.setAmmo(0, 20)
    eventPlayer.setMaxAmmo(0, 20)

    eventPlayer.call_init = false
