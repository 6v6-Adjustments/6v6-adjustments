#!mainFile "../../dev_main.opy"

#!include "constants/ow2_constants.opy"
#!include "utilities/macro_functions.opy"


rule "[passives/damage/damage_passive.opy]: Remove DPS Passive":
    @Event playerTookDamage
    @Condition attacker.getCurrentHero() in getDamageHeroes()
    @Condition attacker != victim
    
    if victim.getCurrentHero() in getTankHeroes():
        eventPlayer.setHealingReceived(percent(100/(100-OW2_DAMAGE_PASSIVE_TANK_HEAL_REDUCTION)))
    else:
        eventPlayer.setHealingReceived(percent(100/(100-OW2_DAMAGE_PASSIVE_HEAL_REDUCTION)))

    wait(0.5)
    wait((OW2_DAMAGE_PASSIVE_DURATION - 0.5), Wait.RESTART_WHEN_TRUE)
    eventPlayer.setHealingReceived(100)
