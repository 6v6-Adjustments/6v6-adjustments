#!mainFile "../../dev_main.opy"

playervar dmg_boost_dot

def initMercy():
    @Name "[mercy/init.opy]: initMercy()"

    setCustomHp(ADJ_MERCY_HEALTH, 0, 0)
    setUltCost(ADJ_MERCY_ULT_COST)

    startHealingModification(eventPlayer, eventPlayer, 200, HealingReeval.RECEIVERS_HEALERS_AND_HEALPERCENT)
    setBaseHealing(eventPlayer, ADJ_MERCY_STAFF_HEALING/OW2_MERCY_STAFF_HEALING)

    eventPlayer.setAmmo(0, ADJ_MERCY_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_MERCY_AMMO)

    eventPlayer.hero_initialized = true


rule "[mercy/init.opy]: Reduce Valkyrie healing and force self-healing":
    @Event eachPlayer
    @Hero mercy
    @Condition eventPlayer.isFiringSecondaryFire() == true
    
    eventPlayer.startDoT(null, Math.INFINITY, 75)
    eventPlayer.dmg_boost_dot = getLastDoT()
    waitUntil(not eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
    stopDoT(eventPlayer.dmg_boost_dot)
    

rule "[mercy/init.opy]: Reduce Valkyrie healing and force self-healing":
    @Event eachPlayer
    @Hero mercy
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setHealingDealt(100)
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setHealingDealt(percent(ADJ_MERCY_STAFF_HEALING / OW2_MERCY_STAFF_HEALING))
