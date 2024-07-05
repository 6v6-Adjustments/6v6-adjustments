#!mainFile "../../dev_main.opy"

#!include "heroes/mauga/cage_fight.opy"
#!include "heroes/mauga/cardiac.opy"


rule "[mauga/init.opy]: Initialize Mauga":
    @Event eachPlayer
    @Hero mauga
    @Condition eventPlayer.call_init

    eventPlayer.removeAllHealthPools()
    wait()
    eventPlayer.setMaxHealth(100.001) # DO NOT REMOVE THIS LINE
    wait() # DO NOT REMOVE THIS LINE
    eventPlayer.setMaxHealth(100)

    eventPlayer.setHealingReceived(0)
    wait()
    eventPlayer.setHealth(649.997)
    # using magic numbers in this code for the time being until it can be further understood

    eventPlayer.addHealthPool(Health.NORMAL, 1, true, true)
    eventPlayer.addHealthPool(Health.ARMOR, 1, true, true)
    eventPlayer.addHealthPool(Health.SHIELDS, 1, true, true)
    eventPlayer.removeAllHealthPools()

    resetStats()
    resetStatuses()
    enableAllAbilities()
    removeSelfHealing()


    if ceil(eventPlayer.getMaxHealth()) != 650:
        goto RULE_START
    
    setBaseDamage(eventPlayer, ADJ_MAUGA_CHAINGUN_DAMAGE/OW2_MAUGA_CHAINGUN_DAMAGE)
    
    eventPlayer.setHealingDealt(percent(ADJ_MAUGA_CARDIAC_LIFESTEAL/OW2_MAUGA_CARDIAC_LIFESTEAL))
    eventPlayer.startScalingSize(0.94, true)

    eventPlayer.balance_change_check = false

    eventPlayer.call_init = false
    
    getPlayersOnHero(Hero.MAUGA, eventPlayer.getTeam()).setHealth(350)
    heal(eventPlayer, null, 350)
    # waitUntil(not eventPlayer.isInSpawnRoom(), Math.INFINITY)
    # damage(eventPlayer, null, 100.99)
    

rule "[mauga/init.opy]: Increase Mauga melee damage":
    @Event playerDealtDamage
    @Hero mauga
    @Condition eventAbility in [Button.MELEE, Button.ABILITY_1]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[mauga/init.opy]: Initialize Mauga":
    @Event eachPlayer
    @Condition eventPlayer.isDuplicatingAHero() == Hero.MAUGA
    @Condition eventPlayer.call_init
    

    eventPlayer.addHealthPool(Health.NORMAL, ADJ_MAUGA_HEALTH_DUPLICATE - ADJ_MAUGA_BASE_HEALTH_DUPLICATE, true, true)
    eventPlayer.addHealthPool(Health.ARMOR, ADJ_MAUGA_ARMOR_DUPLICATE - ADJ_MAUGA_BASE_ARMOR_DUPLICATE, true, true)
