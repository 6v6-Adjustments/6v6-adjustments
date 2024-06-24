#!mainFile "../../dev_main.opy"

#!include "heroes/widowmaker/widows_kiss.opy"


rule "[widowmaker/init.opy]: Initialize Widowmaker":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.WIDOWMAKER
    
    setCustomHp(ADJ_WIDOWMAKER_HEALTH, 0, 0)
    if not eventPlayer.isDuplicatingAHero():
        setBaseDamage(eventPlayer, ADJ_WIDOWMAKER_SCOPED_DAMAGE / OW2_WIDOWMAKER_SCOPED_DAMAGE)
    removeSelfHealing()

    eventPlayer.call_init = false
