#!mainFile "../../dev_main.opy"

# rule "[mauga/cardiac.opy]: Reduce Cardiac Overdrive damage reduction":
#     @Event eachPlayer
#     @Hero mauga
#     @Condition eventPlayer.isUsingAbility2()

#     eventPlayer.setDamageReceived(percent((1-ADJ_MAUGA_CARDIAC_DAMAGE_REDUCTION)/(1-OW2_MAUGA_CARDIAC_DAMAGE_REDUCTION)))
#     waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
#     eventPlayer.setDamageReceived(100)


rule "[mauga/cardiac.opy]: Remove Cardiac Overdrive allied damage reduction":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MAUGA
    @Condition eventPlayer.isUsingAbility2()
    
    #damage(eventPlayer, null, MIN_DAMAGE)
    pushSelfHealing(Button.ABILITY_2)
    startDamageModification(
        getPlayersInRadius(
            eventPlayer, 
            OW2_MAUGA_CARDIAC_RADIUS, 
            eventPlayer.getTeam(), 
            LosCheck.SURFACES).exclude(eventPlayer), 
        getAllPlayers(), 
        percent(1/(1-OW2_MAUGA_CARDIAC_ALLIED_DAMAGE_REDUCTION)), 
        DamageReeval.RECEIVERS_AND_DAMAGERS)
    eventPlayer.balance_change_check = getLastDamageModification()
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    stopDamageModification(eventPlayer.balance_change_check)
    popSelfHealing(Button.ABILITY_2)
