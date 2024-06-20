#!mainFile "../../dev_main.opy"


rule "[symmetra/init.opy]: Symmetra":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Hero symmetra

    setCustomHp(ADJ_SYMMETRA_HEALTH, 0, ADJ_SYMMETRA_SHIELDS)
    removeSelfHealing()

    eventPlayer.call_init = false
