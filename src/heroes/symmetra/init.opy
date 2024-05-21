#!mainFile "../../dev_main.opy"


rule "[symmetra/init.opy]: Symmetra":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SYMMETRA

    setCustomHp(ADJ_SYMMETRA_HEALTH, 0, ADJ_SYMMETRA_SHIELDS)
    removeSelfHealing()

    eventPlayer.call_init = false
