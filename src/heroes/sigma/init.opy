#!mainFile "../../dev_main.opy"

#!include "heroes/sigma/accretion.opy"
#!include "heroes/sigma/kinetic_grasp.opy"


rule "[sigma/init.opy]: Initialize Sigma":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SIGMA

    setCustomHp(ADJ_SIGMA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_SIGMA_HEALTH, 0, ADJ_SIGMA_SHIELDS)
    removeTankPassive()
    removeSelfHealing()

    eventPlayer.balance_change_check = 0
    eventPlayer.call_init = false
