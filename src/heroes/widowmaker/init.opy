#!mainFile "../../dev_main.opy"


def initWidowmaker():
    @Name "[widowmaker/init.opy]: initWidowmaker()"
    
    setCustomHp(ADJ_WIDOWMAKER_HEALTH, 0, 0)
    setUltCost(ADJ_WIDOWMAKER_ULT_COST)
    removeSelfHealing()

    eventPlayer.hero_initialized = true


rule "[widowmaker/init.opy]: Reduce Scoped Shot damage":
    @Event eachPlayer
    @Hero widowmaker
    @Condition eventPlayer.isFiringSecondaryFire()
    
    eventPlayer.setDamageDealt(percent(ADJ_WIDOWMAKER_SCOPED_DAMAGE/OW2_WIDOWMAKER_SCOPED_DAMAGE))
    waitUntil(not eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
