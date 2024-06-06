#!mainFile "../../dev_main.opy"


rule "[mercy/init.opy]: Mercy":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MERCY

    setCustomHp(ADJ_MERCY_HEALTH, 0, 0)

    eventPlayer.setHealingDealt(109.1)

    eventPlayer.setAmmo(0, ADJ_MERCY_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_MERCY_AMMO)

    eventPlayer.call_init = false


rule "[mercy/init.opy]: Reduce Valkyrie healing":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MERCY
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setHealingDealt(100)
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setHealingDealt(109.1)
