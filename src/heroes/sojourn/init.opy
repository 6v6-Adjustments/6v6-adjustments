#!mainFile "../../dev_main.opy"


rule "[sojourn/init.opy]: Sojourn":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SOJOURN
    
    setCustomHp(ADJ_SOJOURN_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.setAmmo(0, 35)
    eventPlayer.setMaxAmmo(0, 35)

    eventPlayer.call_init = false
