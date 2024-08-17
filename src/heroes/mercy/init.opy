#!mainFile "../../dev_main.opy"


def initMercy():
    @Name "[mercy/init.opy]: initMercy()"

    setCustomHp(ADJ_MERCY_HEALTH, 0, 0)
    setUltCost(ADJ_MERCY_ULT_COST)

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
    setBaseHealing(eventPlayer, ADJ_MERCY_STAFF_HEALING/OW2_MERCY_STAFF_HEALING)

    eventPlayer.setAmmo(0, ADJ_MERCY_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_MERCY_AMMO)

    eventPlayer.hero_initialized = true


rule "[mercy/init.opy]: Reduce Valkyrie healing and force self-healing":
    @Event eachPlayer
    @Hero mercy
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setHealingDealt(100)
    setRegeneration(ADJ_MERCY_REGEN_HPS)

    waitUntil(not eventPlayer.isUsingUltimate(), OW2_MERCY_VALKYRIE_DURATION)
    eventPlayer.setHealingDealt(percent(eventPlayer._base_healing_scalar))
