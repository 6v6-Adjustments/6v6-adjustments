#!mainFile "../../dev_main.opy"


rule "[symmetra/init.opy]: Symmetra":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.SYMMETRA

    newHero(100, 0, 125)
    removeSelfHealing()

    eventPlayer.ult_change_check = 1.17
