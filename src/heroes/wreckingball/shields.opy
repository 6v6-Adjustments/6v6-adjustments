#!mainFile "../../dev_main.opy"

playervar adaptive_overhealth


rule "[wreckingball/shields.opy]: Remove Adaptive Shields overhealth transfer":
    @Event eachPlayer
    @Hero hammond
    @Condition eventPlayer.isUsingAbility2()
    
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.setAbility2Enabled(false)
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    enableAllAbilities()
    eventPlayer.allowButton(Button.ABILITY_2)


rule "[wreckingball/shields.opy]: Increase Adaptive Shield base overhealth gain":
    @Event eachPlayer
    @Hero hammond
    @Condition eventPlayer.isUsingAbility2()

    eventPlayer.addHealthPool(Health.NORMAL, OW2_WRECKING_BALL_SHIELD_PER_TARGET - ADJ_WRECKING_BALL_SHIELD_PER_TARGET, false, true)
    eventPlayer.adaptive_overhealth = getLastCreatedHealthPool()
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    removeHealthPool(eventPlayer.adaptive_overhealth)
    