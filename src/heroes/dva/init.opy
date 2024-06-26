#!mainFile "../../dev_main.opy"

#!include "heroes/dva/hp.opy"


rule "[dva/init.opy]: Initialize D.Va":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DVA

    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_DVA_CANNON_DAMAGE/OW2_DVA_CANNON_DAMAGE)

    waitUntil(eventPlayer.getUltCharge() > 0, Math.INFINITY)
    eventPlayer.setUltCharge(0)

    eventPlayer.call_init = false


rule "[dva/init.opy]: Reduce Boosters damage":
    @Event playerDealtDamage
    @Hero dva
    @Condition eventAbility == Button.ABILITY_1

    heal(victim, null, eventDamage - ((ADJ_DVA_BOOSTER_DAMAGE/OW2_DVA_BOOSTER_DAMAGE) * eventDamage/eventPlayer._base_damage_scalar))


rule "[dva/init.opy]: Reduce Fusion Cannons movement speed":
    @Event eachPlayer
    @Hero dva
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE)
    @Condition not eventPlayer.isUsingAbility1()
    
    eventPlayer.setMoveSpeed(percent(ADJ_DVA_CANNON_MOVESPEED/OW2_DVA_CANNON_MOVESPEED))
    waitUntil(not eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) or eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
    if eventPlayer.isFiringPrimaryFire():
        goto RULE_START
        

rule "[dva/init.opy]: Increase D.va other forms of damage":
    @Event playerDealtDamage
    @Hero dva
    @Condition eventAbility in [Button.MELEE, Button.ABILITY_2, Button.ULTIMATE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[dva/init.opy]: Increase Defense Matrix cooldown":
    @Event eachPlayer
    @Hero dva
    @Condition eventPlayer.isFiringSecondaryFire()
    
    # Defense Matrix still goes on cooldown visually even when the ability is disabled, so a faux cooldown was not implemented
    waitUntil(eventPlayer.isFiringSecondaryFire() == false, Math.INFINITY)
    eventPlayer.setSecondaryFireEnabled(false)
    wait(ADJ_DVA_MATRIX_COOLDOWN)
    eventPlayer.setSecondaryFireEnabled(true)
