#!mainFile "../../dev_main.opy"


rule "[tracer/init.opy]: Tracer":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.TRACER
    
    eventPlayer.ult_change_check = 1.18
    eventPlayer.removeAllHealthPools()
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 5)
    eventPlayer.setMaxHealth(85.714)
    #resetHealth()
    #eventPlayer.addHealthPool(Health.NORMAL, 174, true, true)
    resetStats()
    resetStatuses()
    enableAllAbilities()
    setBaseDamage(eventPlayer, ADJ_TRACER_PULSE_PISTOL_DAMAGE/OW2_TRACER_PULSE_PISTOL_DAMAGE)
    eventPlayer.startScalingSize(0.96, true)
    removeSelfHealing()


rule "[tracer/init.opy]: Correct melee and Pulse Bomb damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.TRACER
    @Condition eventAbility in [Button.MELEE, Button.ULTIMATE]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
