#!mainFile "../../dev_main.opy"


rule "[orisa/init.opy]: Correct Fortify overhealth and movement speed":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingAbility1()
    
    eventPlayer.movement_helper = percent(ADJ_ORISA_FORTIFY_MOVESPEED/OW2_ORISA_FORTIFY_MOVESPEED)
    eventPlayer.setMoveSpeed(percent(ADJ_ORISA_FORTIFY_MOVESPEED/OW2_ORISA_FORTIFY_MOVESPEED))
    damage(eventPlayer, null, 181.8) # I don't know where this value comes from or how to calculate it
    eventPlayer.setDamageReceived(percent((1-OW2_ORISA_FORTIFY_DAMAGE_REDUCTION)/(1-ADJ_ORISA_FORTIFY_DAMAGE_REDUCTION)))
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.movement_helper = 100
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_ORISA_FORTIFY_COOLDOWN)
    eventPlayer.setDamageReceived(100)
