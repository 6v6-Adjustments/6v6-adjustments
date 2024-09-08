#!mainFile "../../dev_main.opy"

#!include "heroes/winston/primal.opy"


def initWinston():
    @Name "[winston/init.opy]: initWinston()"

    setCustomHp(
        ADJ_WINSTON_HEALTH_DUPLICATE - ADJ_WINSTON_PRIMAL_HP_DELTA if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_WINSTON_HEALTH - ADJ_WINSTON_PRIMAL_HP_DELTA,
        ADJ_WINSTON_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_WINSTON_ARMOR,
        0)
    eventPlayer.addHealthPool(
        Health.NORMAL, 
        ADJ_WINSTON_PRIMAL_HP_DELTA, 
        true, 
        true)
    eventPlayer._primal_hp_id = getLastCreatedHealthPool()
    setUltCost(ADJ_WINSTON_ULT_COST)
    removeTankPassive()
    removeSelfHealing()
    setBaseDamage(eventPlayer, ADJ_WINSTON_TESLA_DAMAGE/OW2_WINSTON_TESLA_DAMAGE)


    eventPlayer.max_health_scaler = (ADJ_WINSTON_BARRIER_HEALTH/OW2_WINSTON_BARRIER_HEALTH)
    eventPlayer.hero_initialized = true


rule "[winston/init.opy]: Correct Jump Pack, Melee, Primal Rage damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.WINSTON
    @Condition not eventPlayer.isUsingUltimate()
    @Condition eventAbility in [Button.ABILITY_1, Button.MELEE, Button.SECONDARY_FIRE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
