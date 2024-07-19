#!mainFile "../../dev_main.opy"

#!include "heroes/doomfist/meteor_strike.opy"
#!include "heroes/doomfist/punch.opy"
#!include "heroes/doomfist/slam.opy"
#!include "heroes/doomfist/powerblock.opy"


rule "[doomfist/init.opy]: Initialize Doomfist":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.DOOMFIST

    setCustomHp(
        ADJ_DOOMFIST_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DOOMFIST_HEALTH, 
        0, 
        0)
    setUltCost(ADJ_DOOMFIST_ULT_COST)
    removeTankPassive()
    removeSelfHealing()

    if not eventPlayer.isDuplicatingAHero():
        setBaseDamage(eventPlayer, ADJ_DOOMFIST_ROCKET_PUNCH_TOTAL_DAMAGE/OW2_DOOMFIST_ROCKET_PUNCH_TOTAL_DAMAGE)

    eventPlayer.call_init = false


rule "[doomfist/init.opy]: Correct Hand Cannon damage":
    @Event playerDealtDamage
    @Hero doomfist
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_DOOMFIST_HAND_CANNON_DAMAGE/OW2_DOOMFIST_HAND_CANNON_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    