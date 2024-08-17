#!mainFile "../../dev_main.opy"

#!include "constants/adj_constants.opy"
#!include "utilities/custom_hp.opy"
#!include "passives/tank/ult_charge.opy"
#!include "passives/support/self_heal.opy"
#!include "utilities/hero_init.opy"


def initAshe():
    @Name "[ashe/init.opy]: initAshe()"

    setCustomHp(ADJ_ASHE_HEALTH, 0, 0)
    setUltCost(ADJ_ASHE_ULT_COST)
    
    if not eventPlayer.isDuplicatingAHero():
        removeSelfHealing()
    
    eventPlayer.max_health_scaler = (ADJ_ASHE_BOB_HEALTH/OW2_ASHE_BOB_HEALTH)

    eventPlayer.hero_initialized = true
