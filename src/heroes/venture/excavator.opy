#!mainFile "../../dev_main.opy"

#!define ADJ_VENTURE_EXCAVATOR_DAMAGE 70

#!define OW2_VENTURE_EXCAVATOR_BALANCE_DURATION 0.2
#!define OW2_VENTURE_EXCAVATOR_DAMAGE (OW2_VENTURE_EXCAVATOR_DAMAGE_DIRECT + OW2_VENTURE_EXCAVATOR_DAMAGE_EXPLOSION)
#!define OW2_VENTURE_EXCAVATOR_DAMAGE_DIRECT 35
#!define OW2_VENTURE_EXCAVATOR_DAMAGE_EXPLOSION 40
#!define OW2_VENTURE_EXCAVATOR_DURATION 0.3

playervar is_firing_excavator


#This rule checks for when Venture uses primary fire, then we pass this variable onto the next rule to make sure Drill Dash doesn't receive bonus damage from the increases to Smart Excavator's damage
rule "[venture/excavator.opy]: Prepare Smart Excavator damage increase":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isFiringPrimaryFire()

    eventPlayer.is_firing_excavator = true
    wait(OW2_VENTURE_EXCAVATOR_DURATION)
    eventPlayer.is_firing_excavator = false


rule "[venture/excavator.opy]: Increase Smart Excavator damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.VENTURE
    @Condition eventPlayer.isFiringPrimaryFire() or eventPlayer.is_firing_excavator
    @Condition not eventPlayer.balance_change_check

    eventPlayer.balance_change_check = true
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_VENTURE_EXCAVATOR_DAMAGE / OW2_VENTURE_EXCAVATOR_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    wait(OW2_VENTURE_EXCAVATOR_BALANCE_DURATION)
    eventPlayer.balance_change_check = false