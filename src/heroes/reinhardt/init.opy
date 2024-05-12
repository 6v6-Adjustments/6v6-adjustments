#!mainFile "../../dev_main.opy"

#!include "heroes/reinhardt/firestrike.opy"
#!include "heroes/reinhardt/charge.opy"
#!include "heroes/reinhardt/shatter.opy"


rule "[reinhardt/init.opy]: Reinhardt":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    
    setCustomHp(
        ADJ_REINHARDT_HEALTH,
        ADJ_REINHARDT_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_REINHARDT_ARMOR,
        0)
    removeSelfHealing()

    eventPlayer.setKnockbackReceived(115)
    eventPlayer.stopForcingThrottle()
    setBaseDamage(eventPlayer, ADJ_REINHARDT_HAMMER_DAMAGE/OW2_REINHARDT_HAMMER_DAMAGE)

    eventPlayer.call_init = false
