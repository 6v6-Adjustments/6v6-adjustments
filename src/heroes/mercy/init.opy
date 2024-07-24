#!mainFile "../../dev_main.opy"


rule "[mercy/init.opy]: Initialize Mercy":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MERCY

    setCustomHp(ADJ_MERCY_HEALTH, 0, 0)
    setUltCost(ADJ_MERCY_ULT_COST)

    eventPlayer.setHealingDealt(ADJ_MERCY_STAFF_HEALING / OW2_MERCY_STAFF_HEALING)

    eventPlayer.setAmmo(0, ADJ_MERCY_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_MERCY_AMMO)

    eventPlayer.call_init = false


rule "[mercy/init.opy]: Reduce Valkyrie healing":
    @Event eachPlayer
    @Hero mercy
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setHealingDealt(100)
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setHealingDealt(ADJ_MERCY_STAFF_HEALING / OW2_MERCY_STAFF_HEALING)
