#!mainFile "../../dev_main.opy"

#!include "heroes/soldier/biotic_field.opy"


def initSoldier():
    @Name "[soldier/init.opy]: initSoldier()"
    
    setCustomHp(ADJ_SOLDIER_HEALTH, 0, 0)
    setUltCost(ADJ_SOLDIER_ULT_COST)
    removeSelfHealing()

    eventPlayer.setAmmo(0, ADJ_SOLDIER_PULSE_RIFLE_AMMO)
    eventPlayer.setMaxAmmo(0, ADJ_SOLDIER_PULSE_RIFLE_AMMO)

    eventPlayer.setHealingDealt(86.4)

    eventPlayer.hero_initialized = true


rule "[soldier/init.opy]: Increase Heavy Pulse Rifle damage":
    @Event playerDealtDamage
    @Hero soldier
    @Condition eventAbility == Button.PRIMARY_FIRE
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar)*(ADJ_SOLDIER_PULSE_RIFLE_DAMAGE/OW2_SOLDIER_PULSE_RIFLE_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
