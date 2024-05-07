#!mainFile "../../dev_main.opy"


rule "[sojourn/init.opy]: Sojourn":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SOJOURN
    
    newHero(200, 0, 0)
    removeSelfHealing()

    eventPlayer.call_init = false
