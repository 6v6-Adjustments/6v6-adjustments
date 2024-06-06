#!mainFile "../../dev_main.opy"

playervar is_firing_excavator


# Extends Venture's primary fire signal to be used by damage modification rule
rule "[venture/excavator.opy]: Prepare Smart Excavator damage increase":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isFiringPrimaryFire()

    eventPlayer.is_firing_excavator = true
    wait(OW2_VENTURE_EXCAVATOR_DURATION)
    eventPlayer.is_firing_excavator = false


rule "[venture/excavator.opy]: Correct Smart Excavator damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.is_firing_excavator

    damage(
        victim, 
        attacker, 
        ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_EXCAVATOR_DAMAGE/OW2_VENTURE_EXCAVATOR_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    eventPlayer.is_firing_excavator = false
