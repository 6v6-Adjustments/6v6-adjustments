#!mainFile "../../dev_main.opy"


rule "[reinhardt/firestrike.opy]: Force single firestrike":
    @Event eachPlayer
    @Hero reinhardt
    @Condition eventPlayer.isUsingAbility2()

    waitUntil(not eventPlayer.isUsingAbility2(), 1)
    eventPlayer.setAbilityCharge(Button.ABILITY_2, 0) # Every time rein uses firestrike, reset the resource to 0
    wait(ADJ_REINHARDT_FIRE_STRIKE_COOLDOWN_TIME)
    eventPlayer.setAbilityCharge(Button.ABILITY_2, 2)


rule "[reinhardt/firestrike.opy]: Increase Firestrike damage (early animation)":
    @Event eachPlayer
    @Hero reinhardt
    @Condition eventPlayer.isUsingAbility2()

    eventPlayer.setDamageDealt(percent(ADJ_REINHARDT_FIRESTRIKE_DAMAGE/OW2_REINHARDT_FIRESTRIKE_DAMAGE))
    wait(OW2_REINHARDT_FIRESTRIKE_CAST_TIME)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))


# rule "[reinhardt/firestrike.opy]: Correct Firestrike damage":
#     @Event playerDealtDamage
#     @Hero reinhardt
#     @Condition eventAbility == Button.ABILITY_2

#     damage(
#         victim, 
#         attacker, 
#         ((ADJ_REINHARDT_FIRESTRIKE_DAMAGE/OW2_REINHARDT_FIRESTRIKE_DAMAGE) \
#         * (eventDamage/eventPlayer._base_damage_scalar) \
#         - eventDamage)/eventPlayer._base_damage_scalar)
