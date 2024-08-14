#!mainFile "../../dev_main.opy"


rule "[ramattra/nemesis_form.opy]: Correct Nemesis Form armor and movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    
    eventPlayer.stopScalingSize()
    eventPlayer.setDamageDealt(percent(ADJ_RAMATTRA_PUMMEL_DAMAGE/OW2_RAMATTRA_PUMMEL_DAMAGE))
    eventPlayer.setMoveSpeed(percent(ADJ_RAMATTRA_NEMESIS_MOVESPEED/OW2_RAMATTRA_NEMESIS_MOVESPEED))
    eventPlayer.addHealthPool(Health.ARMOR, 10, true, true) # for some reason the addHealthPool function doesn't read constants as usable numbers
    waitUntil(eventPlayer.getMaxHealthOfType(Health.ARMOR) < 11, Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.startScalingSize(0.94, true)
    removeHealthPool(getLastCreatedHealthPool())
    eventPlayer.setDamageDealt(percent(ADJ_RAMATTRA_ACCELERATOR_DAMAGE/OW2_RAMATTRA_ACCELERATOR_DAMAGE))


rule "[ramattra/nemesis_form.opy]: Increase other forms of damage (in nemesis)":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    @Condition eventDamage < ADJ_RAMATTRA_PUMMEL_DAMAGE # This condition stops pummel from applying the damage increase

    damage(victim, null, ((eventDamage/(ADJ_RAMATTRA_PUMMEL_DAMAGE/OW2_RAMATTRA_PUMMEL_DAMAGE)) - eventDamage)/(ADJ_RAMATTRA_PUMMEL_DAMAGE / OW2_RAMATTRA_PUMMEL_DAMAGE))
    # null tracker to prevent recursive logic, vortex/annihilation can't be tracked but also apply very small damage instances


rule "[ramattra/nemesis_form.opy]: Bonus Annihilation movement speed":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.isUsingUltimate() == true
    
    wait(0.064)
    eventPlayer.setMoveSpeed(percent(ADJ_RAMATTRA_ANNIHILATION_MOVESPEED / OW2_RAMATTRA_NEMESIS_MOVESPEED))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
