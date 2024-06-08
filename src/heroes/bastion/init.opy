#!mainFile "../../dev_main.opy"

#!include "heroes/bastion/reconfigure.opy"


rule "[bastion/init.opy]: Bastion":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.BASTION
    
    setCustomHp(ADJ_BASTION_HEALTH, ADJ_BASTION_ARMOR, 0)
    removeSelfHealing()

    eventPlayer.call_init = false


rule "[bastion/init.opy]: Reduce grenade self-damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.BASTION
    @Condition attacker == victim
    
    heal(victim, null, eventDamage - (eventDamage*0.5))
