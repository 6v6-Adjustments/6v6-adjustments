#!mainFile "../../dev_main.opy"

#!include "heroes/junkerqueen/carnage.opy"
#!include "heroes/junkerqueen/commanding_shout.opy"
#!include "heroes/junkerqueen/jagged_blade.opy"
#!include "heroes/junkerqueen/rampage.opy"


def initJunkerQueen():
    @Name "[junkerqueen/init.opy]: initJunkerQueen()"

    setCustomHp(
        ADJ_JUNKERQUEEN_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_JUNKERQUEEN_HEALTH,
        ADJ_JUNKERQUEEN_ARMOR_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_JUNKERQUEEN_ARMOR,
        0)
    setUltCost(ADJ_JUNKERQUEEN_ULT_COST)
    removeTankPassive()
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE / OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE)
    eventPlayer.setHealingDealt(percent(ADJ_JUNKERQUEEN_ADRENALINE_HEAL_MOD / ((ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE / OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE) * OW2_JUNKERQUEEN_ADRENALINE_HEAL_MOD)))
    eventPlayer.setKnockbackDealt(percent(ADJ_JUNKERQUEEN_BLADE_PULL_SCALER))
    eventPlayer.startScalingSize(0.96, true)

    eventPlayer.setMaxAmmo(0, ADJ_JUNKERQUEEN_AMMO_COUNT)
    eventPlayer.setAmmo(0, ADJ_JUNKERQUEEN_AMMO_COUNT)

    eventPlayer.overhealth_check = false
    eventPlayer.max_health_scaler = (ADJ_JUNKERQUEEN_SHOUT_OVERHEALTH / OW2_JUNKERQUEEN_SHOUT_OVERHEALTH)

    eventPlayer.hero_initialized = true
