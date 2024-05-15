#!mainFile "../../dev_main.opy"


def removeTankPassive():
    @Name "[passives/tank/knockback.opy]: removeTankPassive()"
    
    eventPlayer.setKnockbackReceived(percent((1-ADJ_TANK_KNOCKBACK_REDUCTION)/(1-OW2_TANK_KNOCKBACK_REDUCTION)))
