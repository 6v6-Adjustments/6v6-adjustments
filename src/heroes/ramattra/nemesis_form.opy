#!mainFile "../../dev_main.opy"


rule "[ramattra/nemesis_form.opy]: Correct Nemesis Form armor and movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    
    eventPlayer.setMoveSpeed(percent(ADJ_RAMATTRA_NEMESIS_MOVESPEED/OW2_RAMATTRA_NEMESIS_MOVESPEED))
    eventPlayer.addHealthPool(Health.ARMOR, 53.75, true, true) # for some reason the addHealthPool function doesn't read constants as usable numbers
    waitUntil(eventPlayer.getMaxHealthOfType(Health.ARMOR) < 54.75, 99999)
    eventPlayer.setMoveSpeed(100)
    removeHealthPool(getLastCreatedHealthPool())


rule "[ramattra/nemesis_form.opy]: Increase Pummel damage":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    @Condition eventDamage > 50 # This condition stops vortex from applying the damage increase
    @Condition eventAbility != Button.MELEE
    
    damage(victim, attacker, eventDamage * (ADJ_RAMATTRA_PUMMEL_DAMAGE/OW2_RAMATTRA_PUMMEL_DAMAGE) - eventDamage)


rule "[ramattra/nemesis_form.opy]: Bonus Annihilation movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.RAMATTRA
    @Condition eventPlayer.isUsingUltimate() == true
    
    wait(0.1)
    eventPlayer.setMoveSpeed(100)
