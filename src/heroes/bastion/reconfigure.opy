#!mainFile "../../dev_main.opy"


rule "[bastion/reconfigure.opy]: Reduce assault form damage and movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.BASTION
    @Condition eventPlayer.isUsingAbility1()
    
    eventPlayer.setDamageDealt(percent(ADJ_BASTION_ASSAULT_CONFIG_DPS/OW2_BASTION_ASSAULT_CONFIG_DPS))
    eventPlayer.setMoveSpeed(percent(ADJ_BASTION_RECONFIGURE_MOVESPEED/OW2_BASTION_RECONFIGURE_MOVESPEED))
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setMoveSpeed(100)


rule "[bastion/reconfigure.opy]: Correct grenade damage while in assault form":
    @Event playerDealtDamage
    @Condition eventPlayer.hero_setup == Hero.BASTION
    @Condition eventPlayer.isUsingAbility1()
    @Condition eventAbility == Button.SECONDARY_FIRE
    
    # This damage formula is incorrect, I am bad at math.
    damage(victim, attacker, (eventDamage/eventPlayer._base_damage_scalar - eventDamage)/eventPlayer._base_damage_scalar)


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