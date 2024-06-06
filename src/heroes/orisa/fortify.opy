#!mainFile "../../dev_main.opy"


rule "[orisa/init.opy]: Correct Fortify overhealth and reduce duration":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ORISA
    @Condition eventPlayer.isUsingAbility1()
    @Condition not eventPlayer.isInSpawnRoom()
    @Condition not eventPlayer.overhealth_check
    #@Condition eventPlayer.getHealthOfType(Health.ARMOR) >= 0.1
    
    damage(eventPlayer, null, 181.8)
    eventPlayer.overhealth_check = true
    waitUntil(eventPlayer.isUsingAbility1() == false, Math.INFINITY)
    eventPlayer.overhealth_check = false
