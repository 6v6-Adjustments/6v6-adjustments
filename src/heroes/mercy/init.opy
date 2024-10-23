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


rule "[mercy/init.opy]: Track regen_passive_timer for mercy":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MERCY
    @Condition eventPlayer.regen_passive_timer != 0
    
    chase(eventPlayer.regen_passive_timer, 0, duration=OW2_MERCY_VALKYRIE_DURATION if eventPlayer.isUsingUltimate() else 1, ChaseReeval.DESTINATION_AND_DURATION)
    waitUntil(eventPlayer.regen_passive_timer == 0, Math.INFINITY)
    # if eventPlayer.getHealth() != eventPlayer.getMaxHealth():
        eventPlayer.startHoT(null, Math.INFINITY, ADJ_MERCY_REGEN_HPS)
        stopChasingVariable(eventPlayer.regen_passive_timer)
        eventPlayer.self_heal_pvar[7] = getLastHoT()


rule "[mercy/init.opy]: Reduce Valkyrie healing and force self-healing":
    @Event eachPlayer
    @Hero mercy
    @Condition eventPlayer.isUsingUltimate() == true
    
    eventPlayer.stopAllHoT()
    eventPlayer.startHoT(null, OW2_MERCY_VALKYRIE_DURATION, ADJ_MERCY_REGEN_HPS)
    heal(eventPlayer, null, ADJ_MERCY_VALKYRIE_BURST_REGEN)
    eventPlayer.setHealingDealt(percent(ADJ_MERCY_VALKYRIE_BONUS_HPS/OW2_MERCY_VALKYRIE_HEALING))
    wait(ADJ_MERCY_VALKYRIE_BONUS_DUARION)
    eventPlayer.setHealingDealt(percent(ADJ_MERCY_VALKYRIE_HEALING/OW2_MERCY_VALKYRIE_HEALING))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setHealingDealt(percent(eventPlayer._base_healing_scalar))
    eventPlayer.regen_passive_timer = 0
