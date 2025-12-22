#!mainFile "../../dev_main.opy"

#!include "../../heroes/zenyatta/transc.opy"


def initZenyatta():
    @Name "[zenyatta/init.opy]: initZenyatta()"

    setCustomHp(ADJ_ZENYATTA_HEALTH, 0, ADJ_ZENYATTA_SHIELDS)
    setUltCost(ADJ_ZENYATTA_ULT_COST)
    removeSelfHealing()

    eventPlayer.setAmmo(0, 20)
    eventPlayer.setMaxAmmo(0, 20)
    eventPlayer.setKnockbackDealt(4)

    eventPlayer.hero_initialized = true
