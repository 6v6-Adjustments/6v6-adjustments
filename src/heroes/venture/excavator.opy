#!mainFile "../../dev_main.opy"

playervar is_firing_excavator


# Extends Venture's primary fire signal to be used by damage modification rule
rule "[venture/excavator.opy]: Prepare Smart Excavator damage increase":
    @Event eachPlayer
    @Hero venture
    @Condition eventPlayer.isFiringPrimaryFire()

    eventPlayer.is_firing_excavator = true
    wait(OW2_VENTURE_EXCAVATOR_DURATION)
    eventPlayer.is_firing_excavator = false


rule "[venture/excavator.opy]: Correct Smart Excavator damage":
    @Event playerDealtDamage
    @Hero venture
    @Condition eventPlayer.is_firing_excavator

    damage(
        victim, 
        attacker, 
        ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_EXCAVATOR_DAMAGE/OW2_VENTURE_EXCAVATOR_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    eventPlayer.is_firing_excavator = false
