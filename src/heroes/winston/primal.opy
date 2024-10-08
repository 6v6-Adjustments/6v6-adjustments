#!mainFile "../../dev_main.opy"

playervar primal_pvar
#!defineMember _primal_exit_health primal_pvar[0]
#!defineMember _primal_exit_armor primal_pvar[1]
#!defineMember _primal_hp_id primal_pvar[2]


rule "[winston/primal.opy]: Remove bonus Primal Rage health":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.WINSTON
    @Condition eventPlayer.isUsingUltimate()

    removeHealthPool(eventPlayer._primal_hp_id)

    if not eventPlayer.isDuplicatingAHero(): # make sure the following logic doesn't apply to post-dupe echo if she loses dupe while raging
        wait(OW2_WINSTON_PRIMAL_DURATION - 6 * TICK_DURATION)
        eventPlayer._primal_exit_health = eventPlayer.getHealthOfType(Health.NORMAL)
        eventPlayer._primal_exit_armor = eventPlayer.getHealthOfType(Health.ARMOR)

        waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
        eventPlayer.addHealthPool(
            Health.NORMAL, 
            ADJ_WINSTON_PRIMAL_HP_DELTA, 
            true, 
            true)
        eventPlayer._primal_hp_id = getLastCreatedHealthPool()
        eventPlayer.setHealth(min(ADJ_WINSTON_HEALTH, eventPlayer._primal_exit_health) + eventPlayer._primal_exit_armor)


rule "[winston/primal.opy]: Reduce Primal Rage damage":
    @Event eachPlayer
    @Hero winston
    @Condition eventPlayer.isUsingUltimate()
    
    eventPlayer.setDamageDealt(percent(ADJ_WINSTON_PRIMAL_DAMAGE/OW2_WINSTON_PRIMAL_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar)) # revert damage back after Primal Rage concludes


rule "[winston/primal.opy]: Correct Jump Pack damage during Primal Rage":
    @Event playerDealtDamage
    @Hero winston
    @Condition eventPlayer.isUsingUltimate()
    @Condition eventAbility == Button.ABILITY_1

    damage(victim, attacker, (eventDamage/(ADJ_WINSTON_PRIMAL_DAMAGE/OW2_WINSTON_PRIMAL_DAMAGE) - eventDamage)/(ADJ_WINSTON_PRIMAL_DAMAGE/OW2_WINSTON_PRIMAL_DAMAGE))
