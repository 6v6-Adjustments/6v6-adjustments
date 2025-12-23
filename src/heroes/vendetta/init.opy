#!mainFile "../../dev_main.opy"


def initVendetta():
    @Name "[vendetta/init.opy]: initVendetta()"

    setCustomHp(ADJ_VENDETTA_HEALTH, ADJ_VENDETTA_ARMOR, 0)
    setUltCost(ADJ_VENDETTA_ULT_COST)

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()

    eventPlayer.hero_initialized = true
