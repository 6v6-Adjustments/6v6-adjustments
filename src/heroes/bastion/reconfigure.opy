#!mainFile "../../dev_main.opy"


rule "[bastion/reconfigure.opy]: Reduce assault form damage and movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.BASTION
    @Condition eventPlayer.isUsingAbility1()
    
    eventPlayer.setMoveSpeed(percent(ADJ_BASTION_RECONFIGURE_MOVESPEED/OW2_BASTION_RECONFIGURE_MOVESPEED))
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)


rule "[bastion/reconfigure.opy]: Increase movement allowed by self-damage grenade":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.BASTION
    @Condition eventPlayer.isUsingAbility1()
    @Condition attacker == victim
    
    eventPlayer.setMoveSpeed(percent(ADJ_BASTION_SELF_KNOCKBACK_SCALER))
    wait(0.1) # Grace period to make sure the player receives this benefit
    waitUntil(eventPlayer.isOnGround(), Math.INFINITY)
    if not RULE_CONDITION:
        return    
    eventPlayer.setMoveSpeed(percent(ADJ_BASTION_RECONFIGURE_MOVESPEED/OW2_BASTION_RECONFIGURE_MOVESPEED))