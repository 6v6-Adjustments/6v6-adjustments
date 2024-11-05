#!mainFile "../../dev_main.opy"

#!include "heroes/bastion/reconfigure.opy"


def initBastion():
    @Name "[bastion/init.opy]: initBastion()"
    
    setCustomHp(ADJ_BASTION_HEALTH, ADJ_BASTION_ARMOR, 0)
    setUltCost(ADJ_BASTION_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()

    eventPlayer.startScalingSize(0.96, true)

    eventPlayer.hero_initialized = true


# rule "[bastion/init.opy]: Reduce grenade self-damage":
#     @Event playerDealtDamage
#     @Hero bastion
#     @Condition attacker == victim
    
#     heal(victim, null, eventDamage - (eventDamage*0.5))
