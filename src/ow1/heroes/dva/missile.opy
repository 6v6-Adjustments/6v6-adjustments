#!mainFile "../../../main.opy"


rule "[dva/missile.opy]: Set default missile cooldown":
    @Event eachPlayer
    @Condition isHero(eventPlayer, Hero.DVA)
    @Condition eventPlayer.isUsingAbility2()
    
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, OW1_DVA_MICRO_MISSILES_COOLDOWN_TIME)