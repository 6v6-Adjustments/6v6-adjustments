#!mainFile "../../dev_main.opy"

#!include "heroes/brigitte/bash.opy"
#!include "heroes/brigitte/inspire.opy"
#!include "heroes/brigitte/repair_pack.opy"
#!include "heroes/brigitte/whipshot.opy"


def initBrigitte():
    @Name "[brigitte/init.opy]: initBrigitte()"

    setCustomHp(ADJ_BRIGITTE_HEALTH, ADJ_BRIGITTE_ARMOR, 0)
    setUltCost(ADJ_BRIGITTE_ULT_COST)
    removeSelfHealing()

    setBaseDamage(eventPlayer, ADJ_BRIGITTE_FLAIL_DAMAGE/OW2_BRIGITTE_FLAIL_DAMAGE)
    setBaseHealing(eventPlayer, ADJ_BRIGITTE_INSPIRE_TOTAL_HEALING/OW2_BRIGITTE_INSPIRE_TOTAL_HEALING)

    eventPlayer.hero_initialized = true
