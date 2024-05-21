#!mainFile "../../dev_main.opy"


rule "[reinhardt/firestrike.opy]: Force single firestrike":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    @Condition eventPlayer.isUsingAbility2()

    waitUntil(not eventPlayer.isUsingAbility2(), 1)
    eventPlayer.setAbilityCharge(Button.ABILITY_2, 0) # Every time rein uses firestrike, reset the resource to 0
    wait(ADJ_REINHARDT_FIRE_STRIKE_COOLDOWN_TIME)
    eventPlayer.setAbilityCharge(Button.ABILITY_2, 2)


rule "[reinhardt/firestrike.opy]: Increase Firestrike damage (early animation)":
    @Team 1
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    @Condition eventPlayer.isUsingAbility2()

    eventPlayer.setDamageDealt(percent(ADJ_REINHARDT_FIRESTRIKE_DAMAGE/OW2_REINHARDT_FIRESTRIKE_DAMAGE))
    wait(OW2_REINHARDT_FIRESTRIKE_CAST_TIME)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))


# rule "[reinhardt/firestrike.opy]: Correct Firestrike damage":
#     @Event playerDealtDamage
#     @Condition eventPlayer.hero_setup == Hero.REINHARDT
#     @Condition eventAbility == Button.ABILITY_2

#     damage(
#         victim, 
#         attacker, 
#         ((ADJ_REINHARDT_FIRESTRIKE_DAMAGE/OW2_REINHARDT_FIRESTRIKE_DAMAGE) \
#         * (eventDamage/eventPlayer._base_damage_scalar) \
#         - eventDamage)/eventPlayer._base_damage_scalar)
