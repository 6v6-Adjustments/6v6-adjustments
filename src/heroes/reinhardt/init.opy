#!mainFile "../../dev_main.opy"

#!include "heroes/reinhardt/firestrike.opy"
#!include "heroes/reinhardt/charge.opy"
#!include "heroes/reinhardt/shatter.opy"


rule "[reinhardt/init.opy]: Reinhardt":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REINHARDT

    eventPlayer.ult_change_check = 1.07
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(114.3)
    resetHealth()
    eventPlayer.addHealthPool(Health.NORMAL, 249, true, true)
    eventPlayer.addHealthPool(Health.ARMOR, 150 if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else 250, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    eventPlayer.setKnockbackReceived(115)
    eventPlayer.stopForcingThrottle()
    setBaseDamage(eventPlayer, ADJ_REINHARDT_HAMMER_DAMAGE/OW2_REINHARDT_HAMMER_DAMAGE)
    removeSelfHealing()
