#!mainFile "../../dev_main.opy"


rule "[pharah/init.opy]: Pharah":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.PHARAH
    
    newHero(200, 0, 0)
    removeSelfHealing()

    eventPlayer.setProjectileSpeed(87.5)

    eventPlayer.ult_change_check = 1.19


rule "[pharah/init.opy]: Reset projectile speed for Barrage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.PHARAH
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setProjectileSpeed(100)
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setProjectileSpeed(87.5)
