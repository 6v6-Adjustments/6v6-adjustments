#!mainFile "../../dev_main.opy"

playervar baptiste_balance_change_check

#!include "utilities/macro_functions.opy"
#!include "passives/support/self_heal.opy"
#!include "utilities/custom_hp.opy"
#!include "passives/tank/ult_charge.opy"
#!include "utilities/hero_init.opy"
#!include "heroes/baptiste/regen_burst.opy"


def initBaptiste():
    @Name "[baptiste/init.opy]: initBaptiste()"
    
    setCustomHp(ADJ_BAPTISTE_HEALTH, 0, 0)
    setUltCost(ADJ_BAPTISTE_ULT_COST)

    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
    setBaseDamage(eventPlayer, ADJ_BAPTISTE_PRIMARY_DAMAGE/OW2_BAPTISTE_PRIMARY_DAMAGE)
    setBaseHealing(eventPlayer, ADJ_BAPTISTE_BIOTIC_LAUNCHER_HEALING_SPLASH/OW2_BAPTISTE_BIOTIC_LAUNCHER_HEALING_SPLASH)

    eventPlayer.baptiste_balance_change_check = true
    eventPlayer.max_health_scaler = (ADJ_BAPTISTE_LAMP_HP/OW2_BAPTISTE_LAMP_HP)

    eventPlayer.hero_initialized = true


rule "[baptiste/init.opy]: Increase Baptiste melee damage":
    @Event playerDealtDamage
    @Hero baptiste
    @Condition eventAbility in [Button.MELEE]
    
    damage(victim, attacker, ((eventDamage/eventPlayer._base_damage_scalar) - eventDamage)/eventPlayer._base_damage_scalar)


rule "[baptiste/init.opy]: Increase Biotic Launcher healing":
    @Event playerDealtHealing
    @Hero baptiste
    @Condition eventAbility == Button.SECONDARY_FIRE
    @Condition eventHealing < ADJ_BAPTISTE_BIOTIC_LAUNCHER_HEALING_SPLASH
    @Condition eventPlayer.baptiste_balance_change_check

    eventPlayer.baptiste_balance_change_check = false
    heal(healee, healer, eventHealing/eventPlayer._base_healing_scalar * (ADJ_BAPTISTE_BIOTIC_LAUNCHER_HEALING_DIRECT/OW2_BAPTISTE_BIOTIC_LAUNCHER_HEALING_DIRECT) - eventHealing)
    wait(0.15)
    eventPlayer.baptiste_balance_change_check = true
