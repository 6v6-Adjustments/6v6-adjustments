#!mainFile "../../dev_main.opy"


rule "[moira/init.opy]: Moira":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MOIRA

    newHero(200, 0, 0)
    removePassiveHealing()

    eventPlayer.ult_change_check = 0.95


rule "[moira/init.opy]: Prevent fading during coalescence":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MOIRA
    @Condition eventPlayer.isUsingUltimate() == true
    
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setMoveSpeed(107.143)
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setAbility1Enabled(true)
