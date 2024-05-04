#!mainFile "../../dev_main.opy"


rule "[widowmaker/init.opy]: Widowmaker":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.WIDOWMAKER
    
    newHero(175, 0, 0)
    removeSelfHealing()

    eventPlayer.ult_change_check = 1.19
