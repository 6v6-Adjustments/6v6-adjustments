#!mainFile "../../dev_main.opy"


rule "[symmetra/init.opy]: Initialize Symmetra":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.SYMMETRA

    setCustomHp(ADJ_SYMMETRA_HEALTH, 0, ADJ_SYMMETRA_SHIELDS)
    setUltCost(ADJ_SYMMETRA_ULT_COST)
    removeSelfHealing()

    eventPlayer.call_init = false
