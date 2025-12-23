#!mainFile "../../dev_main.opy"


def initWuyang():
    @Name "[weyang/init.opy]: initWuyang()"

    setCustomHp(ADJ_WUYANG_HEALTH, 0, 0)
    setUltCost(ADJ_WUYANG_ULT_COST)

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()

    eventPlayer.hero_initialized = true
