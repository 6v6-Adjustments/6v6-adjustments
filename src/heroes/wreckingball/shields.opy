#!mainFile "../../dev_main.opy"


rule "[wreckingball/shields.opy]: Remove Adaptive Shields overhealth transfer":
    @Event eachPlayer
    @Hero hammond
    @Condition eventPlayer.isUsingAbility2()
    
    eventPlayer.disallowButton(Button.ABILITY_2)
    eventPlayer.setAbility2Enabled(false)
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    enableAllAbilities()
    eventPlayer.allowButton(Button.ABILITY_2)
