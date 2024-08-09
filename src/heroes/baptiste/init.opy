#!mainFile "../../dev_main.opy"

#!include "heroes/baptiste/regen_burst.opy"


rule "[baptiste/init.opy]: Initialize Baptiste":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.BAPTISTE
    
    setCustomHp(ADJ_BAPTISTE_HEALTH, 0, 0)
    setUltCost(ADJ_BAPTISTE_ULT_COST)
    removeSelfHealing()

    # setBaseDamage(eventPlayer, ADJ_BAPTISTE_PRIMARY_DAMAGE/OW2_BAPTISTE_PRIMARY_DAMAGE)
    setBaseHealing(eventPlayer, ADJ_BAPTISTE_BIOTIC_LAUNCHER_HEALING_SPLASH/OW2_BAPTISTE_BIOTIC_LAUNCHER_HEALING_SPLASH)

    eventPlayer.balance_change_check = true
    eventPlayer.call_init = false
    eventPlayer.max_health_scaler = (ADJ_BAPTISTE_LAMP_HP/OW2_BAPTISTE_LAMP_HP)


# rule "[baptiste/init.opy]: Increase Baptiste melee damage":
#     @Event playerDealtDamage
#     @Hero baptiste
#     @Condition eventAbility in [Button.MELEE]
    
#     damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[baptiste/init.opy]: Increase Biotic Launcher healing":
    @Event playerDealtHealing
    @Hero baptiste
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition eventHealing < ADJ_BAPTISTE_BIOTIC_LAUNCHER_HEALING_SPLASH
    @Condition eventPlayer.balance_change_check

    eventPlayer.balance_change_check = false
    heal(healee, healer, eventHealing/eventPlayer._base_healing_scalar * (ADJ_BAPTISTE_BIOTIC_LAUNCHER_HEALING_DIRECT/OW2_BAPTISTE_BIOTIC_LAUNCHER_HEALING_DIRECT) - eventHealing)
    wait(0.15)
    eventPlayer.balance_change_check = true
