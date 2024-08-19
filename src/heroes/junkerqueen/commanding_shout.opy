#!mainFile "../../dev_main.opy"

playervar within_shout_radius = false


rule "[junkerqueen/commanding_shout.opy]: Prepare Commanding Shout ally tracking":
    @Event eachPlayer
    @Hero junkerQueen
    @Condition eventPlayer.isUsingAbility1()

    getPlayersInRadius(eventPlayer, 15.5, eventPlayer.getTeam(), LosCheck.SURFACES).exclude(eventPlayer).within_shout_radius = true
    eventPlayer.setMoveSpeed(percent(eventPlayer._current_speed_scalar * (ADJ_JUNKERQUEEN_SHOUT_MOVESPEED/OW2_JUNKERQUEEN_SHOUT_MOVESPEED)))
    wait(OW2_JUNKERQUEEN_SHOUT_DURATION)
    eventPlayer.setMoveSpeed(percent(eventPlayer._current_speed_scalar))


rule "[junkerqueen/commanding_shout.opy]: Reduce Commanding Shout overhealth for allies":
    @Event eachPlayer
    @Condition eventPlayer.within_shout_radius == true

    # damage(eventPlayer, null, ((OW2_JUNKERQUEEN_SHOUT_ALLY_OVERHEALTH - ADJ_JUNKERQUEEN_SHOUT_ALLY_OVERHEALTH) + (OW2_JUNKERQUEEN_SHOUT_ALLY_OVERHEALTH * eventPlayer.max_health_scaler - OW2_JUNKERQUEEN_SHOUT_ALLY_OVERHEALTH)))
    # heal(eventPlayer, null, 0.01)
    eventPlayer.setMoveSpeed(percent(eventPlayer._current_speed_scalar * (ADJ_JUNKERQUEEN_SHOUT_MOVESPEED/OW2_JUNKERQUEEN_SHOUT_MOVESPEED)))
    wait(OW2_JUNKERQUEEN_SHOUT_ALLY_DURATION)
    eventPlayer.setMoveSpeed(percent(eventPlayer._current_speed_scalar * (ADJ_JUNKERQUEEN_SHOUT_MOVESPEED/100)))
    wait(0.9)
    eventPlayer.setMoveSpeed(percent(eventPlayer._current_speed_scalar))
    eventPlayer.within_shout_radius = false
