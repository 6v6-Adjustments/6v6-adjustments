#!mainFile "../../dev_main.opy"

#!define ADJ_VENTURE_CLOBBER_DAMAGE 65
#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN 6
#!define ADJ_VENTURE_DRILL_DASH_DAMAGE 70
#!define ADJ_VENTURE_EXCAVATOR_DAMAGE 65
#!define ADJ_VENTURE_EXPLOERER_SHIELDS 25
#!define ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE 120

#!define OW2_VENTURE_CLOBBER_DAMAGE 70
#!define OW2_VENTURE_DRILL_DASH_COOLDOWN 6
#!define OW2_VENTURE_DRILL_DASH_DAMAGE 100
#!define OW2_VENTURE_EXCAVATOR_DAMAGE 70
#!define OW2_VENTURE_EXPLOERER_SHIELDS 40
#!define OW2_VENTURE_TECTONIC_SHOCK_DAMAGE 130


rule "Venture":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    
    eventPlayer.ult_change_check = 1.13
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(percent(ADJ_VENTURE_EXPLOERER_SHIELDS/OW2_VENTURE_EXPLOERER_SHIELDS))
    resetHealth()
    eventPlayer.addHealthPool(Health.NORMAL, 199, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE/OW2_VENTURE_DRILL_DASH_DAMAGE)
    removeSelfHealing()

    eventPlayer.setKnockbackDealt(70)


rule "Correct Venture bonus shields":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.getMaxHealthOfType(Health.SHIELDS) >= 46
    
    eventPlayer.addHealthPool(Health.SHIELDS, 3.125, true, true)
    waitUntil(eventPlayer.getMaxHealthOfType(Health.SHIELDS) < 49, 99999)
    removeHealthPool(getLastCreatedHealthPool())


rule "Increase Venture melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventAbility == Button.MELEE
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_CLOBBER_DAMAGE/OW2_VENTURE_CLOBBER_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "Increase Smart Excavator damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isMeleeing() == false
    @Condition eventPlayer.isFiringSecondaryFire() == false
    @Condition eventPlayer.isUsingAbility1() == false
    @Condition eventPlayer.isUsingAbility2() == false
    @Condition eventPlayer.isUsingUltimate() == false

    damage(victim, attacker, eventDamage * 1.107 - eventDamage)


rule "Reduce Burrow damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingAbility1() == true
    
    eventPlayer.setDamageDealt(72.73)
    waitUntil(not eventPlayer.isUsingAbility1(), 999999986991104)
    if not eventPlayer.isUsingUltimate():
        eventPlayer.setDamageDealt(75)
    elif eventPlayer.isUsingUltimate():
        eventPlayer.setDamageDealt(84.62)


rule "Increase Tectonic Shock damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingUltimate() == true
    
    eventPlayer.setDamageDealt(84.62)
    waitUntil(not eventPlayer.isUsingUltimate(), 999999986991104)
    eventPlayer.setDamageDealt(75)
