#!mainFile "../../dev_main.opy"

#!include "heroes/reinhardt/firestrike.opy"
#!include "heroes/reinhardt/charge.opy"
#!include "heroes/reinhardt/shatter.opy"


rule "[reinhardt/init.opy]: Reinhardt":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    
    setCustomHp(
        ADJ_REINHARDT_HEALTH,
        ADJ_REINHARDT_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_REINHARDT_ARMOR,
        0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_REINHARDT_HAMMER_DAMAGE/OW2_REINHARDT_HAMMER_DAMAGE)
    eventPlayer.setKnockbackReceived(percent((1 - ADJ_REINHARDT_STEADAST_KNOCKBACK_REDUCTION)/(1 - OW2_TANK_KNOCKBACK_REDUCTION)))
    eventPlayer.stopForcingThrottle()

    eventPlayer.call_init = false
