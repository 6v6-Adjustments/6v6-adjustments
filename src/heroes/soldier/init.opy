#!mainFile "../../dev_main.opy"

#!include "heroes/soldier/biotic_field.opy"


rule "[soldier/init.opy]: Initialize Soldier 76":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SOLDIER
    
    setCustomHp(ADJ_SOLDIER_HEALTH, 0, 0)
    setUltCost(ADJ_SOLDIER_ULT_COST)
    removeSelfHealing()

    eventPlayer.setHealingDealt(86.4)

    eventPlayer.call_init = false


rule "[soldier/init.opy]: Increase Heavy Pulse Rifle damage":
    @Event playerDealtDamage
    @Hero soldier
    @Condition eventAbility == Button.PRIMARY_FIRE
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_SOLDIER_PULSE_RIFLE_DAMAGE/OW2_SOLDIER_PULSE_RIFLE_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
