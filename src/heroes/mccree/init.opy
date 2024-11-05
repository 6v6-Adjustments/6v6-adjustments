#!mainFile "../../dev_main.opy"

# !include "heroes/mccree/deadeye.opy"
# !include "heroes/mccree/peacekeeper.opy"
# !include "heroes/mccree/roll.opy"


def initMccree():
    @Name "[mccree/init.opy]: initMccree()"
    
    setCustomHp(ADJ_MCCREE_HEALTH, 0, 0)
    setUltCost(ADJ_MCCREE_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()

    eventPlayer.hero_initialized = true


rule "[mccree/init.opy]: Correct Peacekeeper damage":
    @Event playerDealtDamage
    @Hero cassidy
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, eventDamage * (ADJ_MCCREE_PEACEKEEPER_DAMAGE/OW2_MCCREE_PEACEKEEPER_DAMAGE) - eventDamage)
