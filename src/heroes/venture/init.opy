#!mainFile "../../dev_main.opy"

#!include "heroes/venture/excavator.opy"
#!include "heroes/venture/drill_dash.opy"
#!include "heroes/venture/clobber.opy"
# !include "heroes/venture/burrow.opy"
#!include "heroes/venture/tectonic_shock.opy"


def initVenture():
    @Name "[venture/init.opy]: initVenture()"

    setCustomHp(ADJ_VENTURE_HEALTH, 0, 0)
    setUltCost(ADJ_VENTURE_ULT_COST)
    removeSelfHealing()

    if not eventPlayer.isDuplicatingAHero():
        setBaseDamage(eventPlayer, ADJ_VENTURE_BURROW_DAMAGE / OW2_VENTURE_BURROW_DAMAGE)
    eventPlayer.setKnockbackDealt(70)
    # eventPlayer.setMoveSpeed(percent(ADJ_VENTURE_SPEED/OW2_VENTURE_SPEED))

    eventPlayer.setAmmo(0, 6)
    eventPlayer.setMaxAmmo(0, 6)
    
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
