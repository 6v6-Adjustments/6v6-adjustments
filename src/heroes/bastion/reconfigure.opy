#!mainFile "../../dev_main.opy"

playervar sentry_healing


rule "[bastion/reconfigure.opy]: Reduce assault form damage and movement speed":
    @Event eachPlayer
    @Hero bastion
    @Condition eventPlayer.isUsingAbility1()
    
    eventPlayer.setDamageReceived(percent(ADJ_BASTION_IRONCLAD_RESISTANCE/OW2_BASTION_IRONCLAD_RESISTANCE))
    eventPlayer.movement_helper = percent(ADJ_BASTION_RECONFIGURE_MOVESPEED/OW2_BASTION_RECONFIGURE_MOVESPEED)
    eventPlayer.setMoveSpeed(percent(ADJ_BASTION_RECONFIGURE_MOVESPEED/OW2_BASTION_RECONFIGURE_MOVESPEED))
    eventPlayer.startHoT(eventPlayer, OW2_BASTION_ASSAULT_CONFIG_DURATION, ADJ_BASTION_ASSAULT_CONFIG_HPS)
    eventPlayer.sentry_healing = getLastHoT()

    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)

    eventPlayer.setDamageReceived(100)
    eventPlayer.movement_helper = 100
    eventPlayer.setMoveSpeed(100)
    stopHoT(eventPlayer.sentry_healing)


rule "[bastion/reconfigure.opy]: Increase movement allowed by self-damage grenade":
    @Event playerDealtDamage
    @Hero bastion
    @Condition eventPlayer.isUsingAbility1()
    @Condition attacker == victim
    
    eventPlayer.setMoveSpeed(percent(ADJ_BASTION_SELF_KNOCKBACK_SCALER))
    wait(0.1) # Grace period to make sure the player receives this benefit
    waitUntil(eventPlayer.isOnGround(), Math.INFINITY)
    if not RULE_CONDITION:
        return    
    eventPlayer.setMoveSpeed(percent(ADJ_BASTION_RECONFIGURE_MOVESPEED/OW2_BASTION_RECONFIGURE_MOVESPEED))