#!mainFile "../../dev_main.opy"

#!include "heroes/winston/primal.opy"


rule "[winston/init.opy]: Initialize Winston":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.WINSTON

    setCustomHp(
        ADJ_WINSTON_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_WINSTON_HEALTH - (OW2_WINSTON_PRIMAL_HEALTH_BONUS*(ADJ_WINSTON_BARRIER_HEALTH/OW2_WINSTON_BARRIER_HEALTH) - ADJ_WINSTON_PRIMAL_HEALTH_BONUS),
        ADJ_WINSTON_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_WINSTON_ARMOR,
        0)
    eventPlayer.addHealthPool(
        Health.NORMAL, 
        (OW2_WINSTON_PRIMAL_HEALTH_BONUS*(ADJ_WINSTON_BARRIER_HEALTH/OW2_WINSTON_BARRIER_HEALTH) - ADJ_WINSTON_PRIMAL_HEALTH_BONUS), 
        true, 
        true)
    eventPlayer._primal_hp_id = getLastCreatedHealthPool()
    setUltCost(ADJ_WINSTON_ULT_COST)
    removeTankPassive()
    removeSelfHealing()
    setBaseDamage(eventPlayer, ADJ_WINSTON_TESLA_DAMAGE/OW2_WINSTON_TESLA_DAMAGE)


    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_WINSTON_BARRIER_HEALTH/OW2_WINSTON_BARRIER_HEALTH)


rule "[winston/init.opy]: Correct Jump Pack, Melee, Primal Rage damage":
    @Event playerDealtDamage
    @Hero winston
    @Condition eventAbility in [Button.ABILITY_1, Button.MELEE, Button.SECONDARY_FIRE]

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)
