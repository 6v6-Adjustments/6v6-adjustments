#!mainFile "../../dev_main.opy"


# rule "[junkerqueen/rampage.opy]: Reduce Rampage damage":
#     @Event eachPlayer
#     @Hero junkerQueen
#     @Condition eventPlayer.isUsingUltimate()

#     eventPlayer.setDamageDealt(percent(ADJ_JUNKERQUEEN_RAMPAGE_WOUND_DAMAGE/OW2_JUNKERQUEEN_RAMPAGE_WOUND_DAMAGE))
#     waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
#     eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))