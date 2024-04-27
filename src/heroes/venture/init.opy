#!mainFile "../../dev_main.opy"

#!define ADJ_VENTURE_BURROW_DAMAGE 80
#!define ADJ_VENTURE_CLOBBER_DAMAGE 65
#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN 6
#!define ADJ_VENTURE_DRILL_DASH_DAMAGE 70
#!define ADJ_VENTURE_EXCAVATOR_DAMAGE 65
#!define ADJ_VENTURE_EXPLOERER_SHIELDS 25
#!define ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE 110
#!define ADJ_VENTURE_TECTONIC_SHOCK_CRIT 165

#!define OW2_VENTURE_BURROW_DAMAGE 110
#!define OW2_VENTURE_CLOBBER_DAMAGE 70
#!define OW2_VENTURE_DRILL_DASH_COOLDOWN 6
#!define OW2_VENTURE_DRILL_DASH_DAMAGE 100
#!define OW2_VENTURE_EXCAVATOR_DAMAGE 80
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
    setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)
    removeSelfHealing()
    eventPlayer.balance_change_check = false

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
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_CLOBBER_DAMAGE / OW2_VENTURE_CLOBBER_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)


rule "Increase Smart Excavator damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    # @Condition eventPlayer.isMeleeing() == false
    # @Condition eventPlayer.isFiringSecondaryFire() == false
    # @Condition eventPlayer.isUsingAbility1() == false
    # @Condition eventPlayer.isUsingAbility2() == false
    # @Condition eventPlayer.isUsingUltimate() == false
    # @Condition eventPlayer.balance_change_check == false
    @Condition eventPlayer.isFiringPrimaryFire() == true

    eventPlayer.balance_change_check = true
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_EXCAVATOR_DAMAGE / OW2_VENTURE_EXCAVATOR_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    wait(0.20)
    eventPlayer.balance_change_check = false


rule "Reduce Burrow damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingAbility1() == true
    
    eventPlayer.setDamageDealt(percent(ADJ_VENTURE_BURROW_DAMAGE / OW2_VENTURE_BURROW_DAMAGE))
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    if not eventPlayer.isUsingUltimate():
        eventPlayer.setDamageDealt(percent(ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE))
    elif eventPlayer.isUsingUltimate():
        eventPlayer.setDamageDealt(percent(ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE / OW2_VENTURE_TECTONIC_SHOCK_DAMAGE))


rule "Increase Tectonic Shock damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingUltimate() == true
    
    eventPlayer.setDamageDealt(percent(ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE / OW2_VENTURE_TECTONIC_SHOCK_DAMAGE))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE))

# rule "Tectonic Shock critical damage bonus":
#     @Event playerDealtDamage
#     @Condition eventPlayer.hero_setup == Hero.VENTURE
#     @Condition eventPlayer.isUsingUltimate() == true
#     # @Condition getPlayersInRadius(victim, 3, getOppositeTeam(eventPlayer.getTeam()), LosCheck.OFF)

#     eventPlayer.balance_change_check = true
#     damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_TECTONIC_SHOCK_CRIT / ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
#     wait(0.20)
#     eventPlayer.balance_change_check = false