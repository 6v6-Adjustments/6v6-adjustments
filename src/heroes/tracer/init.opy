#!mainFile "../../dev_main.opy"


rule "[tracer/init.opy]: Initialize Tracer":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.TRACER

    setUltCost(ADJ_TRACER_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_TRACER_PULSE_PISTOL_DAMAGE/OW2_TRACER_PULSE_PISTOL_DAMAGE)
    eventPlayer.startScalingSize(0.96, true)

    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_TRACER_HEALTH/OW2_TRACER_HEALTH)


rule "[tracer/init.opy]: Correct melee and Pulse Bomb damage":
    @Event playerDealtDamage
    @Hero tracer
    @Condition eventAbility in [Button.MELEE, Button.ULTIMATE]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
