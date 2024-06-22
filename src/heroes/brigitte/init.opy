#!mainFile "../../dev_main.opy"

#!include "heroes/brigitte/bash.opy"
#!include "heroes/brigitte/inspire.opy"
#!include "heroes/brigitte/repair_pack.opy"
#!include "heroes/brigitte/whipshot.opy"


rule "[brigitte/init.opy]: Initialize Brigitte":
    @Event eachPlayer
    @Condition eventPlayer.call_init
    @Condition eventPlayer.hero_setup == Hero.BRIGITTE

    setCustomHp(ADJ_BRIGITTE_HEALTH, ADJ_BRIGITTE_ARMOR, 0)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_BRIGITTE_FLAIL_DAMAGE/OW2_BRIGITTE_FLAIL_DAMAGE)
    setBaseHealing(eventPlayer, ADJ_BRIGITTE_INSPIRE_TOTAL_HEALING/OW2_BRIGITTE_INSPIRE_TOTAL_HEALING)

    eventPlayer.call_init = false
