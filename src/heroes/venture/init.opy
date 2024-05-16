#!mainFile "../../dev_main.opy"

#!define ADJ_VENTURE_CLOBBER_DAMAGE 65
#!define ADJ_VENTURE_DRILL_DASH_COOLDOWN 6
#!define ADJ_VENTURE_DRILL_DASH_DAMAGE 65

#!define OW2_VENTURE_CLOBBER_DAMAGE 70
#!define OW2_VENTURE_DRILL_DASH_COOLDOWN 6
#!define OW2_VENTURE_DRILL_DASH_DAMAGE 90

#!include "heroes/venture/excavator.opy"
#!include "heroes/venture/tectonic_shock.opy"
#!include "heroes/venture/burrow.opy"


rule "[venture/init.opy]: Venture":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.VENTURE

    setCustomHp(ADJ_VENTURE_HEALTH, 0, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)
    eventPlayer.setKnockbackDealt(70)

    eventPlayer.balance_change_check = false
    eventPlayer.is_firing_excavator = false
    eventPlayer.call_init = false


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
