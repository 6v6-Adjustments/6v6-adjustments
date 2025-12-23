#!mainFile "../../dev_main.opy"


def initFreja():
    @Name "[freja/init.opy]: initFreja()"

    setCustomHp(ADJ_FREJA_HEALTH, 0, 0)
    setUltCost(ADJ_FREJA_ULT_COST)

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()

    eventPlayer.hero_initialized = true
