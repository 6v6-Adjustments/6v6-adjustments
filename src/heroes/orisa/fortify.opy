#!mainFile "../../dev_main.opy"

playervar fortify_timer_id


rule "[orisa/init.opy]: Correct Fortify overhealth and movement speed":
    @Event eachPlayer
    @Hero orisa
    @Condition eventPlayer.isUsingAbility1()
    
    setCurrentSpeed(eventPlayer, ADJ_ORISA_FORTIFY_MOVESPEED/OW2_ORISA_FORTIFY_MOVESPEED)
    damage(eventPlayer, null, 181.8) # I don't know where this value comes from or how to calculate it, removes overhealth
    eventPlayer.setDamageReceived(percent((1-OW2_ORISA_FORTIFY_DAMAGE_REDUCTION)/(1-ADJ_ORISA_FORTIFY_DAMAGE_REDUCTION)))
    eventPlayer.fortify_timer_id = OW2_ORISA_FORTIFY_DURATION - TICK_DURATION
    chase(eventPlayer.fortify_timer_id, 0, rate=1, ChaseReeval.NONE)

    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)

    setCurrentSpeed(eventPlayer, 1)
    eventPlayer.setAbilityCooldown(Button.ABILITY_1, ADJ_ORISA_FORTIFY_COOLDOWN - (eventPlayer.fortify_timer_id * ADJ_ORISA_FORTIFY_REFUND_SCALAR))
    eventPlayer.fortify_timer_id = null
    eventPlayer.setDamageReceived(100)
