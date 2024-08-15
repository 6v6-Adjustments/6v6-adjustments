#!mainFile "../../dev_main.opy"

#!include "heroes/doomfist/meteor_strike.opy"
#!include "heroes/doomfist/punch.opy"
#!include "heroes/doomfist/slam.opy"
#!include "heroes/doomfist/powerblock.opy"


def initDoomfist():
    @Name "[doomfist/init.opy]: initDoomfist()"

    setCustomHp(
        ADJ_DOOMFIST_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_DOOMFIST_HEALTH, 
        0, 
        0)
    setUltCost(ADJ_DOOMFIST_ULT_COST)
    removeTankPassive()

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
        setBaseDamage(eventPlayer, ADJ_DOOMFIST_SEISMIC_SLAM_DAMAGE/OW2_DOOMFIST_SEISMIC_SLAM_DAMAGE)

    eventPlayer.max_health_scaler = (ADJ_DOOMFIST_BEST_DEFENSE / OW2_DOOMFIST_BEST_DEFENSE)

    eventPlayer.hero_initialized = true


rule "[doomfist/init.opy]: Correct Hand Cannon damage":
    @Event playerDealtDamage
    @Hero doomfist
    @Condition eventAbility == Button.PRIMARY_FIRE

    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) * (ADJ_DOOMFIST_HAND_CANNON_DAMAGE/OW2_DOOMFIST_HAND_CANNON_DAMAGE) - eventDamage)/eventPlayer._base_damage_scalar)
    