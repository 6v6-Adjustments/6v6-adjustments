#!mainFile "../../dev_main.opy"


rule "[reinhardt/firestrike.opy]: Force single firestrike":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    @Condition eventPlayer.isUsingAbility2()

    waitUntil(not eventPlayer.isUsingAbility2(), 0.9)
    eventPlayer.setAbilityCharge(Button.ABILITY_2, 0) # Every time rein uses firestrike, reset the resource to 0
    wait(ADJ_REINHARDT_FIRE_STRIKE_COOLDOWN_TIME)
    eventPlayer.setAbilityCharge(Button.ABILITY_2, 2)


rule "[reinhardt/firestrike.opy]: Increase Firestrike damage (early animation)":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.REINHARDT
    @Condition eventPlayer.isUsingAbility2()

    eventPlayer.setDamageDealt(percent(ADJ_REINHARDT_FIRESTRIKE_DAMAGE/OW2_REINHARDT_FIRESTRIKE_DAMAGE))
    wait(OW2_REINHARDT_FIRESTRIKE_CAST_TIME)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
