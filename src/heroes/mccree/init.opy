#!mainFile "../../dev_main.opy"

#!include "heroes/mccree/roll.opy"
#!include "heroes/mccree/deadeye.opy"


rule "[mccree/init.opy]: Cassidy":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.MCCREE
    
    setCustomHp(ADJ_MCCREE_HEALTH, 0, 0)
    removeSelfHealing()

    eventPlayer.call_init = false
