#!mainFile "../../dev_main.opy"


rule "[mccree/deadeye.opy]: Remove damage reduction and set damage during deadeye":
    @Event eachPlayer
    @Hero cassidy
    @Condition eventPlayer.isUsingUltimate()

    # eventPlayer.setDamageDealt(percent(ADJ_MCCREE_DEADEYE_DAMAGE/OW2_MCCREE_DEADEYE_DAMAGE))
    eventPlayer.setDamageReceived(percent(100/(100-OW2_MCCREE_DEADEYE_DAMAGE_REDUCTION)))
    eventPlayer.setDamageDealt(100)

    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)

    # eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
    eventPlayer.setDamageReceived(100)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
 