#!mainFile "../../dev_main.opy"

#!define ADJ_VENTURE_BURROW_DAMAGE 80

#!define OW2_VENTURE_BURROW_DAMAGE 110


rule "[venture/burrow.opy]: Reduce Burrow damage":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isUsingAbility1()
    
    setBaseDamage(eventPlayer, ADJ_VENTURE_BURROW_DAMAGE / OW2_VENTURE_BURROW_DAMAGE)
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    if not eventPlayer.isUsingUltimate():
        setBaseDamage(eventPlayer, ADJ_VENTURE_DRILL_DASH_DAMAGE / OW2_VENTURE_DRILL_DASH_DAMAGE)
    elif eventPlayer.isUsingUltimate():
        setBaseDamage(eventPlayer, ADJ_VENTURE_TECTONIC_SHOCK_DAMAGE / OW2_VENTURE_TECTONIC_SHOCK_DAMAGE)
