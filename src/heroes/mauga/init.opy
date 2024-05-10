#!mainFile "../../dev_main.opy"


rule "[mauga/init.opy]: Mauga":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MAUGA

    newHero(ADJ_MAUGA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_MAUGA_HEALTH, ADJ_MAUGA_ARMOR, 0)
    removeTankPassive()
    removeRegenPassive()

    eventPlayer.setDamageDealt(87.5)
    eventPlayer.setHealingDealt(72)
    eventPlayer.startScalingSize(0.94, true)
    eventPlayer.setJumpVerticalSpeed(101)

    eventPlayer.overhealth_check = false
    eventPlayer.balance_change_check = false

    eventPlayer.call_init = false


rule "[mauga/init.opy]: Increase Mauga melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventAbility == Button.MELEE
    
    damage(victim, attacker, eventDamage * 1.14 - eventDamage)


rule "[mauga/init.opy]: Remove Cardiac Overdrive allied damage reduction and set cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventPlayer.isUsingAbility2() == true
    
    startDamageModification(getPlayersInRadius(eventPlayer, 10.5, eventPlayer.getTeam(), LosCheck.SURFACES).exclude(eventPlayer), getAllPlayers(), 142.8, DamageReeval.RECEIVERS_AND_DAMAGERS)
    eventPlayer.balance_change_check = getLastDamageModification()
    waitUntil(not eventPlayer.isUsingAbility2(), 99999)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 16)
    stopDamageModification(eventPlayer.balance_change_check)


rule "[mauga/init.opy]: Reduce Cage Fight duration":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventPlayer.isUsingUltimate() == true
    
    wait(7)
    eventPlayer.forceButtonPress(Button.ULTIMATE)