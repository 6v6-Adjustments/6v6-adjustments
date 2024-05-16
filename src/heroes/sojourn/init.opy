#!mainFile "../../dev_main.opy"


rule "[sojourn/init.opy]: Sojourn":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SOJOURN
    
    setCustomHp(ADJ_SOJOURN_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.setAmmo(0, ADJ_SOJOURN_RAILGUN_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_SOJOURN_RAILGUN_AMMO)

    eventPlayer.call_init = false
