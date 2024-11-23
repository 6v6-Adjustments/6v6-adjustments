#!mainFile "../../dev_main.opy"


def initHazard():
    @Name "[hazard/init.opy]: initHazard()"
    
    setCustomHp(ADJ_HAZARD_HEALTH, ADJ_HAZARD_ARMOR, 0)
    setUltCost(ADJ_HAZARD_ULT_COST)

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
        setBaseDamage(eventPlayer, ADJ_HAZARD_BONESPUR_DAMAGE/OW2_HAZARD_BONESPUR_DAMAGE)

    eventPlayer.hero_initialized = true
