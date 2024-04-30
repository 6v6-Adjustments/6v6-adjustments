#!mainFile "../../dev_main.opy"

#!define OW2_VENTURE_TECTONIC_SHOCK_BALANCE_DURATION 0.2
#!define ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE 110
#!define ADJ_VENTURE_TECTONIC_SHOCK_CRIT_BONUS 55
#!define ADJ_VENTURE_TECTONIC_SHOCK_CRIT_RADIUS 2.5

#!define OW2_VENTURE_TECTONIC_SHOCK_DAMAGE 130


rule "[venture/tectonic_shock.opy]: Increase Tectonic Shock damage":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingUltimate()
    
    setBaseDamage(eventPlayer, ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE / OW2_VENTURE_TECTONIC_SHOCK_DAMAGE)
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)


rule "[venture/tectonic_shock.opy]: Tectonic Shock critical damage bonus":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingUltimate()
    @Condition not eventPlayer.balance_change_check
    @Condition distance(attacker.getPosition(), victim.getPosition()) < ADJ_VENTURE_TECTONIC_SHOCK_CRIT_RADIUS

    eventPlayer.balance_change_check = true
    damage(victim, attacker, (ADJ_VENTURE_TECTONIC_SHOCK_CRIT_BONUS / eventPlayer._base_damage_scalar))
    wait(OW2_VENTURE_TECTONIC_SHOCK_BALANCE_DURATION)
    eventPlayer.balance_change_check = false
