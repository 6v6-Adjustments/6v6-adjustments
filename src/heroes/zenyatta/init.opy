#!mainFile "../../dev_main.opy"

#!include "heroes/zenyatta/transc.opy"


rule "[zenyatta/init.opy]: Initialize Zenyatta":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ZENYATTA

    setCustomHp(ADJ_ZENYATTA_HEALTH, 0, ADJ_ZENYATTA_SHIELDS)
    removeSelfHealing()

    eventPlayer.setKnockbackDealt(7)

    eventPlayer.setAmmo(0, 20)
    eventPlayer.setMaxAmmo(0, 20)

    eventPlayer.call_init = false
