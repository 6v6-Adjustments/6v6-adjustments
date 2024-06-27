#!mainFile "../../dev_main.opy"

playervar ram_block
playervar block_meter


rule "[ramattra/nemesis_form.opy]: Initialize Nemesis Form":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    
    eventPlayer.ram_block = 100
    progressBarHud(eventPlayer if eventPlayer.ram_block < 100 else null, eventPlayer.ram_block, "Block", HudPosition.TOP, 2, Color.VIOLET, Color.VIOLET, ProgressHudReeval.VISIBILITY_VALUES_AND_COLOR, SpecVisibility.DEFAULT)
    eventPlayer.block_meter = getLastCreatedText()
    eventPlayer.setMoveSpeed(percent(ADJ_RAMATTRA_NEMESIS_MOVESPEED/OW2_RAMATTRA_NEMESIS_MOVESPEED))
    eventPlayer.addHealthPool(Health.ARMOR, 53.75, true, true) # for some reason the addHealthPool function doesn't read constants as usable numbers
    waitUntil(eventPlayer.getMaxHealthOfType(Health.ARMOR) < 54.75, Math.INFINITY)
    eventPlayer.setMoveSpeed(100)
    eventPlayer.setSecondaryFireEnabled(true)
    removeHealthPool(getLastCreatedHealthPool())
    destroyProgressBarHud(getLastCreatedText())


rule "[ramattra/nemesis_form.opy]: Increase Pummel damage":
    @Event playerDealtDamage
    @Hero ramattra
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    @Condition eventDamage > 50 # This condition stops vortex from applying the damage increase
    @Condition eventAbility != Button.MELEE
    
    damage(victim, attacker, eventDamage * (ADJ_RAMATTRA_PUMMEL_DAMAGE/OW2_RAMATTRA_PUMMEL_DAMAGE) - eventDamage)


rule "[ramattra/nemesis_form.opy]: Refresh Annihilation":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.isUsingUltimate() == true
    
    wait(0.064)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.ram_block = 100
    eventPlayer.setMoveSpeed(percent(ADJ_RAMATTRA_ANNIHILATION_MOVESPEED/OW2_RAMATTRA_NEMESIS_MOVESPEED))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)


rule "[ramattra/nemesis_form.opy]: Block resource logic":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.getMaxHealthOfType(Health.ARMOR) == true
    @Condition eventPlayer.isFiringSecondaryFire() == true
    
    chase(eventPlayer.ram_block, 0, rate=(100/ADJ_RAMATTRA_BLOCK_MAXIMUM_DURATION), ChaseReeval.DESTINATION_AND_RATE)
    waitUntil(not eventPlayer.isFiringSecondaryFire() or eventPlayer.getMaxHealthOfType(Health.ARMOR) < 54.75, Math.INFINITY)
    chase(eventPlayer.ram_block, 100, rate=(100/ADJ_RAMATTRA_BLOCK_RECHARGE_DURATION), ChaseReeval.DESTINATION_AND_RATE)
    waitUntil(eventPlayer.isFiringSecondaryFire(), Math.INFINITY)
    stopChasingVariable(eventPlayer.ram_block)
    wait()
    goto RULE_START


rule "[ramattra/nemesis_form.opy]: Disallow Block when meter is empty":
    @Event eachPlayer
    @Hero ramattra
    @Condition eventPlayer.ram_block == 0
    
    eventPlayer.setSecondaryFireEnabled(false)
    waitUntil(eventPlayer.getMaxHealthOfType(Health.ARMOR) < 54.75, ADJ_RAMATTRA_BLOCK_DISABLE_DURATION)
    wait(0.1)
    eventPlayer.setSecondaryFireEnabled(true)
