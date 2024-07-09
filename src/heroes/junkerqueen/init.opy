#!mainFile "../../dev_main.opy"

#!include "heroes/junkerqueen/carnage.opy"
#!include "heroes/junkerqueen/jagged_blade.opy"
#!include "heroes/junkerqueen/rampage.opy"

# playervar within_shout_radius = false


rule "[junkerqueen/init.opy]: Initialize Junker Queen":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.JUNKER_QUEEN

    setCustomHp(
        ADJ_JUNKERQUEEN_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_JUNKERQUEEN_HEALTH,
        0,
        0)
    setUltCost(ADJ_JUNKERQUEEN_ULT_COST)
    removeTankPassive()
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE/OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE)
    eventPlayer.setHealingDealt(percent(ADJ_JUNKERQUEEN_ADRENALINE_HEAL_MOD/((ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE/OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE)*OW2_JUNKERQUEEN_ADRENALINE_HEAL_MOD)))
    eventPlayer.setKnockbackDealt(percent(ADJ_JUNKERQUEEN_BLADE_PULL_SCALER))
    eventPlayer.startScalingSize(0.96, true)

    eventPlayer.setMaxAmmo(0, ADJ_JUNKERQUEEN_AMMO_COUNT)
    eventPlayer.setAmmo(0, ADJ_JUNKERQUEEN_AMMO_COUNT)

    eventPlayer.overhealth_check = false

    eventPlayer.call_init = false


# rule "[junkerqueen/init.opy]: Prepare Commanding Shout overhealth reduction":
#     @Event eachPlayer
#     @Hero junkerQueen
#     @Condition eventPlayer.isUsingAbility1()

#     getPlayersInRadius(eventPlayer, 15.5, eventPlayer.getTeam(), LosCheck.SURFACES).exclude(eventPlayer).within_shout_radius = true


# rule "[junkerqueen/init.opy]: Reduce Commanding Shout overhealth for allies":
#     @Event eachPlayer
#     @Condition eventPlayer.within_shout_radius == true

#     damage(eventPlayer, null, 50 )
#     eventPlayer.within_shout_radius = false
