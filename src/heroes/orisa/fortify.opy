#!mainFile "../../dev_main.opy"


rule "[orisa/init.opy]: Correct Fortify overhealth and movement speed":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingAbility1()
    
    eventPlayer.setMoveSpeed(percent(ADJ_ORISA_FORTIFY_MOVESPEED/OW2_ORISA_FORTIFY_MOVESPEED))
    damage(eventPlayer, null, 181.8) # I don't know where this value comes from or how to calculate it
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_ORISA_FORTIFY_COOLDOWN)
    