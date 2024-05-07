#!mainFile "../../dev_main.opy"


rule "[tracer/init.opy]: Tracer":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.TRACER
    
    defaultHero()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_TRACER_PULSE_PISTOL_DAMAGE/OW2_TRACER_PULSE_PISTOL_DAMAGE)
    eventPlayer.startScalingSize(0.96, true)

    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 5)

    eventPlayer.ult_change_check = 1.18


rule "[tracer/init.opy]: Correct melee and Pulse Bomb damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.TRACER
    @Condition eventAbility in [Button.MELEE, Button.ULTIMATE]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
