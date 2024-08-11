#!mainFile "../../dev_main.opy"


def initTracer():
    @Name "[tracer/init.opy]: initTracer()"

    if eventPlayer.isDuplicatingAHero():
        eventPlayer.removeAllHealthPools()
        wait(0.15)
        eventPlayer.setMaxHealth(100.001) # DO NOT REMOVE THIS LINE
        wait(0.15) # DO NOT REMOVE THIS LINE
        eventPlayer.setMaxHealth(100)

        eventPlayer.setHealingReceived(0)
        eventPlayer.addHealthPool(Health.NORMAL, 1, true, true)
        eventPlayer.addHealthPool(Health.ARMOR, 1, true, true)
        eventPlayer.addHealthPool(Health.SHIELDS, 1, true, true)
        eventPlayer.removeAllHealthPools()

    setUltCost(ADJ_TRACER_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_TRACER_PULSE_PISTOL_DAMAGE/OW2_TRACER_PULSE_PISTOL_DAMAGE)
    eventPlayer.startScalingSize(0.96, true)

    eventPlayer.max_health_scaler = (ADJ_TRACER_HEALTH/OW2_TRACER_HEALTH)

    eventPlayer.hero_initialized = true


rule "[tracer/init.opy]: Correct melee and Pulse Bomb damage":
    @Event playerDealtDamage
    @Hero tracer
    @Condition eventAbility in [Button.MELEE, Button.ULTIMATE]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
