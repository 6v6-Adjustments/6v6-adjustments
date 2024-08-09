#!mainFile "../../dev_main.opy"

#!include "heroes/dva/boosters.opy"
#!include "heroes/dva/defense_matrix.opy"
#!include "heroes/dva/hp.opy"

playervar self_destruct_charge


rule "[dva/init.opy]: Initialize D.Va":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DVA

    # if eventPlayer.isDuplicatingAHero() and not eventPlayer.isInAlternateForm():
    #     setCustomHp(
    #     ADJ_DVA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_HEALTH,
    #     ADJ_DVA_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DVA_ARMOR,
    #     0)

    setUltCost(ADJ_DVA_ULT_COST)

    removeTankPassive()
    removeSelfHealing()

    # if not eventPlayer.isDuplicatingAHero():
    #     setBaseDamage(eventPlayer, ADJ_DVA_MICRO_MISSILES_DAMAGE / OW2_DVA_MICRO_MISSILES_DAMAGE)

    eventPlayer.call_init = false
    eventPlayer.self_destruct_charge = 0
    # eventPlayer.max_health_scaler = (ADJ_DVA_PILOT_HEALTH / OW2_DVA_PILOT_HEALTH)


# rule "[dva/init.opy]: Increase Fusion Cannons damage":
#     @Event playerDealtDamage
#     @Hero dva
#     @Condition not eventAbility in [Button.MELEE, Button.ABILITY_1, Button.ABILITY_2, Button.ULTIMATE]

#     damage(victim, attacker, ((eventDamage / eventPlayer._base_damage_scalar) * (ADJ_DVA_CANNON_DAMAGE / OW2_DVA_CANNON_DAMAGE) - eventDamage) / eventPlayer._base_damage_scalar)


# rule "[dva/init.opy]: Increase D.va other forms of damage":
#     @Event playerDealtDamage
#     @Hero dva
#     @Condition eventAbility in [Button.MELEE, Button.ULTIMATE]

#     damage(victim, attacker, (eventDamage / eventPlayer._base_damage_scalar - eventDamage) / eventPlayer._base_damage_scalar)


rule "[dva/init.opy]: Force reset ult charge when DVa exits Mech":
    @Event eachPlayer
    @Hero dva
    @Condition eventPlayer.isInAlternateForm()

    if eventPlayer.isUsingUltimate(): return
    eventPlayer.setUltCharge(0)
