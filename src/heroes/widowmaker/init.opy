#!mainFile "../../dev_main.opy"


def initWidowmaker():
    @Name "[widowmaker/init.opy]: initWidowmaker()"
    
    setCustomHp(ADJ_WIDOWMAKER_HEALTH, 0, 0)
    setUltCost(ADJ_WIDOWMAKER_ULT_COST)
    removeSelfHealing()

    eventPlayer.hero_initialized = true
