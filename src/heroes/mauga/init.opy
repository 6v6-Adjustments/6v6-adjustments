#!mainFile "../../dev_main.opy"


rule "[mauga/init.opy]: Mauga":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MAUGA

    setCustomHp(ADJ_MAUGA_HEALTH_DUPLICATE if eventPlayer.isDuplicatingAHero() or SETTING_ECHO_TANK_HP else ADJ_MAUGA_HEALTH, ADJ_MAUGA_ARMOR, 0)
    removeTankPassive()
    removeRegenPassive()

    setBaseDamage(eventPlayer, ADJ_MAUGA_CHAINGUN_DAMAGE/OW2_MAUGA_CHAINGUN_DAMAGE)
    eventPlayer.setHealingDealt(72)
    eventPlayer.startScalingSize(0.94, true)

    eventPlayer.balance_change_check = false

    eventPlayer.call_init = false


rule "[mauga/init.opy]: Increase Mauga melee damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventAbility == Button.MELEE

    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


rule "[mauga/init.opy]: Remove Cardiac Overdrive allied damage reduction and set cooldown":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventPlayer.isUsingAbility2()
    
    startDamageModification(
        getPlayersInRadius(
            eventPlayer, 
            OW2_MAUGA_CARDIAC_RADIUS, 
            eventPlayer.getTeam(), 
            LosCheck.SURFACES).exclude(eventPlayer), 
        getAllPlayers(), 
        percent(1/(1-OW2_MAUGA_CARDIAC_DAMAGE_REDUCTION)), 
        DamageReeval.RECEIVERS_AND_DAMAGERS)
    eventPlayer.balance_change_check = getLastDamageModification()
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    stopDamageModification(eventPlayer.balance_change_check)


rule "[mauga/init.opy]: Reduce Cage Fight duration":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventPlayer.isUsingUltimate()

    wait(7)
    eventPlayer.forceButtonPress(Button.ULTIMATE)
