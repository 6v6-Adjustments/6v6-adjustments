#!mainFile "../../../main.opy"


rule "[tracer/init.opy]: Initialize Tracer":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.TRACER)
    @Condition eventPlayer.call_init

    resetHero()
    eventPlayer.call_init = false


rule "[tracer.opy]: Deal OW1 tracer primary fire damage":
    @Event playerDealtDamage
    @Condition isHero(eventPlayer, Hero.TRACER)
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, eventDamage*(OW1_TRACER_PULSE_PISTOL_DAMAGE/OW2_TRACER_PULSE_PISTOL_DAMAGE)-eventDamage)
