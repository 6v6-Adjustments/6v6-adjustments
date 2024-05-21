#!mainFile "../../dev_main.opy"


rule "[bastion/init.opy]: Bastion":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.BASTION
    
    setCustomHp(ADJ_BASTION_HEALTH, ADJ_BASTION_ARMOR, 0)
    removeSelfHealing()

    eventPlayer.call_init = false
