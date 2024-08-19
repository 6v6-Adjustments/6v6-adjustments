#!mainFile "../../dev_main.opy"


# rule "[junkerqueen/carnage.opy]: Bonus Carnage healing":
#     @Event playerDealtDamage
#     @Hero junkerQueen
#     @Condition eventPlayer.isUsingAbility2() # don't use eventAbility, every wound tick checks this rule otherwise
#     @Condition eventDamage >= (ADJ_JUNKERQUEEN_CARNAGE_IMPACT_DAMAGE - 5)

#     heal(eventPlayer, eventPlayer, ADJ_JUNKERQUEEN_CARNAGE_BONUS_HEALING)


rule "[junkerqueen/carnage.opy]: Reduce Carnage damage":
    @Event eachPlayer
    @Hero junkerQueen
    @Condition eventPlayer.isUsingAbility2()

    eventPlayer.setDamageDealt(percent(ADJ_JUNKERQUEEN_CARNAGE_IMPACT_DAMAGE/OW2_JUNKERQUEEN_CARNAGE_IMPACT_DAMAGE))
    waitUntil(not eventPlayer.isUsingAbility2(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))