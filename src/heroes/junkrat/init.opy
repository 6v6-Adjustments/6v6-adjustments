#!mainFile "../../dev_main.opy"


rule "[junkrat/init.opy]: Junkrat":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.JUNKRAT
    
    clearCustomHp()
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


rule "[junkrat/init.opy]: Correct Mine, Trap, Tire, Melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.WINSTON
    @Condition eventAbility in [Button.ABILITY_1, Button.ABILITY_2, Button.ULTIMATE, Button.MELEE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
