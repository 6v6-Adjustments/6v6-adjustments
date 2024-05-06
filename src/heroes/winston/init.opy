#!mainFile "../../dev_main.opy"


rule "[winston/init.opy]: Winston":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.WINSTON
    
    eventPlayer.ult_change_check = 1.13
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(100)
    resetHealth()
    eventPlayer.addHealthPool(Health.NORMAL, 299 if eventPlayer.isDuplicatingAHero() or setting_echo_tank_hp else 399, true, true)
    eventPlayer.addHealthPool(Health.ARMOR, 100, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    removeTankPassive()
    removeSelfHealing()
    setBaseDamage(eventPlayer, ADJ_WINSTON_TESLA_DAMAGE/OW2_WINSTON_TESLA_DAMAGE)


rule "[winston/init.opy]: Correct Jump Pack, Melee, Primal Rage damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.WINSTON
    @Condition eventAbility in [Button.ABILITY_1, Button.MELEE, Button.SECONDARY_FIRE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
