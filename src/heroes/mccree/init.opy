#!mainFile "../../dev_main.opy"

# #!include "heroes/mccree/roll.opy"
# #!include "heroes/mccree/deadeye.opy"


rule "[mccree/init.opy]: Initialize Cassidy":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.CASSIDY
    
    setCustomHp(ADJ_MCCREE_HEALTH, 0, 0)
    setUltCost(ADJ_MCCREE_ULT_COST)
    removeSelfHealing()

    # setBaseDamage(eventPlayer, ADJ_MCCREE_FAN_THE_HAMMER_DAMAGE/OW2_MCCREE_FAN_THE_HAMMER_DAMAGE)

    eventPlayer.call_init = false


rule "[mccree/init.opy]: Correct Cassidy other forms of damage":
    @Event playerDealtDamage
    @Hero cassidy
    @Condition eventAbility == Button.SECONDARY_FIRE

    damage(victim, attacker, eventDamage * (ADJ_MCCREE_FAN_THE_HAMMER_DAMAGE / OW2_MCCREE_FAN_THE_HAMMER_DAMAGE) - eventDamage)
