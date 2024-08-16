#!mainFile "../../dev_main.opy"

playervar valk_regen_id


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
    eventPlayer.startHoT(null, Math.INFINITY, ADJ_MERCY_REGEN_HPS)
    eventPlayer.valk_regen_id = getLastHoT()

    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setHealingDealt(percent(eventPlayer._base_healing_scalar))
    stopHoT(eventPlayer.valk_regen_id)
    eventPlayer.valk_regen_id = null