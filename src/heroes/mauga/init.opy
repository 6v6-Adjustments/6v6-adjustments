#!mainFile "../../dev_main.opy"

#!include "heroes/mauga/cage_fight.opy"
#!include "heroes/mauga/cardiac.opy"


rule "[mauga/init.opy]: Initialize Mauga":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MAUGA

    eventPlayer.removeAllHealthPools()
    wait()
    eventPlayer.setMaxHealth(100.001) # DO NOT REMOVE THIS LINE
    wait() # DO NOT REMOVE THIS LINE
    eventPlayer.setMaxHealth(100)

    eventPlayer.setHealingReceived(0)
    eventPlayer.setHealth(ADJ_MAUGA_HEALTH)

    eventPlayer.addHealthPool(Health.NORMAL, 1, true, true)
    eventPlayer.addHealthPool(Health.ARMOR, 1, true, true)
    eventPlayer.addHealthPool(Health.SHIELDS, 1, true, true)
    eventPlayer.removeAllHealthPools()

    resetStats()
    resetStatuses()
    enableAllAbilities()
    removeSelfHealing()

    if eventPlayer.getMaxHealth() != 699:
        goto RULE_START
   
    setBaseDamage(eventPlayer, ADJ_MAUGA_CHAINGUN_DAMAGE/OW2_MAUGA_CHAINGUN_DAMAGE)
    
    eventPlayer.setHealingDealt(percent(ADJ_MAUGA_CARDIAC_LIFESTEAL/OW2_MAUGA_CARDIAC_LIFESTEAL))
    eventPlayer.startScalingSize(0.94, true)

    eventPlayer.balance_change_check = false

    eventPlayer.call_init = false
    
    wait()
    waitUntil(not eventPlayer.isInSpawnRoom(), Math.INFINITY)
    damage(eventPlayer, null, 149.99)
    

rule "[mauga/init.opy]: Increase Mauga melee damage":
    @Event playerDealtDamage
    @Hero mauga
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
