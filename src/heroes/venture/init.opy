#!mainFile "../../dev_main.opy"

#!define ADJ_VENTURE_BURROW_DAMAGE 80
#!define ADJ_VENTURE_CLOBBER_DAMAGE 65
#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN 6
#!define ADJ_VENTURE_DRILL_DASH_DAMAGE 60
#!define ADJ_VENTURE_EXCAVATOR_DAMAGE 65
#!define OW2_VENTURE_EXCAVATOR_BALANCE_DURATION 0.2
#!define ADJ_VENTURE_EXPLORER_SHIELDS 25
#!define OW2_VENTURE_TECTONIC_SHOCK_BALANCE_DURATION 0.2
#!define ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE 110
#!define ADJ_VENTURE_TECTONIC_SHOCK_CRIT_BONUS 55
#!define ADJ_VENTURE_TECTONIC_SHOCK_CRIT_RADIUS 2.5

#!define OW2_VENTURE_BURROW_DAMAGE 110
#!define OW2_VENTURE_CLOBBER_DAMAGE 70
#!define OW2_VENTURE_DRILL_DASH_COOLDOWN 6
#!define OW2_VENTURE_DRILL_DASH_DAMAGE 100
#!define OW2_VENTURE_EXCAVATOR_DAMAGE 80
#!define OW2_VENTURE_EXCAVATOR_DURATION 0.3
#!define OW2_VENTURE_EXPLORER_SHIELDS 40
#!define OW2_VENTURE_TECTONIC_SHOCK_DAMAGE 130

playervar is_firing_excavator


rule "[venture/init.opy]: Venture":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    
    eventPlayer.ult_change_check = 1.13
    eventPlayer.removeAllHealthPools()
    eventPlayer.setMaxHealth(percent(ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS))
    resetHealth()
    eventPlayer.addHealthPool(Health.NORMAL, 199, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)
    eventPlayer.setKnockbackDealt(70)

    eventPlayer.balance_change_check = false
    eventPlayer.is_firing_excavator = false


rule "[venture/init.opy]: Correct Venture bonus shields":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.getMaxHealthOfType(Health.SHIELDS) >= 46
    
    eventPlayer.addHealthPool(Health.SHIELDS, 3.125, true, true)
    waitUntil(eventPlayer.getMaxHealthOfType(Health.SHIELDS) < 49, Math.INFINITY)
    removeHealthPool(getLastCreatedHealthPool())


rule "[venture/init.opy]: Increase Venture melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventAbility == Button.MELEE
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_CLOBBER_DAMAGE / OW2_VENTURE_CLOBBER_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    setBaseDamage(eventPlayer, ADJ_VENTURE_CLOBBER_DAMAGE / OW2_VENTURE_CLOBBER_DAMAGE)
    waitUntil(not eventPlayer.isMeleeing(), Math.INFINITY)
    setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)


#This rule checks for when Venture uses primary fire, then we pass this variable onto the next rule to make sure Drill Dash doesn't receive bonus damage from the increases to Smart Excavator's damage
rule "[venture/init.opy]: Prepare Smart Excavator damage increase":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isFiringPrimaryFire()

    eventPlayer.is_firing_excavator = true
    wait(OW2_VENTURE_EXCAVATOR_DURATION)
    eventPlayer.is_firing_excavator = false


rule "[venture/init.opy]: Increase Smart Excavator damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isFiringPrimaryFire() or eventPlayer.is_firing_excavator
    @Condition not eventPlayer.balance_change_check

    eventPlayer.balance_change_check = true
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_EXCAVATOR_DAMAGE / OW2_VENTURE_EXCAVATOR_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    wait(OW2_VENTURE_EXCAVATOR_BALANCE_DURATION)
    eventPlayer.balance_change_check = false


rule "[venture/init.opy]: Reduce Burrow damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingAbility1()
    
    setBaseDamage(eventPlayer, ADJ_VENTURE_BURROW_DAMAGE / OW2_VENTURE_BURROW_DAMAGE)
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    if not eventPlayer.isUsingUltimate():
        setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)
    elif eventPlayer.isUsingUltimate():
        setBaseDamage(eventPlayer, ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE / OW2_VENTURE_TECTONIC_SHOCK_DAMAGE)


rule "[venture/init.opy]: Increase Tectonic Shock damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingUltimate()
    
    setBaseDamage(eventPlayer, ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE / OW2_VENTURE_TECTONIC_SHOCK_DAMAGE)
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)


rule "[venture/init.opy]: Tectonic Shock critical damage bonus":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingUltimate()
    @Condition not eventPlayer.balance_change_check
    @Condition distance(attacker.getPosition(), victim.getPosition()) < ADJ_VENTURE_TECTONIC_SHOCK_CRIT_RADIUS

    eventPlayer.balance_change_check = true
    damage(victim, attacker, (ADJ_VENTURE_TECTONIC_SHOCK_CRIT_BONUS / eventPlayer._base_damage_scalar))
    wait(OW2_VENTURE_TECTONIC_SHOCK_BALANCE_DURATION)
    eventPlayer.balance_change_check = false
