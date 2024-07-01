#!mainFile "../../dev_main.opy"

# #!include "heroes/mccree/roll.opy"
# #!include "heroes/mccree/deadeye.opy"


rule "[mccree/init.opy]: Initialize Cassidy":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MCCREE
    
    setCustomHp(ADJ_MCCREE_HEALTH, 0, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_MCCREE_CRIT_MOD/OW2_MCCREE_CRIT_MOD)

    eventPlayer.call_init = false


rule "[mccree/init.opy]: Correct Cassidy non-critical damage":
    @Event playerDealtDamage
    @Hero mccree
    @Condition not eventWasCriticalHit
    @Condition eventAbility in [Button.MELEE, Button.PRIMARY_FIRE, Button.SECONDARY_FIRE, Button.ABILITY_1, Button.ABILITY_2, Button.ULTIMATE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
