#!mainFile "../../dev_main.opy"

#!include "heroes/junkerqueen/carnage.opy"
#!include "heroes/junkerqueen/jagged_blade.opy"
#!include "heroes/junkerqueen/rampage.opy"


rule "[junkerqueen/init.opy]: Initialize Junker Queen":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.JUNKER_QUEEN

    setCustomHp(ADJ_JUNKERQUEEN_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_JUNKERQUEEN_HEALTH, 0, 0)
    removeTankPassive()
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE/OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE)
    eventPlayer.setHealingDealt(percent(ADJ_JUNKERQUEEN_ADRENALINE_HEAL_MOD/((ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE/OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE)*OW2_JUNKERQUEEN_ADRENALINE_HEAL_MOD)))
    eventPlayer.setKnockbackDealt(percent(ADJ_JUNKERQUEEN_BLADE_PULL_SCALER))

    eventPlayer.setMaxAmmo(0, ADJ_JUNKERQUEEN_AMMO_COUNT)
    eventPlayer.setAmmo(0, ADJ_JUNKERQUEEN_AMMO_COUNT)

    eventPlayer.overhealth_check = false

    eventPlayer.call_init = false
