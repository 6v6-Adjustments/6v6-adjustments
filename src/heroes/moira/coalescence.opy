#!mainFile "../../dev_main.opy"


rule "[moira/coalescence.opy]: Prevent fading during Coalescence":
    @Event eachPlayer
    @Condition eventPlayer.hero_setup == Hero.MOIRA
    @Condition eventPlayer.isUsingUltimate()

    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setDamageDealt(percent(ADJ_MOIRA_COALESCENCE_DPS/OW2_MOIRA_COALESCENCE_DPS))
    eventPlayer.setMoveSpeed(percent(ADJ_MOIRA_COALESCENCE_SPEED_BUFF/OW2_MOIRA_COALESCENCE_SPEED_BUFF))
    waitUntil(not eventPlayer.isUsingUltimate(), Math.INFINITY)
    eventPlayer.setDamageDealt(percent(eventPlayer._base_damage_scalar))
    eventPlayer.setMoveSpeed(percent(eventPlayer._current_speed_scalar))
    eventPlayer.setAbility1Enabled(true)


# rule "[moira/coalescence.opy]: Allow self healing during Coalescence":
#     @Event eachPlayer
#     @Hero moira
#     @Condition eventPlayer.isUsingUltimate()

#     pushSelfHealing(Button.ULTIMATE)
#     waitUntil(eventPlayer.isUsingUltimate() == false, Math.INFINITY)
#     popSelfHealing(Button.ULTIMATE)
