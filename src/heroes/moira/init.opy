#!mainFile "../../dev_main.opy"

#!include "heroes/moira/coalescence.opy"

def initMoira():
    @Name "[moira/init.opy]: initMoira()"

    setCustomHp(ADJ_MOIRA_HEALTH, 0, 0)
    setUltCost(ADJ_MOIRA_ULT_COST)
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_MOIRA_GRASP_DPS/OW2_MOIRA_GRASP_DPS)

    eventPlayer.hero_initialized = true


rule "[moira/init.opy]: Increase Moira other forms of damage":
    @Event playerDealtDamage
    @Hero moira
    @Condition not eventPlayer.isUsingUltimate()
    @Condition eventAbility in [Button.MELEE, Button.ABILITY_2]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
