#!mainFile "../../dev_main.opy"


rule "[symmetra/init.opy]: Symmetra":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SYMMETRA

    newHero(100, 0, 125)
    removeSelfHealing()

    eventPlayer.call_init = false
