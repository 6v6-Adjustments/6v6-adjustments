#!mainFile "../../dev_main.opy"

#!include "heroes/soldier/biotic_field.opy"


rule "[soldier/init.opy]: Soldier 76":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.SOLDIER
    
    newHero(200, 0, 0)
    removeSelfHealing()

    eventPlayer.setHealingDealt(86.4)

    eventPlayer.ult_change_check = 1.2


rule "[soldier/init.opy]: Increase Heavy Pulse Rifle damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.SOLDIER
    @Condition eventAbility == Button.PRIMARY_FIRE
    
    damage(victim, attacker, eventDamage * 1.026 - eventDamage)
