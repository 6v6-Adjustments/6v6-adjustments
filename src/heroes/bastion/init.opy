#!mainFile "../../dev_main.opy"


rule "[bastion/init.opy]: Bastion":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.BASTION
    
    newHero(ADJ_BASTION_HEALTH, ADJ_BASTION_ARMOR, 0)
    removeSelfHealing()

    eventPlayer.ult_change_check = 1.21
