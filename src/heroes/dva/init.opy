#!mainFile "../../dev_main.opy"

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


rule "[dva/init.opy]: Reduce Boosters damage":
    @Event playerDealtDamage
    @Hero dva
    @Condition eventAbility == Button.ABILITY_1

    heal(victim, null, eventDamage - ((ADJ_DVA_BOOSTER_DAMAGE / OW2_DVA_BOOSTER_DAMAGE) * eventDamage/eventPlayer._base_damage_scalar))


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


rule "[dva/init.opy]: Increase Defense Matrix cooldown":
    @Event eachPlayer
    @Hero dva
    @Condition eventPlayer.isFiringSecondaryFire()
    
    # Defense Matrix still goes on cooldown visually even when the ability is disabled, so a faux cooldown was not implemented
    waitUntil(eventPlayer.isFiringSecondaryFire() == false, Math.INFINITY)
    eventPlayer.setSecondaryFireEnabled(false)
    wait(ADJ_DVA_MATRIX_COOLDOWN)
    eventPlayer.setSecondaryFireEnabled(true)
