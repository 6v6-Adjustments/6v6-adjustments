#!mainFile "../../dev_main.opy"

#!include "heroes/ramattra/nemesis_form.opy"


rule "[ramattra/init.opy]: Initialize Ramattra":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    
    setCustomHp(ADJ_RAMATTRA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_RAMATTRA_HEALTH, 0, 0)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.startScalingSize(0.94, true)

    eventPlayer.call_init = false
