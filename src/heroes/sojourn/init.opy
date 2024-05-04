#!mainFile "../../dev_main.opy"


rule "[sojourn/init.opy]: Sojourn":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.SOJOURN
    
    newHero(200, 0, 0)
    removeSelfHealing()

    eventPlayer.ult_change_check = 1.1
