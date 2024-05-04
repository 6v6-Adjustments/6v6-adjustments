#!mainFile "../../dev_main.opy"


rule "[mercy/init.opy]: Mercy":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MERCY

    newHero(200, 0, 0)

    eventPlayer.setHealingDealt(109.1)

    eventPlayer.setAmmo(0, 20)
    eventPlayer.setMaxAmmo(0, 20)

    eventPlayer.ult_change_check = 1.04


rule "[mercy/init.opy]: Reduce Valkyrie healing":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MERCY
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setHealingDealt(100)
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setHealingDealt(109.1)
