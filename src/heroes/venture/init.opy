#!mainFile "../../dev_main.opy"

#!include "heroes/venture/excavator.opy"
#!include "heroes/venture/clobber.opy"
#!include "heroes/venture/burrow.opy"
#!include "heroes/venture/tectonic_shock.opy"


rule "[venture/init.opy]: Venture":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.VENTURE

    setCustomHp(ADJ_VENTURE_HEALTH, 0, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)
    eventPlayer.setKnockbackDealt(70)
    eventPlayer.setMoveSpeed(percent(ADJ_VENTURE_SPEED/OW2_VENTURE_SPEED))

    eventPlayer.call_init = false


rule "[venture/init.opy]: Correct Venture bonus shields":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.getMaxHealthOfType(Health.SHIELDS) >= floor(ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS * OW2_VENTURE_EXPLORER_SHIELDS_ULTIMATE)
    
    eventPlayer.addHealthPool(
        Health.SHIELDS,
        ADJ_VENTURE_EXPLORER_SHIELDS_ULTIMATE - (ADJ_VENTURE_EXPLORER_SHIELDS/OW2_VENTURE_EXPLORER_SHIELDS * OW2_VENTURE_EXPLORER_SHIELDS_ULTIMATE),
        true,
        true)
    # subtract 1 to account for rounding error
    waitUntil(eventPlayer.getMaxHealthOfType(Health.SHIELDS) < (ADJ_VENTURE_EXPLORER_SHIELDS_ULTIMATE - 1), Math.INFINITY)
    removeHealthPool(getLastCreatedHealthPool())
