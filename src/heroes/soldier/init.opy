#!mainFile "../../dev_main.opy"

#!include "heroes/soldier/biotic_field.opy"


rule "[soldier/init.opy]: Soldier 76":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SOLDIER
    
    setCustomHp(ADJ_SOLDIER_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.setHealingDealt(86.4)

    eventPlayer.call_init = false


rule "[soldier/init.opy]: Increase Heavy Pulse Rifle damage":
    @Team 1
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.SOLDIER
    @Condition eventAbility == Button.PRIMARY_FIRE
    
    damage(victim, attacker, eventDamage * 1.026 - eventDamage)
