#!mainFile "../../dev_main.opy"

#!include "heroes/dva/boosters.opy"
#!include "heroes/dva/defense_matrix.opy"
#!include "heroes/dva/hp.opy"


rule "[dva/init.opy]: Initialize D.Va":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DVA

    setUltCost(ADJ_DVA_ULT_COST)

    removeTankPassive()
    removeSelfHealing()

    if not eventPlayer.isDuplicatingAHero():
        setBaseDamage(eventPlayer, ADJ_DVA_MICRO_MISSILES_DAMAGE / OW2_DVA_MICRO_MISSILES_DAMAGE)

    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_DVA_PILOT_HEALTH / OW2_DVA_PILOT_HEALTH)


rule "[dva/init.opy]: Increase Fusion Cannons damage":
    @Event playerDealtDamage
    @Hero dva
    @Condition not eventAbility in [Button.MELEE, Button.ABILITY_1, Button.ABILITY_2, Button.ULTIMATE]

    damage(victim, attacker, ((eventDamage / eventPlayer._base_damage_scalar) * (ADJ_DVA_CANNON_DAMAGE / OW2_DVA_CANNON_DAMAGE) - eventDamage) / eventPlayer._base_damage_scalar)


rule "[dva/init.opy]: Increase D.va other forms of damage":
    @Event playerDealtDamage
    @Hero dva
    @Condition eventAbility in [Button.MELEE, Button.ULTIMATE]

    damage(victim, attacker, (eventDamage / eventPlayer._base_damage_scalar - eventDamage) / eventPlayer._base_damage_scalar)


rule "[dva/init.opy]: Correct DVa Remech ult cost":
    @Event eachPlayer
    @Hero dva
    @Condition eventPlayer.isInAlternateForm()
    @Condition not eventPlayer.call_init

    wait(1)
    setUltCost(ADJ_DVA_REMECH_COST)
    waitUntil(not eventPlayer.isInAlternateForm(), Math.INFINITY)
    setUltCost(ADJ_DVA_ULT_COST)
