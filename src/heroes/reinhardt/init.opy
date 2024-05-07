#!mainFile "../../dev_main.opy"

#!include "heroes/reinhardt/firestrike.opy"
#!include "heroes/reinhardt/charge.opy"
#!include "heroes/reinhardt/shatter.opy"


rule "[reinhardt/init.opy]: Reinhardt":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    
    newHero(
        250,
        150 if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else 250,
        0)
    removeSelfHealing()

    eventPlayer.setKnockbackReceived(115)
    eventPlayer.stopForcingThrottle()
    setBaseDamage(eventPlayer, ADJ_REINHARDT_HAMMER_DAMAGE/OW2_REINHARDT_HAMMER_DAMAGE)

    eventPlayer.ult_change_check = 1.07
