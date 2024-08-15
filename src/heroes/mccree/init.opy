#!mainFile "../../dev_main.opy"

# #!include "heroes/mccree/deadeye.opy"
#!include "heroes/mccree/peacekeeper.opy"
# #!include "heroes/mccree/roll.opy"


def initMccree():
    @Name "[mccree/init.opy]: initMccree()"
    
    setCustomHp(ADJ_MCCREE_HEALTH, 0, 0)
    setUltCost(ADJ_MCCREE_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()

    # setBaseDamage(eventPlayer, ADJ_MCCREE_FAN_THE_HAMMER_DAMAGE/OW2_MCCREE_FAN_THE_HAMMER_DAMAGE)

    eventPlayer.hero_initialized = true


# rule "[mccree/init.opy]: Correct Cassidy other forms of damage":
#     @Event playerDealtDamage
#     @Hero mccree
#     @Condition eventAbility in [Button.MELEE, Button.PRIMARY_FIRE, Button.ABILITY_2]

#     damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
