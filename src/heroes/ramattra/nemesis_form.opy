#!mainFile "../../dev_main.opy"


rule "[ramattra/nemesis_form.opy]: Correct Nemesis Form armor and movement speed":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    
    eventPlayer.stopScalingSize()
    eventPlayer.setDamageDealt(percent(ADJ_RAMATTRA_PUMMEL_DAMAGE/OW2_RAMATTRA_PUMMEL_DAMAGE))
    eventPlayer.setMoveSpeed(percent(ADJ_RAMATTRA_NEMESIS_MOVESPEED/OW2_RAMATTRA_NEMESIS_MOVESPEED))
    eventPlayer.addHealthPool(Health.ARMOR, 35, true, true) # for some reason the addHealthPool function doesn't read constants as usable numbers
    waitUntil(eventPlayer.getMaxHealthOfType(Health.ARMOR) < 36, Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.startScalingSize(0.94, true)
    removeHealthPool(getLastCreatedHealthPool())
    eventPlayer.setDamageDealt(percent(ADJ_RAMATTRA_ACCELERATOR_DAMAGE/OW2_RAMATTRA_ACCELERATOR_DAMAGE))


# rule "[ramattra/nemesis_form.opy]: Increase Pummel damage":
#     @Event playerDealtDamage
#     @Hero ramattra
#     @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
#     @Condition eventDamage > 50 # This condition stops vortex from applying the damage increase
#     @Condition eventAbility != Button.MELEE
    
#     damage(victim, attacker, eventDamage * (ADJ_RAMATTRA_PUMMEL_DAMAGE/OW2_RAMATTRA_PUMMEL_DAMAGE) - eventDamage)


rule "[ramattra/nemesis_form.opy]: Bonus Annihilation movement speed":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.isUsingUltimate() == true
    
    wait(0.064)
    eventPlayer.setMoveSpeed(percent(ADJ_RAMATTRA_ANNIHILATION_MOVESPEED/OW2_RAMATTRA_NEMESIS_MOVESPEED))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
