#!mainFile "../../dev_main.opy"

#!include "heroes/orisa/fortify.opy"


rule "[orisa/init.opy]: Orisa":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ORISA
    
    setCustomHp(
        ADJ_ORISA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ORISA_HEALTH, 
        ADJ_ORISA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ORISA_ARMOR, 
        0)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.call_init = false


rule "[orisa/init.opy]: Reduce Terra Surge damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ORISA
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setDamageDealt(80)
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(100)
