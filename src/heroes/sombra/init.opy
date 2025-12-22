#!mainFile "../../dev_main.opy"

#!include "../../heroes/sombra/translocator.opy"


def initSombra():
    @Name "[sombra/init.opy]: initSombra()"

    setCustomHp(ADJ_SOMBRA_HEALTH, null, null)
    setUltCost(ADJ_SOMBRA_ULT_COST)

    eventPlayer.hero_initialized = true
