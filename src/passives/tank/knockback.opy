#!mainFile "../../dev_main.opy"

#!include "constants/adj_constants.opy"
#!include "constants/ow2_constants.opy"
#!include "utilities/macro_functions.opy"


def removeTankPassive():
    @Name "[passives/tank/knockback.opy]: removeTankPassive()"
    
    eventPlayer.setKnockbackReceived(percent((1-ADJ_TANK_KNOCKBACK_REDUCTION)/(1-OW2_TANK_KNOCKBACK_REDUCTION)))
