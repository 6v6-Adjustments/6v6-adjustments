#!mainFile "../../dev_main.opy"


rule "[junkerqueen/init.opy]: Junker Queen":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.JUNKER_QUEEN

    setCustomHp(ADJ_JUNKERQUEEN_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_JUNKERQUEEN_HEALTH, 0, 0)
    removeTankPassive()
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_JUNKERQUEEN_SCATTER_GUN_DAMAGE/OW2_JUNKERQUEEN_SCATTER_GUN_DAMAGE)
    eventPlayer.setHealingDealt(74.29)

    eventPlayer.setMaxAmmo(0, 6)
    eventPlayer.setAmmo(0, 6)

    eventPlayer.overhealth_check = false

    eventPlayer.call_init = false


rule "[junkerqueen/init.opy]: Reduce Rampage Damage":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.JUNKER_QUEEN
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setDamageDealt(66.777)
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
