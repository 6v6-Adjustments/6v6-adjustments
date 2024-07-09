#!mainFile "../../dev_main.opy"


rule "[widowmaker/init.opy]: Initialize Widowmaker":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.WIDOWMAKER
    
    setCustomHp(ADJ_WIDOWMAKER_HEALTH, 0, 0)
    setUltCost(ADJ_WIDOWMAKER_ULT_COST)
    removeSelfHealing()

    eventPlayer.call_init = false
