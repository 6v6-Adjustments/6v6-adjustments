#!mainFile "../../dev_main.opy"


rule "[junkrat/init.opy]: Junkrat":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.JUNKRAT
    
    eventPlayer.removeAllHealthPools()
    wait(0.1)
    eventPlayer.setMaxHealth(100.001) # DO NOT REMOVE THIS LINE
    wait(0.1) # DO NOT REMOVE THIS LINE
    eventPlayer.setMaxHealth(100)
    #resetHealth()
    #Version or the "resetHealth" subroutine that keeps tire at 100 hp
    wait()
    eventPlayer.setHealingReceived(0)
    eventPlayer.setHealth(ADJ_JUNKRAT_HEALTH)
    eventPlayer.addHealthPool(Health.NORMAL, 1, true, true)
    eventPlayer.addHealthPool(Health.ARMOR, 1, true, true)
    eventPlayer.addHealthPool(Health.SHIELDS, 1, true, true)
    eventPlayer.removeAllHealthPools()
    #eventPlayer.addHealthPool(Health.NORMAL, 199, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_JUNKRAT_FRAG_DAMAGE/OW2_JUNKRAT_FRAG_DAMAGE)

    eventPlayer.call_init = false


rule "[junkrat/init.opy]: Correct Junkrat other forms of damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.JUNKRAT
    @Condition eventAbility in [Button.MELEE, Button.ABILITY_1, Button.ABILITY_2, Button.ULTIMATE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
