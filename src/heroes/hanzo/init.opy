#!mainFile "../../dev_main.opy"

#!include "heroes/hanzo/stormbow.opy"


def initHanzo():
    @Name "[hanzo/init.opy]: initHanzo()"
    
    setCustomHp(ADJ_HANZO_HEALTH, 0, 0)
    setUltCost(ADJ_HANZO_ULT_COST)

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
        setBaseDamage(eventPlayer, ADJ_HANZO_MAX_DISTANCE_DAMAGE/OW2_HANZO_ARROW_DAMAGE)

    eventPlayer.hero_initialized = true


rule "[hanzo/init.opy]: Correct Hanzo other forms of damage":
    @Event playerDealtDamage
    @Hero hanzo
    @Condition eventAbility in [Button.MELEE, Button.ULTIMATE]

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)
