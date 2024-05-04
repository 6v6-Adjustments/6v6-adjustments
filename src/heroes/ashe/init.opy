#!mainFile "../../dev_main.opy"


rule "[ashe/init.opy]: Ashe":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.ASHE

    newHero(ADJ_ASHE_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.ult_change_check = 1.21
