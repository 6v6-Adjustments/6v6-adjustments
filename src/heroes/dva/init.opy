#!mainFile "../../dev_main.opy"

#!include "heroes/dva/hp.opy"


rule "[dva/init.opy]: Initialize D.Va":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DVA

    removeTankPassive()
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_DVA_CANNON_DAMAGE/OW2_DVA_CANNON_DAMAGE)

    eventPlayer.call_init = false


rule "[dva/init.opy]: Reduce Boosters damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventAbility == Button.ABILITY_1

    heal(victim, null, eventDamage - ((ADJ_DVA_BOOSTER_DAMAGE/OW2_DVA_BOOSTER_DAMAGE) * eventDamage/eventPlayer._base_damage_scalar))


rule "[dva/init.opy]: Increase D.va other forms of damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventAbility in [Button.MELEE, Button.ABILITY_2]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[dva/init.opy]: Increase Defense Matrix cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.DVA
    @Condition eventPlayer.isFiringSecondaryFire()
    
    # Defense Matrix still goes on cooldown visually even when the ability is disabled, so a faux cooldown was not implemented
    waitUntil(eventPlayer.isFiringSecondaryFire() == false, Math.INFINITY)
    eventPlayer.setSecondaryFireEnabled(false)
    wait(ADJ_DVA_MATRIX_COOLDOWN)
    eventPlayer.setSecondaryFireEnabled(true)