#!mainFile "../../dev_main.opy"

#!include "heroes/venture/excavator.opy"
#!include "heroes/venture/drill_dash.opy"
#!include "heroes/venture/clobber.opy"
#!include "heroes/venture/burrow.opy"
#!include "heroes/venture/tectonic_shock.opy"


def initVenture():
    @Name "[venture/init.opy]: initVenture()"

    setCustomHp(ADJ_VENTURE_HEALTH, 0, 0)
    setUltCost(ADJ_VENTURE_ULT_COST)
    removeSelfHealing()

    if not eventPlayer.isDuplicatingAHero():
        setBaseDamage(eventPlayer, ADJ_VENTURE_CLOBBER_DAMAGE/OW2_VENTURE_CLOBBER_DAMAGE)
    eventPlayer.setKnockbackDealt(ADJ_VENTURE_DRILL_DASH_KNOCKBACK)

    eventPlayer.setAmmo(0, ADJ_VENTURE_DRILL_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_VENTURE_DRILL_AMMO)
    
    eventPlayer.max_health_scaler = (ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS)
    eventPlayer.hero_initialized = true


rule "[venture/init.opy]: Correct Venture bonus shields":
    @Event eachPlayer
    @Hero venture
    @Condition eventPlayer.getMaxHealthOfType(Health.SHIELDS) >= floor(ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS * OW2_VENTURE_EXPLORER_SHIELDS_ULTIMATE)
    
    eventPlayer.addHealthPool(
        Health.SHIELDS,
        ADJ_VENTURE_EXPLORER_SHIELDS_ULTIMATE - (ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS * OW2_VENTURE_EXPLORER_SHIELDS_ULTIMATE),
        true,
        true)
    # subtract 1 to account for rounding error
    waitUntil(eventPlayer.getMaxHealthOfType(Health.SHIELDS) < (ADJ_VENTURE_EXPLORER_SHIELDS_ULTIMATE - 1), Math.INFINITY)
    removeHealthPool(getLastCreatedHealthPool())
