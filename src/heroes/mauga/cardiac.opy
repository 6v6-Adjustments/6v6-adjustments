#!mainFile "../../dev_main.opy"


rule "[mauga/init.opy]: Remove Cardiac Overdrive allied damage reduction":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventPlayer.isUsingAbility2()
    
    damage(eventPlayer, null, MIN_DAMAGE)
    pushSelfHealing(Button.ABILITY_2)
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
    popSelfHealing(Button.ABILITY_2)
