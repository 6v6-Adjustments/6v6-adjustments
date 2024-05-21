#!mainFile "../../dev_main.opy"


rule "[pharah/init.opy]: Pharah":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.PHARAH
    
    setCustomHp(ADJ_PHARAH_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.setProjectileSpeed(87.5)

    eventPlayer.call_init = false


rule "[pharah/init.opy]: Reset projectile speed for Barrage":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.PHARAH
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setProjectileSpeed(100)
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setProjectileSpeed(87.5)
