#!mainFile "../../dev_main.opy"


rule "[symmetra/init.opy]: Symmetra":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SYMMETRA

    newHero(ADJ_SYMMETRA_HEALTH, 0, ADJ_SYMMETRA_SHIELDS)
    removeSelfHealing()

    eventPlayer.call_init = false
