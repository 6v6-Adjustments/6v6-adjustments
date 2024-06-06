#!mainFile "../../dev_main.opy"


rule "[bastion/init.opy]: Bastion":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.BASTION
    
    setCustomHp(ADJ_BASTION_HEALTH, ADJ_BASTION_ARMOR, 0)
    removeSelfHealing()

    eventPlayer.call_init = false


rule "[bastion/init.opy]: Reduce assault form movement speed":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.BASTION
    @Condition eventPlayer.isUsingAbility1()
    
    eventPlayer.setMoveSpeed(percent(ADJ_BASTION_RECONFIGURE_MOVESPEED/OW2_BASTION_RECONFIGURE_MOVESPEED))
    waitUntil(not eventPlayer.isUsingAbility1(), Math.INFINITY)
    eventPlayer.setMoveSpeed(100)