#!mainFile "../../dev_main.opy"

#!include "heroes/orisa/javelin.opy"
#!include "heroes/orisa/fortify.opy"
#!include "heroes/orisa/terra_surge.opy"


rule "[orisa/init.opy]: Initialize Orisa":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.ORISA
    
    setCustomHp(
        ADJ_ORISA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ORISA_HEALTH, 
        ADJ_ORISA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_ORISA_ARMOR, 
        0)
    setUltCost(ADJ_ORISA_ULT_COST)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.balance_change_check = true
    eventPlayer.call_init = false
