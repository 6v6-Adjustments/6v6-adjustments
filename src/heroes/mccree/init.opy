#!mainFile "../../dev_main.opy"

#!include "heroes/mccree/roll.opy"
#!include "heroes/mccree/deadeye.opy"


rule "[mccree/init.opy]: Cassidy":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MCCREE
    
    newHero(250, 0, 0)
    removeSelfHealing()

    eventPlayer.ult_change_check = 1.22
